FROM alpine:latest

RUN apk update

RUN apk add grafana


RUN apk add bash openrc
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


# RUN wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz
# RUN tar -zxvf grafana-6.7.2.linux-amd64.tar.gz
# RUN rm grafana-6.7.2.linux-amd64.tar.gz
# RUN ls
RUN rm -rf /usr/share/grafana
# RUN mv grafana-6.7.2 /usr/share/grafana 

COPY ./srcs/grafana.tar.gz /usr/share/grafana.tar.gz
WORKDIR /usr/share
RUN tar xzvf grafana.tar.gz
RUN rm -rf grafana.tar.gz
# RUN ls -ll /usr/share/grafana/conf
# RUN rm /usr/share/grafana/data/grafana.db
# RUN rm /usr/share/grafana/conf/sample.ini

COPY ./srcs/grafana.ini /usr/share/grafana/conf/
# COPY ./srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
# COPY ./srcs/dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
# COPY ./srcs/dashboard.json /usr/share/grafana/conf/provisioning/dashboards/
COPY ./srcs/start.sh .
RUN  chmod +x start.sh
EXPOSE 3000

CMD "./start.sh"