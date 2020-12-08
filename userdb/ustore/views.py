from django.shortcuts import render
from rest_framework import generics, permissions, status
from rest_framework.response import Response

from knox.models import AuthToken
from .serializers import UserSerializer, RegisterSerializer, ChangePasswordSerializer, FilesSerializer, FileGetterSerializer, ProjectSerializer,ProjectFileGetterSerializer
from .models import File, Project

from django.contrib.auth import login
from django.contrib.auth.models import User

from rest_framework.authtoken.serializers import AuthTokenSerializer
from knox.views import LoginView as KnoxLoginView
from rest_framework.permissions import IsAuthenticated
import sqlite3
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse




# Register API
class RegisterAPI(generics.GenericAPIView):
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)# Create your views here.
        user = serializer.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })


class LoginAPI (KnoxLoginView):
    permission_classes = (permissions.AllowAny,)

    def post(self,request, format=None):
        serializer=AuthTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user=serializer.validated_data['user']
        login(request,user)
        return super(LoginAPI,self).post(request,format=None)


class ChangePasswordView (generics.UpdateAPIView):
    serializer_class=ChangePasswordSerializer
    model=User
    permission_classes=(IsAuthenticated,)

    def get_object(self, queryset=None):
        obj=self.request.user
        print (obj)
        return obj

    def post(self, request, *args, **kwargs):
        self.object=self.get_object()
        serializer=self.get_serializer(data=request.data)

        if serializer.is_valid():
            #check old password
            if not self.object.check_password(serializer.data.get("old_password")):
                return Response({"old_password":["Wrong password"]}, status=status.HTTP_400_BAD_REQUEST)

            #set new password
            self.object.set_password(serializer.data.get("new_password"))
            self.object.save()
            response={
                'status': 'success',
                'code':status.HTTP_200_OK,
                'message':'Password Updated Succesfully',
                'data':[]
            }
            return Response(response)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
class FilesAccessView(generics.GenericAPIView):

    serializer_class=FilesSerializer
    model=File
    permission_classes=(IsAuthenticated,)
    def get_object(self, queryset=None):
        obj=self.request.user
        return obj

    def post(self,request, *args, **kwargs):
        self.object=self.get_object()
        user_serializer=UserSerializer(self.object)
        username=user_serializer.data.get("username")
        # postData=JSONParser().parse(request)
        data_serializer=FilesSerializer(data=request.data)

        if data_serializer.is_valid():
            # data_serializer.save()
            conn = sqlite3.connect('db.sqlite3')
            curr = conn.cursor()
            id=data_serializer.data.get("id")
            filename=data_serializer.data.get("name")
            language=data_serializer.data.get("lang")
            fullcode=data_serializer.data.get("body")
            query='''select owner from ustore_file
                where
                    owner=? and name=?;
                '''
            curr.execute(query,[username,filename])
            tlist=curr.fetchall()
            if len(tlist)!=0:
                query='''
                update ustore_file
                set lang=?, body=?
                where owner=? and name=?'''
                curr.execute(query,[language,fullcode,username,filename])
                message = filename + " updated succesfully"
                curr.close()
                conn.close()
                return Response({"status":"success", "message":message},status=status.HTTP_200_OK)
            query='''select name from ustore_file
                where owner=?;
                '''
            curr.execute(query,[username])
            tlist=curr.fetchall()
            if len(tlist)>10:
                curr.close()
                conn.close()
                return Response({"error":"Max File Limit exceeded"}, status=status.HTTP_400_BAD_REQUEST)

            query='insert into ustore_file values(?,?,?,?,?)'
            curr.execute(query,[id,username,filename,language,fullcode])
            conn.commit()

            message=filename+" uploaded succesfully"
            curr.close()
            conn.close()
            return Response({"status":"success", "message":message},status=status.HTTP_200_OK)

        return Response(data_serializer.errors, status=status.HTTP_400_BAD_REQUEST)




class ProjectAcessView(generics.GenericAPIView):
    serializer_class=ProjectSerializer
    model=Project
    permission_classes = (IsAuthenticated,)

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj
    def post(self,request,*args,**kwargs):
        self.object = self.get_object()
        user_serializer = UserSerializer(self.object)
        username = user_serializer.data.get("username")
        # postData=JSONParser().parse(request)
        data_serializer = ProjectSerializer(data=request.data)

        if data_serializer.is_valid():
            # data_serializer.save()
            conn = sqlite3.connect('db.sqlite3')
            curr = conn.cursor()
            id = data_serializer.data.get("id")
            print ('initial id :')
            print (id)
            filename = data_serializer.data.get("name")
            projectname=data_serializer.data.get("projectname")
            relpath=data_serializer.data.get("relpath")
            language = data_serializer.data.get("lang")
            fullcode = data_serializer.data.get("body")

            query='''select name, relpath from ustore_project
            where owner=? and projectname=?;
            '''
            curr.execute(query,[username,projectname])
            tlist=curr.fetchall()
            if (len(tlist)==0):
                query='''select count(distinct projectname) 
                from ustore_project 
                where owner=?;
                '''
                curr.execute(query,[username])
                np=curr.fetchall()
                np=np[0][0]
                if (np>=5):
                    curr.close()
                    conn.close()
                    return Response({'status':'fail',"message":"Max Number of Projects Reached"},status=status.HTTP_400_BAD_REQUEST)
                query='insert into ustore_project values(?,?,?,?,?,?,?)'
                curr.execute(query,[id,username,filename,projectname,relpath,language,fullcode])
                conn.commit()
                curr.close()
                conn.close()
                return Response({'status':'success', 'message':'file added to the new project'},status=status.HTTP_200_OK)
            # for i in range(0,len(tlist)):
            #     tlist[i]=tlist[i][0]
            # print (tlist)
            if (filename,relpath) in tlist:
                query = ''' update ustore_project
                            set lang=?, body=?
                            where owner=? and projectname=? and name=?;
                            '''
                projectname=data_serializer.data.get("projectname")
                curr.execute(query,[language,fullcode,username,projectname,filename])
                conn.commit()
                curr.close()
                conn.close()
                return Response({'status':'success','message':'file is updated'},status=status.HTTP_200_OK)
            if len(tlist)<10:
                print ('file is added')
                query='insert into ustore_project values(?,?,?,?,?,?,?)'
                print (id)
                curr.execute(query,[id,username,filename,projectname,relpath,language,fullcode])
                conn.commit()
                curr.close()
                conn.close()
                return Response({'status':'success','message':'file is added in project'}, status=status.HTTP_200_OK)
            curr.close()
            conn.close()
            return Response({'status':'fail','message':'max number of files in project reached'}, status=status.HTTP_400_BAD_REQUEST)

        return Response(data_serializer.errors,status=status.HTTP_400_BAD_REQUEST)





class ProjectgetView(generics.GenericAPIView):
    permission_classes = (IsAuthenticated,)
    def get_object(self, queryset=None):
        obj = self.request.user
        return obj
    def post (self, request, *args, **kwargs):
        self.object = self.get_object()
        user_serializer = UserSerializer(self.object)
        username = user_serializer.data.get("username")
        # postData=JSONParser().parse(request)
        data_serializer = FileGetterSerializer(data=request.data)

        if data_serializer.is_valid():
            conn = sqlite3.connect('db.sqlite3')
            curr = conn.cursor()
            projectlist=data_serializer.data.get('all')
            projectname=data_serializer.data.get('name')

            if projectlist=='True':
                query=''' select DISTINCT projectname from ustore_project 
                where owner=? ;
                '''
                curr.execute(query,[username])
                tlist=curr.fetchall()
                if len(tlist) == 0:
                    curr.close()
                    conn.close()
                    return Response({'status': 'fail', 'data': 'project does not exist'},status=status.HTTP_400_BAD_REQUEST)
                for i in range(0,len(tlist)):
                    tlist[i]=tlist[i][0]
                curr.close()
                conn.close()
                return Response({'status':'success','projectlist':tlist}, status=status.HTTP_200_OK)
            query='''select name, body, lang, relpath from ustore_project 
            where owner=? and projectname=? ;
            '''
            curr.execute(query,[username,projectname])
            tlist=curr.fetchall()
            if len(tlist)==0:
                curr.close()
                conn.close()
                return Response({'status':'fail', 'data':'project does not exist'}, status=status.HTTP_400_BAD_REQUEST)

            for i in range(0,len(tlist)):
                tmap={}
                tmap['name']=tlist[i][0]
                tmap['body']=tlist[i][1]
                tmap['lang']=tlist[i][2]
                tmap['path']=tlist[i][3]
                tlist[i]=tmap
            curr.close()
            conn.close()
            return Response({'status':'success', 'data':tlist}, status=status.HTTP_200_OK)


        return Response(data_serializer.errors,status=status.HTTP_400_BAD_REQUEST)

class FilegetView(generics.GenericAPIView):
    permission_classes = (IsAuthenticated,)

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj
    def post(self,request,*args, **kwargs):
        self.object = self.get_object()
        user_serializer = UserSerializer(self.object)
        username = user_serializer.data.get("username")
        data_serializer = FileGetterSerializer(data=request.data)
        if data_serializer.is_valid():
            conn = sqlite3.connect('db.sqlite3')
            curr = conn.cursor()
            listall=data_serializer.data.get("all")
            if listall=='True':
                query='select name from ustore_file where owner=?'
                curr.execute(query, [username])
                nameList=curr.fetchall()
                for i in range(0,len(nameList)):
                    nameList[i]=nameList[i][0]
                curr.close()
                conn.close()
                return Response({"names":nameList},status=status.HTTP_200_OK)
            filename=data_serializer.data.get("name")

            query='''
                select lang, body from ustore_file
                where owner=? and name=?;
                '''

            curr.execute(query,[username,filename])
            tlist=curr.fetchall()
            if len(tlist)==0:
                # message=filename+" does not exist"
                curr.close()
                conn.close()
                return Response({"error":"file does not exist"}, status=status.HTTP_400_BAD_REQUEST)
            curr.close()
            conn.close()
            return Response({"lang":tlist[0][0], "body":tlist[0][1]})

        return Response(data_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
class FileDeleteView(generics.GenericAPIView):
    permission_classes = (IsAuthenticated,)
    def get_object(self, queryset=None):
        obj = self.request.user
        return obj
    def post(self,request,*args,**kwargs):
        self.object = self.get_object()
        user_serializer = UserSerializer(self.object)
        username = user_serializer.data.get("username")
        data_serializer = FileGetterSerializer(data=request.data)
        if data_serializer.is_valid():
            conn = sqlite3.connect('db.sqlite3')
            curr = conn.cursor()
            all=data_serializer.data.get("all")
            if all=='True':
                query='''delete from ustore_file
                where owner=?;
                '''
                curr.execute(query,[username])
                conn.commit()
                conn.close()
                return Response({'status':'successfull', 'message':"all files of given user is deleted"}, status=status.HTTP_200_OK)

            filename = data_serializer.data.get("name")
            query = '''delete from ustore_file
                            where
                                owner=? and name=?;
                            '''

            curr.execute(query, [username, filename])
            conn.commit()
            curr.close()
            conn.close()
            return Response({'status': 'successfull', 'message': "file deleted"}, status=status.HTTP_200_OK)


        return Response(data_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ProjectDeleteView(generics.GenericAPIView):
    permission_classes = (IsAuthenticated,)
    def get_object(self, queryset=None):
        obj = self.request.user
        return obj
    def post (self, request, *args, **kwargs):
        self.object = self.get_object()
        user_serializer = UserSerializer(self.object)
        username = user_serializer.data.get("username")
        # postData=JSONParser().parse(request)
        data_serializer = ProjectFileGetterSerializer(data=request.data)
        if data_serializer.is_valid():
            conn = sqlite3.connect('db.sqlite3')
            curr = conn.cursor()
            allfiles = data_serializer.data.get('all')
            projectname = data_serializer.data.get('projectname')
            filename=data_serializer.data.get('filename')

            if allfiles=='True':
                query='''delete from ustore_project 
                where owner=? and projectname=? ;
                '''
                curr.execute(query,[username,projectname])
                conn.commit()
                curr.close()
                conn.close()
                message=projectname + ' deleted successfully'
                return Response({'status':'success', 'message':message}, status=status.HTTP_200_OK)

            query='''delete from ustore_project 
            where owner=? and projectname=? and name=? ;'''

            curr.execute(query,[username,projectname,filename])
            conn.commit()
            curr.close()
            conn.close()
            return Response({'status':'success', 'message':'file deleted successfully'}, status=status.HTTP_200_OK)

        return Response(data_serializer.errors, status=status.HTTP_400_BAD_REQUEST)