FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget
RUN apk add bash
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN apk update  && echo "update before Wordpress install : Done"
RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /var/www
RUN mkdir /var/www/wordpress

WORKDIR /var/www/wordpress/
RUN	wget https://wordpress.org/wordpress-5.6.tar.gz
RUN tar -zxvf wordpress-5.6.tar.gz
RUN rm -rf wordpress-5.6.tar.gz

WORKDIR /var/www/wordpress
RUN chown -R www-data:www-data *
RUN chmod -R 755 *

RUN echo "copying wp-config.php"
COPY ./srcs/wp-config.php /var/www/wordpress
COPY ./wordpress_srcs/setup.sh .
RUN chmod +x setup.sh
RUN ./setup.sh