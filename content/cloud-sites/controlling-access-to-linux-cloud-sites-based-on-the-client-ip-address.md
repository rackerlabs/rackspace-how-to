---
permalink: controlling-access-to-linux-cloud-sites-based-on-the-client-ip-address/
audit_date:
title: Control access to Linux Cloud Sites based on the client IP address
type: article
created_date: '2011-03-10'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

With updates being made to the Cloud Sites infrastructure, some users
will need to update their rules to comply with Apache 2.4 .htaccess
rules for blocking and/or allowing IP addresses to specific sites. The
changes made from Apache 2.2 to Apache 2.4 allow a much simpler method
of blocking IPs, and the previous method required for Cloud Sites is no
longer necessary. Please keep in mind that these rules are only for the
PHP 5.6 offering, as the PHP 5.3/5.4 offering still uses the legacy
rules, archived at the bottom of this article, and will be phased out
entirely as PHP 5.3/5.4 is removed from use.

**Note:** The mod_access_compat Apache module is loaded in the Cloud Sites
environment to allow the previously standard Allow/Deny directives
without requiring SetEnvIf. This method, however, is deprecated and is
discouraged as any future Apache updates could make the rules
unusable.

To block a specific IP on a given site, the .htaccess file needs to use
Require not IP `<IP or range>`, within a `RequireAll` directive, so
that the rules can verify. Failure to use a `Require` directive will
results in an Internal Server Error.

    <RequireAll>
    Require all granted
    Require not ip 46.148.22.18
    Require not ip 46.148.18.162
    Require not ip 46.119.121.146
    Require not ip 195.154.183.108
    </RequireAll>

To allow only a specific IP on a given site, the .htaccess file needs to
use Require IP `<IP or range>`, but does not require a directive.
You can also place a simple 403 error message for visitors not meeting
the requirements.

    Require ip 127.0.0.1
    Require ip 10.5.55.123
    ErrorDocument 403 "This site can only be accessed within the company network"

For further reading on more specific rules for blocking or allowing
access by IP or host, please view the Apache 2.4 documentation for
Access Control rules:

[https://httpd.apache.org/docs/2.4/howto/access.html](https://httpd.apache.org/docs/2.4/howto/access.html)

**Note:** The information below is deprecated as of Apache 2.4 and kept for archival purposes while the ORD datacenter is still able to use PHP 5.3/5.4. Users are encouraged to use PHP 5.6 and update their rules according to the above information.

On Cloud Sites, due to our unique hosting environment, we require an
addition to the **Allow/Deny** instruction in the .htaccess file when
controlling access to a site based on IP address. The issue is that the
requesting IP address coming into a server is the IP address of our load
balancing server instead of the visitor's IP address. This means
limiting access on an IP address level through .htaccess becomes
problematic. To work around that, we provide an environment variable
called **X-Cluster-Client-Ip** that contains the visitor's IP address.

In the `.htaccess` file containing your rules, make the appropriate change
from the list below based on your requirements.

-  Allowing only a certain IP/IP Addresses:

       order deny,allow
       deny from all
       allow from env=allowclient
       SetEnvIf X-Cluster-Client-Ip 000.000.000.000 allowclient

-  Allowing only a certain IP/IP Addresses when your site is using SSL:

       order deny,allow
       deny from all
       allow from 000.000.000.000

  Replace **000.000.000.000** with your IP address. This will only allow
your IP address to access your site, and is a great way to develop your
site without the risk of someone reaching it before it's ready.

  **You can repeat line 1 to allow multiple IPs.**

-  Denying an IP/Multiple IP addresses:

       Order Allow,Deny
       Deny from env=DenyAccess
       Allow from all
       SetEnvIf X-Cluster-Client-Ip "^000.000.000.000" DenyAccess

-  Denying an IP/Multiple IP addresses when your site is using SSL:

       Order Allow,Deny
       Deny from env=DenyAccess
       Allow from all
       SetEnvIf X-FORWARDED-FOR "^000.000.000.000" DenyAccess

  Replace **000\\.000\\.000\\.000** with the IP address you want to deny. This will deny the IP address specified/multiple IP addresses (If you use multiple lines, as specified below).

  **You can repeat line 1 to deny multiple IP addresses.**

**Note:** Implementing this code may prevent images from
loading on your cloud site. To address this you can add the following
code do your **.htaccess** file:

    <FilesMatch ".(gif|jpe?p|png)$">
    order deny,allow
    allow from env=allowclient
    </FilesMatch>
