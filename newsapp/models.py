from tkinter import N
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver,receiver
from django.conf import settings
from django.core.mail import send_mail
from django.http import HttpResponse


class NewsDetails(models.Model):
    slno = models.AutoField(primary_key=True)
    news_header = models.CharField(max_length=500, blank=True, null=True)
    news_data = models.TextField(blank=True, null=True)
    news_type = models.CharField(max_length=50, blank=True, null=True)
    news_images_urls = models.CharField(max_length=500, blank=True, null=True)
    publish_date = models.DateField(blank=True, null=True)
    record_start_date = models.DateField(blank=True, null=True)
    record_end_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'news_details'


class NewsType(models.Model):
    slno = models.AutoField(primary_key=True)
    news_type = models.CharField(max_length=50, blank=True, null=True)
    new_type_display = models.CharField(max_length=100, blank=True, null=True)
    record_start_date = models.DateField(blank=True, null=True)
    record_end_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'news_type'
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)


def sendmail(sender,instance,created,*args,**kwargs):
    subject="A New Category Added"
    message="Hi,User a new category is being added to the exiting category.Kindly check if not please contact your admin"
    from_email=settings.EMAIL_HOST_USER
    recipient_list=[settings.RECIPIENT_ADDRESS]
    print("A new Category added to the exiting category.Kindly check if not please contact your admin")
    send_mail(subject,message,from_email,recipient_list,fail_silently=False)
    if created:
        instance.save()
    return HttpResponse("Email sent successfully")
post_save.connect(sendmail,sender=NewsType)