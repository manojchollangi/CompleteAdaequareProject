from importlib.resources import Package
from django.http import HttpResponse
from .models import NewsDetails,NewsType
from newseditorapp.models import Packages
from .serializers import CategoryNews,Subscription
from django.utils import timezone
from django.db.models import Q


def get_valid_news_types():
    return NewsType.objects.all().order_by("new_type_display")

def get_news_details(type_of_news):
    return NewsDetails.objects.filter(news_type=type_of_news).order_by('-slno')[:]
    

def valid_news_types():
    search=Q(record_end_date__gte=timezone.now().date())# change the condition
    news_types_list=NewsType.objects.filter(search).order_by('news_type')
    for i in news_types_list:
        print(i.news_type)
    #print(news_types_list)
    return news_types_list


def get_news_details_filter(cat):
    return NewsDetails.objects.filter(news_type=cat).order_by('-publish_date')[:5]


def get_news_details_filter_id(slno):
    return NewsDetails.objects.filter(slno=slno)


def getAllNewsTypes():
    return NewsType.objects.values_list('news_type')



def get_news_headlines():
    news_headlines=[]
    for news_type in valid_news_types():
        a=CategoryNews()
        a.categoryId=news_type.slno
        print("category Id:",a.categoryId)
        a.category=news_type.news_type
        print("category:",a.category)
        top_news=get_news_details_filter(a.category)
        print("top_news:",top_news)
        a.latestNews=top_news
        #print(a.latestNews)
        if len(top_news)>0:
            news_headlines.append(a)
    return news_headlines



def get_subscription_packages():
    subscription_packages=[]
    for package in Packages.objects.all():
        a=Subscription()
        a.sub_no=package.sub_no
        print("sub_no:",a.sub_no)
        a.package_details=package.package_details
        print("package_details:",a.package_details)
        a.sub_name=package.sub_name
        print("package_name:",a.sub_name)
        a.package_amount=package.package_amount
        print("package_amount:",a.package_amount)
        subscription_packages.append(a)
    return subscription_packages

def get_user_save(form):
    message=""
    if form.is_valid():
        try:
            form.save()
            message="User added Successfully"
        except Exception as e:
            message="Failed to add user" + str(e)
    else:
        message="Error in adding a user"
    return message