FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget curl
RUN apk add bash
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 



RUN apk update  && echo "update before php install : Done"
RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "Installing phpmyadmin"
RUN mkdir /var/www
RUN	mkdir /var/www/phpMyAdmin
RUN chmod 775 var/www
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.zip
RUN unzip phpMyAdmin-4.9.4-all-languages.zip
RUN mv /phpMyAdmin-4.9.4-all-languages/* /var/www/phpMyAdmin

WORKDIR /var/www/phpMyAdmin
RUN rm config.sample.inc.php
COPY ./php_srcs/config.inc.php /var/www/phpMyAdmin
COPY ./php_srcs/setup.sh .
RUN chmod +x setup.sh
RUN ./setup.sh
EXPOSE 5000