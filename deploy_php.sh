#!/bin/bash
dir=$(date +%Y%m%d_%H%M%S)
mkdir /var/www/deploy/$dir/
tar -zxvf /var/www/deploy/*.tar.gz -C /var/www/deploy/$dir/
chown -R ubuntu:www-data /var/www/deploy/$dir/
chmod -R 775 /var/www/deploy/$dir/
ln -sfn /var/www/deploy/$dir/ /var/www/project/php_test
rm -rf  /var/www/deploy/*.tar.gz
docker restart 1cf7dd81c5b3
docker exec 1cf7dd81c5b3 service nginx start
docker exec 1cf7dd81c5b3 service php7.0-fpm start
