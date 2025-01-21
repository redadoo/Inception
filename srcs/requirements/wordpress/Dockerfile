FROM alpine:3.20.0

RUN apk add --no-cache curl 

RUN apk add --no-cache \
	curl \
	php83 \
	php83-cgi \
	php83-fpm \
	php83-mysqli \
	php83-mbstring \
	php83-gd \
	php83-cli \
	php83-phar \
	&& rm -rf /var/cache/apk/*

	
WORKDIR /var/www/html/
	
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN curl -O https://wordpress.org/latest.tar.gz \
&& tar xfz latest.tar.gz \
&& mv wordpress/*  . \
&& rm -rf latest.tar.gz wordpress

COPY ./conf/www.conf /etc/php/php83-fpm.d/www.conf

RUN mkdir /run/php

COPY ./tools/wp_init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_init.sh
ENTRYPOINT ["/usr/local/bin/wp_init.sh"]
	

EXPOSE 9000

CMD ["/usr/sbin/php-fpm83", "-F"]