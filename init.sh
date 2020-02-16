#!/bin/sh

docker exec -ti mediawikidocker_mediawiki_1 /bin/bash -c "cp -aT /etc/stunnel2 /etc/stunnel"
docker exec -ti mediawikidocker_mediawiki_1 /bin/bash -c "cp -aT /var/www/html2 /var/html"
docker exec -ti mediawikidocker_mediawiki_1 chown -R www-data:www-data /var/www/html

