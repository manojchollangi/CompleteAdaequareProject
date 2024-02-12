from django.db import models

class Users(models.Model):
    slno = models.AutoField(db_column='SLNO', primary_key=True)  # Field name made lowercase.
    user_name = models.CharField(db_column='USER_NAME', max_length=20, db_collation='utf8mb4_0900_ai_ci')  # Field name made lowercase.
    first_name = models.CharField(db_column='FIRST_NAME', max_length=50, db_collation='utf8mb4_0900_ai_ci')  # Field name made lowercase.
    last_name = models.CharField(db_column='LAST_NAME', max_length=50, db_collation='utf8mb4_0900_ai_ci')  # Field name made lowercase.
    email = models.CharField(db_column='EMAIL', max_length=50, db_collation='utf8mb4_0900_ai_ci')  # Field name made lowercase.
    password = models.CharField(db_column='PASSWORD', max_length=100, db_collation='utf8mb4_0900_ai_ci')  # Field name made lowercase.
    re_enter_password = models.CharField(db_column='RE_ENTER_PASSWORD', max_length=100, db_collation='utf8mb4_0900_ai_ci')  # Field name made lowercase.
    cell_number = models.BigIntegerField(db_column='CELL_NUMBER')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'users'

    
