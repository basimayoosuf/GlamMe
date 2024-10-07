from django.conf.urls import url
from service import views

urlpatterns = [
    url('viewservice/', views.viewservice),
    url('view_services/',views.view_services.as_view())
]
