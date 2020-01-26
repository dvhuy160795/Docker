FROM composer:1.5.1 AS composer
FROM php:7.4-fpm

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /home/Docker

COPY ./composer.json /home/Docker
COPY ./composer.lock /home/Docker
COPY ./ /home/Docker