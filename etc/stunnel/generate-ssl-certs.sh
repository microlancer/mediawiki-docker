openssl genrsa -out key.pem 2048
openssl req -new -x509 -key stunnel-key.pem -out stunnel-cert.pem -days 1095
cat stunnel-key.pem stunnel-cert.pem >> stunnel.pem

chmod 600 stunnel.pem stunnel-key.pem stunnel-cert.pem

ls -al stunnel-cert.pem
ls -al stunnel.pem
ls -al stunnel-key.pem
