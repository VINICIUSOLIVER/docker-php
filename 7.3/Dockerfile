FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y lsb-release apt-transport-https ca-certificates software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y nano
RUN apt-get install -y ufw

#Install PHP
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-cli php7.3-soap php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json
RUN service php7.3-fpm start

# Install Nginx
RUN apt-get install -y nginx
RUN ufw allow 'Nginx HTTP'

COPY nginx/default /etc/nginx/sites-enabled/default
COPY nginx/sites-enabled/* /etc/nginx/sites-enabled/
RUN nginx -t && service nginx restart
RUN service nginx start

# Install Git
RUN apt-get install -y git

# COPY SSH KEYS
# COPY ./../.ssh/* /home/root/.ssh/

WORKDIR /

CMD service php7.3-fpm start && nginx -g 'daemon off;'

