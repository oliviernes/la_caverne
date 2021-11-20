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
            int = int(request.POST['int'])
            dex = int(request.POST['dex'])
            con = int(request.POST['con'])
            cha = int(request.POST['cha'])

            carac_dic = {"forc": forc, "sag": sag, "int": int, "dex": dex, "con": con, "cha": cha}

            point_carac_assigned = -18

            for val in carac_dic.values():
                point_carac_assigned += val


            if point_carac_assigned > 20:
                form_perso = CreaPersoForm()

                return render(request, "joueur/perso.html", { "form_perso": form_perso, "points_exceed": True })

            if form_perso.is_valid():


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

            sagesse = Carac(nom="sagesse", valeur=sag, personnages=personnages)
            sagesse.save()

            intelligence = Carac(nom="intelligence", valeur=int, personnages=personnages)
            intelligence.save()

            dexterite = Carac(nom="dextérité", valeur=dex, personnages=personnages)
            dexterite.save()

            constitution = Carac(nom="constitution", valeur=con, personnages=personnages)
            constitution.save()

            charisme = Carac(nom="charisme", valeur=cha, personnages=personnages)
            charisme.save()


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