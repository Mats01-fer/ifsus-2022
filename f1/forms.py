from .models import Team, Driver
from django.forms import ModelForm, Form, CharField, Select



class TeamForm(ModelForm):
    class Meta:
        model = Team
        fields = '__all__'
        
class DriverForm(ModelForm):
    class Meta:
        model = Driver
        fields = '__all__'
        




drivers = Driver.objects.all()



class AssingPointsForm(Form):
    points_25 = CharField(label='25', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_18 = CharField(label='18', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_15 = CharField(label='15', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_12 = CharField(label='12', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_10 = CharField(label='10', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_8 = CharField(label='8', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_6 = CharField(label='6', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_4 = CharField(label='4', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_2 = CharField(label='2', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))
    points_1 = CharField(label='1', widget=Select(choices=[(driver.number, "%d %s %s" % (driver.number, driver.name, driver.last_name)) for driver in drivers]))