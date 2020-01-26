#!/bin/bash
composer create-project --prefer-dist laravel/laravel Docker

cd Docker
composer install

#run docker-compose
cd ..
docker-compose up
