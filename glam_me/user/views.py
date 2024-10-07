from django.http import HttpResponse
from django.shortcuts import render
from user.models import User

# Create your views here.

# def userregister(request):
#     return render(request, 'user/userregister.html')

def view_user(request):
    obj = User.objects.all()
    context = {
        'a': obj
    }

    return render(request, 'user/view_user.html', context)

from rest_framework.views import APIView,Response
from user.serializers import android_serialiser

class user_reg(APIView):
    def post(self,request):
        obj=User()
        obj.username=request.data['username']
        obj.password=request.data['password']
        obj.address=request.data['address']
        obj.email=request.data['email']
        obj.phone=request.data['phone']
        obj.location=request.data['location']

        obj.save()
        return HttpResponse('yes')

