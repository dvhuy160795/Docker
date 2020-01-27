# #!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT=$(readlink -f $0)
SOURCEPATH=`dirname $SCRIPT`
sudo apt-get install php php-cli php-zip wget unzip

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c5b9b6d368201a9db6f74e2611495f369991b72d9c8cbd3ffbc63edff210eb73d46ffbfce88669ad33695ef77dc76976') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer

sudo apt-get install docker
sudo apt-get install docker-compose

composer create-project --prefer-dist laravel/laravel $SOURCEPATH/../../Docker


chmod -R 777 $SOURCEPATH/../../Docker/storage/
(cd $SOURCEPATH/../../Docker && exec composer install)
(cd $SOURCEPATH/../../Docker && exec chmod -R 777 storage/)

#run docker-compose

docker-compose -f $SOURCEPATH/../docker-compose.yml up
