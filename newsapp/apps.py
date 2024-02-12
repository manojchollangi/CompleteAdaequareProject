from django.apps import AppConfig


class NewsappConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'newsapp'


    def ready(self):
        from newseditorapp import scheduler
        scheduler.delete_news()