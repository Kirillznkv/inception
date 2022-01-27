FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 744 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY db.sql ./

RUN service mysql start && mysql < db.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe


