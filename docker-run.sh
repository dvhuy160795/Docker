#!/bin/bash
composer create-project --prefer-dist laravel/laravel Docker

cd Docker
chmod -R 777 storage/
composer install

#run docker-compose
cd ..
docker-compose up
