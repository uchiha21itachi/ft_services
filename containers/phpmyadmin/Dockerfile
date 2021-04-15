FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget curl
RUN apk add bash
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


#Creating new user and group 'www' for nginx
RUN	adduser -D -g 'www' www

#Creating a dir for html files 
RUN	chown -R www:www /var/lib/nginx
RUN	chown -R www:www /var/run/nginx
RUN	chown -R www:www /var/www 




WORKDIR /var/www/phpMyAdmin
RUN     rm config.sample.inc.php
COPY    ./php_srcs/nginx.conf /etc/nginx/
COPY    ./php_srcs/server.crt /ssl_certificate/
COPY    ./php_srcs/server.key /ssl_certificate/
COPY    ./php_srcs/config.inc.php /var/www/phpMyAdmin
COPY    ./php_srcs/setup.sh .
RUN     chmod +x setup.sh
EXPOSE  5000

CMD "./setup.sh"
