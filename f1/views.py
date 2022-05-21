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
from .models import Team
from django.forms import ModelForm
from .forms import TeamForm
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

    def get(self, request, *args, **kwargs):
        return render(request,template_name=self.template_name, context={'title': "test", "form": self.form})
    

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