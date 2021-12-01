"""Functional tests"""
import time

from django.test import LiveServerTestCase
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class NewVisitorTest(LiveServerTestCase):
    """Class testing a new user visiting the la caverne website"""

    fixtures = ["dumpy_caverne_fixture"]

    def setUp(self):

        options = webdriver.ChromeOptions()
        options.add_argument("start-maximized");
        options.add_argument("disable-infobars")
        options.add_argument("--disable-extensions")

        self.browser = webdriver.Chrome(chrome_options=options)

    def tearDown(self):
        self.browser.quit()

    def test_user_story(self):
        """Test the story of an user inside la_caverne app"""

        # Mell has heard about a website to save characters. She goes
        # to check out its homepage.

        self.browser.get(self.live_server_url)

        time.sleep(1)

        self.assertIn("caverne", self.browser.title)
        first_link_text = self.browser.find_element_by_tag_name("a").text
        self.assertIn("La Cave", first_link_text)

        # She choose to enter the inputs of her first character:

        nom = self.browser.find_element_by_name("nom")
        nom.click()
        nom.send_keys("Astérix")

        time.sleep(1)

        age = self.browser.find_element_by_name("age")
        age.click()
        age.send_keys("32")

        time.sleep(1)

        sex = self.browser.find_element_by_name("sex")
        sex.click()
        sex.send_keys("M")

        time.sleep(1)

        taille = self.browser.find_element_by_name("taille")
        taille.click()
        taille.send_keys("145")

        time.sleep(1)

        poids = self.browser.find_element_by_name("poids")
        poids.click()
        poids.send_keys("45")

        time.sleep(1)

        alignement = self.browser.find_element_by_name("alignement")
        alignement.click()
        alignement.send_keys("menhir")

        time.sleep(1)

        divinite = self.browser.find_element_by_name("divinite")
        divinite.click()
        divinite.send_keys("Toutatix")

