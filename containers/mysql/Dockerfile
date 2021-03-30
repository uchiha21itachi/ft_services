FROM alpine:latest

# Getting wget
RUN apk update
RUN apk add wget curl
RUN apk add bash
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN apk add mysql mysql-client --no-cache