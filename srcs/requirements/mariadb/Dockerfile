FROM alpine:3.19.4

RUN apk update && apk upgrade

RUN apk add --no-cache mysql mysql-client

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY conf/init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306

CMD ["mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]
