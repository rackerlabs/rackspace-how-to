---
permalink: install-an-ssl-certificate/
audit_date: '2018-10-18'
title: Install an SSL certificate
type: article
created_date: '2018-10-18'
created_by: Cat Lookabaugh
last_modified_date: '2018-10-18'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

After you [generate a certificate signing request (CSR)](/how-to/generate-a-csr)
and [purchase or renew a Secure Socket Layer (SSL certificate](https://support.rackspace.com/how-to/purchase-or-renew-an-ssl-certificate/),
you'll need to install it. This article shows how to install an SSL certificate on
various servers and operating systems. The following sections provide
instructions for the installation process:

- [Prerequisites](#prerequisites)

- [Install certificate on Microsoft&reg; Windows&reg; 2008 R2 and 2012 servers](#install-certificate-on-windows-servers)

- [Install certificate on Linux&reg; server with Apache&reg;](#install-certificate-on-linux-server-with-apache)

- [Install certificate on Linux server with Nginx&reg;](#install-certificate-on-linux-server-with-nginx)

- [Install certificate on Managed Hosting solutions](#install-certificate-on-managed-hosting-solutions)

- [Reload or restart the webserver service](#reload-or-restart-the-webserver)

- [Test the certificate](#test-the-certificate)

After you have installed your certificate, you should reload your webserver
service.

### Prerequisites

Before installing your certificate, make sure you have the following items:

- A certificate from your preferred SSL vendor stored on your server. If you
don't already have a certificate, see
[Generate a CSR](https://support.rackspace.com/how-to/generate-a-csr/) and
[Purchase or renew an SSL certificate](https://support.rackspace.com/how-to/purchase-or-renew-an-ssl-certificate/)
for instructions.
- The CA bundle with the root and intermediate certificates, provided by the SSL
vendor.
- The **.key** file that was generated when you created the Certificate Signing
Request (CSR).
- A webserver such as Apache and ``mod_ssl`` should be installed.
- You also need to have an Internet Protocol (IP) address for your SSL certificate.

#### Copy the files into the default location on your server

A vendor-provided SSL certificate contains three components: the SSL certificate,
the certificate authority (CA) file, and the SSL key. When you receive your SSL
certificate from your authority, upload it to your server by using the following
steps.

1. Copy all the contents of the certificate, including the `BEGIN CERTIFICATE`
and `END CERTIFICATE` lines. Save the copied text as `domain.com.crt`.

2. Copy the certificate and private key into the appropriate server directory
in which you plan to store your certs (For example, the default Apache
directories are: `/usr/local/apache/conf/ssl.crt/` or
`/etc/httpd/conf/ssl.crt/`).

### Install certificate on Windows servers

The following sub-sections show how to install and bind an SSL certificate on
Windows servers by using the Internet Information Services (IIS) Manager.  The
final sub-section provides the steps

#### Install the certificate

Prerequisite: You should already have the certificate provided by your
preferred SSL vendor.

1. In the IIS Manager, select the server and double-click **Server Certificates**.
2. Under **Actions**, click **Complete Certificate Request**.
3. In the wizard, select the location of the certificate file, provided by your
SSL vendor.
4. For *Windows Server 2012 only*, name the file and choose your store.
5. Click **OK**.

#### Set up the bindings

1. In the IIS Manager, right-click your site and select **Edit Bindings**.
2. In the **Site Bindings** window, click **Add**.
3. In the **Add Site Binding** dialog box, perform the following steps:
    1. Set the value of **Type** to **https**.
    2. For *Windows Server 2012 only*, specify the host name, if necessary.
    3. From the **SSL certificate** list, select your certificate.
    4. Click **OK**.

After the binding is set up, the **Site Bindings** window shows the binding for
HTTPS.

#### Import an SSL certificate from another server

1. In the IIS Manager, double-click **Server Certificates**.
2. Under **Actions**, click **Import**.
3. Select the location of your certificate file, enter the password (if you set
one), and choose your certificate store (*Windows Server 2012 only*). Then,
click **OK**.

### Install certificate on Linux server with Apache

The following subsections show how to save your certificate on a Linux server
and configure Apache to use the certificate, modify the IP tables, and verify
the settings.  After you have installed the certificate,
[reload or restart the webserver](#reload-or-restart-the-webserver).

#### Save the certificate and key file

Save the certificate provided by the SSL vendor and the **.key** file that you
generated when your created the CSR in the appropriate directories.  We
recommend the following directories:

- **Certificates**: `/etc/httpd/conf/ssl.crt`
- **Keys**: `/etc/httpd/conf/ssl.key`

#### Configure httpd.conf

Open the Apache **httpd.conf** file in a text editor, and add the following
lines for the ``VirtualHost``, changing the IP address and the paths to the
certificate files to reflect the location of your certificate:

    <VirtualHost 123.45.67.89:443>
    ServerName www.domain.com
    DocumentRoot /path/to/your/document/root/htdocs

    SSLEngine ON
    SSLCertificateFile /etc/httpd/conf/ssl.crt/domain.com.crt
    SSLCertificateKeyFile /etc/httpd/conf/ssl.key/domain.com.key

    ErrorLog logs/ssl.domain.com.error_log
    CustomLog logs/ssl.domain.com.access_log combined
    </VirtualHost>

Save the changes and exit the editor.

#### iptables

You might need to open a port in your firewall to allow SSL connections to
port ``443``.  To verify, get a list of your firewall rules by running the
following command:

    sudo /sbin/iptables -L

If you have iptables active but without exceptions for port ``443``, you'll
need to add some, as shown the following sample:

    sudo /sbin/iptables -I INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
    sudo /sbin/iptables -I OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

Remember to add the rules to your iptables config file or run the following code
on Red Hat-based distributions:

    sudo /sbin/service iptables save

#### Verify configuration syntax

To verify the configuration file syntax, Run the following command ensuring that
you have no spelling errors and haven't added the wrong filenames:

    # httpd -t

If the file is good, the command returns ``Syntax OK``. If there are errors,
the command returns the incorrect lines.

#### Install certificate on Linux server with Nginx

The following subsections show how to save your certificate on a Linux server
with Nginx and configure the virtual hosts file.  After you have installed the
certificate, [reload or restart the webserver](#reload-or-restart-the-webserver).

#### Save the certificates and key file

Save to your server the primary and intermediate certificates, which should be
in the **domain_name.pem** file that you received from the SSL vendor, and the
**.key** file that you generated when your created the CSR.

If you don't already have a certificate bundle file, combine the primary
certificate (for example, my_domain.crt) and the intermediate certificate
(for example, intermediate.crt) into a single file by running the following
command:

    cat my_domain.crt intermediate.crt >> bundle.crt

#### Configure the Nginx virtual hosts file

Use the following instructions to edit the Nginx virtual hosts file:

1. Edit the Nginx virtual host file on your server.

2. Copy the existing, non-secure server module (from `server {` through the
closing `}`) and paste the code immediately below the server module.

3. In the pasted section add the following lines between `server {` and the
`server name` line:

    listen   443;

    ssl    on;
    ssl_certificate    /etc/ssl/your_domain_name.pem; (or bundle.crt)
    ssl_certificate_key    /etc/ssl/your_domain_name.key;

4. Make sure that the **ssl_certificate** file matches your bundle file and
that the **ssl_certificate_key** file matches your key file.

### Install certificate on Managed Hosting solutions

If you have requested an SSL certificate for your Rackspace Managed Hosting
server by submitted a Rackspace ticket, Rackspace will install the certificate
for you.  You should provide details including where you want the certificate
installed and your private key file.


### Reload or restart the webserver

After you have installed the SSL certificate, you should reload the webserver
service.  This section describes the steps to restart Apache and Nginx.

When you are making changes to Apache, you have two different options for your
changes to work: to restart the service or to reload the service. A restart
should be necessary only if you are adding or removing modules (such as
the ``sslL_module``). Because restarting a service takes some time to come back
up, we recommend that you use the reload option.

#### Reload Apache

To reload Apache, run the following command:

**CentOS 7.x and later**

    # systemctl reload httpd

**CentOS 6.x and earlier**

    # service httpd reload

**Ubuntu**

    # /etc/init.d/apache2 reload

#### Restart Apache

To restart your Apache web server, run the following command:

    # /etc/init.d/httpd restart
    or
    # /etc/init.d/apache2 restart

#### Restart Nginx

To restart Nginx, run the following command:

        sudo /etc/init.d/nginx restart

### Test the certificate

The best way to test a certificate is to use a 3rd-party tool like the
[SSLLabs scanner](https://www.ssllabs.com/ssltest/). If you need assistance in
improving the security configuration of your certificate, contact Rackspace.

**Note**: If you browse to your website by using the Hypertext Transfer Protocol
Secure (HTTPS) protocol directive, the padlock icon on your browser is displayed
in the locked position if your certificates are installed correctly and the server
is properly configured for SSL.
