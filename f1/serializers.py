from django.contrib.auth.models import User, Group
from rest_framework import serializers

from f1.models import Complaint, Driver, PointsUpdate, Race, Team


class UserSerializer(serializers.HyperlinkedModelSerializer):
    # tweets = serializers.HyperlinkedRelatedField(many=True, view_name='tweet-detail', read_only=True)
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']
        
        
        
class TeamSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Team
        fields = ['id', 'name', 'created_at', 'modified', 'points']
    
    
class DriverSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Driver
        fields = ['number', 'name', 'last_name', 'team', 'points']    

class RaceSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Race
        fields = ['id', 'name', 'location', 'date', 'completed']

        
class PointsUpdateSerializer(serializers.HyperlinkedModelSerializer):
    class Meta: 
        model = PointsUpdate
        fields = ['id', 'descirption', 'created_at', 'modified', 'points', 'driver', 'reace']
        

class ComplaintSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Complaint
        fields = ['id', 'descirption', 'created_at', 'modified', 'team', 'status', 'resolved']

# class TweetSerializer(serializers.HyperlinkedModelSerializer):
#     likes = serializers.IntegerField(read_only=True, source='likes.count')
#     comments = serializers.HyperlinkedRelatedField(many=True, view_name='comment-detail', read_only=True)
    
#     username = serializers.SerializerMethodField()
#     class Meta:
#         model = Tweet
#         fields = ['id', 'text', 'user', 'created_at', 'modified', 'comments', 'likes', 'username']

#     def get_username(self, obj):
#         return obj.user.username        
        

    