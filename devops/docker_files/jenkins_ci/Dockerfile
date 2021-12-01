FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
   
RUN git clone --branch dbconnect https://github.com/oliviernes/la_caverne.git

COPY la_caverne/devops/docker_files/wait-for-it.sh /bin/sh

ENTRYPOINT ["/bin/sh/wait-for-it.sh"]

#RUN py.test --junitxml results.xml la_caverne/test/test_views.py
#CMD ["db:5432", "pytest", "-v", "/usr/src/app/la_caverne/test/test_views.py"]
