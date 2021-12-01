FROM jenkins/jenkins

USER root

RUN apt update && apt install virtualenv wget sudo postgresql -y \
&& wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
&& apt install libpq-dev fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libdbus-1-3 libdrm2 libgbm1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libxcomposite1 libxdamage1 libxfixes3 libxkbcommon0 libxrandr2 libxshmfence1 xdg-utils -y \
&& dpkg -i google-chrome-stable_current_amd64.deb \
&& wget https://chromedriver.storage.googleapis.com/95.0.4638.17/chromedriver_linux64.zip \
&& unzip chromedriver_linux64.zip

RUN usermod -aG sudo jenkins

RUN echo "jenkins  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/jenkins

USER jenkins
