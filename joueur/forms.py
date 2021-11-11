"""Forms for search view"""
from django import forms
from django.forms import ModelForm

from .models import Classe, Race, Personnages, Def, Carac

class CreaPersoForm(ModelForm):
    "Create personnage form"

    class Meta:
        model = Personnages
        fields = [
            "nom",
            "age",
            "sex",
            "taille",
            "poids",
            "alignement",
            "divinite",
            "initiative",
            "point_carac",
        ]

