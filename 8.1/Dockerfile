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
RUN chmod 700 /root/.ssh

WORKDIR /

CMD service php8.1-fpm start && nginx -g 'daemon off;'

