FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget curl
RUN apk add bash
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN apk update  && echo "update before Wordpress install : Done"
RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /www

WORKDIR /www
RUN	wget https://wordpress.org/wordpress-5.6.tar.gz
RUN tar -zxvf wordpress-5.6.tar.gz
RUN rm -rf wordpress-5.6.tar.gz

# RUN	adduser -D -g 'www' data
# RUN	chown -R www:data /www/wordpress
# RUN chown -R www-data:www-data *

WORKDIR /www/wordpress/
RUN ls -la

RUN echo "copying wp-config.php"
COPY ./wordpress_srcs/wp-config.php /www/wordpress/
COPY ./wordpress_srcs/setup.sh .
RUN ls -ll
RUN sleep 5
RUN chmod +x setup.sh
EXPOSE 5050

CMD "./setup.sh"
