from django.conf.urls import url
from artist_complaint import views

urlpatterns = [
    url('artistcmpltreply/(?P<idd>\w+)',views.artistcmpltreply),
    url('view_artcmplnt/',views.view_artistcmplnt),
    url('artistcmplt/',views.artist_complaint.as_view()),
    url('reply_vw/',views.view_reply.as_view()),

]


