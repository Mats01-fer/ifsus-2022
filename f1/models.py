from django.conf import settings
from django.db import models


class Team(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=140)
    created_at = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    points = models.IntegerField(default=0)
    
    def __str__(self):
        return self.name


class Driver(models.Model):
    number = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=140)
    last_name = models.CharField(max_length=140)
    team = models.ForeignKey(
        Team, on_delete=models.CASCADE, related_name='drivers')
    points = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.number} {self.name} {self.last_name}"

class Race(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=140)
    location = models.CharField(max_length=140)
    date = models.DateField()
    completed = models.BooleanField(default=False)
    
    def __str__(self):
        return f"{self.name} {self.location} {self.date}"


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
    


class Complaint(models.Model):
    id = models.AutoField(primary_key=True)
    descirption = models.CharField(max_length=1140)
    created_at = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='complaints')
    status = models.CharField(max_length=140)
    resolved = models.BooleanField(default=False)
    
    
    def __str__(self):
        return f"{self.team}: {self.descirption} {self.status} {self.resolved}"