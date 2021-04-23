# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yassharm <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/30 14:54:13 by yassharm          #+#    #+#              #
#    Updated: 2021/03/30 14:55:27 by yassharm         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# Getting wget
RUN 	apk update
RUN 	apk add wget curl
RUN 	apk add bash
RUN 	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN	apk add mariadb mariadb-client openrc

RUN apk add util-linux openrc
VOLUME /sys/fs/cgroup 
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel  

RUN apk add telegraf
RUN mkdir -p /etc/telegraf/
RUN mkdir -p /var/log/telegraf
RUN touch /var/log/telegraf/telegraf.log
COPY ./sql_srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN export TELEGRAF_CONFIG_PATH="/etc/telegraf/telegraf.conf"

COPY 	./sql_srcs/wordpress.sql .
COPY 	./sql_srcs/setup.sh .
RUN 	chmod +x setup.sh
EXPOSE  3306
CMD 	"./setup.sh"

