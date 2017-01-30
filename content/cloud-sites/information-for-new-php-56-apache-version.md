---
permalink: information-for-new-php-56-apache-version/
audit_date:
title: 'Information for new PHP 5.6 & Apache version'
type: article
created_date: '2015-06-25'
created_by: Alonzo Garza
last_modified_date: '2016-01-04'
last_modified_by: Nate Archer
product: Cloud Sites
product_url: cloud-sites
---

### What is changing?

Cloud Sites will be updating current versions of PHP to PHP 5.6. This
maintenance is occurring due to upcoming EOL support (for prior PHP
versions). This upgrade will provide new features for customers to
utilize. We are proactively providing test links to help identify
potential site break changes that may occur on your sites.

**Note:**
-   PHP 5.6 will be released on Apache 2.4 (Updating from Apache 2.2)
-   PHP5.6 test links will be available after Aug 1st
-   **Early Q3 2015** - PHP 5.6 test links will be available for all
    customers to begin testing. See below.
-   **Late Q3 2015** - PHP 5.6 will be available for provisioning.
-   **Late Q3 2015** - PHP 5.3/5.4 clusters will be updated to PHP 5.6

#### Access Control (.htaccess) Updates

In version 2.2, access control is based on client hostname, IP address,
and other characteristics of client requests. The operations were
performed by using the directives
[Order](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#order),
[Allow](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#allow),
[Deny](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#deny),
and
[Satisfy](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html#satisfy).

In version 2.4, access control is performed in the same way as other
authorization checks, using the new module
[mod\_authz\_host](http://httpd.apache.org/docs/2.4/mod/mod_authz_host.html).
The old access control idioms should be replaced by the new
authentication mechanisms, although for compatibility with old
configurations, the new module
[mod\_access\_compat](http://httpd.apache.org/docs/2.4/mod/mod_access_compat.html)
is provided.

-   See link <http://httpd.apache.org/docs/2.4/upgrading.html#run-time>

#### Server Side Includes

Sites implementing legacy SSI syntax will need to update to the new
Apache syntax or enable SSILegacyExprParser via .htaccess:

     SSILegacyExprParser on

See:

-   <http://httpd.apache.org/docs/2.4/mod/mod_include.html#ssilegacyexprparser>
-   <http://httpd.apache.org/docs/2.4/expr.html>

### What is not changing?

-   No website DNS changes will be required.
-   FTP services will not change.

#### How does this affect me?

Given the changes from PHP 5.3 / 5.4 to 5.6 (to include the upgrade from
Apache 2.2 to 2.4), we ask that customers view the provided links for
common break changes. We ask that all customers use the provided test
links below to verify application compatibility.

#### Example link for DFW1-1:

If your site is [www.example.com](http://www.example.com), the test link
for your site on PHP 5.6 will be
[http://www.example.com.php56-&lt;cluster&gt;.dfw1-1.websitetestlink.com](http://www.example.com.php56-testing.ord1-1.websitetestlink.com)

Replace the 53 or 54 with 56 to use the new testlink.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"><div class="tablesorter-header-inner">
Example Current Testlink URL
</div></th>
<th align="left"><div class="tablesorter-header-inner">
Example NEW Testlink URL
</div></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><span>www.yoursite.com.php53-10</span><em>.</em><strong>dfw1-1</strong><span>.websitetestlink.com</span></td>
<td align="left">www.yoursite.com.php56-10<em>.</em><strong>dfw1-1</strong>.websitetestlink.com</td>
</tr>
<tr class="even">
<td align="left"><span>www.yoursite.com.php54-1</span><em>.</em><strong>dfw1-1</strong><span>.websitetestlink.com</span></td>
<td align="left"><span>www.yoursite.com.php56-1</span><em>.</em><strong>dfw1-1</strong><span>.websitetestlink.com</span></td>
</tr>
<tr class="odd">
<td align="left">www.yoursite.com.php53-10.<strong>dfw1-2</strong>.websitetestlink.com</td>
<td align="left">www.yoursite.com.php56-10.<strong>dfw1-2</strong>.websitetestlink.com</td>
</tr>
<tr class="even">
<td align="left">www.yoursite.com.php54-1.<strong>dfw1-2</strong>.websitetestlink.com</td>
<td align="left">www.yoursite.com.php56-1.<strong>dfw1-2</strong>.websitetestlink.com</td>
</tr>
</tbody>
</table>

**Note:** The above test links will be used until the environment has been
made fully available, at which point they will be updated. SSL will be unavailable as the test links do not support HTTPS.

## FAQ

#### Is this Apache version fixing CVE \#\#\#?

-   The version of Apache has been updated to 2.4 along with all of its
    relevant CVE updates.

#### After the maintenance, my website's php_errors.log is showing "PHP Warning Deprecated" alerts. What may have occurred?

-   The PHP application should continue to run as normal, but may not be
    supported by newer versions of PHP.
-   It's highly recommended to update the application to use the newer
    functions for PHP 5.6.

#### My site keeps saying "connection refused" when trying to test HTTPS when utilizing the updated test links. What may have occurred?

-   Cloud Sites test links do not support SSL, so any requests made to
    them with HTTPS will fail.

### Related Topics

-   [Important scheduled maintenance: DFW environment migration](/how-to/important-scheduled-maintenance-dfw-environment-migration)
-   [Information for Customer IPs & DNS](/how-to/information-for-customer-ip-addresses-and-dns)
-   [Information for MS SQL changes](/how-to/information-for-ms-sql-changes)
-   [Information for MySQL Users (MariaDB 10.0)](/how-to/information-for-mysql-users-mariadb-100)
