FROM alpine:latest

RUN apk update

RUN apk add grafana


RUN apk add bash openrc openssl
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN openrc > /dev/null 2>&1
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN apk add telegraf
RUN mkdir -p /etc/telegraf/
RUN mkdir -p /var/log/telegraf
RUN touch /var/log/telegraf/telegraf.log
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN export TELEGRAF_CONFIG_PATH="/etc/telegraf/telegraf.conf"


RUN chmod 700 /etc/ssl/private
RUN chmod 700 /etc/ssl/certs
RUN openssl req -x509 \
-nodes -days 365 -newkey rsa:2048 \
-out /etc/ssl/certs/cert.pem \
-keyout /etc/ssl/private/key.pem \
-subj "/C=FR/ST=Paris/L=Paris/O=42 Ecole/OU=yash/CN=localhost"


RUN rm -rf /usr/share/grafana
COPY ./srcs/grafana.tar.gz /usr/share/grafana.tar.gz
WORKDIR /usr/share
RUN tar xzvf grafana.tar.gz
RUN rm -rf grafana.tar.gz

RUN   rm -Rf /usr/share/grafana/conf/provisioning/*
COPY ./srcs/provisioning  /usr/share/grafana/conf/provisioning/
RUN  mkdir /usr/share/grafana/conf/dashboards
COPY ./srcs/dashboards  /usr/share/grafana/conf/dashboards
COPY ./srcs/grafana.ini /usr/share/grafana/conf/

COPY ./srcs/start.sh .
RUN  chmod +x start.sh
EXPOSE 3000

CMD "./start.sh"