"""Functional tests"""
import time

from django.test import LiveServerTestCase
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class NewVisitorTest(LiveServerTestCase):
    """Class testing a new user visiting the la caverne website"""


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

