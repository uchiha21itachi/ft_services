FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget
RUN apk add bash
RUN apk add openssh
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Getting nginx
RUN	apk update && apk upgrade 
RUN apk add nginx && echo "Nginx install done" 
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

RUN	mkdir /run/nginx
RUN	mkdir /var/run/sshd
RUN	mkdir /www
RUN	adduser -D -g 'www' www && chown -R www:www /var/lib/nginx && chown -R www:www /www 
RUN chmod 775 /www

COPY ./nginx_srcs/wordpress.conf /etc/nginx/sites-available/
COPY ./nginx_srcs/nginx.conf /etc/nginx/
COPY ./nginx_srcs/server.crt /ssl_certificate/
COPY ./nginx_srcs/server.key /ssl_certificate/
COPY ./nginx_srcs/sshd_config /etc/ssh

WORKDIR /etc/nginx/sites-enabled
RUN ls -l
# RUN rm default

WORKDIR /
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
COPY ./nginx_srcs/start.sh .
RUN chmod +x start.sh
RUN ./start.sh

EXPOSE 80/tcp
EXPOSE 443/tcp
