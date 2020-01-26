#!/bin/bash
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT=`readlink -f $0`
DIR=`dirname $SCRIPT`
PROJECT_DIR="$(dirname $(dirname $DIR))"
DOCKER_FILES="-f docker-compose.yml"

cd $PROJECT_DIR/Docker
# Create global network
docker network inspect my-network &>/dev/null || docker network create --driver bridge my-network

#run docker-compose
docker-compose $DOCKER_FILES $@

cd Docker
composer install