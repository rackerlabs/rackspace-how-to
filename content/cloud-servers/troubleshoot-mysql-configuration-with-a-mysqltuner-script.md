---
permalink: troubleshoot-mysql-configuration-with-a-mysqltuner-script/
audit_date: '2019-01-18'
title: Troubleshoot MySQL configuration with a MySQLTuner script
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-01-19'
last_modified_by: Erik Wilson
product: Cloud Servers
product_url: cloud-servers
---

MySQLTuner is an original Perl® script written by Rackspace that executes a series of Structured Query Language (SQL®) queries to identify some common configuration issues with MySQL®. By using the results, you can make adjustments to increase performance and stability.

Always back up your configuration files before testing the optimizations. You should not perform optimizations unless you fully understand (or have researched) the implication of changing the settings.

Use the following steps to run MySQLTuner:

1. Ensure that your  **~/.my.cnf** file is properly configured. By using this file, you can configure
   MySQLTuner to automatically connect to the remote database (client). Enter the following values:

       user=<userName>

       password=<password>

       host=<cloudDBHostname>

2. Download the **mysqltuner.pl** script from [https://github.com/major/MySQLTuner-perl](https://github.com/major/MySQLTuner-perl).

3. Run the script by using Perl.
