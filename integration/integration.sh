virtualenv -p python3 .venv
. .venv/bin/activate
pip3 install -r requirements.txt
pip3 install -r requirements-dev.txt
sed -ire 's/127.0.0.1/db-host/' caverne/settings.py
export PATH=/:$PATH
echo $PATH
python3 manage.py makemigrations
python3 manage.py migrate
cd test
pytest -v
sed -i '20d' tests_functional.py
awk 'NR==20{print "        options.add_argument('--no-sandbox')\n        options.add_argument('--disable-dev-shm-usage')\n        options.add_argument('--headless')\n        self.browser = webdriver.Chrome(chrome_options=options)"}1' tests_functional.py > newfile
rm tests_functional.py
cp newfile tests_functional.py
rm newfile
sed -ire 's/--no-sandbox/"--no-sandbox"/' tests_functional.py
sed -ire 's/--disable-dev-shm-usage/"--disable-dev-shm-usage"/' tests_functional.py
sed -ire 's/--headless/"--headless"/' tests_functional.py
python ../manage.py test
