from django.db import models

# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    address = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.CharField(max_length=20)
    location = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'user'

    def __str__(self):
        return self.username


