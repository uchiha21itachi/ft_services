FROM alpine:latest

RUN apk update  && echo "update before php install : Done"
RUN apk install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/www/phpmyadmin
COPY ./php_srcs/config.inc.php /var/www/phpmyadmin

RUN echo "Installing phpmyadmin"
WORKDIR /var/www/phpmyadmin/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages/* .
RUN rm -rf phpMyAdmin-4.9.0.1-all-languages
RUN rm config.sample.inc.php