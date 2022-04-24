FROM php:8.0-fpm-alpine AS base

WORKDIR /var/www/html/
LABEL maintainer="Sergio Villanueva <sergiovillanueva@protonmail.com>"

COPY . .
COPY --from=composer:2.3 /usr/bin/composer /usr/local/bin/composer

ENV APP_ENV=prod
ENV APP_DEBUG=0

RUN \
    apk add libpq-dev php8-pdo_pgsql && \
    docker-php-ext-install pdo_pgsql && \
    composer install --no-dev --optimize-autoloader && \
    php bin/console cache:clear
