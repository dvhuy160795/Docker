# #!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT=$(readlink -f $0)
SOURCEPATH=`dirname $SCRIPT`

composer create-project --prefer-dist laravel/laravel $SOURCEPATH/../../Docker


chmod -R 777 $SOURCEPATH/../../Docker/storage/
(cd $SOURCEPATH/../../Docker && exec composer install)
(cd $SOURCEPATH/../../Docker && exec chmod -R 777 storage/)

#run docker-compose

docker-compose -f $SOURCEPATH/../docker-compose.yml up
