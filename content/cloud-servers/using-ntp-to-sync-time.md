---
permalink: using-ntp-to-sync-time/
audit_date:
title: Use NTP to Sync Time
type: article
created_date: '2013-04-15'
created_by: Jered Heeschen
last_modified_date: '2013-04-18'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

Keeping your system's date and time accurate is easy to do using NTP.

Having an accurate clock on your server ensures that time stamps in
emails sent from your machine are correct. An accurate clock is
especially helpful when you need to look at the logs from a particular
time of day.

If you don't occasionally set the
system clock yourself, the time will slowly drift away from a perfectly
accurate setting. That's when the network time protocol (NTP) is
useful.

### What is NTP?

NTP lets you automatically sync your system time with a remote server.
The NTP can be used to update the clock on a machine with a remote
server. This keeps your machine's time accurate by syncing with servers
that are known to have accurate times. NTP also keeps the clocks on
several machines in sync, thus making it easier to match log entries for
an event across multiple servers.

It's easy to set up an NTP server to regularly adjust your machine's
clock. It's also possible to make it a bit more complicated if you need
your clock accurate down to the millisecond instead of just to the
second.

### Install

The first thing to do is install the NTP server. Grab the package by
running:

#### Ubuntu / Debian:

    sudo aptitude update
    sudo aptitude install ntp

#### CentOS:

    sudo yum install ntp

Once installed, you can ensure the service will run at boot time by
running:

    sudo /sbin/chkconfig ntpd on

#### Fedora / RHEL:

    sudo yum install ntp

Once installed, you can ensure the service will run at boot time by
running:

    sudo chkconfig ntpd on

#### Arch:

    sudo pacman -Sy ntp

Once installed, you can ensure the service will run at boot time by
adding "ntpd" to the "DAEMONS" value in the rc.conf file here:

    /etc/rc.conf

#### Gentoo:

    sudo emerge -sync
    sudo emerge ntp

Once installed, you can ensure the service will run at boot time by
running:

    sudo ln -s /etc/init.d/ntpd /etc/runlevels/default

### Start the service

To make sure the NTP service starts after installing it, run:

#### Ubuntu / Debian / CentOS / RHEL / Gentoo:

    sudo /etc/init.d/ntp start

#### Fedora:

    sudo /etc/init.d/ntpd start

#### Arch:

    sudo /etc/rc.d/ntpd start

As is usual for Linux services, you can stop or restart the NTP service
by running the above command with

    stop

or

    restart

sent as the argument instead of start.

### Quickstart

Most people just want to get NTP running and don't need to sync their
clock to pinpoint, millisecond-level accuracy. In this case, nothing
more needs to be done. When you installed NTP, it set you up with
default servers to sync with. NTP will now sync your clock
automatically. Congratulations on a job well done!

### The .ntpconf file

If you want to use NTP to sync several of your own machines, or if you
want to choose NTP servers other than the defaults, the NTP
configuration file can be found at

    /etc/ntp.conf

There are a few settings that can be changed, but the only settings of
interest to most users include any server entries. Use the default
settings for your specific Linux distribution.

With more than one server entry, your NTP server will query all servers
and select a time that the majority of the polled servers agree on. By
using three or more servers, your clock will be more accurate than if it
uses only one.

Adding the iBurst option after the server address will speed up the NTP
time sync slightly. While this is helpful, it isn't essential.

The dynamic option tells NTP that it can try a configured server again
later if it's unavailable at some point. The dynamic option is useful
when NTP is running on a machine that doesn't always have access to the
Internet. It is not necessary on a machine with a dedicated connection.

### NTP security

Protect yourself against NTP server attacks by adding `disable monitor` to
your **/etc/ntp.conf** file. Disabling monitoring will prevent unwanted remote
queries that use commands from older versions of NTP, such as *monlist*.

### Syncing multiple servers

If you have more than one machine to sync, it is best to designate one
as the master NTP server. Set up the master server to connect to an
outside NTP server, then have the other machines sync to the master.
This setup reduces the number of outgoing connections and guarantees
that all of your machines have their time set to the same value. This
configuration requires changes to the server settings in the ntp.conf
files on each machine.

Set up any external servers you want to use on the master machine. For
example, if you want to use the NTP pool servers you can set the server values in the master
ntp.conf file to:

    server 0.pool.ntp.org iburst
    server 1.pool.ntp.org iburst
    server 2.pool.ntp.org iburst
    server 3.pool.ntp.org iburst

Point the ntp.conf to your master server on every other machine for
which you want to sync the time. For example, if your master server is
"main.example.com," you would alter the ntp.conf files on the secondary
machines so that the server entries are as follows:

    server main.example.com iburst

After setting the server parameters and ensuring that the iptables don't
block connections to your main NTP server, restart the NTP services on
each machine to get them syncing.

#### Adjusting iptables

NTP uses UDP port 123 to conduct its business, either connecting out to
another NTP server or accepting incoming connections. If you have
iptables filtering incoming traffic on the main NTP server in your
cluster, then you'll need to open port 123 to UDP traffic to allow the
other servers to connect to it. You can open port 123 for UDP traffic
with the following iptables arguments:

    -I INPUT -p udp --dport 123 -j ACCEPT
    -I OUTPUT -p udp --sport 123 -j ACCEPT

### Choosing an NTP server

When syncing one or more machines via NTP, you'll want at least one of
them to set their time from a reliable external server. There are many
public servers out there that are either synced directly from an atomic
clock (guaranteeing an absolutely accurate time), or are synced from
another server that syncs to an atomic clock.

#### Public NTP server lists

The best source for lists of public NTP servers is the [NTP Servers
WebHome](http://support.ntp.org/bin/view/Servers/WebHome) at the main
NTP site. At the site is a description of the servers available, and in
the sidebar are links to three levels of NTP servers: Primary,
secondary, and pool.

<img src="{% asset_path cloud-servers/using-ntp-to-sync-time/usingntp_0.png %}" width="183" height="249" />

Deciding what type of server to sync from will depend on how accurate
you need your servers to be.

#### NTP pool servers

For most users, the pool servers are the best choice. Pool servers are
machines that have volunteered to make their NTP server available to the
public. They typically sync from a secondary NTP server so their time is
accurate, but not necessarily accurate to the nearest millisecond.

Most users don't need their machine time accurate to the nearest
millisecond; they just want to know what time it is. Use the pool
servers unless you need pinpoint accuracy.

Using the NTP pool servers is as easy as setting the server entries in
your ntp.conf file to:

    server 0.pool.ntp.org iburst
    server 1.pool.ntp.org iburst
    server 2.pool.ntp.org iburst
    server 3.pool.ntp.org iburst

To ensure that you only connect to pool servers in your own country or
region, visit the [pool servers
page](http://support.ntp.org/bin/view/Servers/NTPPoolServers) for more
specific addresses. For most people, the above entries will be more than
sufficient. Those addresses rotate among a huge list of volunteer NTP
servers worldwide so the load on any one machine never gets too great.

If you want to contribute to the NTP pool once you've set up your NTP
server, get details on how to do so from the [pool
website](http://www.pool.ntp.org/en/join.html).

#### Primary and secondary servers

The other two tiers of NTP servers are primary and secondary servers. A
primary server is one that gets its time directly from an atomic clock
(or from GPS satellites, which use atomic clocks). Atomic clocks are
expensive so there aren't many primary servers. You don't have to use a
primary server unless you're looking for extreme scientific accuracy.

A secondary server usually gets its time from a primary server. If you
want accuracy down to the millisecond level, having three secondary
servers in your ntp.conf will work well.

You can see what public servers are available in either tier by
selecting either list from the [NTP Servers
WebHome](http://support.ntp.org/bin/view/Servers/WebHome). Before
selecting and using a server, check the details for that server as
follows:

-   **ISO:** The ISO column lists the country of origin of that
    particular server.
-   **AccessPolicy:** The AccessPolicy field tells you what the access
    policy is for that server. **Open Access** means the server can be
    used by the public, subject to any notification requirements the
    server has.
-   **Notify:** The Notify field for secondary servers lists the
    preferences of that server's administrator regarding whether or not
    they be notified before you sync with their NTP server. Admins who
    want to be notified are usually trying to manage the traffic to
    their server, so be sure and respect their wishes
    regarding notification. Note that primary servers are always
    considered as requesting notification before use.
-   **Service Area:** If you've selected a primary or secondary server
    you want to use, click its hostname in the list to view further
    details for that server. Among the details listed is the
    **ServiceArea** field that describes the geographic or demographic
    group they intend to serve. If that field is **Public** then you do
    not have to be in a particular region to use the server. If they
    list a more specific service area, be sure to respect the server
    administrator's wishes in that regard.

### Testing with ntpdate

Before using an external NTP server to sync your time you should make
sure you can actually connect to the server from your machine.
Fortunately there's a tool for that included with the NTP server called
**ntpdate**.

The ntpdate command will sync your clock with an NTP server. It's
similar to what the NTP server does on a regular basis. The ntpd program
is a separate package on Ubuntu and Debian. The other distributions
install ntpdate at the time of ntpd installation. To use ntpdate, Ubuntu
and Debian users must first install it.

    sudo aptitude install ntpdate

Set your clock to sync at times you specify by using cron to run
ntpdate. Otherwise, run the NTP server as it uses less bandwidth and
keeps time more accurately by tracking your clock's drift over time and
adjusting accordingly. Use ntpdate for testing purposes only.

The ntpdate command will not run when the NTP server is running. If you
run ntpdate and get a response like "the NTP socket is in use," this
means your NTP server is running. Stop it with the appropriate command
for your distribution:

#### Ubuntu / Debian

    sudo /etc/init.d/ntp stop

#### CentOS / Fedora / RHEL / Gentoo

    sudo /etc/init.d/ntpd stop

#### Arch

    sudo /etc/r.d/ntpd stop

You can now run ntpdate with the server you want to sync against as an
argument. For example, to tell ntpdate to try and sync with
"pool.ntp.org", run:

    sudo ntpdate pool.ntp.org

When you're finished testing, remember to restart NTP:

#### Ubuntu / Debian

    sudo /etc/init.d/ntp start

#### CentOS / Fedora / RHEL / Gentoo

    sudo /etc/init.d/ntpd start

#### Arch

    sudo /etc/rc.d/ntpd start

### Summary

Fortunately, NTP time syncing is pretty easy to do. Once you've set the
time servers and started the NTP service, it will do its work quietly in
the background.

If NTP has any problems it will log them to the system log, which you
should be checking regularly anyway.

For more details on setting up an NTP server and what options are
available, visit the [NTP documentation
site](http://support.ntp.org/bin/view/Support/WebHome). If you want to
know more about how NTP works, go to the main [NTP web
site](http://www.ntp.org/) and all will be revealed.
