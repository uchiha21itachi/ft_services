FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget curl
RUN apk add bash openssl
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN apk update  && echo "update before Wordpress install : Done"
RUN	apk add fcgi php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add nginx && echo "Nginx install done" 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN	mkdir /run/nginx
# RUN mkdir /www

WORKDIR /var/www
RUN	wget https://wordpress.org/wordpress-5.6.tar.gz
RUN tar -zxvf wordpress-5.6.tar.gz
RUN rm -rf wordpress-5.6.tar.gz

RUN	adduser -D -g 'www' www

RUN	chown -R www:www /var/lib/nginx
RUN	chown -R www:www /var/run/nginx
RUN	chown -R www:www /var/www 


RUN chmod 700 /etc/ssl/private
RUN chmod 700 /etc/ssl/certs
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/server.crt

RUN apk add telegraf
RUN mkdir -p /etc/telegraf/
RUN mkdir -p /var/log/telegraf
RUN touch /var/log/telegraf/telegraf.log
COPY ./wordpress_srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN export TELEGRAF_CONFIG_PATH="/etc/telegraf/telegraf.conf"


WORKDIR /var/www/wordpress/
RUN ls -la

RUN echo "copying wp-config.php"
COPY ./wordpress_srcs/default.conf /etc/nginx/http.d/
COPY ./wordpress_srcs/wp-config.php /var/www/wordpress/

COPY ./wordpress_srcs/setup.sh .
RUN ls -ll
RUN nginx -t
RUN chmod +x setup.sh
EXPOSE 5050
CMD "./setup.sh"
