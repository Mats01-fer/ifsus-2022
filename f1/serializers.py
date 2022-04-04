from django.contrib.auth.models import User, Group
from rest_framework import serializers


class UserSerializer(serializers.HyperlinkedModelSerializer):
    # tweets = serializers.HyperlinkedRelatedField(many=True, view_name='tweet-detail', read_only=True)
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


# class TweetSerializer(serializers.HyperlinkedModelSerializer):
#     likes = serializers.IntegerField(read_only=True, source='likes.count')
#     comments = serializers.HyperlinkedRelatedField(many=True, view_name='comment-detail', read_only=True)
    
#     username = serializers.SerializerMethodField()
#     class Meta:
#         model = Tweet
#         fields = ['id', 'text', 'user', 'created_at', 'modified', 'comments', 'likes', 'username']

#     def get_username(self, obj):
#         return obj.user.username        
        
# class CommentSerializer(serializers.HyperlinkedModelSerializer):
#     class Meta:
#         model = Comment
#         fields = ['id', 'text', 'user', 'created_at', 'modified', 'tweet']
        
# class LikeSerializer(serializers.HyperlinkedModelSerializer):
#     class Meta:
#         model = Like
#         fields = ['id', 'user', 'tweet', 'created_at', 'modified']
    