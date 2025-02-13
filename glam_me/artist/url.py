from django.conf.urls import url
from artist import views

urlpatterns = [
    url('manageartist/', views.manage_artist),
    url('approve/(?P<idd>\w+)', views.approve),
    url('reject/(?P<idd>\w+)', views.reject),
    url('approved/',views.approved),
    url('rejected/',views.rejected),
    url('pending/',views.pending),


    url('artist_reg/',views.artist_reg.as_view()),
    url('view_artist/',views.view_artist.as_view()),
    url('ccc/',views.ccc.as_view()),
    url('update/',views.update.as_view()),
    url('upload/',views.upload_image),
    url('uploadport/',views.upload_portfolio)

]