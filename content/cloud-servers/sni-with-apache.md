---
permalink: sni-with-apache
audit_date:
title: SNI with Apache
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

### Using Multiple SSL Certificates With  apache With One IP Address.

SNI works for either Apache. But in this article we are focusing on Apache. 
SNI is supported in Apache v2.2.12 , and  OpenSSL v0.9.8j or later. SNI supports a transport layer security (TLS) .
Lets Say You are limited to one SSL Certificate per Socket or IP address. This is terribly inconvenient if your isp, or web host will only allow a limited amount of ip's or only allow a single ip. 
SNI will secure multiple vhosts/sites for either Apache or IIS with a single or even multiple SSL certificates.  This can be for either multiple domainsor multiple sub-domain names.  
 SNI most often is used to apply multiple domains to a single ip address. 
(This is limited to Modern browsers see bellow for details.)
Apache with SNI Extension Requirements 

Required

openssl v 0.9.8j or later
 apache v2.2.12 or later
mod_ssl
OS's that support SNI from scratch
Redhat enterprise Linux 6.x and later SNI ready
Fedora 10 and later SNI ready
Centos 6.x SNI ready
Debian 6.x and later SNI ready  
Ubuntu 10.04 and later SNI ready
  
OS's that need Apache, openssl, mod_ssl to be compiled with proper versions:
 Redhat enterprise Linux5.x
 Centos 5.x 

### Setup 
### Check mod_ssl is installed:
(rehl, centos, fedora) yum list installed| grep mod_ssl

(debain, ubuntu) dpkg -s apache2.2-common or dpkg -s apache2-common

If it is not:
(rehl, centos, fedora) yum install mod_ssl
 (debain, ubuntu) apt-get install  apache2.2-common or apt-get install  apache2-common. Then enable the module:
 a2enmod ssl; /etc/init.d/apache2 reload
### Using unsupported browsers.

Test on a browser that is unsupported and it will load the SSL Cert of the first vhost that apache parses (loads). 
This can be disabled by adding the following line to the apache conf file (apache2.conf, or httpd.conf):
SSLStrictSNIVHostCheck on
This will cause a 403 error for unsupported browsers.  
 
### Setting up vhosts
This article assumes you know your where your OS keeps it's vhost file or where you put your vhost configuration. 
In your root apache conf file (apache2.conf or httpd.conf) add the following:
# Ensure that Apache listens on port 443
Listen 443
NameVirtualHost *:443
 # Go ahead and accept connections for these vhosts 

# from non-SNI clients SSLStrictSNIVHostCheck off
In your vhost conf file for each site you will need to add your virutalhost config 
to the  vhost file:
(remember this is just an example)
First Vhost:

<VirtualHost *:443>

 ServerName www.yoursite.com

 DocumentRoot /var/www/site

 SSLEngine on

 SSLCertificateFile /path/to/www_yoursite_com.crt

 SSLCertificateKeyFile /path/to/www_yoursite_com.key

 SSLCertificateChainFile /path/to/DigiCertCA.crt

</Virtual Host>

Second Vhost:

<VirtualHost *:443>

 ServerName www.yoursite2.com

 DocumentRoot /var/www/site2

 SSLEngine on

 SSLCertificateFile /path/to/www_yoursite2_com.crt

 SSLCertificateKeyFile /path/to/www_yoursite2_com.key

 SSLCertificateChainFile /path/to/DigiCertCA.crt

</Virtual Host>
You can test this with a self-signed certificate if you want.   
openssl req -new -nodes -keyout mykey.key -out mycert.cer -days 3650 -x509
Specify the domain name in the **Common Name** section.
restart apache
BROWERS
SNI is a newer Technology and most Browsers support it. However it does not work in either IE6. Or any Windows XP browser except for chrome 6 and later. 

Desktop Browsers
* Internet Explorer 7 and later
* Firefox 2 and later
* Opera 8 with TLS 1.1 enabled
* Google Chrome:
    Supported on Windows XP on Chrome 6 and later
    Supported on Vista and later by default
    OS X 10.5.7 in Chrome Version 5.0.342.0 and later
* Chromium 11.0.696.28 and later
* Safari 2.1 and later (requires OS X 10.5.6 and later or Windows Vista and later).
* Note: No versions of Internet Explorer on Windows XP support SNI
Mobile Browsers
* Mobile Safari for iOS 4.0
* Android 3.0 (Honeycomb) and later
* Windows Phone 7
