from rest_framework import serializers
from django.contrib.auth.models import User
from .models import File


# User Serializer
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email')

# Register Serializer
class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'], validated_data['email'], validated_data['password'])

        return user

#Change Password Serializer
class ChangePasswordSerializer(serializers.Serializer):
    model=User
    """
    Serializer for password change Endpoint
    """
    old_password=serializers.CharField(required=True)
    new_password=serializers.CharField(required=True)

class FilesSerializer(serializers.Serializer):
    # class Meta:
    #     model=Files
    #     fields=('owner',
    #             'name',
    #             'lang',
    #             'body')
    # model=File
    name=serializers.CharField(required=True)
    lang=serializers.CharField(required=True)
    body=serializers.CharField(allow_blank=True)

class FileGetterSerializer(serializers.Serializer):
    all=serializers.BooleanField(required=True)
    name=serializers.CharField(required=True)

class ProjectSerializer(serializers.Serializer):
    name=serializers.CharField(required=True)
    projectname=serializers.CharField(required=True)
    relpath=serializers.CharField(allow_blank=True,required=False)
    lang=serializers.CharField(required=True)
    body=serializers.CharField(allow_blank=True)

class ProjectFileGetterSerializer(serializers.Serializer):
    all=serializers.BooleanField(required=True)
    projectname=serializers.CharField(required=True)
    filename=serializers.CharField(required=True)