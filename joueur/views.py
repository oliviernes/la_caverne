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

            carac_dic = {"forc": int(request.POST['for']),
                         "sag": int(request.POST['sag']),
                         "int": int(request.POST['int']),
                         "dex": int(request.POST['dex']),
                         "con": int(request.POST['con']),
                         "cha": int(request.POST['cha'])
                         }

            point_carac_assigned = -58

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

            for key, val in carac_dic.items():
                carac_dic[key] = val + race.bonus_carac


            force = Carac(nom="force", valeur=carac_dic['forc'], personnages=personnages)
            force.save()

            sagesse = Carac(nom="sagesse", valeur=carac_dic['sag'], personnages=personnages)
            sagesse.save()

            intelligence = Carac(nom="intelligence", valeur=carac_dic['int'], personnages=personnages)
            intelligence.save()

            dexterite = Carac(nom="dextérité", valeur=carac_dic['dex'], personnages=personnages)
            dexterite.save()

            constitution = Carac(nom="constitution", valeur=carac_dic['con'], personnages=personnages)
            constitution.save()

            charisme = Carac(nom="charisme", valeur=carac_dic['cha'], personnages=personnages)
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