from django.http import HttpResponse
from django.shortcuts import render
from artist.models import Artist
from login.models import Login

# Create your views here.
# def artistreg(request):

#     return render(request, 'artist/artistregister.html')


def manage_artist(request):
    obj = Artist.objects.all().order_by('-artist_id')
    context = {
        'h': obj
    }
    return render(request, 'artist/manage_artist.html',context)

def approved(request):
    obj = Artist.objects.filter(status='Approved')
    context = {
        'h': obj
    }
    return render(request, 'artist/approved.html',context)

def rejected(request):
    obj = Artist.objects.filter(status='Rejected')
    context = {
        'h': obj
    }
    return render(request, 'artist/rejected.html',context)
def pending(request):
    obj = Artist.objects.filter(status='pending')
    context = {
        'h': obj
    }
    return render(request, 'artist/pending.html',context)

def approve(request, idd):
    obj = Artist.objects.get(artist_id=idd)
    obj.status = 'Approved'
    obj.save()
    return manage_artist(request)

def reject(request, idd):
    obj = Artist.objects.get(artist_id=idd)
    obj.status = 'Rejected'
    obj.save()
    return manage_artist(request)

# def view_artist(request):
#     return render(request, 'artist/view_artist.html')

from rest_framework.views import APIView, Response
from artist.serializers import android_serialiser

class artist_reg(APIView):
    def post(self, request):
        obj = Artist()
        obj.artistname = request.data['artistname']
        obj.password=request.data['password']
        obj.qualification=request.data['qualification']
        obj.e_mail=request.data['email']
        obj.phone=request.data['phone']
        obj.image=request.data['image']
        obj.portfolio_image=request.data['portfolio_image']
        obj.status='pending'
        obj.save()
        ob=Login()
        ob.username=obj.artistname
        ob.password=obj.password
        ob.u_id=obj.artist_id
        ob.type='artist'
        ob.status="pending"
        ob.save()
        return HttpResponse('yes')

class view_artist(APIView):
    def get(self, request):
        obj = Artist.objects.all()
        art = android_serialiser(obj, many=True)
        return Response(art.data)

class ccc(APIView):
    def post(self,request):
        ob=Artist.objects.filter(artist_id=request.data['usid'])
        ser=android_serialiser(ob,many=True)
        return Response(ser.data)

class update(APIView):
    def post(self,request):
        ob=Artist.objects.get(artist_id=request.data['usid'])
        ob.artistname = request.data['artistname']
        ob.qualification = request.data['qualification']
        ob.email = request.data['email']
        ob.phone = request.data['phone']
        ob.save()
        return HttpResponse("yes")


from glam_me import settings
from django.core.files.storage import  FileSystemStorage
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
def upload_image(request):
    if request.method=='POST' and request.FILES['file']:
        mfile=request.FILES['file']
        fs=FileSystemStorage()
        fpath=str(settings.BASE_DIR) + (settings.STATIC_URL) + mfile.name
        fname=fs.save(fpath,mfile)
        print(fname)
        return HttpResponse("yes")

def upload_portfolio(request):
    if request.method=='POST' and request.FILES['portfolio']:
        mfile=request.FILES['portfolio']
        fs=FileSystemStorage()
        fpath=str(settings.BASE_DIR) + (settings.STATIC_URL) + mfile.name
        fname=fs.save(fpath,mfile)
        print(fname)
        return HttpResponse("yes")