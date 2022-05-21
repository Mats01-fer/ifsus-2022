from .models import Team
from django.forms import ModelForm



class TeamForm(ModelForm):
    class Meta:
        model = Team
        fields = '__all__'