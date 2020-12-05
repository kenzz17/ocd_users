from django.db import models
from django.contrib.auth.models import User

class Files(models.Model):
    owner=models.CharField(max_length=150)
    name=models.CharField(max_length=50)
    lang=models.CharField(max_length=15)
    body=models.TextField()
# Create your models here.
