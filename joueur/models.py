from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.


class Classe(models.Model):
    "Record classe model"

    nom = models.CharField(max_length=50)
    bonus_def = models.IntegerField()
    pdv = models.IntegerField()
    recuperation = models.IntegerField()

    def __str__(self):
        return self.nom


class Race(models.Model):
    "Record race model"

    nom = models.CharField(max_length=50)
    bonus_carac = models.IntegerField()
    vitesse_dep = models.IntegerField()
    cat_taille = models.CharField(max_length=50)
    vision = models.BooleanField()

    def __str__(self):
        return self.nom


class Personnages(models.Model):
    "Record person model"

    GENDER = (("M", "mâle"), ("F", "femelle"))

    nom = models.CharField(max_length=50)
    age = models.IntegerField()
    sex = models.CharField(max_length=50, choices=GENDER, verbose_name="sexe")
    taille = models.IntegerField()
    poids = models.IntegerField()
    alignement = models.CharField(max_length=100)
    divinite = models.CharField(max_length=100)
    initiative = models.IntegerField()
    point_carac = models.IntegerField()
    classe = models.ForeignKey(Classe, on_delete=models.CASCADE)
    race = models.ForeignKey(Race, on_delete=models.CASCADE)
    utilisateur = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.nom


class Def(models.Model):
    "Record definition model"

    nom = models.CharField(max_length=50)
    valeur = models.IntegerField()
    personnages = models.ForeignKey(Personnages, on_delete=models.CASCADE)

    def __str__(self):
        return self.nom


class Carac(models.Model):
    "Record character model"

    nom = models.CharField(max_length=50)
    valeur = models.IntegerField()
    personnages = models.ForeignKey(Personnages, on_delete=models.CASCADE)

    def __str__(self):
        return self.nom
