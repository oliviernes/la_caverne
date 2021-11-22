from pytest import mark

from django.test import Client
from django.contrib.auth.models import User
from django.urls import reverse

from joueur.models import Classe, Race, Personnages, Def, Carac

from urllib.parse import urlencode

####################
#   login view     #
####################

import pdb


class TestLogin:

    client = Client()

    def test_login(self):

        response = self.client.get("/login/")

        assert response.status_code == 200
        assert response.templates[0].name == "registration/login.html"
        assert response.templates[1].name == "joueur/base.html"

    @mark.django_db
    def test_login_valid_user(self):
        User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        response_login = self.client.login(
            username="lennon@thebeatles.com", password="johnpassword"
        )

        response_post = self.client.post(
            "/login/",
            {"username": "lennon@thebeatles.com", "password": "johnpassword"},
        )

        assert response_login == True
        assert response_post.url == "/my_account/"
        assert response_post.status_code == 302

    @mark.django_db
    def test_login_wrong_user(self):

        response = self.client.post(
            "/login/", {"username": "tartampion", "password": "johnpassword"}
        )

        assert response.status_code == 200
        assert response.templates[0].name == "registration/login.html"
        assert response.templates[1].name == "joueur/base.html"

    @mark.django_db
    def test_login_wrong_password(self):

        User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        response_login = self.client.login(
            username="lennon@thebeatles.com", password="wrongpassword"
        )

        response_post = self.client.post(
            "/login/",
            {"username": "lennon@thebeatles.com", "password": "wrongpassword"},
        )

        assert response_login == False
        assert response_post.status_code == 200
        assert response_post.templates[0].name == "registration/login.html"
        assert response_post.templates[1].name == "joueur/base.html"

    @mark.django_db
    def test_login_no_user_recorded(self):

        response = self.client.login(
            username="lennon@thebeatles.com", password="johnpassword"
        )

        assert response == False


####################
#   signup view    #
####################


class TestSignup:

    client = Client()

    def test_signup(self):

        response = self.client.get("/signup/")

        assert response.status_code == 200
        assert response.templates[0].name == "registration/signup.html"
        assert response.templates[1].name == "joueur/base.html"

    @mark.django_db
    def test_signup_right_infos(self):

        response = self.client.post(
            "/signup/",
            {
                "username": "Mell1",
                "first_name": "Mell",
                "last_name": "MAMAMA",
                "email": "mell6@gmail.com",
                "password1": "monsupermdp1234",
                "password2": "monsupermdp1234",
            },
        )

        users = User.objects.all()

        assert response.url == "/my_account/"
        assert response.status_code == 302
        assert users.count() == 1
        assert users[0].username == "Mell1"
        assert users[0].first_name == "Mell"
        assert users[0].last_name == "MAMAMA"
        assert users[0].email == "mell6@gmail.com"

    @mark.django_db
    def test_signup_user_incorrect_data(self):

        response = self.client.post(
            "/signup/",
            {
                "username": "",
                "first_name": "",
                "last_name": "",
                "email": "pimail.com",
                "password1": "aa",
                "password2": "bb",
            },
        )

        users = User.objects.all()

        assert response.status_code == 200
        assert response.templates[0].name == "registration/signup.html"
        assert response.templates[1].name == "joueur/base.html"
        assert users.count() == 0

    @mark.django_db
    def test_signup_user_email_already_used(self):

        User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        response = self.client.post(
            "/signup/",
            {
                "username": "Mell1",
                "first_name": "Mell",
                "last_name": "MAMAMA",
                "email": "lennon@thebeatles.com",
                "password1": "monsupermdp1234",
                "password2": "monsupermdp1234",
            },
        )

        users = User.objects.all()

        assert response.status_code == 200
        assert response.templates[0].name == "registration/signup.html"
        assert response.templates[1].name == "joueur/base.html"
        assert users.count() == 1


#####################
#   my_account view #
#####################


def test_my_account():

    client = Client()
    response = client.get("/my_account/")

    assert response.status_code == 200
    assert response.templates[0].name == "registration/account.html"
    assert response.templates[1].name == "joueur/base.html"


#################
#   logout view #
#################


def test_logout_view():

    client = Client()
    response = client.get("/logout")

    assert response.status_code == 200
    assert response.templates[0].name == "registration/logged_out.html"
    assert response.templates[1].name == "joueur/base.html"


#################
#   calcul view #
#################


class TestCalcul:

    client = Client()

    @mark.django_db
    def test_save_character_with_user_logged_in(self):

        User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        data = urlencode(
            {
                "nom": "Asterix",
                "age": 30,
                "sex": "M",
                "taille": 150,
                "poids": 50,
                "alignement": "sanglier",
                "divinite": "Toutatix",
                "initiative": 7,
                "classe": "Guerrier",
                "race": "Gaulois",
                "for": 10,
                "sag": 11,
                "int": 11,
                "dex": 11,
                "con": 11,
                "cha": 11,
                "my_perso": "Enregistrer le personnage",
            }
        )

        response_post = self.client.post(
            reverse("calcul"),
            data,
            content_type="application/x-www-form-urlencoded",
        )

        assert response_post.status_code == 200
        assert len(response_post.context["persos"]) == 1
        assert response_post.context["persos"][0].nom == "Asterix"
        assert response_post.context["persos"][0].initiative == 7
        assert response_post.templates[0].name == "joueur/liste_perso.html"

    @mark.django_db
    def test_save_character_with_user_logged_out(self):

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        data = urlencode(
            {
                "nom": "Asterix",
                "age": 30,
                "sex": "M",
                "taille": 150,
                "poids": 50,
                "alignement": "sanglier",
                "divinite": "Toutatix",
                "initiative": 7,
                "classe": "Guerrier",
                "race": "Gaulois",
                "for": 10,
                "sag": 11,
                "int": 11,
                "dex": 11,
                "con": 11,
                "cha": 11,
                "my_perso": "Enregistrer le personnage",
            }
        )

        response_post = self.client.post(
            reverse("calcul"),
            data,
            content_type="application/x-www-form-urlencoded",
        )

        assert response_post.status_code == 302

    @mark.django_db
    def test_save_character_with_force_not_provided(self):

        User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        data = urlencode(
            {
                "nom": "Asterix",
                "age": 30,
                "sex": "M",
                "taille": 150,
                "poids": 50,
                "alignement": "sanglier",
                "divinite": "Toutatix",
                "initiative": 7,
                "classe": "Guerrier",
                "race": "Gaulois",
                "for": "",
                "sag": 11,
                "int": 11,
                "dex": 11,
                "con": 11,
                "cha": 11,
                "my_perso": "Enregistrer le personnage",
            }
        )

        response_post = self.client.post(
            reverse("calcul"),
            data,
            content_type="application/x-www-form-urlencoded",
        )

        assert response_post.status_code == 200
        assert len(response_post.context["form_perso"].fields) == 8
        assert response_post.context["empty_carac"] == True
        assert response_post.context["form_perso"].fields["nom"].label == "Nom"
        assert response_post.templates[0].name == "joueur/perso.html"

    @mark.django_db
    def test_save_character_with_point_carac_assigned_more_than_20(self):

        User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        data = urlencode(
            {
                "nom": "Asterix",
                "age": 30,
                "sex": "M",
                "taille": 150,
                "poids": 50,
                "alignement": "sanglier",
                "divinite": "Toutatix",
                "initiative": 7,
                "classe": "Guerrier",
                "race": "Gaulois",
                "for": 18,
                "sag": 19,
                "int": 25,
                "dex": 22,
                "con": 17,
                "cha": 29,
                "my_perso": "Enregistrer le personnage",
            }
        )

        response_post = self.client.post(
            reverse("calcul"),
            data,
            content_type="application/x-www-form-urlencoded",
        )

        assert response_post.status_code == 200
        assert len(response_post.context["form_perso"].fields) == 8
        assert response_post.context["points_exceed"] == True
        assert response_post.context["form_perso"].fields["nom"].label == "Nom"
        assert response_post.templates[0].name == "joueur/perso.html"

    @mark.django_db
    def test_get_calcul_page(self):

        response_get = self.client.get(reverse("calcul"))

        assert response_get.status_code == 200
        assert response_get.templates[0].name == "joueur/perso.html"

    @mark.django_db
    def test_get_home_page(self):

        response_get = self.client.get("/")

        assert response_get.status_code == 200
        assert response_get.templates[0].name == "joueur/perso.html"
        assert response_get.templates[1].name == "joueur/base.html"


#####################
#  Liste_perso view #
#####################


class TestListePerso:

    client = Client()

    @mark.django_db
    def test_get_liste_perso_page(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        guerrier = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        response_get = self.client.get(reverse("liste_perso"))

        assert response_get.status_code == 200
        assert response_get.templates[0].name == "joueur/liste_perso.html"

    @mark.django_db
    def test_get_no_persos_page(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        response_get = self.client.get(reverse("liste_perso"))

        assert response_get.status_code == 200
        assert response_get.templates[0].name == "joueur/no_persos.html"

    @mark.django_db
    def test_get_liste_perso_page_user_not_logged_in(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        guerrier = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        response_get = self.client.get(reverse("liste_perso"))

        assert response_get.status_code == 302


#####################
#  fiche_perso view #
#####################


class TestFichePerso:

    client = Client()

    @mark.django_db
    def test_get_fiche_perso_page(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        asterix = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        Carac.objects.create(nom="Charisme", valeur=12, personnages=asterix)
        Def.objects.create(nom="Vigueur", valeur=10, personnages=asterix)

        response_post = self.client.post(
            reverse("fiche_perso", kwargs={"my_perso_id": asterix.id})
        )

        assert response_post.status_code == 200
        assert response_post.context["perso"].nom == "Astérix"
        assert len(response_post.context["carac"]) == 1
        assert response_post.context["carac"][0].nom == "Charisme"

        assert len(response_post.context["defence"]) == 1
        assert response_post.context["defence"][0].nom == "Vigueur"
        assert response_post.templates[0].name == "joueur/fiche_perso.html"

    @mark.django_db
    def test_get_not_allowed_page(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        asterix = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        Carac.objects.create(nom="Charisme", valeur=12, personnages=asterix)
        Def.objects.create(nom="Vigueur", valeur=10, personnages=asterix)

        response_post = self.client.post(
            reverse("fiche_perso", kwargs={"my_perso_id": 2123})
        )

        assert response_post.status_code == 200
        assert response_post.templates[0].name == "joueur/not_allowed.html"

    @mark.django_db
    def test_get_fiche_perso_page_with_user_logged_out(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        asterix = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        Carac.objects.create(nom="Charisme", valeur=12, personnages=asterix)
        Def.objects.create(nom="Vigueur", valeur=10, personnages=asterix)

        response_post = self.client.post(
            reverse("fiche_perso", kwargs={"my_perso_id": asterix.id})
        )

        assert response_post.status_code == 302


#####################
#    delete view    #
#####################


class TestDelete:

    client = Client()

    @mark.django_db
    def test_delete_character_belonging_to_user_with_user_logged_in(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        asterix = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        Carac.objects.create(nom="Charisme", valeur=12, personnages=asterix)
        Def.objects.create(nom="Vigueur", valeur=10, personnages=asterix)

        response_post = self.client.post(reverse("delete", kwargs={"pk": asterix.id}))

        assert response_post.status_code == 200
        assert response_post.context["nom_perso"] == "Astérix"
        assert response_post.templates[0].name == "joueur/perso_deleted.html"

    @mark.django_db
    def test_delete_character_not_belonging_to_user_with_user_logged_in(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        self.client.login(username="lennon@thebeatles.com", password="johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        asterix = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        Carac.objects.create(nom="Charisme", valeur=12, personnages=asterix)
        Def.objects.create(nom="Vigueur", valeur=10, personnages=asterix)

        response_post = self.client.post(reverse("delete", kwargs={"pk": 6546}))

        assert response_post.status_code == 200
        assert response_post.templates[0].name == "joueur/not_allowed_to_delete.html"

    @mark.django_db
    def test_delete_character_with_user_logged_out(self):

        user = User.objects.create_user("john", "lennon@thebeatles.com", "johnpassword")

        guerrier = Classe.objects.create(
            nom="Guerrier", bonus_def=5, pdv=100, recuperation=50
        )

        gaulois = Race.objects.create(
            nom="Gaulois", bonus_carac=5, vitesse_dep=8, cat_taille=10, vision=False
        )

        asterix = Personnages.objects.create(
            nom="Astérix",
            age=30,
            sex="M",
            taille=150,
            poids=50,
            alignement="sanglier",
            divinite="Toutatix",
            initiative=7,
            point_carac=10,
            classe=guerrier,
            race=gaulois,
            utilisateur=user,
        )

        Carac.objects.create(nom="Charisme", valeur=12, personnages=asterix)
        Def.objects.create(nom="Vigueur", valeur=10, personnages=asterix)

        response_post = self.client.post(reverse("delete", kwargs={"pk": asterix.id}))

        assert response_post.status_code == 302
