---
permalink: checking-running-services-on-linux/
audit_date: '2019-01-24'
title: Check running services on Linux
type: article
created_date: '2012-06-21'
created_by: Rackspace Support
last_modified_date: '2019-01-24'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

When you need to troubleshoot a network service, the first step is to ensure
that the service is running.

If the service has an initialization (init) script installed, you can use the
`service` command to start, stop, and check the status of the service. This
command references a service by using its init script, which is stored in the
`/etc/init.d` directory for Debian&reg;-based distributions and the
`etc/rc.d/init.d` directory for Red Hat&reg;-based distributions.

If you don't know the name that the system uses for a service, check either
of the preceding directories by using the `ls` command followed by the
directory name. Some names vary depending on your distribution. For example,
Apache&reg; is `httpd` on CentOS&reg; and `apache2` on Ubuntu&reg;.

**Note**: Many newer Linux&reg; distributions use `systemd` instead of
`netstat` to check services. If you're using `systemd`, replace all
`service <service-name> <status>` commands with `systemct1 <status> <service-name>`.
For more information about `systemct1` commands, see the Fedora&trade;
[SysVinit to Systemd Cheatsheet](https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet).

### Check the service status

A service can have any of the following statuses:

- `start`: The service has started.
- `stop`: The service has stopped running.
- `restart`: The service is rebooting and will start after the process is
  complete.

The following example shows how to check the status of `httpd` on CentOS
by using the `service` command:

    $ sudo service httpd status
    httpd is stopped

### Start the service

If a service isn't running, you can use the `service` command to start it. The
following example starts the `httpd` service:

    $ sudo service httpd start
    Starting httpd:                                            [  OK  ]

If the application can't be started, the system reports the
failure and usually displays a message that indicates the cause of the problem.

    $ sudo service httpd start
    Starting httpd: (98)Address already in use: make_sock: could not bind to address [::]:80
    (98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
    no listening sockets available, shutting down
    Unable to open logs
    [FAILED]

### Use netstat to find port conflicts

In the preceding example, `httpd` can't be started because something is
already listening on the port. To find out what's listening, you can run the
`netstat` command.

Run the following command to display a list of listening programs and the
ports that they're using:

    # netstat -plnt
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name
    tcp        0      0 10.176.77.113:3306          0.0.0.0:*                   LISTEN      28509/mysqld
    tcp        0      0 0.0.0.0:80                  0.0.0.0:*                   LISTEN      2113/nc
    tcp        0      0 127.0.0.1:25                0.0.0.0:*                   LISTEN      1115/master
    tcp        0      0 :::22                       :::*                        LISTEN      1051/sshd

The output shows that the `nc` program (which appears in the `Program name`
column) is listening on port 80 (which appears in the `Local Address`
column). Stopping this program should enable `httpd` to be started.

**Note**: For more information about the `netstat` command, see [Check listening ports with netstat](/how-to/checking-listening-ports-with-netstat).

### Check xinetd status

If the service isn't running, it might be because a super-server such as
an Extended Internet Service Daemon (`xinetd`) is being used to launch the
program when a connection is received. If this is the case, starting the
service might have resolved the issue. Run the following command to verify
that the issue is resolved:

    $ sudo service xinetd status
    xinetd (pid  8795) is running...

### Check logs

If you can’t start your service, [review your logs](/how-to/linux-log-files) to
see if they contain information about the issue.

### Next steps

After you're sure that the application is running, check the
[server resources](/how-to/checking-system-load-on-linux) to verify how much
your application is consuming.
