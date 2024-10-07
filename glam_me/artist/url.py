from django.conf.urls import url
from artist import views

urlpatterns = [
    url('manageartist/', views.manage_artist),
    url('approve/(?P<idd>\w+)', views.approve),
    url('reject/(?P<idd>\w+)', views.reject),


    url('artist_reg/',views.artist_reg.as_view()),
    url('view_artist/',views.view_artist.as_view())

]