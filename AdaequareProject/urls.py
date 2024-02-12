"""AdaequareProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from django.urls import path, include
from django.views.generic import RedirectView
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from .views import *
from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token,refresh_jwt_token,verify_jwt_token
from django.contrib.auth import views as auth_views
#from django.views.generic.base import TemplateView
from newseditorapp.views import logout_view,sendmail,home



urlpatterns = [
    path('admin/', admin.site.urls),
    path('newsapp/', include('newsapp.urls')),
    path("newseditor/",include('newseditorapp.urls')),
    path("api/newsdisplay/",PaginationAPI1.as_view()),
    path("api/newstypedisplay/",PaginationAPI2.as_view()),
    path("api/newssearch/",NewsSearchAPI.as_view()),
    path("api/news/",NewsDetailsGetPost.as_view(),name='add_news_details'),
    path("api/news/<int:slno>/",NewsDetailsGetslno.as_view()),
    path("api/category/",NewsTypeGetPost.as_view(),name='add_category'),
    path("api/category/<int:slno>/",NewsTypeGetslno.as_view()),
    path("api/signin/", obtain_jwt_token,name='login'),
    #path("api/refresh/",refresh_jwt_token),
    #path("api/verify/",verify_jwt_token),
    path('accounts/login/', auth_views.LoginView.as_view()),
    path("accounts/logout/",logout_view),
    path("home/",home),
    path("home/sendmail/",sendmail),
    path('paypal/', include('paypal.standard.ipn.urls')),  
    path("api-token-auth/",obtain_jwt_token),
]

urlpatterns += [
path('', RedirectView.as_view(url='newsapp/', permanent=True)),
]

urlpatterns += staticfiles_urlpatterns()