FROM alpine:latest

# Getting wget
RUN 	apk update
RUN 	apk add wget
RUN 	apk add bash
RUN 	apk add openssh 
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

# RUN nginx -t

RUN apk add util-linux openrc
# VOLUME /sys/fs/cgroup 
# RUN rc-update add rsyslog default\
#   && mkdir /run/openrc\
#   && touch /run/openrc/softlevel  


RUN	    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.org
COPY	./nginx_srcs/wordpress.conf /etc/nginx/conf.d/
COPY	./nginx_srcs/nginx.conf /etc/nginx/
COPY	./nginx_srcs/index.html /www/
COPY	./nginx_srcs/server.crt /ssl_certificate/
COPY	./nginx_srcs/server.key /ssl_certificate/
COPY	./nginx_srcs/sshd_config /etc/ssh

WORKDIR /etc/nginx/conf.d/
RUN ls -l
RUN rm default.conf
RUN ls -l

WORKDIR /
COPY ./nginx_srcs/start.sh /usr/local/bin/
# RUN chmod/+x start.sh
RUN chmod u+x,g+x /usr/local/bin/start.sh\
  && ln -s /usr/local/bin/start.sh /

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD "./start.sh"
