from django.contrib import admin
from django.urls import path
from . import views



urlpatterns = [
    path('', views.news_types_view),
    path('news', views.news_details),
    path("retrieve/",views.retrieve_active_news_types),
    path("newspaper",views.display_active_categories),
    path('newspaper/news/<int:slno>/',views.news_details_id),
    path('packages',views.packages),
    path('subscribe/',views.active_subscription),
    path('signupuser/',views.user_signup),
    path('signup/',views.user_render),
    path('login',views.user_login,name='login'),
    path('redirect',views.login_redirect),
    #path('payment',views.payment),
    path('payment/',views.process_payment,name='payment'),
    path('paypal-return/',views.paypal_return,name='paypal-return'),
    path('paypal-cancel/',views.paypal_cancel,name='paypal-cancel'),
    path('users',views.users),
    path('register/',views.RegisterUser.as_view()),
]
