---
node_id: 1437
title: Checking Listening Ports with netstat
type: article
created_date: '2012-06-21'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### netstat

If you're troubleshooting a service that you know [is running normally](/how-to/checking-system-load-on-linux)
the next step is to make sure it's listening to the right network port.

The `netstat` command shows the services listening to ports on a Linux
server along with the details of any connections currently made to them.
The connection details we look at during basic network daemon
troubleshooting are the addresses the daemon is listening on (including
the port number), the daemon's PID (process identifier), and the program
name.

Of course, you need to run `netstat` on the server running the service.
Remember that `netstat` is not affected by your firewall configuration.

### Checking ports

To list tcp ports that are being listened on, along with the name of
each listener's daemon and its PID, run:

    sudo netstat -plnt

The following example shows `netstat`'s output for three common programs
that are listening on three different sockets.

    $ sudo netstat -plnt
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name
    tcp        0      0 0.0.0.0:3306                0.0.0.0:*                   LISTEN      3686/mysqld
    tcp        0      0 :::443                      :::*                        LISTEN      2218/httpd
    tcp        0      0 :::80                       :::*                        LISTEN      2218/httpd
    tcp        0      0 :::22                       :::*                        LISTEN      1051/sshd

### Filtering the list

If the list of listening daemons is long you can use grep to filter it.
For example, to filter out everything except the default web server port, number 80, run:

    $ sudo netstat -plnt | grep ':80'
    tcp        0      0 :::80                       :::*                        LISTEN      8448/httpd

### Analysing the results

Common outcomes are:

-   Nothing is listening on the port. Check the service configuration
    files then try restarting the service.
-   The correct service is listening on the correct port. In this case
    we need to test the service more thoroughly - skip to the article on
    [testing the listening service for response using
    netcat](/how-to/testing-network-services-with-netcat).
-   Something other than the expected service appears to be listening on
    the port.

**Note**: If a super-server, such as xinetd,
is listening on the port this may be desired. See above for details on
looking at your xinetd configuration.

If something else is listening to the port, try disabling that program,
e.g. "sudo service httpd stop", or changing its configuration so it no
longer listens on the required port. Then enable the correct service
when netstat shows the port is free, e.g. "sudo service vsftpd start".

If you make any changes because the incorrect service is listening or
nothing is, run the netstat command again to see if it has made a
difference. If netstat doesn't show the program listening on the correct
port you need to address its configuration before you go any further.

### Outcome

If you make changes at this point make sure to test your setup &ndash; you may
have resolved your issue.

If not, let's continue to test connections to the service by using [the netcat command.](/how-to/testing-network-services-with-netcat)
