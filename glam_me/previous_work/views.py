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
        obj.artist_id=request.data['uid']
        obj.save()
        return HttpResponse('yes')


class view_previous_work(APIView):
    def post(self, request):
        aid=request.data['aid']
        obj = PreviousWork.objects.filter(artist_id=aid)
        pre = android_serialiser(obj, many=True)
        return Response(pre.data)


from glam_me import settings
from django.core.files.storage import  FileSystemStorage
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
def upload_work(request):
    if request.method=='POST' and request.FILES['file']:
        mfile=request.FILES['file']
        fs=FileSystemStorage()
        fpath=str(settings.BASE_DIR) + (settings.STATIC_URL) + mfile.name
        fname=fs.save(fpath,mfile)
        print(fname)
        return HttpResponse("yes")