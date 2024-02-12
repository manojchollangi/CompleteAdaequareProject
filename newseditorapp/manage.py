from email import message
from mailbox import Message
import re
from urllib import request
from newsapp.models import *
from newsapp.views import news_details
from .forms import *
from django.db.models import Q
from .users.models import Users



def getFilterNewsTypes():
    return NewsType.objects.values_list('news_type').filter()

def get_news_type_slno(slno):
    return NewsType.objects.get(slno=slno)


def saving_news_type(form):
    message1=''
    if form.is_valid():
        try:
            form.save()
            message1="Details are successfully submitted"
        except Exception as e:
            message1="Failed to add  news_category" + str(e)
    else:
        message1="Errors occurred while adding the category"
    return message1

def saving_news_type_update(form):
    message1=''
    if form.is_valid():
        news_type=form.cleaned_data['news_type']
        new_type_display=form.cleaned_data['new_type_display']
        record_start_date=form.cleaned_data['record_start_date']
        record_end_date=form.cleaned_data['record_end_date']
        try:
            form.save()
            message1 += "Category successfully updated"
        except Exception as e:
            message1 +="Failed to update the news_type" + str(e)
    else:
        message1+="Some errors occured while modifying category"
    return message1



def news_search_query(NewsSearch,FromDate,ToDate,form):
    search=(Q(news_data__icontains=NewsSearch.strip()) & Q(publish_date__gte=FromDate) & (Q(publish_date__lte=ToDate)))
    news_details_list=NewsDetails.objects.filter(search)
    print(news_details_list)
    return news_details_list

def get_all_news_details():
    return NewsDetails.objects.all()

def saving_news_details(form):
    message=""
    if form.is_valid():
        try:
            form.save()
            message="News added Successfully"
        except Exception as e:
            message="Failed to add news" + str(e)
    else:
        message="Error in adding a news"
    return message

def get_edit_news_details(slno):
    return NewsDetails.objects.get(slno=slno)

def get_update_news_details(form):
    message=""
    if form.is_valid():
        try:
            form.save()
            message="Details updated successfully"
        except Exception as e:
            message="Failed to update record : " + str(e)
    return message

def get_users_list():
    return Users.objects.all()

def post_users_list(form):
    message=""
    if form.is_valid():
        password=form.cleaned_data['password']
        re_enter_password=form.cleaned_data['re_enter_password']
        cell_number=form.cleaned_data['cell_number']
        try:
            form.save()
            message="User Details added Successfully"
        except Exception as e:
            message="Failed to add user details" + str(e)
    return message

def get_edit_user_details(slno):
    return Users.objects.get(slno=slno)

def get_update_user_details(form):
    message=""
    if form.is_valid():
        try:
            form.save()
            message="User Details updated successfully"
        except Exception as e:
            message="Failed to update record : " + str(e)
    return message

def get_add_bulk_news(df):
    message=""
    news_list = []
    for index, row in df.iterrows():
        record=NewsDetails()
        record.news_header=row["news_header"]
        record.news_data=row["news_data"]
        record.news_type=row["news_type"]
        record.news_images_urls=row["news_images_urls"]
        record.publish_date=row["publish_date"]
        record.record_end_date=row["record_start_date"]
        record.record_end_date=row["record_end_date"]
        news_list.append(record)
    NewsDetails.objects.bulk_create(news_list)
    message +="you are successfully added a file and data stored into database."
    return message
