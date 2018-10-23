---
permalink: purchase-or-renew-an-ssl-certificate/
audit_date: '2018-10-23'
title: Purchase or renew an SSL certificate
type: article
created_date: '2018-10-23'
created_by: Stephanie Fillmon
last_modified_date: '2018-10-23'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

After you [generate a certificate signing request (CSR)](/how-to/generate-a-csr), you can purchase a Secure Sockets Layer (SSL) certificate for your server. This article describes how to purchase a new SSL certificate or renew an existing certificate.

- [Purchase a certificate](#purchase-a-certificate)
- [Renew a certificate](#renew-a-certificate)
- [MyRackspace users](#myrackspace-users)

### Purchase a certificate

To purchase an SSL certificate, you must first choose a certificate authority (CA). There are many vendors to choose from, such as [Symantec&trade;](https://www.websecurity.symantec.com/ssl-certificate), [DigiCert&reg;](https://www.digicert.com/), or [Thawte&reg;](https://www.thawte.com/). You can choose whichever vendor you want.

You'll need your CSR and the fully qualified domain name to which the certificate applies, also called the *common name*.

The type of certificate that you purchase and the validity period vary by vendor, and you can choose whichever certificate suits your needs.

After you submit the CSR, the CA emails the person who is listed as the admin contact for the domain with a validation request to ensure that you actually own the domain for which you want to purchase the certificate.

**Note:** Thawte accepts only the following email addresses when sending the authorizing email for the SSL123 product:<br/><br/><ul><li>admin@</li><li>administrator@</li><li>hostmaster@</li><li>webmaster@</li><li>postmaster@</li><Administrative contact listed in WHOIS, if found</li></ul>

After you have purchased and validated your certificate, you're ready to install it.

### Renew a certificate

Follow your vendor's SSL certificate renewal process. You might
need the following details:

-   **Server type**: For example, Apache 2.4.
-   **SSL type**: For example, OpenSSL (some vendors label this modSSL).
-   **CSR**

After you have completed your renewal, you're ready to install the new certificate.

### MyRackspace users

If you are a Managed or Dedicated customer and use the MyRackspace portal, you can purchase an SSL certificate from Rackspace. Contact your support team or submit a ticket to start the certificate purchase process.

When it is time to renew your certificate, Rackspace will contact you prior to the end of the validity period.

### Next steps

- [Install an SSL certificate](/how-to/install-an-ssl-certificate)
