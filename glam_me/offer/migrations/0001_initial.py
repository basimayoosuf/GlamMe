# Generated by Django 3.2.25 on 2024-08-31 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Offer',
            fields=[
                ('offerid', models.AutoField(primary_key=True, serialize=False)),
                ('offer', models.CharField(max_length=45)),
                ('offerdate', models.CharField(max_length=45)),
            ],
            options={
                'db_table': 'offer',
                'managed': False,
            },
        ),
    ]
