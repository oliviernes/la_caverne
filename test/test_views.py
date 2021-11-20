from pytest import mark

from django.test import Client
from django.contrib.auth.models import User

####################
#   login view     #
####################


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
