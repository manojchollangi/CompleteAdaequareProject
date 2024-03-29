# Generated by Django 3.2 on 2022-09-29 08:47

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Packages',
            fields=[
                ('sub_no', models.IntegerField(db_column='SUB_NO', primary_key=True, serialize=False)),
                ('sub_name', models.CharField(blank=True, db_column='SUB_NAME', max_length=20, null=True)),
                ('time_period', models.IntegerField(blank=True, db_column='TIME_PERIOD', null=True)),
                ('package_amount', models.FloatField(db_column='PACKAGE_AMOUNT')),
                ('package_details', models.CharField(db_column='PACKAGE_DETAILS', max_length=50)),
            ],
            options={
                'db_table': 'packages',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('slno', models.AutoField(db_column='SLNO', primary_key=True, serialize=False)),
                ('user_name', models.CharField(db_collation='utf8mb4_0900_ai_ci', db_column='USER_NAME', max_length=20)),
                ('first_name', models.CharField(db_collation='utf8mb4_0900_ai_ci', db_column='FIRST_NAME', max_length=50)),
                ('last_name', models.CharField(db_collation='utf8mb4_0900_ai_ci', db_column='LAST_NAME', max_length=50)),
                ('email', models.CharField(db_collation='utf8mb4_0900_ai_ci', db_column='EMAIL', max_length=50)),
                ('password', models.CharField(db_collation='utf8mb4_0900_ai_ci', db_column='PASSWORD', max_length=100)),
                ('re_enter_password', models.CharField(db_collation='utf8mb4_0900_ai_ci', db_column='RE_ENTER_PASSWORD', max_length=100)),
                ('cell_number', models.BigIntegerField(db_column='CELL_NUMBER')),
            ],
            options={
                'db_table': 'users',
                'managed': False,
            },
        ),
    ]
