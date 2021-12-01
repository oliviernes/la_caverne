FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
   
RUN git clone https://github.com/oliviernes/la_caverne.git

RUN sed -i 's/127.0.0.1/172.21.0.2/' la_caverne/caverne/settings.py
#RUN sed -i 's/5432/5532/' la_caverne/caverne/settings.py

#CMD pytest -v /usr/src/app/la_caverne/test/test_views.py
