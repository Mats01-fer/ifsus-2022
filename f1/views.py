from django.contrib.auth.models import User, Group
from rest_framework import serializers, viewsets
from rest_framework import permissions

from f1.models import Complaint, Driver, PointsUpdate, Race, Team
from .serializers import ComplaintSerializer, DriverSerializer, PointsUpdateSerializer, RaceSerializer, TeamSerializer, UserSerializer, GroupSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from django.views.generic import View
from django.shortcuts import render


from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.views.generic.detail import DetailView

from .models import Team
from django.forms import ModelForm, modelformset_factory
from .forms import TeamForm, DriverForm, AssingPointsForm
from django.http import HttpResponseRedirect



class TeamCreateView(CreateView):
    model = Team
    fields = ['name']

class TeamUpdateView(UpdateView):
    model = Team
    fields = ['name']

class TeamDeleteView(DeleteView):
    model = Team
    success_url = '/teams'

class TeamView(View):

    template_name = 'team_form.html'
    form = TeamForm()
    DriverFormSet = modelformset_factory(Driver, form=DriverForm, extra=1, can_delete=True)

    def get(self, request, id, *args, **kwargs):
        queryset = Driver.objects.filter(team=id)
        formset = self.DriverFormSet(queryset=queryset)
        team = Team.objects.filter(id=id)[0]

        return render(request,template_name=self.template_name, context={'title': team.name, "form": self.form, "formset": formset, 'team': team })
    

class IsFIAPermission(permissions.BasePermission):
    """
    Only FIA can assing points
    """

    def has_permission(self, request, view):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.
        if request.method in permissions.SAFE_METHODS:
            return True

        # user must be in FIA group
        return request.user.groups.filter(name='FIA').exists()

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]
    

class TeamViewSet(viewsets.ModelViewSet):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer
    permission_classes = [permissions.IsAuthenticated]
    
class DriverViewSet(viewsets.ModelViewSet):
    queryset = Driver.objects.all()
    serializer_class = DriverSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    
class PointsUpdateViewSet(viewsets.ModelViewSet):
    queryset = PointsUpdate.objects.all()
    serializer_class = PointsUpdateSerializer
    permission_classes = [IsFIAPermission]
    

class ComplaintViewSet(viewsets.ModelViewSet):
    queryset = Complaint.objects.all()
    serializer_class = ComplaintSerializer
    permission_classes = [permissions.IsAuthenticated]
    
class RaceViewSet(viewsets.ModelViewSet):
    queryset = Race.objects.all()
    serializer_class = RaceSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    
# class TweetViewSet(viewsets.ModelViewSet):
#     """
#     API endpoint that allows tweets to be viewed or edited.
#     """
#     queryset = Tweet.objects.all().order_by('-created_at')
#     serializer_class = TweetSerializer
#     permission_classes = [permissions.IsAuthenticated]


# class CommentViewSet(viewsets.ModelViewSet):
#     queryset = Comment.objects.all().order_by('-created_at')
#     serializer_class = CommentSerializer
#     permission_classes = [permissions.IsAuthenticated]
    
    
# class LikeViewSet(viewsets.ModelViewSet):
#     queryset = Like.objects.all().order_by('-created_at')
#     serializer_class = LikeSerializer
#     permission_classes = [permissions.IsAuthenticated]





class GetUserView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request, format=None):
        content = {
            'username': str(request.user),  # `django.contrib.auth.User` instance.
            'auth': str(request.auth),  # None
            'uid': str(request.user.id),
        }
        return Response(content)
    
    
    
class TeamsView(View):
    
    def get(self, request, *args, **kwargs):
        teams = Team.objects.all()
        return render(request, 'teams.html', context={'teams': teams})
    
class RacesView(View):
    
    def get(self, request, *args, **kwargs):
        query = self.request.GET.get("q")
        races = Race.objects.all()
        filtered = []
        if query:
            for race in races:
                if query in race.name.lower():
                    filtered.append(race)
        else:
            filtered = races
        return render(request, 'races.html', context={'races': filtered, 'title': 'Races'})
    

class TeamDetailView(DetailView):
  
    model = Team

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class ConstructorsView(View):
    
    def get(self, request, *args, **kwargs):
        teams_data = []
        teams = Team.objects.all().order_by('points')
        for team in teams:
            drivers = Driver.objects.filter(team=team)
            
            teams_data.append({
                'team': team,
                'points': sum([driver.points for driver in drivers]),
                'drivers': drivers,
                'position': 0
            })


        teams_data = sorted(teams_data, key = lambda i: i['points'], reverse=True)
        pos = 1
        for team in teams_data:
            team['position'] = pos
            pos += 1
        return render(request, 'constructors.html', context={'teams_data': teams_data, 'title': 'Constructors'})

class DriversView(View):
    def get(self, request, *args, **kwargs):
        drivers = Driver.objects.all().order_by('points')

        drivers_with_points = [];
        pos = 1
        for driver in drivers:
            drivers_with_points.append({
                'name': driver.name,
                'last_name': driver.last_name,
                'team': driver.team,
                'number': driver.number,
                'points': driver.points,
                'pos': pos,
            })
            pos += 1

        return render(request, 'drivers.html', context={'drivers': drivers_with_points, 'title': 'Drivers'})
 
class RacePointScoringView(View):
    def get(self, request, id, *args, **kwargs):
        race = Race.objects.filter(id=id).first()
    
        form = AssingPointsForm()
        return render(request, 'race.html', context={'form': form, 'race': race})
    
    def post(self, request, id, *args, **kwargs):
        race = Race.objects.filter(id=id).first()
        form = AssingPointsForm(request.POST)
        if form.is_valid():
            scoring = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
            for score in scoring:
                driver = form.cleaned_data['points_%s'%score]
                driver = Driver.objects.filter(number=driver).first()
                driver.points += score
                driver.save()
                p = PointsUpdate(driver=driver, points=score,race=race, FIA_officer=request.user, descirption='Race points')
                
                p.save()
           
            return HttpResponseRedirect('/constructors/')
        else:   
            return render(request, 'race.html', context={'form': form, 'title': race.name + ' Results'})

            
