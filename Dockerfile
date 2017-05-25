FROM ubuntu
RUN sed -i s/http/ftp/ /etc/apt/sources.list && apt-get update
RUN apt-get install -y  php-fpm php-xml composer
ADD id_rsa /root/.ssh/id_rsa
ADD deploy.sh /root/
ENTRYPOINT /root/deploy.sh
