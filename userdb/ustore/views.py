from django.shortcuts import render
from rest_framework import generics, permissions, status
from rest_framework.response import Response

from knox.models import AuthToken
from .serializers import UserSerializer, RegisterSerializer, ChangePasswordSerializer, FilesSerializer
from .models import File

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
                return Response({"error":"filename already exists"}, status=status.HTTP_400_BAD_REQUEST)
            query='''select name from ustore_file
                where owner=?;
                '''
            curr.execute(query,[username])
            tlist=curr.fetchall()
            if len(tlist)>10:
                return Response({"error":"Max File Limit exceeded"}, status=status.HTTP_400_BAD_REQUEST)

            query='insert into ustore_file values(?,?,?,?,?)'
            curr.execute(query,[id,username,filename,language,fullcode])
            conn.commit()

            message=filename+" uploaded succesfully"

            return Response({"status":"success",'code':status.HTTP_200_OK, "message":message},)

        return Response(data_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
