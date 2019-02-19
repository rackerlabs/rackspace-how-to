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

After you submit the CSR, the CA emails a validation request to the person who is listed as the administrative contact for the domain to ensure that you actually own the domain for which you want to purchase the certificate.

Thawte accepts only the following email addresses when sending the authorizing email for the SSL123 product:

  - admin@
  - administrator@
  - hostmaster@
  - webmaster@
  - postmaster@
  - Administrative contact listed in WHOIS, if found

After you have purchased and validated your certificate, you're ready to [install it](/how-to/install-an-ssl-certificate).

### Renew a certificate

Follow your vendor's SSL certificate renewal process. You might
need the following details:

-   **Server type**: For example, Apache&reg; 2.4.
-   **SSL type**: For example, OpenSSL (some vendors label this modSSL).
-   **CSR**

After you have completed your renewal, you're ready to install the new certificate.

### MyRackspace users

If you are a Managed or Dedicated customer and use the [MyRackspace Portal](https://login.rackspace.com/), you can purchase an SSL certificate from Rackspace. Contact your Support team or submit a ticket to start the certificate purchase process.

When it is time to renew your certificate, Rackspace will contact you before the end of the validity period.

### Next steps

- [Install an SSL certificate](/how-to/install-an-ssl-certificate)
