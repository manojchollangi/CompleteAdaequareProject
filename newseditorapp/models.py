from django.db import models

# Create your models here.
class Packages(models.Model):
    sub_no = models.IntegerField(db_column='SUB_NO', primary_key=True)  # Field name made lowercase.
    sub_name = models.CharField(db_column='SUB_NAME', max_length=20, blank=True, null=True)  # Field name made lowercase.
    time_period = models.IntegerField(db_column='TIME_PERIOD', blank=True, null=True)  # Field name made lowercase.
    package_amount = models.FloatField(db_column='PACKAGE_AMOUNT')  # Field name made lowercase.
    package_details = models.CharField(db_column='PACKAGE_DETAILS', max_length=50)


    class Meta:
        managed = False
        db_table = 'packages'
