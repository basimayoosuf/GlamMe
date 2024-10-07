from django.http import HttpResponse
from django.shortcuts import render
from previous_work.models import PreviousWork

# Create your views here.

def pvswork(request):
    return render(request, 'previous_work/pvswork.html')

def view_prvswrk(request):
    return render(request, 'previous_work/view_prvswrk.html')


from rest_framework.views import APIView, Response
from previous_work.serializers import android_serialiser


class previous_work(APIView):
    def post(self, request):
        obj = PreviousWork()
        obj.image=request.data['image']
        obj.artist_id=1
        obj.save()
        return HttpResponse('yes')


class view_previous_work(APIView):
    def get(self, request):
        obj = PreviousWork.objects.all()
        pre = android_serialiser(obj, many=True)
        return Response(pre.data)
