from django.conf.urls import url
from notification import views

urlpatterns = [
    url('notification/', views.notification),
    url('view_notifction/', views.view_notification.as_view())
]