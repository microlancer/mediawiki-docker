docker exec -ti mediawiki_lightning bash -c 'echo "127.0.0.1 ln-gateway-testnet" >> /etc/hosts'
docker exec -ti mediawiki_lightning /etc/init.d/stunnel4 start
