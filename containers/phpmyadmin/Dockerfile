FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget curl
RUN apk add bash openssl
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 



RUN apk update  && echo "update before php install : Done"
RUN	apk add fcgi php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add nginx && echo "Nginx install done" 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN	mkdir /run/nginx
# RUN mkdir /var/www

RUN echo "Installing phpmyadmin"
RUN	mkdir /var/www/phpMyAdmin
RUN chmod 775 var/www
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.zip
RUN unzip phpMyAdmin-4.9.4-all-languages.zip
RUN mv /phpMyAdmin-4.9.4-all-languages/* /var/www/phpMyAdmin

RUN chmod 700 /etc/ssl/private
RUN chmod 700 /etc/ssl/certs
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/server.crt

#Creating new user and group 'www' for nginx
RUN	adduser -D -g 'www' www

#Creating a dir for html files 
RUN	chown -R www:www /var/lib/nginx
RUN	chown -R www:www /var/run/nginx
RUN	chown -R www:www /var/www 

RUN apk add telegraf
RUN mkdir -p /etc/telegraf/
RUN mkdir -p /var/log/telegraf
RUN touch /var/log/telegraf/telegraf.log
COPY ./php_srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN export TELEGRAF_CONFIG_PATH="/etc/telegraf/telegraf.conf"


WORKDIR /var/www/phpMyAdmin
RUN     rm config.sample.inc.php
COPY    ./php_srcs/default.conf /etc/nginx/http.d/
COPY    ./php_srcs/config.inc.php /var/www/phpMyAdmin
COPY    ./php_srcs/setup.sh .
RUN     chmod +x setup.sh
EXPOSE  5000

CMD "./setup.sh"
