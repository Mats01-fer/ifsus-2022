from django.conf import settings
from django.db import models


class Team(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=140)
    created_at = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    points = models.IntegerField(default=0)


class Driver(models.Model):
    number = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=140)
    last_name = models.CharField(max_length=140)
    team = models.ForeignKey(
        Team, on_delete=models.CASCADE, related_name='drivers')
    points = models.IntegerField(default=0)


class Race(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=140)
    location = models.CharField(max_length=140)
    date = models.DateField()
    completed = models.BooleanField(default=False)


class PointsUpdate(models.Model):
    id = models.AutoField(primary_key=True)
    descirption = models.CharField(max_length=140)
    created_at = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    points = models.IntegerField(default=0)
    driver = models.ForeignKey(
        Driver, on_delete=models.CASCADE, related_name='point_updates')
    reace = models.ForeignKey(
        Race, on_delete=models.CASCADE, related_name='point_updates')
