# mediawiki-docker
Docker file to run mediawiki

How to use
----------

1. Build the mediawiki_lightning image. Run `sh build.sh`.
1. Start with docker-compose. Run `sh start.sh`.
1. Initialize the container. Run `sh init.sh`.
1. Visit http://127.0.0.1:8080 and the install steps should appear.
1. When asked for the DB host, use the hostname `database` which will resolve to the IP address of the mysql container. Do not use localhost or 127.0.0.1 as they won't work. See the yml file for the other DB values.
1. Also suggested: set to Account Creation Required, update Return email address, enable Parser hooks > ParserFunctions, Enable file uploads, No caching
1. Copy the LocalSettings.php at the end of the setup into the ./html folder. For example, it might look like: `cp ~/Downloads/LocalSetting.php ./html` (depends where you downloaded it)
1. Download/clone the `LightningPayment` extension into the ./html/extensions folder 
1. Copy the `/etc/stunnel/stunnel.pem` file from the lightning-php api server.
1. Modify the `/etc/stunnel/ln-gateway-client.conf` file to use the correct ip of your lightning node php api.
1. Run: `sh start-stunnel.sh`.
1. (Optional) Go into the container with `sh root.sh` and check the /var/log/stunnel4/stunnel.log for any errors.
1. (Optional) Also validate the lightning node connection within the container: `curl -v http://ln-gateway:3000/?method=getinfo` should return node information. 
1. Create a template page LightningPayment with the contents of Template.txt - You can do this by editing: http://127.0.0.1:8080/index.php?title=Template:LightningPayment&action=edit
1. Browse to http://127.0.0.1:8080/index.php/Special:LightningPayment to check that the extension and template are working.                                    
1. You may need to reconfigure exim4 to ensure mail is working.
1. To stop: `sh stop.sh`


Add these settings to the bottom of the LocalSettings.php file:

```
wfLoadExtension( 'ParserFunctions' );
include("extensions/LightningPayment/LightningPayment.php");

$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['user']['edit'] = false;
$wgGroupPermissions['trusted']['edit'] = true;
$wgGroupPermissions['*']['createpage'] = false;
$wgGroupPermissions['user']['createpage'] = false;
$wgGroupPermissions['trusted']['createpage'] = true;

$wgLightningPaymentNodeUrl = 'http://ln-gateway:3000';
#$wgMainCacheType = CACHE_NONE;
#$wgCacheDirectory = false;
#$wgShowExceptionDetails = true;

$wgUrlProtocols[] = 'lightning:';

$wgAllowImageTag = true;
$wgAllowExternalImagesFrom = ['https://chart.googleapis.com/'];
```

