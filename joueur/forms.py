"""Forms for search view"""
from django import forms
from django.forms import ModelForm

from .models import Classe, Race, Personnages, Def, Carac

class CreaPersoForm(ModelForm):
    "Create personnage form"


    classe = forms.ModelMultipleChoiceField(
        queryset=Classe.objects.all().order_by("nom"),
        widget=forms.Select,
    )

    race = forms.ModelMultipleChoiceField(
        queryset=Race.objects.all().order_by("nom"),
        widget=forms.Select,
    )


    class Meta:
        model = Personnages
        fields = [
            "nom",
            "age",
            "gender",
            "taille",
            "poids",
            "alignement",
            "divinite",
            "initiative",
            "classe",
            "race"
        ]

