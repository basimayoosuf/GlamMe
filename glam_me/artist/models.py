from django.db import models


# Create your models here.
class Artist(models.Model):
    artist_id = models.AutoField(primary_key=True)
    artistname = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    qualification = models.CharField(max_length=45)
    e_mail = models.CharField(db_column='e-mail', max_length=45)  # Field renamed to remove unsuitable characters.
    phone = models.IntegerField()
    image = models.CharField(max_length=500)
    portfolio_image = models.CharField(max_length=500)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'artist'
