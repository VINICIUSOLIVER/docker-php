FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y nano
RUN apt-get install -y ufw

# GIT
RUN apt-get install -y git

# PHP
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y --no-install-recommends php8.1
RUN apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath php8.1-fpm

# NGINX
RUN apt-get install -y nginx
RUN ufw allow 'Nginx HTTP'

# NGINX CONFIG
COPY ./nginx/* /etc/nginx/sites-enabled/
RUN nginx -t && service nginx restart
RUN service nginx start

# SSH CREDENTIALS
COPY ./ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh

# COMPOSER
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /

CMD service php8.1-fpm start && nginx -g 'daemon off;'
