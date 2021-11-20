"""Map URL patterns to view function"""
from django.urls import path, include

from . import views


urlpatterns = [
    path("accounts/", include("django.contrib.auth.urls")),
    path("my_account/", views.my_account, name="my_account"),
    path("login/", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
    path("signup/", views.signup_view, name="signup"),
]
