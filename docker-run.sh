#!/bin/bash
composer create-project --prefer-dist laravel/laravel Docker

php /usr/local/bin/composer create-project --prefer-dist laravel/laravel Docker

cd Docker
chmod -R 777 storage/
composer install

php /usr/local/bin/composer install
#run docker-compose
cd ..
docker-compose up
