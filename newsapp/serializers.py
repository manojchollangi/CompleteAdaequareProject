from rest_framework import serializers
from .models import NewsDetails, NewsType
from newseditorapp.models import Packages
from newseditorapp.users.models import *


class NewsDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsDetails
        fields = "__all__"



class NewsTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsType
        fields = "__all__"

class PackagesSerializer(serializers.ModelSerializer):
    
    class Meta:
        model= Packages
        fields= "__all__"


class CategoryNews:
    categoryId = None
    category = None
    latestNews = []

    def __init__(self):
        self.categoryId = None
        self.category = None
        self.latestNews = []


class CategoryNewsSerializer(serializers.Serializer):
    categoryId = serializers.IntegerField(min_value=0, max_value=1000)
    category = serializers.CharField()
    latestNews =NewsDetailsSerializer(many=True)

    def create(self):
        return CategoryNews

class Subscription:
    sub_no = None
    package_details = None
    package_amount = None
    sub_name= None 

    def __init__(self):
        self.sub_no = None
        self.package_details = None
        self.package_amount = None
        self.sub_name = None
     
class SubscriptionSerializer(serializers.Serializer):
    sub_no = serializers.IntegerField()
    package_details = serializers.CharField()
    package_amount = serializers.FloatField()
    sub_name= serializers.CharField()

    def create(self):
        return Subscription

class RegisterUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ['user_name', 'password']