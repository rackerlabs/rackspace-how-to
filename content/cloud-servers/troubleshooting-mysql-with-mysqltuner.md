---
permalink: troubleshooting-mysql-configuration-with-mysqltuner-script
audit_date: '2019-01-18'
title: Troubleshooting MySQL configuration with MySQLTuner script
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-01-18'
last_modified_by: '2019-01-18'
product: Cloud Servers
product_url: cloud-servers
---

MySQLTuner is an original script written by Rackspace that executes a series of SQL queries to identify some common configuration issues with MySQL.

While many of the suggestions provided by the script should be taken into consideration, do not implement any changes without fully understanding the changes being made.

1. Ensure that your  `~/.my.cnf` file is properly configured. Using this file, you can configure MySQLTuner to automatically connect to the remote database.
[client]

    user=*userName*

    password=*password*

    host=*cloudDBHostname*

2. Obtain the wget **mysqltuner.pl** script.

3. Execute the script using perl.

Always back up your configuration before testing the optimizations. Optimizations should not be performed unless you fully understand (or have researched) the implication of changing the setting.
