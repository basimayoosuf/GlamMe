
# from django.db import models
# from service.models import Service
#
#
#
#
# class Artistservice(models.Model):
#     aservice_id = models.AutoField(primary_key=True)
#     # service_id = models.IntegerField()
#     service = models.ForeignKey(Service, on_delete=models.CASCADE)
#     description = models.CharField(max_length=600)
#     rate = models.IntegerField()
#
#     class Meta:
#         managed = False
#         db_table = 'artistservice'
