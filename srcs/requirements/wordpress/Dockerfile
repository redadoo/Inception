FROM alpine:3.19.4

# Install required packages
RUN apk add --no-cache wget lighttpd

# Create the directory for webapps
RUN mkdir -p /usr/share/webapps/

# Download and extract WordPress
RUN cd /usr/share/webapps/ && \
wget https://wordpress.org/latest.tar.gz && \
tar -xzvf latest.tar.gz && \
rm latest.tar.gz

RUN apk update && apk add php php-cgi php-fpm php-mysqli php-mbstring php-gd php-cli php-phar curl

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY ./tools/wp_init.sh /usr/local/bin/wp_init.sh
RUN chmod +x /usr/local/bin/wp_init.sh

ENTRYPOINT [ "/usr/local/bin/wp_init.sh" ]

EXPOSE 9000

WORKDIR /var/www/html

# Start PHP-FPM
CMD ["php-fpm82", "-F"]
