from django.shortcuts import render,redirect
from django.http import HttpResponse
from newsapp.models import NewsType,NewsDetails
from newsapp.views import news_types_view
from .forms import *
from django.core.paginator import Paginator
from django.utils import timezone
from .users.models import Users
from .users.forms import UsersForm,UsersUpdateForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login,authenticate,logout
from django.contrib.auth.models import User
from django.conf import settings
from django.core.mail import send_mail
import pandas as pd
from newsapp.manage import *
from .manage import *



# To show all news list
@login_required
def existing_news_type(request):
    news_list = get_valid_news_types()
    return render(request,'categorydisplay.html',{"news_list": news_list})



# to create a news record
@login_required
def add_news_type(request):
    message1=''
    if request.method =='POST':
        form=NewsTypeForm(request.POST)
        message1=saving_news_type(form)
        return render(request,'categoryadd.html',{"message1": message1,"form": form})
    else:
        form=NewsTypeForm()
        return render(request,'categoryadd.html',{"form":form})



#To Edit the NewsType form
@login_required
def news_type_edit(request,slno):
    news=get_news_type_slno(slno)
    form=NewsTypeFormUpdate(instance=news)
    return render(request,"categoryedit.html",{"news":news,"form":form})



#To Update the NewsType
@login_required
def news_type_update(request,slno):
    news=get_news_type_slno(slno)
    form=NewsTypeFormUpdate(request.POST,instance=news)
    message=saving_news_type_update(form)
    return render(request,'categoryedit.html',{"message":message})


#news search application
@login_required
def news_search(request):
    form=NewsSearchForm()
    if request.method == "POST":
        NewsSearch=request.POST.get("NewsSearch")
        FromDate=request.POST.get("FromDate")
        ToDate=request.POST.get("ToDate")
        news_details_list=news_search_query(NewsSearch,FromDate,ToDate,form)
        paginator=Paginator(news_details_list,3)
        page_number=request.GET.get("page")
        posts_obj=paginator.get_page(page_number)
    else:
        news_details_list=get_all_news_details()
        paginator=Paginator(news_details_list,3)
        page_number=request.GET.get("page")
        posts_obj=paginator.get_page(page_number)
    return render(request,"newssearch.html",{"form":form,"data":news_details_list,"posts_obj":posts_obj})




#ADDING NEWS TO THE DATABASE VIEWS
@login_required
def add_news_details(request):
    message=""
    form=NewsDetailsForm()
    if request.method =='POST':
        form=NewsDetailsForm(request.POST)
        message=saving_news_details(form)
    return render(request,'addnews.html',{"message":message,"form":form})



#Edit the existing news database
@login_required
def edit_news_details(request,slno):
    message=""
    news_details_list=get_edit_news_details(slno)
    if timezone.now().date() >= news_details_list.publish_date:
        message="News has been already published cannot be updated"
        form=NewsSearchForm()
        news_details_list=get_all_news_details()
        paginator=Paginator(news_details_list,3)
        page_number=request.GET.get("page")
        posts_obj=paginator.get_page(page_number)
        return render(request,"newssearch.html",{"message":message,"form":form,"data":news_details_list,"posts_obj":posts_obj})
    else:
        form=NewsDetailsFormUpdate(instance=news_details_list)
        return render(request,"newsupdate.html",{"db_news_details":news_details_list,'form':form,"message":message})



#update the news in database
@login_required
def update_news_details(request,slno):
    db_news_details=get_edit_news_details(slno)#db news
    form=NewsDetailsFormUpdate(request.POST,instance=db_news_details)
    message=get_update_news_details(form)
    return render(request,'newsupdate.html',{"db_news_details":db_news_details,"message":message,"form":form})



@login_required
def get_user_details(request):
    form=UsersForm()
    users_list=get_users_list()
    return render(request,'users.html',{"form":form,'users_list':users_list})



@login_required
def post_user_details(request):
    if request.method =='POST':
        form=UsersForm(request.POST)
        message=post_users_list(form)
    else:
        form=UsersForm()
    users_list = get_users_list()
    return render(request,'users.html',{"form":form,"message":message,"users_list":users_list})


@login_required
def edit_user_details(request,slno):
    db_user_details=get_edit_user_details(slno)
    form=UsersUpdateForm(instance=db_user_details)
    users_list=get_users_list()
    return render(request,"users1.html",{"form":form,"db_user_details":db_user_details,"users_list":users_list})


@login_required
def update_user_details(request,slno):
    db_user_details=get_edit_user_details(slno)
    form=UsersUpdateForm(request.POST,instance=db_user_details)
    message=get_update_user_details(form)
    users_list=get_users_list()
    return render(request,'users1.html',{"db_user_details":db_user_details,"form":form,"message":message,"users_list":users_list})

def logout_view(request):
    logout(request)
    message="You are successfully logged out"
    return render (request,"testapp/home.html",{"message":message})

@login_required
def home(request):
    return render(request,"testapp/home1.html")

@login_required 
def sendmail(request):
    if request.method=="POST":
        email=request.POST.get("email")    
        msg =request.POST.get("msg")
        subject="Category added"
        message="Hello admin sir,You got a message, His email id is: "+ str(email)+" and he want to connect and his reason for contacting you is:"+ str(msg)
        from_email=settings.EMAIL_HOST_USER
        recipient_list=[settings.RECIPIENT_ADDRESS]
        send_mail(subject,message,from_email,recipient_list,fail_silently=False)
    return HttpResponse("Your message successfully sent")



@login_required
def add_bulk_news(request):
    if request.method == "POST":
        excel_file = request.FILES["excel_file"]
        df = pd.DataFrame(pd.read_excel(excel_file))
        message = get_add_bulk_news(df)
    return render(request, 'testapp/fileupload.html',{"message":message})


        