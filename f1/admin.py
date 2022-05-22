from django.contrib import admin
from .models import Team, Driver, Location,  PointsUpdate, Complaint, Race



  
class DriverDetailInline(admin.TabularInline):
    model = Driver
    

class TeamAdmin(admin.ModelAdmin):
    inlines = [DriverDetailInline]
  
class DriverAdmin(admin.ModelAdmin):
  pass

class LocationAdmin(admin.ModelAdmin):
  pass

class PointsUpdateAdmin(admin.ModelAdmin):
  pass

class ComplaintAdmin(admin.ModelAdmin):
  pass

class RaceAdmin(admin.ModelAdmin):
  pass


admin.site.register(Team, TeamAdmin)
admin.site.register(Driver, DriverAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(PointsUpdate, PointsUpdateAdmin)
admin.site.register(Complaint, ComplaintAdmin)
admin.site.register(Race, RaceAdmin)