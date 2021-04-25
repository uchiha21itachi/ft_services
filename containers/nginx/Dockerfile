FROM alpine:latest

# Getting wget
RUN 	apk update
RUN 	apk add wget
RUN 	apk add bash
RUN 	apk add openssh openssl

# RUN     apk add openrc --no-cache

# Getting nginx
RUN     apk update && apk upgrade 
RUN 	apk add nginx && echo "Nginx install done" 
RUN 	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN 	echo "daemon off;" >> /etc/nginx/nginx.conf

#Generating ssh keys
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

#Creating require dir
RUN	mkdir /run/nginx
RUN	mkdir /var/run/sshd
RUN	mkdir /www

#Creating new user and group 'www' for nginx
RUN	adduser -D -g 'www' www

#Creating a dir for html files 
RUN	chown -R www:www /var/lib/nginx
RUN	chown -R www:www /var/run/sshd
RUN	chown -R www:www /run/nginx
RUN	chown -R www:www /www 


RUN apk add util-linux openrc
# VOLUME /sys/fs/cgroup 

RUN chmod 700 /etc/ssl/private
RUN chmod 700 /etc/ssl/certs
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/server.crt

RUN   mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.org
COPY  ./nginx_srcs/nginx.conf /etc/nginx/
COPY	./nginx_srcs/index.html /www/
COPY	./nginx_srcs/sshd_config /etc/ssh

WORKDIR /etc/nginx/conf.d/
RUN ls -l
RUN rm default.conf
RUN ls -l

RUN apk add telegraf
RUN mkdir -p /etc/telegraf/
RUN mkdir -p /var/log/telegraf
RUN touch /var/log/telegraf/telegraf.log
COPY ./nginx_srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN export TELEGRAF_CONFIG_PATH="/etc/telegraf/telegraf.conf"

RUN adduser -D yash
RUN echo "yash:yash"|chpasswd

WORKDIR /
COPY ./nginx_srcs/start.sh /usr/local/bin/
# RUN chmod/+x start.sh
RUN chmod u+x,g+x /usr/local/bin/start.sh\
  && ln -s /usr/local/bin/start.sh /

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD "./start.sh"
