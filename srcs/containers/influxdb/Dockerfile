FROM alpine:latest

RUN apk update

RUN apk add influxdb


RUN apk add bash openssl openrc
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

COPY ./srcs/start.sh .
RUN ls -ll
RUN chmod +x start.sh
EXPOSE 8086

CMD "./start.sh"