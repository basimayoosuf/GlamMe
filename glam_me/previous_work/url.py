from django.conf.urls import url
from previous_work import views

urlpatterns = [
      url('previous_work/',views.previous_work.as_view()),
      url('view_previous_work/',views.view_previous_work.as_view())

]