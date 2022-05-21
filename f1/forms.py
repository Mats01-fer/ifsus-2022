from .models import Team, Driver
from django.forms import ModelForm



class TeamForm(ModelForm):
    class Meta:
        model = Team
        fields = '__all__'
        
class DriverForm(ModelForm):
    class Meta:
        model = Driver
        fields = '__all__'
        
