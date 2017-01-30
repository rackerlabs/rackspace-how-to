---
permalink: checking-running-services-on-linux/
audit_date: '2016-10-11'
title: Check running services on Linux
type: article
created_date: '2012-06-21'
created_by: Rackspace Support
last_modified_date: '2016-10-11'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

When you need to troubleshoot a network service, the first step is to ensure that the
service is running.

If the service has an init script installed, you can use the `service` command to start, stop,
and check the status of the service. The service command references a service by using
its init script, which is stored in the **/etc/init.d** directory for debain based distributions and the
**etc/rc.d/init.d** directory for Red Hat based distributions. 

If you aren't sure what name the system uses for a service, check either directory by
using the `ls` command followed by the directory. Some names vary depending on your
distribution. For example, Apache is `httpd` on CentOS and `apache2` on Ubuntu.

**Note:** Many newer Linux distributions use systemd instead of netstat for checking services. If you are using systemd, replace all `service <service-name> <status>` commands with `systemct1 <status> <service-name>`. For more information about `systemct1` commands, see the Fedora [SysVinit to Systemmd Cheatsheet](https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet).

### Check the service status

A service can have any of the following statuses:

- `start`: The service has started.
- `stop`: The service has stopped running
- `restart`: The service is rebooting and will start after the process is complete

The following example shows how to check the status of `httpd` on CentOS
using the `service` command.

    $ sudo service httpd status
    httpd is stopped

### Start the service

If a service isn't running, you can use the `service` command to start it.

    $ sudo service httpd start
    Starting httpd:                                            [  OK  ]

If the application can't be started, the system reports the
failure and usually shows a message explaining the reason.

    $ sudo service httpd start
    Starting httpd: (98)Address already in use: make_sock: could not bind to address [::]:80
    (98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
    no listening sockets available, shutting down
    Unable to open logs
    [FAILED]

### Use netstat to find port conflicts

In the  preceding example, `httpd` can't be started because something is
already listening on the port. To find out what it is, you can run
`netstat` commnand.

Run the following command to display a list of listening programs and the ports that
they are using.

    # netstat -plnt
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name
    tcp        0      0 10.176.77.113:3306          0.0.0.0:*                   LISTEN      28509/mysqld
    tcp        0      0 0.0.0.0:80                  0.0.0.0:*                   LISTEN      2113/nc
    tcp        0      0 127.0.0.1:25                0.0.0.0:*                   LISTEN      1115/master
    tcp        0      0 :::22                       :::*                        LISTEN      1051/sshd

The output shows that the nc program (listed in the `Program name` column) is listening on
port 80 (in the `Local Address` column). Stopping it should allow `httpd` to be started.

**Note:** For more information about `netstat` command, see [Check listening ports with netstat](/how-to/checking-listening-ports-with-netstat)

### Check xinetd status

If the service isn't running, it might be because a super-server, such as xinetd, is being
used to launch the program when a connection is received. Starting the service might
have resolved the issue. Run the following command to verify: 

    $ sudo service xinetd status
    xinetd (pid  8795) is running...

### Check logs

If you can’t start your service, [look at your logs](https://community.rackspace.com/products/f/25/t/531) to see if they contain information about the issue. 

### Next steps
Once you're sure the application is running, check [the server resources](/how-to/checking-system-load-on-linux) that your application is consuming. 
