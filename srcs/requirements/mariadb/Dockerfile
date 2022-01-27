FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get install mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


