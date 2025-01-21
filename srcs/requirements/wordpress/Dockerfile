FROM alpine:3.20.0

RUN apk add --no-cache \
	curl \
	php82 \
	php82-cgi \
	php82-fpm \
	php82-mysqli \
	php82-mbstring \
	php82-gd \
	php82-cli \
	php82-phar \
	&& rm -rf /var/cache/apk/*

WORKDIR /var/www/html

RUN curl -O https://wordpress.org/latest.tar.gz \
	&& tar xfz latest.tar.gz \
	&& mv wordpress/* . \
	&& rm -rf latest.tar.gz wordpress

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY ./tools/wp_init.sh /usr/local/bin/wp_init.sh
RUN chmod +x /usr/local/bin/wp_init.sh

ENTRYPOINT [ "/usr/local/bin/wp_init.sh" ]

EXPOSE 9000

CMD ["php-fpm82", "-F"]
