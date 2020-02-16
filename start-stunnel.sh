docker exec -ti mediawikidocker_mediawiki_1 bash -c 'echo "127.0.0.1 ln-gateway-testnet" >> /etc/hosts'
docker exec -ti mediawikidocker_mediawiki_1 /etc/init.d/stunnel4 start
