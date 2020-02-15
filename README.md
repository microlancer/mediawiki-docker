# mediawiki-docker
Docker file to run mediawiki

How to use
----------

* Download or copy the `docker-compose.yml` file into your directory.
* To start (as background daemon): `docker-compose -d up`
* Visit http://127.0.0.1:8080 and the install steps should appear.
* When asked for the DB host, use the hostname `database` which will resolve to the IP address of the mysql container. Do not use localhost or 127.0.0.1 as they won't work. See the yml file for the other DB values.
* To stop: `docker-compose down`

