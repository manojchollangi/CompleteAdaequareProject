from django.contrib import admin
from django.urls import path
from . import views


urlpatterns = [
    path("newscategory",views.existing_news_type),
    path("",views.existing_news_type),
    path('newscategory/news',views.add_news_type),
    path('newscategory/edit/<int:slno>',views.news_type_edit),
    path('newscategory/edit/update/<int:slno>', views.news_type_update),
    path('newssearch',views.news_search),
    path('newssearch/addnews',views.add_news_details,name='add_news'),
    path('newssearch/edit/<int:slno>',views.edit_news_details),
    path("newssearch/edit/update/<int:slno>",views.update_news_details),
    path("users/",views.get_user_details),
    path('users/post',views.post_user_details),
    path("users/edit/<int:slno>",views.edit_user_details),
    path("users/edit/update/<int:slno>",views.update_user_details),
    path("newssearch/addnews/upload",views.add_bulk_news),
]
