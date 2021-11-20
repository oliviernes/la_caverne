"""Forms for search view"""
from django.forms import ModelForm

from .models import Personnages


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
        ]
