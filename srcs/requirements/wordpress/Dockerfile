FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get install php-fpm wget php-mysql


COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

RUN chmod -R 755 /var/www/*

