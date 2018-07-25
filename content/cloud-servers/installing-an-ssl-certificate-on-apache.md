---
permalink: installing-an-ssl-certificate-on-apache/
audit_date: '2018-07-27'
title: Install an SSL certificate on Apache
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-07-27'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article is a continuation of [Generate a CSR](/how-to/generate-a-csr-with-openssl/) and
takes you from creating and receiving your SSL certificate (cert) from your
authority of choice to installing it in Apache. We use Apache for this article
because it is the most common web server on Linux and the Internet. The majority
of this documentation was pulled from
[RapidSSL.com](<http://www.rapidssl.com/ssl-certificate-support/install-ssl-certificate/apache_2x.htm>),
which is a great place to buy a certificate.

### Prerequisites

Before installing your certificate, make sure you have the following items:

- Apache and mod_ssl should be installed.
- You also need to have an IP address for your SSL cert and a unique IP
address for each SSL that you want to host. Certificate authorities and browsers
require that all SSL certs be on their own IP address.

### Installing your SSL certificate

#### Copy the files in into the default locale

When you receive your SSL certificate from your authority, upload it to
your server.

1. Copy all the contents of the certificate, including the `BEGIN CERTIFICATE`
and `END CERTIFICATE` lines. Save the copied text as `domain.com.crt`.

2. Copy the certificate and private key into the Apache server directory in
which you plan to store your certs (by default:
`/usr/local/apache/conf/ssl.crt/` or `/etc/httpd/conf/ssl.crt/`).

#### Edit the httpd.conf file

Open the Apache httpd.conf file in a text editor, and add the following lines
for the VirtualHost:

    <VirtualHost 123.45.67.89:443>
    ServerName www.domain.com
    DocumentRoot /path/to/your/document/root/htdocs

    SSLEngine ON
    SSLCertificateFile /etc/httpd/conf/ssl.crt/domain.com.crt
    SSLCertificateKeyFile /etc/httpd/conf/ssl.key/domain.com.key

    ErrorLog logs/ssl.domain.com.error_log
    CustomLog logs/ssl.domain.com.access_log combined
    </VirtualHost>

**Note**: Keep in mind that you should change the paths to the certificate files
to reflect the location of your certificate.

Save the changes and exit the editor.

### iptables

You may need to open a port in your firewall to allow SSL connections to
port ``443``.  To verify, get a list of your firewall rules:

    sudo /sbin/iptables -L

If you have iptables active but without exceptions for port ``443``, you'll
need to add some, as shown the following sample:

    sudo /sbin/iptables -I INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
    sudo /sbin/iptables -I OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

Remember to add the rules to your iptables config file or run the following code
on Red Hat-based distributions:

    sudo /sbin/service iptables save

### Reload or restart Apache

To activate the the cert, you'll need to either reload or restart Apache.
Because reloading Apache when disrupt any active sites, reloading is the
preferred choice, especially if you have several active sites. Restarting takes
all the sites down, while a reload just updates the configuration content.

#### Reload Apache

To reload Apache, run the following command:

**CentOS 7.0 and higher**

    # systemctl reload httpd

**CentOS 6.9 and lower**

    # service httpd reload

**Ubuntu**

    # /etc/init.d/apache2 reload

#### Restart Apache

To restart your Apache web server, run the following command:

    # /etc/init.d/httpd restart
    or
    # /etc/init.d/apache2 restart

### Test the certificate

Test your certificate by using a browser to connect to your server. Use
the https protocol directive (e.g. https://yourserver/) to indicate you
wish to use secure HTTP.

**Note**: The padlock icon on your browser will be displayed in the locked
position if your certificates are installed correctly and the server is
properly configured for SSL.
