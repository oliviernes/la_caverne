from django.shortcuts import render, redirect

# Create your views here.

from .forms import CreaPersoForm
from .models import (Classe, Race, Personnages, Def, Carac)

import pdb

def calcul(request):
    """Display calcul results and save user's personnage information."""

    if request.method == "POST":

        if request.user.is_authenticated:

            user = request.user

            form_perso = CreaPersoForm(request.POST)

            carac_liste = []

            forc = int(request.POST['for'])
            sag = int(request.POST['sag'])
            # int = int(request.POST['int'])
            # dex = int(request.POST['dex'])
            # con = int(request.POST['con'])
            # cha = int(request.POST['cha'])
            
            carac_liste.append(forc)
            carac_liste.append(sag)
            # carac_liste.append(int)
            # carac_liste.append(dex)
            # carac_liste.append(con)
            # carac_liste.append(cha)

            point_carac_assigned = sum(carac_liste) - 18

            if point_carac_assigned > 20:
                form_perso = CreaPersoForm()

                return render(request, "joueur/perso.html", { "form_perso": form_perso, "points_exceed": True })

            if form_perso.is_valid():

                breakpoint()

                nom = form_perso.cleaned_data["nom"]
                age = form_perso.cleaned_data["age"]
                gender = form_perso.cleaned_data["sex"]
                taille = form_perso.cleaned_data["taille"]
                poids = form_perso.cleaned_data["poids"]
                alignement = form_perso.cleaned_data["alignement"]
                divinite = form_perso.cleaned_data["divinite"]
                initiative = form_perso.cleaned_data["initiative"]

                point_carac = 20 - point_carac_assigned

                classe = Classe.objects.get(nom=request.POST['classe'])
                race = Race.objects.get(nom=request.POST['race'])

            personnages = Personnages(
                nom=nom,
                age=age,
                sex=gender,
                taille=taille,
                poids=poids,
                alignement=alignement,
                divinite=divinite,
                initiative=initiative,
                point_carac=point_carac,
                classe=classe,
                race=race,
                utilisateur=user
                )

            personnages.save()

            force = Carac(nom="force", valeur=forc, personnages=personnages)
            force.save()

            return render(request, "joueur/liste_perso.html")

        return redirect("login")

    form_perso = CreaPersoForm()

    return render(request, "joueur/perso.html", { "form_perso": form_perso })

def liste_perso(request):
    """Liste des personnages de l'utilisateur page"""
    return render(request, "joueur/liste_perso.html")

def fiche_perso(request):
    """fiche du personnages de l'utilisateur page"""
    return render(request, "joueur/fiche_perso.html")