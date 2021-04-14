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

# RUN	apk add mariadb mariadb-client openrc
RUN	apk add mysql mysql-client
# RUN adduser -D -g 'mysql' mysql

# COPY 	./sql_srcs/create_user.sql .

COPY 	./sql_srcs/wordpress.sql .
COPY 	./sql_srcs/config.sql .
COPY 	./sql_srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY 	./sql_srcs/setup.sh .
RUN 	chmod +x setup.sh
EXPOSE  3306
CMD 	"./setup.sh"

