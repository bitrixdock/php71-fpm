FROM php:7.1-fpm

MAINTAINER vmpartner

RUN apt-get update  && \
    apt-get install -y --no-install-recommends wget apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list && \
    echo "deb-src https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.1-memcached \
    php7.1-memcache \
    php7.1-mbstring \
    php7.1-mysql \
    php7.1-intl \
    php7.1-xdebug \
    php7.1-interbase \
    php7.1-soap \
    php7.1-gd \
    php7.1-imagick \
    php7.1-mcrypt \
    php7.1-opcache \
    php7.1-zip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN usermod -u 1000 www-data

EXPOSE 9000