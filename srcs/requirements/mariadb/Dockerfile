FROM alpine:3.20.0

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql

EXPOSE 3306

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./tools/init_mariadb.sh /usr/local/bin/init_mariadb.sh
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/init_mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/init_mariadb.sh" ]

CMD [ "mysqld"]
