---
permalink: restart-apache/
audit_date: '2019-01-22'
title: Restart Apache
type: article
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-01-22'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

You might need to restart Apache&reg; when you want changes that you make
take effect, or when you need to bring Apache's resource use back to a normal
range. However, sometimes Apache fails to restart. This article shows you how
to check your configuration settings and restart Apache when it fails.

**Note**: Before you use the following instructions and make any changes
to your configuration files, we recommend that you back up the existing files.

### Check the syntax

The cause of the error might simply be a misspelled word or a dot (.) that's out of place.
Run the following command to check the syntax:

    httpd –S

You should see the following output:

    Syntax OK

If you receive an error message similar to the one in the following example output, you need to address the error before you attempt to restart Apache:

    Syntax error on line 51 of /etc/httpd/conf/httpd.conf:
    Invalid command 'erverRoot', perhaps misspelled or defined by a module not included in the server configuration

### Check the Apache error logs

If you resolve those errors and Apache still doesn't restart, check the Apache error logs. Using two windows might be helpful. In one window, use the tail command against the error log by running the following command:

    tail –f /var/log/httpd/error_log
    

In the other window, attempt to restart Apache by running the following
command:

    /etc/init.d/httpd restart

Watch the first window while restarting Apache to see any errors that are being generated to the logs.

Apache also might not restart if there is another service that is binding to the port that Apache is trying to use, as shown in the following output:

    Stopping httpd:                                           [FAILED]
    Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using 2001:4801:7824:103:9ed:a5a8:3301:d53a for ServerName
    [Wed Sep 10 20:48:11 2014] [warn] NameVirtualHost *:443 has no VirtualHosts
    [Wed Sep 10 20:48:11 2014] [warn] NameVirtualHost *:80 has no VirtualHosts
    (98)Address already in use: make_sock: could not bind to address [::]:80
    (98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
    no listening sockets available, shutting down
    Unable to open logs

This output shows that Apache is not able to start because another service is already assigned to port 80.

You can either change the port to which Apache is assigned or check if the other service that is assigned to this port is supposed to be on port 80. Run the `netstat` command to identify the other service that is using that port, as shown in the following example:

    netstat –plnt

The output should look similar to the following example:

    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address             Foreign Address             State      PID/Program name
    tcp       0     0 0.0.0.0:80                  0.0.0.0:*                   LISTEN     5272/sshd
    tcp       0     0 127.0.0.1:25                0.0.0.0:*                   LISTEN     1581/master
    tcp       0     0 0.0.0.0:3306                0.0.0.0:*                   LISTEN     5835/mysqld
    tcp       0     0 :::80                                       :::*        LISTEN     5272/sshd
    tcp       0     0 ::1:25                                      :::*        LISTEN     1581/master

In this example, the output shows that Secure Shell (SSH) is listening on port 80, which should not be the case. You can rectify this situation by modifying the configuration file for SSH to listen on a different port, then restart Apache.

You might also see the following error:

    httpd dead but subsys locked, but pid exists

This error means that Apache was running, but crashed. When you start Apache,
it creates a lock file to indicate that it is running. The lock file helps prevent
multiple instances from running. When you stop Apache, this lock file is
removed. When it crashes, however, the lock file still exists but the process
does not. If you see this error, you need to remove the lock file by running
the following commands:

    rm /var/lock/subsys/httpd

    /etc/init.d/httpd restart

Running these commands removes the unused lock file so that Apache can create
a new one when it restarts.
