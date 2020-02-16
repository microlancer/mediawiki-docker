docker exec -ti mediawiki-docker_mediawiki_1 bash -c 'echo "127.0.0.1 ln-gateway" >> /etc/hosts'
docker exec -ti mediawiki-docker_mediawiki_1 /etc/init.d/stunnel4 start
