#!/bin/bash
sudo yum install php php-cli php-zip wget unzip
wget -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm
wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# rpm -i remi-release-7.rpm epel-release-latest-7.noarch.rpm
FOR PHP 7.0 EXECUTE:
# yum-config-manager --enable remi-php70
FOR PHP 7.1 EXECUTE:
# yum-config-manager --enable remi-php71
FOR PHP 7.2 EXECUTE:
# yum-config-manager --enable remi-php72
FOR PHP 7.3 EXECUTE:
FOR PHP 7.4 EXECUTE:
yum install php
yum update

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c5b9b6d368201a9db6f74e2611495f369991b72d9c8cbd3ffbc63edff210eb73d46ffbfce88669ad33695ef77dc76976') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer

sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -aG docker root

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

cd ..
cd ..

php /usr/local/bin/composer create-project --prefer-dist laravel/laravel Docker

cd Docker
chmod -R 777 storage/

php /usr/local/bin/composer install
#run docker-compose
cd ..
docker-compose up
