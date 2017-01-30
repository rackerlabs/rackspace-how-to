---
permalink: information-for-mysql-users-mariadb-100/
audit_date:
title: Information for MySQL Users (MariaDB 10.0)
type: article
created_date: '2015-06-25'
created_by: Alonzo Garza
last_modified_date: '2016-06-20'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

### What is changing?

Within our DFW datacenter, Cloud Sites will be updating existing MySQL
databases to MariaDB 10.0 which is a highly compatible, drop in
replacement for MySQL. This maintenance allows Cloud Sites to continue
to evolve and provide a more secure and reliable infrastructure for our
customers. Below are the upcoming changes:

-   Existing MySQL databases will be upgraded to Maria DB 10.0
-   External IPs used to manage your database will change. Please refer
    to the Control Panel for the new IP.
-   We will be deploying the latest version of phpMyAdmin for MySQL
    web administration.
-   URLs to access these services will be changing. Please refer to the
    table below for information on the new URL.
-   The URLs for site management will be available after September 1st.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"><div class="tablesorter-header-inner">
<div class="tablesorter-header-inner">
Current Website Testlink
</div>
</div></th>
<th align="left"><div class="tablesorter-header-inner">
<div class="tablesorter-header-inner">
NEW phpMyAdmin URL
</div>
</div></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Contains &quot;DFW1-1&quot;</td>
<td align="left"><a href="https://mysql.dfw3-1.websitesettings.com" class="uri">https://mysql.dfw3-1.websitesettings.com</a></td>
</tr>
<tr class="even">
<td align="left">Contains &quot;DFW1-2&quot;</td>
<td align="left"><a href="https://mysql.dfw3-2.websitesettings.com" class="uri">https://mysql.dfw3-2.websitesettings.com</a></td>
</tr>
</tbody>
</table>

### Technology Reference for MariaDB 10.0

-   Feature comparisons:
    <https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-features/>
-   Replacement for MySQL:
    <https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/>
-   MariaDB FAQ site:
    <https://mariadb.com/kb/en/meta/about-the-mariadb-knowledge-base/>

### What is not changing?

-   Plugins and database connectors that utilize your DB will not need
    to be updated. Maria DB is a drop in replacement for MySQL
-   We will create an alias from the old hostname to the new
    hostname automatically.

    **Note:** In the future we will deprecate the
    former hostnames at end of Q2 2016
-   Cloud Database instances are not subject to this migration (Note:
    Our outbound IPs will be changing, if you are using any IP based
    ACLs on external resources, please see
    [here](/how-to/information-for-customer-ip-addresses-and-dns)

### FAQ

#### MySQL Workbench stopped connecting after the maintenance. What could have occurred?

-   External database Management IPs will be changing. These IPs will be
    visible in your control panel's page within the database section.

#### How do I reference my database IP information?

1. Log in to your Cloud Sites control panel
   at [manage.rackspacecloud.com](http://manage.rackspacecloud.com)
2. Click on **Hosting > Cloud Sites** and select the domain
   under which the database was created
3. From the domain details page click on the **Features** tab and select
   the active database you wish to reference.

#### Will my database content be affected after the maintenance?

-   No. Data will not be modified during the maintenance. Only Hostname
    and IP information will be changing

#### Will my former hostname information be affected after the maintenance?

-   External IPs for your instances will be updated and the former IPs
    will no longer be usable for connection strings
-   Former hostnames will automatically be aliased to the new database
    host

#### Related Topics

-   [Important scheduled maintenance: DFW environment migration](/how-to/important-scheduled-maintenance-dfw-environment-migration)
-   [Information for Customer IPs & DNS](/how-to/information-for-customer-ip-addresses-and-dns)
-   [Information for MS SQL changes](/how-to/information-for-ms-sql-changes)
-   [Information for MySQL Users (MariaDB 10.0)](/how-to/information-for-mysql-users-mariadb-100)
-   [Information for new PHP 5.6 & Apache version](/how-to/information-for-new-php-56-apache-version)
