from django.db import models
from django.contrib.auth.models import User

class File(models.Model):
    owner=models.CharField(max_length=150)
    name=models.CharField(max_length=100)
    lang=models.CharField(max_length=15)
    body=models.TextField()
class Project(models.Model):
    owner = models.CharField(max_length=150)
    name = models.CharField(max_length=100)
    projectname=models.CharField(max_length=100)
    relpath=models.TextField()
    lang = models.CharField(max_length=15)
    body = models.TextField()
# Create your models here.
