from urllib import response
from rest_framework.test import APITestCase
from django.urls import reverse
from newsapp.models import *
from django.contrib.auth.models import User
from rest_framework.test import APIClient
from rest_framework import status



class TestViews(APITestCase):
    token=''
    def setUp(self):
        print("******creating a user******")
        self.admin = User.objects.create_user(username='admin', email='admin@test.com', password='password123', is_staff=True)
        self.admin.save()


    def test_user_can_login(self):
        print('*****User can login*****')
        url='/api/signin/'
        data={'username':'admin','password':'password123'}
        self.client = APIClient()
        response = self.client.post(url,data)
        self.assertEqual(response.status_code, 200)
        #print(response.content)
        print(response.data['token'])
        self.token=response.data['token']

    def test_user_news_type(self):
        #creating a news type
        news_type={'news_type':'NATIONAL','new_type_display':'NATIONAL','record_start_date':'2022-09-30','record_end_date':'2022-10-31'} 
        print('*****authorization through JWT token*****')
        self.client.credentials(HTTP_AUTHORIZATION='JWT {0}'.format(self.token)
        )
        response = self.client.post(reverse('add_category'), news_type)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        print(response.content)

    def test_user_view_existing_views(self):
        #displaying the news_objects IN THE DATABASE
        print('***********Available database objects in DB************')
        response = self.client.get(reverse('add_news_details'),data={})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        print("response:",response.content)
        qs=NewsDetails.objects.all()
        self.assertEqual(qs.count(), 0)

    def test_user_add_news_details(self):
        #creating a news object 
        print('******Creating news object*******')
        news_details={'news_header':'modi is a good person','news_data':'Modi finally showed some kindness on prisoners','news_type':"NATIONAL",'news_images_urls':'','publish_date':'2022-09-30','record_start_date':'2022-09-30','record_end_date':'2022-10-31'}
        self.client.credentials(HTTP_AUTHORIZATION='JWT {0}'.format(self.token)
        )
        response = self.client.post(reverse('add_news_details'), news_details)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        print(response.content)
        qs=NewsDetails.objects.all()
        self.assertEqual(qs.count(), 1)