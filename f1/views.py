from django.contrib.auth.models import User, Group
from rest_framework import serializers, viewsets
from rest_framework import permissions
from .serializers import UserSerializer, GroupSerializer
from rest_framework.response import Response
from rest_framework.views import APIView

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