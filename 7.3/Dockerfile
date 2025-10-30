FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    nano \
    ufw  \
    git  \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    software-properties-common  \
    nginx  \
    openssh-client

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get install -y \
    php7.3  \
    php7.3-cli  \
    php7.3-soap  \
    php7.3-fpm  \
    php7.3-json  \
    php7.3-pdo  \
    php7.3-mysql  \
    php7.3-zip  \
    php7.3-gd  \
    php7.3-mbstring  \
    php7.3-curl  \
    php7.3-xml  \
    php7.3-bcmath  \
    php7.3-json

RUN ufw allow 'Nginx HTTP'
RUN nginx -t

# NGINX CONFIG
COPY ./nginx/* /etc/nginx/sites-enabled/

# SSH CREDENTIALS
COPY ./ssh/* /root/.ssh/
RUN chmod -R 600 /root/.ssh/

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" && \
    php composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    php -r "unlink('composer-setup.php');";

RUN apt install dos2unix

COPY ./script.start.sh /start.sh
RUN chmod +x /start.sh
RUN dos2unix /start.sh

WORKDIR /

CMD ["/start.sh"]

