from apscheduler.schedulers.background import BackgroundScheduler
from newsapp.models import NewsDetails, sendmail
from datetime import datetime,timedelta
from django.conf import settings
from django.core.mail import send_mail


# Creates a default Background Scheduler
sched = BackgroundScheduler()
 
def delete_news():
    try:
        news_objects=NewsDetails.objects.filter(publish_date__lte=datetime.now()-timedelta(days=5))
        msg = "<table>"
        if len(news_objects)>0:
            for news_item  in news_objects:
                msg += "<tr><td>"+str(news_item.publish_date)+"</td><td>"+news_item.news_header+"</td></tr>"
            msg += "</table>"
            NewsDetails.objects.filter(publish_date__lte=datetime.now()-timedelta(days=5)).delete()
            subject="The following news records are deleted from database "
            message="Hi Manoj,"+"\n"+"The following records are deleted from database with a news header and publish date"+ msg
            from_email=settings.EMAIL_HOST_USER
            recipient_list=[settings.RECIPIENT_ADDRESS]
            send_mail(subject,message,from_email,recipient_list,fail_silently=False)
    except Exception as e:
        print("The exception is :",str(e))
    
    
sched.add_job(delete_news,trigger='cron',day_of_week='*', hour='8', minute='30')
 
# Starts the Scheduled jobs
sched.start()
