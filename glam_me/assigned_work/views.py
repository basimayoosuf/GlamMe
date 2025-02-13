from django.shortcuts import render
from assigned_work.models import AssignedWork
from assigned_work.models import AssignedWork
from artist.models import Artist
import datetime
from service.models import Service
from django.http import HttpResponse
def assignedwork(request,idd):
    ob = Artist.objects.all()
    context = {
        'a': ob,
    }
    if request.method == 'POST':
        obj = AssignedWork()
        obj.date = request.POST.get('bdate')
        obj.time = request.POST.get('btime')
        obj.booking_id = request.POST.get('book')
        obj.artist_id = request.POST.get('an')
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
    def post(self,request):
        uid=request.data['uid']
        statuses = ['accepted', 'pending', 'completed']
        # obj=AssignedWork.objects.filter(status='accepted',artist_id=uid)
        obj = AssignedWork.objects.filter(status__in=statuses, artist_id=uid)
        assw=android_serialiser(obj,many=True)
        return Response(assw.data)

class update(APIView):
    def post(self,request):
        obj=AssignedWork.objects.all()
        uid=request.data['uid']
        assw=android_serialiser(obj,many=True)
        return Response(assw.data)

class accept(APIView):
    def post(self,request):
        obj=AssignedWork.objects.get(assigned_id=request.data['aid'])
        obj.status='Accepted'
        obj.save()
        return HttpResponse('yes')

class reject(APIView):
    def post(self,request):
        obj=AssignedWork.objects.get(assigned_id=request.data['aid'])
        obj.status='Rejected'
        obj.save()
        return HttpResponse('yes')

class completed(APIView):
    def post(self, request):
        obj = AssignedWork.objects.get(assigned_id=request.data['aid'])
        obj.status = 'Completed'
        obj.save()
        return HttpResponse('yes')

class notcompleted(APIView):
    def post(self, request):
        obj = AssignedWork.objects.get(assigned_id=request.data['aid'])
        obj.status = 'pending'
        obj.save()
        return HttpResponse('yes')
