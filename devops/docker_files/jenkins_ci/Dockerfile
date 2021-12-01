FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
   
RUN git clone https://github.com/oliviernes/la_caverne.git

#CMD pytest -v /usr/src/app/la_caverne/test/test_views.py
