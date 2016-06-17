---
permalink: generate-a-csr-with-openssl/
audit_date:
title: Generate a CSR with OpenSSL
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-15'
last_modified_by: Aaron Davis
product: Cloud Servers
product_url: cloud-servers
---

This article will go through the first step of creating and eventually
installing an SSL certificate. You'll use the same steps whether you are
getting a traditional SSL from an authority like Verisign, a self signed
certificate or the '\*' Wildcard certificate. Most of the information is
taken from [RapidSSL's support documentation](http://www.rapidssl.com/ssl-certificate-support/generate-csr/Apache2.htm),
which is also a great place to buy a certificate. The Rackspace Cloud is
not a certificate authority and does not resell SSL certificates so you
will need to go to a third party solution and purchase a certificate
using this certificate signing request (CSR).

**Note:** You can also generate a CSR and private key using a [feature in the Cloud Control Panel](https://csrgenerator.rackspace.com/). For more
information, see [Create an SSL CSR in the Rackspace Cloud Control Panel](/how-to/create-a-csr-in-the-cloud-control-panel).

### Prerequisites

First you need to install **Openssl** on your server. This is
a common package and will be available on all of the major distros
through their package installer. Here is how you check to see if it is
installed in a "Yum" style system:

    rpm -qa | grep -i openssl

The above command should return the following packages, or something
similar:

    openssl-1.0.1e-48.el6_8.1.x86_64
    openssl-devel-1.0.1e-48.el6_8.1.x86_64
    openssl-1.0.1e-48.el6_8.1.i686

If it didn't you'll want to run the following:

    yum install openssl openssl-devel
    
If you are using Debian or Ubuntu the command you will run is slightly different.

    dpkg -l |grep openssl
    
This will return the following output.

    ii  libgnutls-openssl27:amd64           2.12.23-12ubuntu2.4              amd64        GNU TLS library - OpenSSL wrapper
    ii  openssl                             1.0.1f-1ubuntu2.16               amd64        Secure Sockets Layer toolkit - cryptographic utility
    
If you do not have openssl installed you can do so with the following command.

    apt-get install openssl

### Generate the RSA key

Create a RSA key for your Apache server, since every distro is different
in where to place the certificates, we are just going to place it in an
arbitrary spot:

    mkdir ~/domain.com.ssl/
    cd ~/domain.com.ssl/

Type the following command to generate a private key.

    openssl genrsa -out ~/domain.com.ssl/domain.com.key 2048

### Create a CSR

Type the following command to create a CSR with the RSA private key
(output will be PEM format):

    openssl req -new -sha256 -key ~/domain.com.ssl/domain.com.key -out ~/domain.com.ssl/domain.com.csr

When creating a CSR you must follow these conventions. Enter the
information to be displayed in the certificate. The following characters
can not be used for the Organization Name or the Organizational Unit:

     < > ~ ! @ # $ % ^ * / \ ( ) ?.,&

| DN Field | Explanation | Example |
| -------- | ----------- | ------- |
| Common Name | The fully qualified domain  name for your web  server. This must be an  exact match. | If you intend to secure the URL `https://www.yourdomain.com`, then  your CSR's common name must be `www.yourdomain.com`. If you plan on  getting a wildcard certificate make sure to prefix your domain with an  asterisk, example: `*.domain.com.` |
| Organization | The exact legal name of your organization. Do not abbreviate your organization name. | domain.com |
| Organization Unit | Section of the organization. | IT |
| City or Locality | The city where your organization is legally  located. | Wellesley Hills |
| State or Province | The state or province where your organization  is legally located. Can not be abbreviated. | Massachusetts |
| Country | The two-letter ISO abbreviation for your  country. | US |

-   Warning: Leave the challenge password blank (press enter)

### Verify your CS

    openssl req -noout -text -in ~/domain.com.ssl/domain.com.csr

### Submit your CSR

From this point you have to take your CSR that you created here and
submit it to a certificate authority. Ones that we recommend are going
to be Verisign, Thawte and RapidSSL. There are also a number of other
certificate authorities out there, shop around.

### Next section

[Installing an SSL certificate](/how-to/installing-an-ssl-certificate-on-apache)
