---
permalink: using-sni-to-host-multiple-ssl-certificates-in-apache/
audit_date: '2019-01-28'
title: Using SNI to host multiple SSL certificates in Apache
type: article
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: '2019-01-28'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Server Name Identification (SNI) is an extension of the Secure Socket Layer (SSL) and Transport
Layer Security (TLS) protocol that enables you to host multiple SSL certificates on a single
unique Internet Protocol (IP) address. This article describes how to use SNI to host multiple
SSL certificates in Apache&reg;.

### Prerequisites

Your server must meet the following requirements to use SNI:

- Apache v2.2.12 or later
- OpenSSL&reg; v 0.9.8j or later
- mod_ssl must be installed

The following operating systems support SNI without additional modifications:

- Red Hat&reg; Enterprise Linux&reg; (RHEL) 6 and later
- Fedora&reg; 10 and later
- CentOS&reg; 6
- Debian&reg; 6 and later
- Ubuntu&reg; 10.04 and later
  
The following operating systems require Apache, OpenSSL, and mod_ssl to be compiled
with proper versions:

- Red Hat Enterprise Linux 5
- Centos 5

#### Check that mod_ssl is installed

Before you use SNI, check that mod_ssl is installed by running the following command:

**RHEL, CentOS, and Fedora**

    yum list installed | grep mod_ssl

**Debian and Ubuntu**

    dpkg -s apache2.2-common

If mod_ssl is not installed, use the following command to install it:

**RHEL, CentOS, and Fedora**

    yum install mod_ssl
    
**Debian and Ubuntu**

 For Debian and Ubuntu, install mod_ssl by using the following command:
 
     apt-get install apache2.2-common
 
 Then enable the module by running `a2enmod ssl; /etc/init.d/apache2 reload`.  
 
### Set up vhosts

Add the following lines in your root Apache configuration file (**apache2.conf** or **httpd.conf**):

    # Ensure that Apache listens on port 443
    Listen 443
    
    # Listen for virtual host requests on all IP addresses
    NameVirtualHost *:443

    # Accept connections for these vhosts from non-SNI clients
    SSLStrictSNIVHostCheck off

In the vhost configuration file for each site, you must add your virtual host configuration. It
should look similar to the following examples:

First vhost:

    <VirtualHost *:443>

     ServerName www.yoursite.com

     DocumentRoot /var/www/site

     SSLEngine on

     SSLCertificateFile /path/to/www_yoursite_com.crt

     SSLCertificateKeyFile /path/to/www_yoursite_com.key

     SSLCertificateChainFile /path/to/DigiCertCA.crt

    </Virtual Host>

Second vhost:

    <VirtualHost *:443>

     ServerName www.yoursite2.com

     DocumentRoot /var/www/site2

     SSLEngine on

     SSLCertificateFile /path/to/www_yoursite2_com.crt

     SSLCertificateKeyFile /path/to/www_yoursite2_com.key

     SSLCertificateChainFile /path/to/DigiCertCA.crt

    </Virtual Host>
    
You can test the configuration with a self-signed certificate by using the following
command:

    openssl req -new -nodes -keyout mykey.key -out mycert.cer -days 3650 -x509

Specify the domain name in the **Common Name** section, and then restart Apache.


### Supported browsers

SNI is supported by most browsers, however older browsers such as Internet Explorer&reg; 6
and any Windows&reg; XP&reg; browser do not support SNI.

**Desktop browsers**

- Internet Explorer 7 and later
- Firefox&reg; 2 and later
- Opera 8 with TLS 1.1 enabled
- Google Chrome&reg;:

  - Supported on Windows XP on Chrome 6 and later
  - Supported on Vista and later by default
  - Supported on OS X 10.5.7 in Chrome Version 5.0.342.0 and later
  
- Chromium&reg; 11.0.696.28 and later
- Safari 2.1 and later (requires OS X 10.5.6 and later or Windows Vista and later).

**Note:** No versions of Internet Explorer on Windows XP support SNI.

**Mobile browsers**

- Mobile Safari for iOS 4.0 and later
- Android 3.0 (Honeycomb) and later
- Windows Phone 7 and later

#### Unsupported browsers

Unsupported browsers load the SSL certificate of the first vhost that Apache loads. You can
display a 403 error instead by adding the following line to the Apache configuration file
(**apache2.conf**, or **httpd.conf**):

    SSLStrictSNIVHostCheck on
