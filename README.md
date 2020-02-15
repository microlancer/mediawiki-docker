# mediawiki-docker
Docker file to run mediawiki

How to use
----------

* Download or copy the `docker-compose.yml` file into your directory.
* To start (as background daemon): `docker-compose -d up`
* Visit http://127.0.0.1:8080 and the install steps should appear.
* When asked for the DB host, use the hostname `database` which will resolve to the IP address of the mysql container. Do not use localhost or 127.0.0.1 as they won't work. See the yml file for the other DB values.
* Download/clone the `LightningPayment` extension into the ./html/extensions folder 
* Copy the `/etc/stunnel/stunnel.pem` file from the lightning-php api server.
* Create a template page LightningPayment with the contents of Template.txt - You can do this by editing: http://127.0.0.1:8080/index.php?title=Template:LightningPayment&action=edit
* Browse to http://127.0.0.1:8080/index.php/Special:LightningPayment to check that the extension and template are working.                                    
* You may need to reconfigure exim4 to ensure mail is working.
* To stop: `docker-compose down`


Add these settings to LocalSettings.php:

```
wfLoadExtension( 'ParserFunctions' );

include("extensions/LightningPayment/LightningPayment.php");


# End of automatically generated settings.
# Add more configuration options below.

$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['user']['edit'] = false;
$wgGroupPermissions['trusted']['edit'] = true;
$wgGroupPermissions['*']['createpage'] = false;
$wgGroupPermissions['user']['createpage'] = false;
$wgGroupPermissions['trusted']['createpage'] = true;

$wgBitcoinPaymentApiKey = 'aaaaaabbbbbbbccccccc111';
$wgBitcoinPaymentNodeUrl = 'http://ln-gateway:3000';
#$wgMainCacheType = CACHE_NONE;
#$wgCacheDirectory = false;
#$wgShowExceptionDetails = true;

$wgUrlProtocols[] = 'lightning:';

$wgAllowImageTag = true;
$wgAllowExternalImagesFrom = ['https://chart.googleapis.com/'];
```

