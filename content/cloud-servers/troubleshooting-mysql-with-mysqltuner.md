---
permalink: troubleshooting-mysql-with-mysqltuner
audit_date:
title: Troubleshooting MySQL with MySQLTuner
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

MySQL tuner is a script originally written by a Racker (Major Hayden) that executes a series of SQL queries to identify some common configuration issues that could lead to problems in certain circumstances.
It's important to remember that scripts are no more then that. They are only scripts. While many of the suggestions should be taken into considerations, it can be just as bad to blindly implement changes without fully understanding the changes being made. That being said, let's jump right in!

* First, we must ensure we have a properly configured ~/.my.cnf file. With this file, we can easily configure mysqltuner to automatically connect to the remote database.
[client]

user=[Your User goes here.] 

password=[Your Password goes here.] 

host=[Cloud DB hostname goes here.]

* We also need to obtain the script.

wget mysqltuner.pl

* The file extension is .pl which tells us we should use perl to execute it!

perl mysqltuner.pl

**Note** Please keep in mind that scripts are not magical and you should always back up your configuration before testing optimizations. Optimizations should not be performed unless you fully understand (or at least have researched it) the implication of changing the setting.
