from newsapp.models import NewsType,NewsDetails
from newsapp.serializers import NewsDetailsSerializer,NewsTypeSerializer
from rest_framework.response import Response
from rest_framework.generics import *
from rest_framework.pagination import PageNumberPagination
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication




class SetPagination1(PageNumberPagination):
    page_size=2
    page_query_param="mypage"
    page_size_query_param="num"
    max_page_size=15



class PaginationAPI1(ListAPIView):
    queryset=NewsDetails.objects.all()
    pagination_class=SetPagination1
    serializer_class=NewsDetailsSerializer
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]




class SetPagination2(PageNumberPagination):
    page_size=5
    page_query_param="mypage"
    page_size_query_param="num"
    max_page_size=3




class PaginationAPI2(ListAPIView):
    queryset=NewsType.objects.all()
    pagination_class=SetPagination2
    serializer_class=NewsTypeSerializer
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]



class NewsDetailsGetPost(ListCreateAPIView):
    queryset=NewsDetails.objects.all()
    serializer_class=NewsDetailsSerializer
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]
    
    def get(self, request,format=None):
        queryset=NewsDetails.objects.all()
        serializer=NewsDetailsSerializer(queryset,many=True)
        return Response(serializer.data)



class NewsDetailsGetslno(RetrieveUpdateDestroyAPIView):
    queryset=NewsDetails.objects.all()
    serializer_class=NewsDetailsSerializer
    lookup_field='slno'
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]


class NewsTypeGetPost(ListCreateAPIView):
    queryset=NewsType.objects.all()
    serializer_class=NewsTypeSerializer
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]

    def get(self, request,format=None):
        queryset=NewsType.objects.all()
        serializer=NewsTypeSerializer(queryset,many=True)
        return Response(serializer.data)



class NewsTypeGetslno(RetrieveUpdateDestroyAPIView):
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]
    queryset=NewsType.objects.all()
    serializer_class=NewsTypeSerializer
    lookup_field='slno'



class NewsSearchAPI(generics.ListAPIView):
    serializer_class=NewsDetailsSerializer
    authentication_classes=[JSONWebTokenAuthentication]
    permission_classes=[IsAuthenticated]

    def get_queryset(self):
        queryset=NewsDetails.objects.all()
        newssearch = self.request.query_params.get('newssearch')
        fromdate = self.request.query_params.get('fromdate')
        todate=self.request.query_params.get('todate')
        if newssearch and fromdate and todate is not None:
            queryset=queryset.filter(news_data__icontains=newssearch,publish_date__range=[fromdate, todate])
        return queryset

    