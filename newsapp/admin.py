from django.contrib import admin
from newsapp.models import NewsType,NewsDetails

# Register your models here.
class NewsAdmin(admin.ModelAdmin):
    list_display=['slno','news_type','new_type_display','record_start_date','record_end_date']
admin.site.register(NewsType,NewsAdmin)

class NewsDetailsAdmin(admin.ModelAdmin):
    list_display=['slno',"news_header","news_data","news_type","news_images_urls","publish_date","record_start_date",'record_end_date']

admin.site.register(NewsDetails,NewsDetailsAdmin)
