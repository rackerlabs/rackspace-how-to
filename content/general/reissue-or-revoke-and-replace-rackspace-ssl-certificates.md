---
permalink: reissue-or-revoke-and-replace-rackspace-ssl-certificates/
audit_date: '2019-02-11'
title: Reissue or revoke and replace Rackspace SSL certificates
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-02-12'
last_modified_by: William Loy
product: general
product_url: general
---

This article provides instructions for reissuing or revoking and replacing Rackspace Secure Sockets Layer (SSL) certificates by using the Rackspace Control Panel.

Use the following steps to reissue or revoke and replace the certificates:

1. Log in to [login.rackspace.com](https://login.rackspace.com).

2. Expand the **Network** dropdown menu, then click the **SSL certificates** option.

3. Under the **Configured** tab, select the blue highlighted domain name for which you want to update the SSL certificate.

4. Select **Reissue** or **Revoke & Replace** on the right-hand side of the screen.

    - Symantec&reg; certificates prompt you with the option to **Revoke and Replace** the certificate.

        **Warning:** Your SSL certificate is not automatically revoked on your server. The current SSL certificate remains valid until the new certificate is placed on the intended device.

    - Thawte&reg; certificates prompt you with the option to **Reissue** the certificate.

5. Click **Submit** to reissue or revoke and replace the SSL certificate. 
