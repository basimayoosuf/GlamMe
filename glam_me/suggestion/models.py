from django.db import models
from user.models import User
# Create your models here.
class Suggestion(models.Model):
    suggestionid = models.AutoField(primary_key=True)
    suggestion = models.CharField(max_length=500)
    # userid = models.IntegerField()
    user = models.ForeignKey(User,on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'suggestion'

