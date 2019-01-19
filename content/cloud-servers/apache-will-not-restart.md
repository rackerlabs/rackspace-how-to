---
permalink: apache-will-not-restart
audit_date:
title: Apache Will Not Restart
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Sometimes you need to restart Apache for changes you have made to take effect or maybe it is using too many resources and you need to restart it to bring the resource usage back to normal ranges. But what if Apache fails to restart?
There are a few things you may want to check. Before making any changes to the configuration files I would suggest making a backup of the existing files. 

First start by checking the syntax:

# httpd –S

The output you want to see is:

Syntax OK

If you receive an error message you will want to address the error before attempting to restart Apache. It could simply be a word that is misspelled or even something as simple as a . where it should not be.:
Syntax error on line 51 of /etc/httpd/conf/httpd.conf:
Invalid command 'erverRoot', perhaps misspelled or defined by a module not included in the server configuration
If you resolve those errors and Apache still will not restart go ahead and check the Apache error logs. One of the easiest ways is to use 2 windows. One where you will be tailing the error log:

# tail –f /var/log/httpd/error _log

In the other window attempt to restart Apache.

# /etc/init.d/httpd restart

Watch the first window (where you are tailing the logs) while restarting Apache. This will let you see any errors that are being generated to the logs.
Another reason Apache may not restart is that there is another service that is binding to the port Apache is trying to use:
Stopping httpd:                                           [FAILED]
Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using 2001:4801:7824:103:9ed:a5a8:3301:d53a for ServerName
[Wed Sep 10 20:48:11 2014] [warn] NameVirtualHost *:443 has no VirtualHosts
[Wed Sep 10 20:48:11 2014] [warn] NameVirtualHost *:80 has no VirtualHosts
(98)Address already in use: make_sock: could not bind to address [::]:80
(98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
no listening sockets available, shutting down
Unable to open logs
At this point you’ll want to do a netstat to see what other service is using that port. Apache is not able to start because there is a service already assigned to port 80. You can either change the port Apache is assigned to or check to see if the other service assigned to this port is supposed to be on 80:

# netstat –plnt

Output:
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address             Foreign Address             State      PID/Program name
tcp       0     0 0.0.0.0:80                  0.0.0.0:*                   LISTEN     5272/sshd
tcp       0     0 127.0.0.1:25                0.0.0.0:*                   LISTEN     1581/master
tcp       0     0 0.0.0.0:3306                0.0.0.0:*                   LISTEN     5835/mysqld
tcp       0     0 :::80                                       :::*        LISTEN     5272/sshd
tcp       0     0 ::1:25                                      :::*        LISTEN     1581/master
In this case SSH is listening on port 80, weird. I didn’t want that. I would modify the ssh configuration file for ssh to listen on the port of my choice, then restart Apache.
The following error can seem a little weird, but it is not that bad once you start looking into it:
httpd dead but subsys locked, but pid exists
This means Apache was running, but has since crashed. When you start Apache it will create a lock file to indicate that it is running. This is to help avoid multiple instances running. When you stop Apache this lock file is removed. When it crashes though, the lock file still exists but the process does not. You’ll want to remove the lock file:

# rm /var/lock/subsys/httpd

Then run:

# /etc/init.d/httpd restart

The goal here is to remove the unused lock file so that Apache will be able to create a new one upon restart. 
