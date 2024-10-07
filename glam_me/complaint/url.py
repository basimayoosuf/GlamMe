from django.conf.urls import url
from complaint import views

urlpatterns = [
    url('postreply/(?P<idd>\w+)',views.postreply),
    url('viewcomplaint/',views.viewcomplaint),
    url('complaint/',views.complaint.as_view()),
    url('view_complaint/',views.view_complaint.as_view())

]