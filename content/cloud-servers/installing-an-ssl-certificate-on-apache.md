---
permalink: installing-an-ssl-certificate-on-apache/
audit_date:
title: Install an SSL certificate on Apache
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-10-19'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article is a continuation of [Generate a CSR](/how-to/generate-a-csr-with-openssl/) and
will take you from creating and receiving your SSL cert from your
authority of choice to installing it in apache. Apache
is the most common web server on Linux and the Internet. 

<http://www.rapidssl.com/ssl-certificate-support/install-ssl-certificate/apache_2x.htm>

### Prerequisites

- Apache and mod_ssl installed on your server. 

- An IP address for this SSL cert and a unique IP address for each
SSL that you want to host. Certificate authorities and browsers require
that all SSL certs be on their own IP address.

### Installing your SSL Certificate

#### Copy the files in into the default locale

When you receive your SSL certificate from your authority, upload it to
your server.

1. Copy all the contents of the certificate, including the `BEGIN CERTIFICATE` and `END CERTIFICATE` lines. Save the copied text as `domain.com.crt`.

2. Copy the certificate and private key into the Apache server directory in which you plan to store your certificates (by default:
`/usr/local/apache/conf/ssl.crt/` or `/etc/httpd/conf/ssl.crt/`).

#### Edit the httpd.conf

Open the Apache httpd.conf file in a text editor, and create the following
Virtual Host:

    <VirtualHost 123.45.67.89:443>
    ServerName www.domain.com
    DocumentRoot /path/to/your/document/root/htdocs

    SSLEngine ON
    SSLCertificateFile /etc/httpd/conf/ssl.crt/domain.com.crt
    SSLCertificateKeyFile /etc/httpd/conf/ssl.key/domain.com.key

    ErrorLog logs/ssl.domain.com.error_log
    CustomLog logs/ssl.domain.com.access_log combined
    </VirtualHost>

**Note**: Any paths to the certificate files need to be changed to where ever you choose to place your certificate.

Save the changes and exit the editor.

### iptables

You might need to open a port in your firewall to allow SSL connections to
port 443.  To check, get a list of your firewall rules:

    sudo /sbin/iptables -L

If you have iptables active but it doesn't have any exceptions for port
443, add the exceptions by running:

    sudo /sbin/iptables -I INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
    sudo /sbin/iptables -I OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

Remember to add the rules to your iptables config file. If you're on a RHEL distributions, run:

    sudo /sbin/service iptables save

### Restart Apache

Restart your apache web server:

    # /etc/init.d/httpd restart
    or
    # /etc/init.d/apache2 restart

Test your certificate by using a browser to connect to your server. Use
the https protocol directive (e.g. https://yourserver/) to indicate you
wish to use secure HTTP.

**Note**: The padlock icon on your browser will be displayed in the locked
position if your certificates are installed correctly and the server is
properly configured for SSL.
