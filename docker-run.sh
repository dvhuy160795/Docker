#!/bin/bash
cd Docker
composer install

#run docker-compose
cd ..
docker-compose up
