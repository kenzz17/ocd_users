# Generated by Django 3.1.2 on 2020-12-05 08:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ustore', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='files',
            name='name',
            field=models.CharField(max_length=100),
        ),
    ]
