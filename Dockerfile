FROM debian:9
MAINTAINER kost - https://github.com/kost

ENV APACHE_RUN_USER=www-data \
 APACHE_RUN_GROUP=www-data \
 APACHE_PID_FILE=/var/run/apache2$SUFFIX/apache2.pid \
 APACHE_RUN_DIR=/var/run/apache2$SUFFIX \
 APACHE_LOCK_DIR=/var/lock/apache2$SUFFIX \
 APACHE_LOG_DIR=/var/log/apache2$SUFFIX \
 LANG=C

RUN apt-get -qq update && \
apt-get install -yq wget ca-certificates libapache2-mod-php php-ldap && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
mkdir -p /var/run/apache2$SUFFIX/ /var/lock/apache2$SUFFIX /var/log/apache2$SUFFIX && \
echo "[Success]"

EXPOSE 80

VOLUME ["/var/www/html"]
WORKDIR /var/www/html

ENTRYPOINT ["apache2", "-D", "FOREGROUND"]
