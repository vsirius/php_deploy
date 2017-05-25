#!/bin/bash
cd /php_docker
composer  install --prefer-source  &&
tar -czvf php_$(date +%Y%m%d_%H%M%S).tar.gz *
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null *.tar.gz ubuntu@52.59.247.75:/var/www/deploy/

