FROM python:3.8

RUN useradd olivier
WORKDIR /caverne

COPY . /caverne

RUN apt update && apt install virtualenv nginx sudo -y

RUN apt install python3-dev libpq-dev postgresql postgresql-contrib -y

RUN virtualenv -p python3 .venv

RUN . .venv/bin/activate

RUN pip install -r requirements.txt

RUN touch /etc/nginx/sites-available/caverne

RUN ln -s /etc/nginx/sites-available/caverne /etc/nginx/sites-enabled

RUN echo "server {\n\n    listen 80; server_name 141.94.175.93;\n\
    root /caverne/;\n\n    location /static {\n        alias\
 /caverne/staticfiles/;\n\
    }\n\n    location / {\n        proxy_set_header Host \$http_host;\n\
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;\n\
        proxy_redirect off;\n\
        if (!-f \$request_filename) {\n\
            proxy_pass http://127.0.0.1:8000;\n             break;\n\
        }\n\
    }\n\
 }" | tee /etc/nginx/sites-available/caverne

RUN service nginx reload

RUN usermod -aG sudo olivier

RUN echo "olivier  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/olivier

USER olivier
