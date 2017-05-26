FROM ubuntu
RUN sed -i s/http/ftp/ /etc/apt/sources.list && apt-get update
RUN     apt-get install -y  php-fpm php-xml composer  nginx supervisor nano
RUN    cd /var/www/  && mkdir project && mkdir php_test
COPY php_docker /var/www/project/php_test
RUN    cd /var/www/project/php_test/ && composer install --prefer-source
RUN      rm -rf /etc/nginx/sites-enabled/default
COPY php_app /etc/nginx/sites-enabled/
RUN chmod -R 777 /var/www/project/
COPY supervisord.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx
RUN service php7.0-fpm start

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
