---
permalink: generate-a-csr-with-openssl/
audit_date: '2016-06-24'
title: Generate a CSR with OpenSSL
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-24'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article shows how to create a certificate signing request (CSR) for an SSL
certificate, whether it's a traditional SSL from an authority like Verisign, a
self-signed certificate, or the '\*' Wildcard certificate. Most of the information is
taken from [RapidSSL's support documentation](http://www.rapidssl.com/ssl-certificate-support/generate-csr/Apache2.htm),
which is also a great place to buy a certificate. The Rackspace Cloud is
not a certificate authority (and does not resell SSL certificates), so you
will need to go to a third party solution to purchase a certificate
using the CSR that you create here.

**Note:** You can also generate a CSR and private key using a
[feature in the Cloud Control Panel](https://csrgenerator.rackspace.com/). For more
information, see [Create an SSL CSR in the Rackspace Cloud Control Panel](/how-to/create-a-csr-in-the-cloud-control-panel).

### Prerequisites

You must install `openssl` on your server. This is a common package and is
available on all of the major distros through their package installer.

To check to see if it is installed in a "Yum" style system, run the following command.

    rpm -qa | grep -i openssl

The above command should return the following or similar packages:

    openssl-1.0.1e-48.el6_8.1.x86_64
    openssl-devel-1.0.1e-48.el6_8.1.x86_64
    openssl-1.0.1e-48.el6_8.1.i686

If the packages above are not returned, install `openssl` by running the following command.

    yum install openssl openssl-devel

To check to see if it is installed in a Debian or Ubuntu system, run the following
command.

    dpkg -l |grep openssl

You should receive the following output.

    ii  libgnutls-openssl27:amd64           2.12.23-12ubuntu2.4              amd64        GNU TLS library - OpenSSL wrapper
    ii  openssl                             1.0.1f-1ubuntu2.16               amd64        Secure Sockets Layer toolkit - cryptographic utility

If you don't see the expected output, install `openssl`, run the following command.

    apt-get install openssl

### Generate the RSA key

Run the following commands to create a directory in which to store your RSA key,
substituting a directory name of your choice.

    mkdir ~/domain.com.ssl/
    cd ~/domain.com.ssl/

Run the following command to generate a private key.

    openssl genrsa -out ~/domain.com.ssl/domain.com.key 2048

### Create a CSR

Type the following command to create a CSR with the RSA private key
(output will be PEM format):

    openssl req -new -sha256 -key ~/domain.com.ssl/domain.com.key -out ~/domain.com.ssl/domain.com.csr

Enter the necessary information for creating a CSR, using the conventions
shown in the following table.

**Note:** The following characters cannot be used for the `Organization Name` or the
`Organizational Unit`:

     < > ~ ! @ # $ % ^ * / \ ( ) ?.,&

| DN Field | Explanation | Example |
| -------- | ----------- | ------- |
| Common Name | The fully qualified domain  name for your web  server. This must be an  exact match. | If you intend to secure the URL `https://www.yourdomain.com`, then  your CSR's common name must be `www.yourdomain.com`. If you plan on getting a wildcard certificate, make sure to prefix your domain with an  asterisk, example: `*.domain.com.` |
| Organization | The exact legal name of your organization. Do not abbreviate your organization name. | domain.com |
| Organization Unit | Section of the organization. | IT |
| City or Locality | The city where your organization is legally  located. | Wellesley Hills |
| State or Province | The state or province where your organization  is legally located. This cannot be abbreviated. | Massachusetts |
| Country | The two-letter ISO abbreviation for your country. | US |

-   Warning: Leave the challenge password blank (press enter).

### Verify your CSR

Run the following command to verify your CSR.

    openssl req -noout -text -in ~/domain.com.ssl/domain.com.csr

### Submit your CSR

Submit the CSR that you created here to a certificate authority. We recommend
Verisign, Thawte and RapidSSL, but there are other certificate authorities that
you can choose to use.

**Next section** - [Installing an SSL certificate](/how-to/installing-an-ssl-certificate-on-apache)
