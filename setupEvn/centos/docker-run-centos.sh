#!/bin/bash
SCRIPT=$(readlink -f $0)
SOURCEPATH=`dirname $SCRIPT`

php /usr/local/bin/composer create-project --prefer-dist laravel/laravel $SOURCEPATH/../../Docker

chmod -R 777 $SOURCEPATH/../../Docker/storage/
(cd $SOURCEPATH/../../Docker && exec php /usr/local/bin/composer update)
(cd $SOURCEPATH/../../Docker && exec chmod -R 777 storage/)

#run docker-compose
docker-compose -f $SOURCEPATH/../docker-compose.yml up
