FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y nano
RUN apt-get install -y ufw
#Install PHP
RUN apt-get install -y --no-install-recommends php8.1
RUN apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath php8.1-fpm
RUN service php8.1-fpm start
# Install Nginx

RUN apt-get install -y nginx
RUN ufw allow 'Nginx HTTP'

COPY nginx/default /etc/nginx/sites-enabled/default
COPY nginx/sites-enabled/* /etc/nginx/sites-enabled/

RUN nginx -t && service nginx restart
RUN service nginx start

# COPY ./../.ssh/* /root/.ssh/
# RUN chmod 600 /root/.ssh/config
# RUN chown root:root /root/.ssh/config
# RUN chmod 600 /root/.ssh/id_rsa

WORKDIR /

CMD service php8.1-fpm start && nginx -g 'daemon off;'

