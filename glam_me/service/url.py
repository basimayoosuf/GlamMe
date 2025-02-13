from django.conf.urls import url
from service import views

urlpatterns = [
    url('add/',views.service),
    url('viewservice/', views.viewservice),
    url('serv_view/',views.view_services.as_view()),
    url('service/',views.add_ser.as_view()),
    url('xyz',views.artistservice.as_view()),
    url('artservice',views.view_artservices.as_view()),

]
