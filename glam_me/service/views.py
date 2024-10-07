from django.http import HttpResponse
from django.shortcuts import render
from service.models import Service
# Creaete your views here.

def service(request):
    return render(request, 'service/service.html')

def viewservice(request):
    obj = Service.objects.all()
    context = {
        'b': obj
    }
    return render(request, 'service/viewservice.html', context)


from rest_framework.views import APIView, Response
from service.serializers import android_serialiser

class view_services(APIView):
    def get(self,request):
        obj=Service.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)


class service(APIView):
    def post(self, request):
        obj = Service()
        obj.service=request.data['service']
        obj.artist_id=1
        obj.save()
        return HttpResponse('yes')


