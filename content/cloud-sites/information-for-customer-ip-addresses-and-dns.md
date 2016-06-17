---
permalink: information-for-customer-ip-addresses-and-dns/
audit_date:
title: Information for customer IP addresses and DNS
type: article
created_date: '2015-06-25'
created_by: Alonzo Garza
last_modified_date: '2016-01-14'
last_modified_by: Rose Coste
product: Cloud Sites
product_url: cloud-sites
---

### What is changing?

-   Outbound IP addresses for access to external services, such as
    Twitter or Facebook, will change. If you have an external service
    restricting access by IP address, aff the following IP addresses to
    your whitelist prior to September 1, 2015:
    -   *72.32.10.144/28 (WC1.DFW3 outbound pool)*
    -   *72.32.47.176/28 (WC2.DFW3 outbound pool)*
    -   *72.32.10.144 - 72.32.10.159 (WC1.DFW3)*
    -   *72.32.47.176 - 72.32.47.191 (WC2.DFW3)*

-   Outbound IP addresses for access to ServiceNet resources
    will change. If you have any ServiceNet resources such as Cloud
    Servers, Cloud Databases, etc., restricting access by IP address,
    please add **10.187.240.0/20** to your whitelists.

-   Database management IP addresses will change. Based on your
    technology, please reference
    [MSSQL](/how-to/information-for-ms-sql-changes)
    or
    [MySQL](/how-to/information-for-mysql-users-mariadb-100)
    for more information.

-   Test links for websites will be changing to reflect their
    new location. Test links should only be used for testing purposes
    and can change at any time. These URLs for site management are
    available after September 1, 2015:
    -   If your current testlink URL contains "DFW1-1", then your new
        testlink URL follows this pattern:
        www.yoursite.com.*cluster.***dfw3-1**.websitetestlink.com
    -   If your current testlink URL contains "DFW1-2", then your new
        testlink URL follows this pattern:
        www.yoursite.com.*cluster.***dfw3-2**.websitetestlink.com

### What is not changing?

-   Customers will not need to update their DNS entries for
    their websites. We will be migrating SSL and cluster IPs over.

-   Customers using 3rd party DDoS mitigation services (such
    as CloudFlare) will not need to update anything on their end.

-   FTP records and IPs will also remain the same.

    **Note:** Old DNS entries (i.e., test links) will be retired by end
    of Q2 2016.

### How does this affect me?

Most customers will not have to make any changes in order to continue
functioning correctly.

Customers that will likely be affected are those using outdated security
practices. Here are examples of websites likely affected:

-   Websites using external services (only if those have firewalls
    restricting by IP address)
-   Websites running a completely (or partially) from the testlink
-   Websites using the database management IP for external production
    access
-   Websites that have hard-coded IP addresses instead of a hostname

### FAQ

**My site feed (example: Twitter, Facebook, Instagram) stopped working
after the maintenance. What could have occurred?**

-   The outbound IPs will be changing. If your site connects to external
    applications or services, these will need to be updated.

**My site connects to my Cloud Server to manage my databases and
caching, but after the maintenance, it stopped working. What could have
occurred?**

-   The outbound IP addresses have changed. If your site connects to
    another Rackspace service like a Cloud Server, add the following IP
    addresses to your network rules to accept the connections:
    -   *72.32.10.144/28 (WC1.DFW3 outbound pool)*
    -   *72.32.47.176/28 (WC2.DFW3 outbound pool)*
    -   *72.32.10.144 - 72.32.10.159 (WC1.DFW3)*
    -   *72.32.47.176 - 72.32.47.191 (WC2.DFW3)*

**MySQL Workbench/SQL Server Management Studio stopped connecting after
the maintenance. What could have occurred?**

-   External database management IPs will be changing. Based on
    your technology, please
    reference [MSSQL](/how-to/information-for-ms-sql-changes) or [MySQL](/how-to/information-for-mysql-users-mariadb-100) for
    more information

**My test links stopped working after the maintenance. What occurred?**

-   After the maintenance, test links will be changing to a new format
    to reflect the new datacenter. Please see test link table above.

**Related Topics**

-   [Important scheduled maintenance: DFW environment migration](/how-to/important-scheduled-maintenance-dfw-environment-migration)
-   [Information for Customer IPs & DNS](/how-to/information-for-customer-ip-addresses-and-dns)
-   [Information for MS SQL changes](/how-to/information-for-ms-sql-changes)
-   [Information for MySQL Users (MariaDB 10.0)](/how-to/information-for-mysql-users-mariadb-100)
-   [Information for new PHP 5.6 & Apache version](/how-to/information-for-new-php-56-apache-version)
