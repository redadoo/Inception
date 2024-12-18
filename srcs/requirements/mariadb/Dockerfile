# Dockerfile for MariaDB container

# Use Alpine Linux 3.19 as the base image
FROM alpine:3.19

# Install MariaDB and client
RUN apk update && apk add mariadb mariadb-client

# Create necessary directories and set permissions
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql

# Expose MariaDB port
EXPOSE 3306

# Copy initialization script and SQL file
COPY ./tools/init_mariadb.sh /usr/local/bin/init_mariadb.sh
COPY  ./conf/wordpress.sql /usr/local/bin/wordpress.sql
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Set execute permissions
RUN chmod +x /usr/local/bin/init_mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

# Set entrypoint
ENTRYPOINT [ "/usr/local/bin/init_mariadb.sh" ]

# Set default command
CMD [ "mysqld" ]
