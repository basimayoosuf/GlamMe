from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login
# Create your views here.

def login(request):
    if request.method =="POST":
        eml = request.POST.get("uname")
        passw = request.POST.get("psw")
        obj = Login.objects.filter(username=eml,password=passw)
        # print(len(obj))
        tp =""
        for ob in obj :
            tp = ob.type
            uid = ob.u_id
            if tp == "admin" :
                request.session["u_id"]=uid
                return HttpResponseRedirect('/temp/admin/')
            else :
                objlist = "email or password incorrect....Please try again....!"
                context = {
                    'msg' : objlist,

                }
                return render(request, 'login/login.html',context)
    return render(request, 'login/login.html')



from rest_framework.views import APIView,Response
from login.serializers import android_serialiser

class login_flutter(APIView):
    def get(self,request):
        ob = Login.objects.all()
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)

    def post(self,request):
        username = request.data['username']
        password = request.data['password']
        ob = Login.objects.filter(username=username, password=password)
        ser = android_serialiser(ob, many=True)
        return Response(ser.data)

