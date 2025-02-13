from django.conf.urls import url
from notification import views

urlpatterns = [
    url('notification/', views.notification),
    url('notificationuser/', views.notificationuser),
    url('artist/', views.view_notification_artist.as_view()),
    url('user/',views.view_notification_user.as_view())
]