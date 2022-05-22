"""f1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path, re_path
from rest_framework_nested import routers
# from rest_framework import routers
from rest_framework.authtoken import views as token_views

from . import views

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'complaints', views.ComplaintViewSet)
router.register(r'teams', views.TeamViewSet)
router.register(r'drivers', views.DriverViewSet)
router.register(r'pointsupdates', views.PointsUpdateViewSet)
router.register(r'races', views.RaceViewSet)


# tweet_router = routers.NestedSimpleRouter(
#     router,
#     r'users',
#     lookup='user')
# tweet_router.register(
#     r'tweets',
#     views.TweetViewSet,
#     basename='user-tweet'
# )
app_name = ''


urlpatterns = [
    path('admin/', admin.site.urls),
    # path('', include(router.urls)),
    # path('', include(tweet_router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('api-token-auth/', token_views.obtain_auth_token),
    path('get-user/', views.GetUserView.as_view()),
    re_path(r'team/(?P<id>\d+)/', views.TeamView.as_view(), name='team-detail'),
    path('teams/', views.TeamsView.as_view()),
    path('races/', views.RacesView.as_view()),
    path('constructors/', views.ConstructorsView.as_view()),
    re_path(r'race-points/(?P<id>\d+)/', views.RacePointScoringView.as_view()),
]
