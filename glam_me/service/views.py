from django.http import HttpResponse
from django.shortcuts import render
from service.models import Service
# Creaete your views here.

# def service(request):
#     return render(request, 'service/service.html')
from service.models import Artistservice


def service(request):
    if request.method == 'POST':
        obj = Service()
        obj.artist_id='1'
        obj.service = request.POST.get('ser')
        obj.save()
    return render(request, 'service/service.html')



def viewservice(request):
    obj = Service.objects.all().order_by('-service_id')
    context = {
        'b': obj
    }
    return render(request, 'service/viewservice.html', context)


from rest_framework.views import APIView, Response
from service.serializers import android_serialiser,android_serialiser1

class view_services(APIView):
    def get(self,request):
        obj=Service.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)



class view_artservices(APIView):
    # def get(self,request):
    #     obj=Service.objects.all()
    #     ser=android_serialiser(obj,many=True)
    #     return Response(ser.data)
    def post(self,request):
        sid=request.data['sid']
        obj=Artistservice.objects.filter(service_id=sid)
        ser=android_serialiser1(obj,many=True)
        return Response(ser.data)



class view_ser(APIView):
    def get(self,request):
        obj=Service.objects.all()
        service=android_serialiser(obj,many=True)
        return Response(service.data)



class add_ser(APIView):
    def post(self, request):
        obj = Service()
        obj.service=request.data['service']
        obj.artist_id=request.data['uid']
        obj.save()
        return HttpResponse('yes')


class artistservice(APIView):
    def post(self,request):
        obj = Artistservice()
        obj.service=request.data['ser']
        obj.service_id=request.data['sid']
        obj.description=request.data['description']
        obj.rate=request.data['rate']
        obj.artist_id=request.data['uid']
        obj.save()
        return HttpResponse('yes')

