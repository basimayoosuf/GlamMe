# Generated by Django 3.2.25 on 2024-08-31 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('bookingid', models.AutoField(primary_key=True, serialize=False)),
                ('serviceid', models.IntegerField()),
                ('userid', models.IntegerField()),
                ('date', models.DateField()),
                ('time', models.TimeField()),
                ('status', models.CharField(max_length=45)),
            ],
            options={
                'db_table': 'booking',
                'managed': False,
            },
        ),
    ]
