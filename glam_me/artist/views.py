from django.http import HttpResponse
from django.shortcuts import render
from artist.models import Artist

# Create your views here.
# def artistreg(request):

#     return render(request, 'artist/artistregister.html')


def manage_artist(request):
    obj = Artist.objects.all()
    context = {
        'h': obj
    }
    return render(request, 'artist/manage_artist.html',context)


def approve(request, idd):
    obj = Artist.objects.get(artistid=idd)
    obj.status = 'Approved'
    obj.save()
    return manage_artist(request)

def reject(request, idd):
    obj = Artist.objects.get(artistid=idd)
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
        return HttpResponse('yes')

class view_artist(APIView):
    def get(self, request):
        obj = Artist.objects.all()
        art = android_serialiser(obj, many=True)
        return Response(art.data)
