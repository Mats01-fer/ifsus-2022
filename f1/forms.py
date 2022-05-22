from .models import Team, Driver
from django.forms import ModelForm, Form, CharField, Select
from django.core.exceptions import ValidationError



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
    
    
    def clean(self):
   
        super(AssingPointsForm, self).clean()
        
        # every selected driver must be unique
        drivers = [self.cleaned_data['points_25'], self.cleaned_data['points_18'], self.cleaned_data['points_15'], self.cleaned_data['points_12'], self.cleaned_data['points_10'], self.cleaned_data['points_8'], self.cleaned_data['points_6'], self.cleaned_data['points_4'], self.cleaned_data['points_2'], self.cleaned_data['points_1']]
        # if drivers contains duplicates, raise an error
        if(len(drivers) != len(set(drivers))):
            raise ValidationError("Niste dobro rasporedili vozače")
 
        # return any errors if found
        return self.cleaned_data