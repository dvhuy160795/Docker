#!/bin/bash
SCRIPT=$(readlink -f $0)
SOURCEPATH=`dirname $SCRIPT`


#run docker-compose
docker-compose -f $SOURCEPATH/../docker-compose.yml up
