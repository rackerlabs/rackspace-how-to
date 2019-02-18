---
permalink: troubleshooting-mysql-configuration-with-mysqltuner-script
audit_date: '2019-02-18'
title: Troubleshooting MySQL configuration with MySQLTuner script
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-18'
last_modified_by: 'Erik Wilson'
product: Cloud Servers
product_url: cloud-servers
---

MySQLTuner is an original Perl script written by Rackspace that executes a series of SQL queries to identify some common configuration issues with MySQL. Using the results you can make adjustments to increase performance and stability.

1. Ensure that your  **~/.my.cnf** file is properly configured. Using this file, you can configure MySQLTuner to automatically connect to the remote database (client).

    user=*userName*

    password=*password*

    host=*cloudDBHostname*

2. Download the **mysqltuner.pl** script from **https://github.com/major/MySQLTuner-perl**.

3. Run the script using Perl.

Always back up your configuration files before testing the optimizations. Optimizations should not be performed unless you fully understand (or have researched) the implication of changing the settings.
