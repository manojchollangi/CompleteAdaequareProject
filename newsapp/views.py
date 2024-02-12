
from django.http import JsonResponse, HttpResponse
from .serializers import *
from .manage import *
from newseditorapp.users.forms import *
from django.shortcuts import render, redirect
from django.urls import reverse
from newseditorapp.users.models import Users
from paypal.standard.forms import PayPalPaymentsForm
from django.conf import settings
from django.contrib import messages
import uuid
from django.core import serializers
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from django.contrib.auth import login,authenticate,logout
from django.contrib.auth.decorators import login_required



import logging
logger = logging.getLogger("newsapp_views")





# get available news in the database.
def news_types_view(request):
    #getting all news list from backend please check it once 
    custom_news_list = get_valid_news_types()
    news_list=custom_news_list
    return render(request, 'testapp/news.html', {"news_list": news_list})


#json serialization data
def news_details(request):
    news_type = request.GET['news_type']
    news_details_list = get_news_details(news_type)
    serializer = NewsDetailsSerializer(news_details_list, many=True)
    return JsonResponse({'news': serializer.data})


#get active newstypes
def retrieve_active_news_types(request):
    news_headlines=get_news_headlines()
    serializer=CategoryNewsSerializer(news_headlines,many=True)
    return JsonResponse({"news_type": serializer.data})


def display_active_categories(request):
    return render (request,'testapp/newspaper.html')

#get news based on id
def news_details_id(request,slno):
    news_details=get_news_details_filter_id(slno)
    return render (request,'testapp/newsdetails.html',{"newsdetails": news_details})


@login_required
def packages(request):
    return render (request,'testapp/subscribe.html')


#available packages
@login_required
def available_packages(request):
    subscription_packages=Package.objects.all()
    return render (request,'testapp/signup.html',{"subscription_packages": subscription_packages})


@login_required
def active_subscription(request):
    subscription_packages = get_subscription_packages()
    serializer = SubscriptionSerializer(subscription_packages,many=True)
    return JsonResponse({"subscription_packages": serializer.data})


@login_required
def user_signup(request):
    if request.method == 'POST':
        user_name = request.POST['user_name']
        logger.info('User entered username',user_name)
        first_name = request.POST['first_name']
        logger.info('User entered firstname',first_name)
        last_name = request.POST['last_name']
        logger.info('User entered lastname',last_name)
        email = request.POST['email']
        logger.info('User entered email',email)
        password = request.POST['password']
        logger.info('User entered password',password)
        re_enter_password = request.POST['re_enter_password']
        logger.info('User entered re_enter_password',re_enter_password)
        cell_number = request.POST['cell_number']
        logger.info('User entered cell_number',cell_number)
        
        new_user = Users(user_name = user_name,first_name=first_name,last_name=last_name,email=email,password=password,re_enter_password=re_enter_password,cell_number=cell_number)
        
        print(new_user)
        logger.info('News Users',new_user)
        
        new_user.save()
        logger.info('saved new user',new_user)
        success = 'user '+ user_name + ' Created successfully'
        logger.info('success',success)
        return JsonResponse({"success":success,"user_name":user_name})

@login_required
def user_render(request):
    users_list=Users.objects.all()
    print(users_list) 
    return render (request,'testapp/signup.html',{"users_list":users_list})
    

 
def user_login(request):
    form = LoginForm()
    return render (request,'testapp/login.html',{"form":form})


def login_redirect(request):
    if request.method == "POST":
        form=LoginForm(request.POST)
        user_name=request.POST["user_name"]
        password=request.POST["password"]
        user = authenticate(username=user_name,password=password)
        if user is not None:
            login(request, user)
            user_name = user.username
            return render(request,'testapp/loggedin.html')
        else:
            messages.error(request, 'Bad credentials')
            return redirect('/newsapp/login')



@login_required
def payment(request):
    return render (request,'testapp/payment.html')


@login_required
def process_payment(request):
    #order_id = request.session.get('order_id')
    #item_name = request.POST['order_id']  
    host = request.get_host()
    paypal_dict = {
        'business': settings.PAYPAL_RECEIVER_EMAIL,
        'amount': '20.00',#'%.2f' % order.total_cost().quantize(Decimal('.01')),
        'item_name': 'product1',#'Order {}'.format(order.id),
        'invoice': str(uuid.uuid4()), #str(order.id),
        'currency_code': 'USD',
        'notify_url': 'http://{}{}'.format(host,reverse('paypal-ipn')),
        'return_url': 'http://{}{}'.format(host,reverse('paypal-return')),
        'cancel_return': 'http://{}{}'.format(host,reverse('paypal-cancel')),
    }
    form = PayPalPaymentsForm(initial=paypal_dict)
    return render (request,'testapp/payment.html',{'form':form})


@login_required
def paypal_return(request):
    messages.success(request, 'Your are successfully made the payment!')
    return redirect('payment')


@login_required
def paypal_cancel(request):
    messages.error(request, 'Your payment has been canceled!!!')
    return redirect('payment')


@login_required
def users(request):
    user_names=Users.objects.all()
    return render (request,'testapp/signup.html',{'user_names':user_names})


def logout_view(request):
    logout(request)
    message="You are successfully logged out"
    return redirect ('/newsapp/login')


class RegisterUser(APIView):
    def post(self, request):
        serializer=RegisterUserSerializer(data=request.data)

        if not serializer.is_valid():
            return Response({"status":403, "message": "some errors are encountered","errors":serializer.errors})
        
        serializer.save()
        user=Users.objects.get(user_name=serializer.data['user_name'])
        token_obj= Token.objects.get_or_create(user_name=user)

        return Response({'status':200, 'payload':serializer.data,'token':str(token_obj)})
