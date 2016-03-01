---
node_id: 4728
title: Information for MS SQL changes
type: article
created_date: '2015-06-25'
created_by: Alonzo Garza
last_modified_date: '2016-01-04'
last_modified_by: Nate Archer
product: Cloud Sites
product_url: cloud-sites
---

### What is changing?

-   External IPs used to manage your database will change. Please refer
    to the Control Panel for the new IP address
-   We will be deploying the latest version of My Little Admin (MLA) and
    My Little Backup (MLB) for MSSQL web administration
-   URLs to access these services will be changing, so please refer to
    the table below for more information
-   The URLs for management will be available after September 1^st^
-   Former hostnames will automatically be aliased to the new database
    hosts

**Note:** Old entries (ie., admin links) will be retired by end of Q2
2016

| Current Website Testlink | NEW My Little Admin URL |
| ------------------------ | -----------------------
| Contains DFW1-1 | [https://mssql.dfw3-1.websitesettings.com/mla](https://mssql.dfw3-1.websitesettings.com/mla)
| Contains DFW1-2 | [https://mssql.dfw3-2.websitesettings.com/mla](https://mssql.dfw3-2.websitesettings.com/mla)

### What is not changing?

-   Your version of MSSQL will not be changing. During the maintenance,
    we will be migrating SQL Server 2012 and SQL Server 2014 over to the
    new environment.
-   We will create an alias from the old hostname to the new
    hostname automatically. **Note:** *In the future we will deprecate
    the former hostnames at end of Q2 2016.*
-   Cloud Database instances are not subject to this migration.

### How does this affect me?

-   Customers using 3rd party utilities (ie. Navicat, SSMS, etc.) will
    need to update the IP address that they use to connect to their
    database for management
-   If a customer is using the management IP for production access to
    their database, we recommend that they make use of our Cloud
    Database offering.

    **Note:** Cloud Sites databases are meant to be used
    with a Cloud Sites websites only.

-   If you have pages bookmarked for web management of your database,
    please be sure to update these accordingly.



### FAQ

#### SQL Server Management Studio stopped connecting after the maintenance. What could have occurred?

-   External database Management IPs will be changing. These IPs will be
    visible in your control panel's page within the database section.

#### How do I reference my database IP information?

-   Log into your Cloud Sites control panel at
    [manage.rackspacecloud.com](http://manage.rackspacecloud.com)
-   Click on **Hosting > Cloud Sites** and select the domain
    under which the database was created
-   From the domain details page click on the **Features*** tab and select
    the active database you wish to reference:

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/MSSQL.png)

#### Will my database content be affected after the maintenance?

-   No. Data will not be modified during the maintenance. Only Hostname
    and IP information will be changing

#### Will my former hostname information be affected after the
maintenance?

-   External IPs for your instances will be updated and the former IPs
    will no longer be usable for connection strings
-   Former hostnames will automatically be aliased to the new database
    hosts

### Related topics

-   [Important scheduled maintenance: DFW environment migration](/how-to/important-scheduled-maintenance-dfw-environment-migration)
-   [Information for Customer IPs & DNS](/how-to/information-for-customer-ip-addresses-and-dns)
-   [Information for MS SQL changes](/how-to/information-for-ms-sql-changes)
-   [Information for MySQL Users (MariaDB 10.0)](/how-to/information-for-mysql-users-mariadb-100)
-   [Information for new PHP 5.6 & Apache version](/how-to/information-for-new-php-56-apache-version)
