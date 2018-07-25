---
permalink: installing-an-ssl-certificate-on-apache/
audit_date: '2018-07-18'
title: Install an SSL certificate on Apache
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-07-18'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to install an SSL certificate on your Apache server. There are many SSL vendors that you can choose from. Where you buy your SSL certificate is up to you.

### Prerequisites

Before you can install an SSL certificate, you must create a certificate signing request (CSR) on the server. See [Generate a CSR](/how-to/generate-a-csr-with-openssl/) for instructions.

You must also have apache and mod_ssl installed, and you will need
to have an IP address for this SSL cert and a unique IP address for each
SSL that you want to host. Certificate authorities and browsers require
that all SSL certs be on their own IP address.

### Installing your SSL Certificate

To install your SSL certificate, you must copy the certificate files to your server and edit the Apache configuration file to add the locations of the SSL files.

#### Copy the files to your server

A vendor-provided SSL certificate contains three components: the SSL certificate, the certificate authority (CA) file, and the SSL key. We recommend that you name the files as **year-domain**, such as **2018-example.com**, and store them in the following locations on your server:

| Path on server | Item | Description |
| --- | --- | --- |
| **/etc/ssl/certs/2018-example.com.crt** | SSL certificate | SSL certificates are small data files that digitally bind a cryptographic key to an organization's details. When installed on a web server, it activates the padlock and the **https** protocol and allows secure connections from a web server to a browser. |
| **etc/ssl/certs/2018-example.com-CABundle.crt** | CA file | A certificate authority (CA) is a trusted entity that issues electronic documents that verify a digital entity's identity on the Internet. |
| **/etc/ssl/private/2018-example.com.key** | SSL key | The private SSL key is a text file used initially to generate a CSR and later to secure and verify connections using the certificate created per that request. The private key is used to create a digital signature. Be sure to keep this key private and secure. |

**Note:** Be sure to differentiate between the SSL certificate and the CA file when choosing a name as they are both **.crt** files.

#### Edit the Apache configuration file

Apache's main configuration file is typically named **httpd.conf** or **apache2.conf**. You can usually find this file in either **/etc/httpd** or **/etc/apache2/**.

Open the Apache configuration file in a text editor, and create the following Virtual Host:

    <VirtualHost 123.45.67.89:443>
    ServerName example.com
    DocumentRoot /var/www/vhosts/example.com/httpdocs

    SSLEngine ON
    SSLCertificateFile /etc/ssl/certs/2018-example.com.crt
    SSLCACertificateFile /etc/ssl/certs/example.com-CABundle.crt
    SSLCertificateKeyFile /etc/ssl/private/2018-example.com.key

    ErrorLog logs/example.com-error_log
    CustomLog logs/example.com-access_log common
    </VirtualHost>

**Note:** Be sure to use the name of your certificate files in place of the example name.

Save and close the file when you are finished.

### iptables

You may need to open a port in your firewall to allow SSL connections to
port 443.  To check, get a list of your firewall rules:

    sudo /sbin/iptables -L

If you have iptables active but it doesn't have any exceptions for port
443, we'll have to add some:

    sudo /sbin/iptables -I INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
    sudo /sbin/iptables -I OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

Remember to add the rules to your iptables config file or, on Red
Hat-based distributions, run:

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
