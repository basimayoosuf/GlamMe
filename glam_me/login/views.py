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