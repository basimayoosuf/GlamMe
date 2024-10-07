from django.shortcuts import render
from assigned_work.models import AssignedWork
from assigned_work.models import AssignedWork
from artist.models import Artist
from service.models import Service
def assignedwork(request):
    ob = Artist.objects.all()
    obb =Service.objects.all()
    context = {
        'a': ob,
        'b': obb
    }
    if request.method == 'POST':
        obj = AssignedWork()
        obj.date = request.POST.get('date')
        obj.time = request.POST.get('time')
        obj.booking_id = 1
        obj.service_id = 1
        obj.artist_id = request.POST.get('an')
        obj.service_id = request.POST.get('service')
        obj.status = 'pending'
        obj.save()
    return render(request, 'assigned_work/assignedwork.html', context)

def view_assignedwork(request):
    return render(request, 'assigned_work/view_assingedwork.html')

def view_wrkstatus(request):
    obj = AssignedWork.objects.all()
    context = {
        'f': obj
    }
    return render(request, 'assigned_work/view_wrkstatus.html', context)

from rest_framework.views import APIView, Response
from assigned_work.serializers import android_serialiser


class view_assigned_work(APIView):
    def get(self,request):
        obj=AssignedWork.objects.all()
        assw=android_serialiser(obj,many=True)
        return Response(assw.data)