---
permalink: testing-network-services-with-netcat/
audit_date:
title: Testing Network Services with netcat
type: article
created_date: '2012-06-21'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Using netcat

If you have a network service that's not behaving like it should but you
know it's [listening to a network
port](/how-to/checking-listening-ports-with-netstat),
you can take a closer look at a connection to the program to see if it
reveals the problem.

We will now use nc, a.k.a. netcat, to test access to the service. If nc
is not installed by default - run "sudo yum install nc" on Red Hat-based
distros or "sudo apt-get install netcat" on Debian-based distros.


### Basic test

First we'll run a simple test to see if the port accepts connections.
We'll do that with the nc command and the"-vz" option:

    {.pre .codeblock}
    nc -vz IP_Address Port

The IP address should be the one on which the service receives
connections.

The following three examples show the possible output:

#### The connection is successfully made

    {.pre .codeblock}
    nc -vz 203.0.113.96 21
    Connection to 203.0.113.96 21 port [tcp/ftp] succeeded!

#### The connection is refused

    {.pre .codeblock}
    nc -vz 203.0.113.96 80
    nc: connect to 203.0.113.96 port 80 (tcp) failed: Connection refused

#### There is no response to the connection request

    {.pre .codeblock}
    nc -vz 203.0.113.96 80
    nc: connect to 203.0.113.96 port 80 (tcp) failed: Connection timed out

### Connection refused

You'll usually see this response when the service isn't running or a
firewall is rejecting the connection.

If you haven't already confirmed that the service is running you can
check using the ps and service commands as explained in the [previous
article in this series on checking running
services](/how-to/checking-running-services-on-linux).

If your service is running it's likely the connection being refused
because your firewall is rejecting the connection. Take a look at the
"connection timed out" section for instructions on troubleshooting your
firewall.


### Connection timed out

A connection timed out response indicates that your connection is not
getting to the service. Often this happens when when your firewall is
blocking the port. The simplest way to test this is to temporarily add a
rule that will accept connections on the required port.

The following example inserts a rule on line 1 of the input chain that
will accept all tcp connections on port 80 (http). This rule would be
used when testing a web server such as Apache.

    {.pre .codeblock}
    sudo /sbin/iptables -I INPUT 1 -p tcp --dport http -j ACCEPT

iptables will instantly update with any changes made. Repeat the test
with nc to see if there is any change in the response.

If you want to remove the rule you have added you can use the -D option
as well as the position of the rule in the chain. In the previous
example we added a rule at line 1, the top of the chain. The following
example shows how to remove it.

    {.pre .codeblock}
    sudo /sbin/iptables -D INPUT 1


You can check your current firewall configuration at any time by running
the following:

    {.pre .codeblock}
    sudo /sbin/iptables -L -v

### Connection succeeded

If the initial connection succeeds it indicates that nc can connect to
the service. Now we should look at the connection in a bit more detail.

First use the "-vt" option to see if the service can respond to basic
network queries:

    {.pre .codeblock}
    nc -vt IP Address Port

Are you able to connect, send commands to the service-daemon and receive
responses? If so, that indicates that the program is accessible and your
issue may be due to the way the client is trying to connect or how the
service is configured to respond to the connection.

Once you've connected you may also need to send some information to the
service to get a response. You might send a GET request to a web server,
for example, or some other appropriate data before you'll receive a
response from the service.

### Closing the connection

To close the connection you can either press Ctrl + C or type the
service specific quit command.

As an example, you can close a connection to an FTP server with the
"QUIT" command:

    {.pre .codeblock}
    nc -vt 203.0.113.96 21
    Connection to 203.0.113.96 21 port [tcp/ftp] succeeded!
    220 (vsFTPd 2.0.5)
    QUIT
    221 Goodbye.

#### Commands rejected

If nc reports success but does not allow you to send any commands or you
get a response from the service-daemon reporting the service is not
available, you may have tcp wrappers providing access control.

An FTP service being blocked by tcp wrappers could look like this:

    {.pre .codeblock}
    nc -vt 203.0.113.96 21
    Connection to 203.0.113.96 21 port [tcp/ftp] succeeded!
    421 Service not available.

If the program is compatible with tcp wrappers it will have been
compiled with libwrap. To check if a program can make use of tcp
wrappers use the following command:

    {.pre .codeblock}
    ldd /path/to/binary | grep libwrap

In the following example the vsftpd program is checked for the libwrap
shared library file.

    {.pre .codeblock}
    ldd /usr/sbin/vsftpd | grep libwrap
    libwrap.so.0 => /lib64/libwrap.so.0 (0x00007f62c734a000)

If the program is not compatible with tcp wrappers grep will not return
anything.

#### Checking logs

Whenever a connection is blocked it should be logged. Try checking the
program's logs for relevant messages.

In the logs for vsftpd, found at /var/log/vsftpd.log, a blocked
connection due to tcp wrappers looks like this:

    {.pre .codeblock}
    Tue Jun  7 16:14:21 2011 [pid 28599] CONNECT: Client "203.0.113.43", "Connection refused: tcp_wrappers denial."

#### hosts.deny

The /etc/hosts.deny file is where rules that block connections are
defined. If you have troubke seeing an entry for your service in the
file try using grep to search for it.

Search the file for the program name

    {.pre .codeblock}
    sudo grep "vsftpd" /etc/hosts.deny
    vsftpd : ALL

Try commenting out any offending lines using a hash (\#). Changes to
this file take effect automatically - no services need to be restarted.

Note that tcp wrappers will allow a connection by default so if it is
the cause of the issue there must be an entry in /etc/hosts.deny for the
service. You could rename the file /etc/hosts.deny to temporarily remove
all your deny rules e.g. "sudo mv /etc/hosts.deny /etc/hosts.deny.old".
Please be aware that this will affect all applications that use tcp
wrappers.

### Further investigation

If you have completed all the tests described above without identifying
any issues that is a good indication that the service is running
normally on the server. The next step is to test the connectivity to the
server by using ping and traceroute utilities.
