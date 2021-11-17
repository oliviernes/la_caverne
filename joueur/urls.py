"""Map URL patterns to view function"""
from django.urls import path

from . import views

urlpatterns = [
    path("", views.calcul, name="calcul"),
    path("fiche_perso/",views.fiche_perso, name="fiche_perso"),
    path("liste_perso/",views.liste_perso, name="liste_perso")
]