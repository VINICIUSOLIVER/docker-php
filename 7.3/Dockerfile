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
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'ed0feb545ba87161262f2d45a633e34f591ebb3381f2e0063c345ebea4d228dd0043083717770234ec00c5a9f9593792') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

COPY script.start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /

CMD ["/start.sh"]

