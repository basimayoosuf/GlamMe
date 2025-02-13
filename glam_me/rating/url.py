from django.conf.urls import url
from rating import views

urlpatterns = [
    url('viewrating/', views.viewrating),
    url('rating/',views.ratingg.as_view()),
    url('view',views.view.as_view())
]