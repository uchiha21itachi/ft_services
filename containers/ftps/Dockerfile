
# FROM	alpine

# RUN		apk add vsftpd openssl openrc curl

# COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
# COPY ./srcs/start.sh .

# EXPOSE	20 21 21000-21004

# VOLUME [ "/ftp" ]

# CMD     "./start.sh"

FROM alpine:latest

RUN apk update


RUN apk add bash openrc openssl curl
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN openrc > /dev/null 2>&1
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


RUN chmod 700 /etc/ssl/private
RUN chmod 700 /etc/ssl/certs
RUN openssl req -x509 \
-nodes -days 365 -newkey rsa:2048 \
-out /etc/ssl/certs/cert.pem \
-keyout /etc/ssl/private/key.pem \
-subj "/C=FR/ST=Paris/L=Paris/O=42 Ecole/OU=yash/CN=localhost"

RUN apk add telegraf
RUN mkdir -p /etc/telegraf/
RUN mkdir -p /var/log/telegraf
RUN touch /var/log/telegraf/telegraf.log
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN export TELEGRAF_CONFIG_PATH="/etc/telegraf/telegraf.conf"


RUN apk add vsftpd
COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN adduser --disabled-password --home etc/vsftpd/home yash
RUN echo "yash:yash" | chpasswd
RUN echo 'Hello world !' >> etc/vsftpd/home/testfile.txt
RUN chown yash /
RUN chmod 766 /etc/vsftpd/home/testfile.txt

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 21 30020
CMD "./start.sh"