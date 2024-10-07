from django.http import HttpResponse
from django.shortcuts import render
from artist_complaint.models import ArtistComplaint
import datetime
# def artistcmplt(request):
#     return render(request, 'artist_complaint/artistcmplt.html')

def artistcmpltreply(request, idd):
    if request.method =='POST':
        obj = ArtistComplaint.objects.get(artist_comp_id=idd)
        obj.reply = request.POST.get('reply')
        obj.save()
        return view_artistcmplnt(request)
    return render(request, 'artist_complaint/artistcmpltreply.html')

def view_artistcmplnt(request):
    obj = ArtistComplaint.objects.all()
    context = {
        'g': obj
    }
    return render(request, 'artist_complaint/view_artistcmplnt.html', context)

# def viewartistreply(request):
#     return render(request, 'artist_complaint/viewartistreply.html')


from rest_framework.views import APIView, Response
from artist_complaint.serializers import android_serialiser


class artist_complaint(APIView):
    def post(self, request):
        obj = ArtistComplaint()
        obj.complaint=request.data['complaint']
        obj.booking_id=1
        obj.reply='pending'
        obj.artist_id=1
        obj.date=datetime.datetime.today()

        obj.save()
        return HttpResponse('yes')


class view_artistcomplaint(APIView):
    def get(self,request):
        obj=ArtistComplaint.objects.all()
        artcom=android_serialiser(obj,many=True)
        return Response(artcom.data)


