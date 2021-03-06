FROM ubuntu AS litecart

WORKDIR /workdir

RUN apt-get update && apt-get install curl unzip -y

RUN curl -o litecart-2.2.8.zip -L -O "https://www.litecart.net/en/downloading?version=2.2.8&action=get"

RUN unzip litecart-2.2.8.zip -d litecart

FROM php:7.4-apache

RUN apt-get update && apt-get install locales locales-all -y

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY --from=litecart /workdir/litecart/public_html /app

ENV APACHE_DOCUMENT_ROOT /app

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Apache document root change
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Apache mod_rewrite
RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/ && \
    cp /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/

# Php config install extensions

RUN pecl config-set php_ini "$PHP_INI_DIR/php.ini"
RUN apt-get update && apt-get install -y \
        libzip-dev zip libmagickwand-dev libicu-dev zlib1g-dev \
        sendmail libpng-dev  libfreetype6-dev libjpeg62-turbo-dev --no-install-recommends && \
    pecl channel-update pecl.php.net && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-configure intl &&  \
    docker-php-ext-install intl mysqli pdo pdo_mysql && \
    pecl install apcu zip imagick gd  && \
    docker-php-ext-enable apcu zip imagick  mysqli

# Make it writable
RUN chmod -R 777 /app
