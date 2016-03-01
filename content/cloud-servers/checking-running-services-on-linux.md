---
node_id: 1435
title: Checking running services on Linux
type: article
created_date: '2012-06-21'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The first step in troubleshooting a network service is to make sure the
program is running.

### service

To check that the program is running we will start by using the command
`service`. You can use `service` to start, stop, and check status for an
application that has an init script installed.

#### Service names

The service command references a service using its init script, stored
in the **/etc/init.d** directory. Check that directory if you aren't sure
what name the system uses for a service.

Some names vary depending on your distribution - apache is `httpd` on
CentOS, for example, while it's `apache2` on Ubuntu.

#### Service status

The following example shows how to check the status of `httpd` on CentOS
using the service command.

    $ sudo service httpd status
    httpd is stopped

#### Service control

If a service isn't running you can use `service` to start it.

    $ sudo service httpd start
    Starting httpd:                                            [  OK  ]

If the application cannot be started the service command will report the
failure and usually show a message explaining the reason.

    $ sudo service httpd start
    Starting httpd: (98)Address already in use: make_sock: could not bind to address [::]:80
    (98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
    no listening sockets available, shutting down
    Unable to open logs
    [FAILED]

### netstat

In the example above, `httpd` cannot be started because something is
already listening on the port. To find out what it is you can run
`netstat`.

We will cover `netstat` in more detail [later in this series](/how-to/checking-listening-ports-with-netstat)
but for this example it is enough to know that it can be used to display
a list of listening programs and the ports they are using.

    # netstat -plnt
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name
    tcp        0      0 10.176.77.113:3306          0.0.0.0:*                   LISTEN      28509/mysqld
    tcp        0      0 0.0.0.0:80                  0.0.0.0:*                   LISTEN      2113/nc
    tcp        0      0 127.0.0.1:25                0.0.0.0:*                   LISTEN      1115/master
    tcp        0      0 :::22                       :::*                        LISTEN      1051/sshd

The output from `netstat` shows that nc (listed in the 'Program name'
column) is listening on port 80 (in the 'Local Address' column) and so
stopping it should allow `httpd` to be started.

Remember that if the service isn't running it may be that a
super-server, such as xinetd, is being used to launch the program when a
connection is received.

### Checking again

If the service wasn't running, starting it may have resolved the issue.
Let's give it a test to find out.

If the program is running you should see something similar to the
following when you check it with `service`:

    $ sudo service xinetd status
    xinetd (pid  8795) is running...

If you cannot start your application take a look at your logs to see if
they contain further information regarding the issue. This guide should
help with making use of your logs.

### Continuing onward

Once you're sure the application is running you'll want to [take a look at the server resources it is consuming](/how-to/checking-system-load-on-linux).
