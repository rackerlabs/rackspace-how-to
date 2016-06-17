---
permalink: upgrading-to-php-56-and-apache-24-version-in-the-ord-environment/
audit_date:
title: Upgrading to PHP 5.6 and Apache 2.4 version in the ORD environment
type: article
created_date: '2015-11-30'
created_by: Justin Taylor
last_modified_date: '2015-12-10'
last_modified_by: Renee Rendon
product: Cloud Sites
product_url: cloud-sites
---

Cloud Sites is updating current versions of PHP to PHP 5.6. This
maintenance is occurring because of upcoming end of life (EOL) support
for certain PHP versions. This upgrade provides new features for
customers to use.

We are proactively providing test links to help identify potential site
break changes that might occur on your sites. PHP5.6 test links will be
shared in customer ticket notification

Following is a timeline for PHP 5.6 availability:

-   **Available now**: PHP 5.6 is currently available.
-   **Early Q1 2016**: PHP 5.3 and 5.4 clusters will be updated to
    PHP 5.6.
-   **Mid Q1 2016**: Migrations to PHP 5.6 will begin for all ORD
    customer nodes.

### Access control (.htaccess) updates

In Apache 2.2, access control is based on client hostname, IP address,
and other characteristics of client requests. The operations were
performed by using the
directives [Order](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#order), [Allow](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#allow), [Deny](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#deny),
and [Satisfy](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#satisfy).

In Apache 2.4, access control is performed in the same way as other
authorization checks, by using the new module
[mod_authz_host](http://httpd.apache.org/docs/2.4/mod/mod_authz_host.html).
We recommend you replace the old access control idioms with the new
authentication mechanisms, although for compatibility with old
configurations, the new
module [mod_access_compat](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html) is
provided.

For more information, see
<http://httpd.apache.org/docs/2.4/upgrading.html#run-time>

**Server Side Includes**

Sites that use legacy Server Side Includes (SSI) syntax will need to be
updated to the new Apache syntax or `SSILegacyExprParser` must be enabled
via **.htaccess**:

     SSILegacyExprParser on

For more information, see:

-   <http://httpd.apache.org/docs/2.4/mod/mod_include.html#ssilegacyexprparser>
-   <http://httpd.apache.org/docs/2.4/expr.html>

### What is not changing?

-   No website DNS changes will be required.
-   FTP services will not change.

### How does this affect me?

Given the changes from PHP 5.3 and 5.4 to 5.6 (to include the upgrade
from Apache 2.2 to 2.4), we ask that customers view the provided links
for common break changes. We ask that all customers use the following
test links to verify application compatibility.

**Example link for ORD1-1**

If your site is [www.example.com](http://www.example.com/), the test
link for your site on PHP 5.6 is
[http://www.example.com.php56-&lt;cluster&gt;.ord1-1.websitetestlink.com](http://www.example.com.php56-testing.ord1-1.websitetestlink.com/)

Replace the 53 or 54 in your current test link with 56 tin the new test
link, as shown in the following table.

Example current test link URL | Example new test link URL
------|------
www.yoursite.com.php53-10.ord1-1.websitetestlink.com | www.yoursite.com.php56-10.ord1-1.websitetestlink.com
www.yoursite.com.php54-1.ord1-1.websitetestlink.com | www.yoursite.com.php56-1.ord1-1.websitetestlink.com

The preceding test links will be used until the environment has been
made fully available, at which point they will be updated.

**Note:** SSL is unavailable because the test links do not support HTTPS.

### FAQ

#### Is this Apache version fixing CVE?

The version of Apache has been updated to 2.4 along with all of its relevant CVE updates.

#### After the maintenance, my website's php_errors.log is showing "PHP Warning Deprecated" alerts. What happened?

The PHP application should continue to run as normal, but it might not be supported by newer versions of PHP. We recommend that you update the application to use the newer functions for PHP 5.6.

#### My site keeps saying "connection refused" when trying to test HTTPS when utilizing the updated test links. What happened?

Cloud Sites test links do not support SSL, so any requests made to them with HTTPS fail.
