# #!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT=$(readlink -f $0)
SOURCEPATH=`dirname $SCRIPT`

#run docker-compose
docker rm -f huydv-mysql huydv-httpd huydv-php huydv-memcached
docker-compose -f $SOURCEPATH/../docker-compose.yml up
