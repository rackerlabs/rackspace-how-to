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
taken from [RapidSSL's support documentation](http://www.rapidssl.com/ssl-certificate-support/generate-csr/Apache2.htm).

The Rackspace Cloud is not a certificate authority (and does not resell SSL certificates),
so you need to go to a third party solution,such as RapidSSL, to purchase a certificate
using the CSR that you create here.

**Note:** You can also generate a CSR and private key by using a
[feature in the Cloud Control Panel](https://csrgenerator.rackspace.com/). For more
information, see [Create a CSR in the Cloud Control Panel](/how-to/create-a-csr-in-the-cloud-control-panel).

### Install OpenSSL

You must install OpenSSL on your server. This is a common package and is
available on all of the major Linux distributions through their package installers.

To check whether it is installed on a system that uses `yum` (such as CentOS or Red Hat
Enterprise Linux), run the following command.

    rpm -qa | grep -i openssl

The preceding command should return the following or similar packages:

    openssl-1.0.1e-48.el6_8.1.x86_64
    openssl-devel-1.0.1e-48.el6_8.1.x86_64
    openssl-1.0.1e-48.el6_8.1.i686

If these packages are not returned, install OpenSSL by running the following command:

    yum install openssl openssl-devel

To check whether OpenSSL is installed in a Debian or Ubuntu system, run the following
command:

    dpkg -l |grep openssl

You should receive the following output.

    ii  libgnutls-openssl27:amd64           2.12.23-12ubuntu2.4              amd64        GNU TLS library - OpenSSL wrapper
    ii  openssl                             1.0.1f-1ubuntu2.16               amd64        Secure Sockets Layer toolkit - cryptographic utility

If you don't see the expected output, install OpenSSL, run the following command:

    apt-get install openssl

### Generate the RSA key

Run the following commands to create a directory in which to store your RSA key,
substituting a directory name of your choice:

    mkdir ~/domain.com.ssl/
    cd ~/domain.com.ssl/

Run the following command to generate a private key:

    openssl genrsa -out ~/domain.com.ssl/domain.com.key 2048

### Create a CSR

Type the following command to create a CSR with the RSA private key
(output is in PEM format):

    openssl req -new -sha256 -key ~/domain.com.ssl/domain.com.key -out ~/domain.com.ssl/domain.com.csr

When prompted, enter the necessary information for creating a CSR by using the conventions
shown in the following table.

**Note:** The following characters cannot be used in the `Organization Name` or the
`Organizational Unit`: < > ~ ! @ # $ % ^ * / \ ( ) ?.,&

| DN field | Explanation | Example |
| -------- | ----------- | ------- |
| Common Name | The fully qualified domain  name for your web  server. This must be an  exact match. | If you intend to secure the URL `https://www.yourdomain.com`, then  your CSR's common name must be `www.yourdomain.com`. If you plan to get a wildcard certificate, make sure to prefix your domain name with an  asterisk, for example: `*.domain.com.` |
| Organization Name | The exact legal name of your organization. Do not abbreviate your organization name. | domain.com |
| Organizational Unit | Section of the organization. | IT |
| City or Locality | The city where your organization is legally  located. | Wellesley Hills |
| State or Province | The state or province where your organization  is legally located. Do not use an abbreviation. | Massachusetts |
| Country | The two-letter ISO abbreviation for your country. | US |

Warning: Leave the challenge password blank (press **Enter**).

### Verify your CSR

Run the following command to verify your CSR:

    openssl req -noout -text -in ~/domain.com.ssl/domain.com.csr

### Submit your CSR

Submit the CSR that you created to a certificate authority. We recommend
Verisign, Thawte and RapidSSL, but there are other certificate authorities that
you can choose to use.

**Next section** - [Install an SSL certificate on Apache](/how-to/installing-an-ssl-certificate-on-apache)
