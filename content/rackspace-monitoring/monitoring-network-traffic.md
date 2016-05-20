---
permalink: monitoring-network-traffic/
audit_date:
title: Monitor Network Traffic
type: article
created_date: '2012-04-04'
created_by: Rackspace Support
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

### Basic essential network monitoring

This article discusses the following topics:

-   Monitoring in Linux
-   About The Tools](#aboutthetools
-   Ubuntu / Debian Installation
-   CentOS / RHEL Installation
-   Fedora (16+) Installation
-   openSUSE Installation
-   How to use VNstat
-   How to use IPtraf
-   How to use
    Tcpdump](/how-to/capturing-packets-with-tcpdump)

Basic administration principles state that you, the administrator,
should have a strong grasp on what your server is doing at all times.
One major metric that is sometimes missed is overall network activity.
The metrics gained by proper network monitoring can reveal your traffic
trends, which will lead to a better understanding of the trends for your
application, the load times on your system, and any activity that may
not have been accounted for. Monitoring is essential to a successful
infrastructure, and, without it, you will be forced to guess or
interpret logs, which may lead to a misunderstanding of the real traffic
going to, and leaving, your server.

**Note:** As an alternative to the setup described in this article,
Rackspace offers its [Cloud
Monitoring](http://www.rackspace.com/cloud/monitoring/) service at no
cost for use with Cloud Servers. For more information about this
flexible service, see [Getting Started with Cloud Monitoring](/how-to/cloud-monitoring).


### Monitoring in Linux

In the world of Linux, there are many open source solutions that can
accomplish the lofty goals of monitoring and logging "**Actual**"
traffic. Most of these free, Open Source tools can work with minimal
setup and achieve very high accuracy. Out of all the tools available, I
am partial to VNstat and IPtraf. Both of these can be found in most
repositories, have minimal dependencies, and work on ALL Linux systems.



### About the tools

**VNstat** : *[Learn More about VNstat](http://humdi.net/vnstat/)*

VNstat is a console-based network traffic monitor for Linux and BSD
that keeps a log of network traffic for the selected interface(s). It
uses the network interface statistics provided by the kernel as an
information source. This means that VNstat won't actually be sniffing
any traffic and also ensures light use of system resources. With
VNstat, you are able to keep a log of all incoming and outgoing traffic,
which will be logged by Minute, Hour, Day, Month, and Year.

**IPtraf** : *[Learn More about IPtraf](http://iptraf.seul.org/about.html)*

IPTraf is a console-based network statistics utility for Linux. It
gathers a variety of figures such as TCP connection packet and byte
counts, interface statistics and activity indicators, TCP/UDP traffic
breakdowns, and LAN station packet and byte counts.

### How to install these tools


### Ubuntu / Debian

*Here is how to install VNstat as well as IPtraf on a Ubuntu or Debian Slice.*

Both of these tools are readily available on a Debian or Ubuntu Server.

A quick search will yield these packages.

    apt-get update

    apt-cache search iptraf
    ## iptraf - Interactive Colorful IP LAN Monitor

    apt-cache search vnstat
    ## vnstat - console-based network traffic monitor

To do the installation of the tools on your server, simply execute this command.

    apt-get install iptraf vnstat

Lastly, we setup VNstat to begin monitoring the interfaces.

    # Public Interface
    vnstat -u -i eth0

    # Private Interface
    vnstat -u -i eth1


### CentOS / RHEL

*Here is how to install VNstat as well as IPtraf on a CentOS / RHEL
Slice.*

In the base repositories for CentOS and RHEL, IPtraf is easily
installed. However, VNstat is not not found in these repositories and
will either need to be installed via a third-party repository, or
compiled from source. In this instance, I choose to install from source,
because VNstat is a small package and has no real dependencies. At the time 
of this writing, VNstat 1.12 is the latest version available.

VNstat is a simple package to install by using the following commands.

**First** - Download and unpack the source.

    cd ~/
    wget http://humdi.net/vnstat/vnstat-1.12.tar.gz
    tar xzf vnstat-1.12.tar.gz
    cd ~/vnstat-1.12

**Second** - Now make sure that you have the two needed packages
installed, which are gcc and make, and then install vnstat.

    yum install gcc make
    make
    make install

**Third** - Now that the package is installed, we need to make it start,
and automatically restart on boot.

    cp ~/vnstat-1.12/examples/init.d/redhat/vnstat /etc/init.d/vnstat
    chmod +x /etc/init.d/vnstat
    /etc/init.d/vnstat start
    cd /etc/init.d/
    chkconfig --add vnstat
    chkconfig vnstat on
    cd ~/

**Fourth** - Lastly, we setup VNstat to begin monitoring the interfaces.

    # Public Interface
    vnstat -u -i eth0

    # Private Interface
    vnstat -u -i eth1

Here is the package that we will need to install on your server for IPtraf.

You can search for the package like this:

    yum search iptraf
    ## iptraf.x86_64 : A console-based network monitoring utility.

To install, here is the command :

    yum install iptraf.x86_64


### Fedora (16+)

*Here is how to install VNstat as well as IPtraf on a Fedora Slice.*

Both of the packages are readily available from the Fedora repositories.

A quick search will yield these packages.

    yum search iptraf
    ## iptraf.x86_64 : A console-based network monitoring utility

    yum search vnstat
    ## vnstat.x86_64 : Console-based network traffic monitor

To install the tools on your server, simply execute the following command.

    yum install iptraf vnstat

We need to setup VNstat to begin monitoring the interfaces.

    # Public Interface
    vnstat -u -i eth0

    # Private Interface
    vnstat -u -i eth1

Lastly, we create a symlink for legacy purposes.

    ln -s /usr/sbin/iptraf-ng /usr/sbin/iptraf


### openSUSE

*Here is how to install VNstat as well as IPtraf on a openSUSE Slice.*

Like CentOS and RHEL, IPtraf is easily installed in openSUSE. However,
VNstat is not not found in the repositories. It either needs to be
installed via a third-party repository, or compiled from source. In this
instance, I choose to install from source, because VNstat is a small package, 
easy to install, and has no real dependencies.

Here are the commands to install VNstat:

**First** - Download the source and unpack the source:

    cd ~/
    wget http://humdi.net/vnstat/vnstat-1.12.tar.gz
    tar xzf vnstat-1.12.tar.gz
    cd ~/vnstat-1.12

**Second** - Now make sure that you have the two needed packages
installed, which are 'gcc' and 'make', and then install vnstat.

    zypper ref
    zypper in gcc make
    make
    make install

**Third** - Now that the package is installed, we need to make it start,
and automatically restart, on boot.

    cp ~/vnstat-1.12/examples/init.d/redhat/vnstat /etc/init.d/vnstat
    chmod +x /etc/init.d/vnstat
    /etc/init.d/vnstat start
    cd /etc/init.d/
    chkconfig --add vnstat
    chkconfig vnstat on
    cd ~/

**Fourth** - Lastly, we setup VNstat to begin monitoring the interfaces.

    # Public Interface
    vnstat -u -i eth0

    # Private Interface
    vnstat -u -i eth1

Here is the package that we need to install on your server for IPtraf.

A quick Search for the package reveals :

    zypper se iptraf
    ## iptraf    | TCP/IP Network Monitor | srcpackage

To install iptraf, type the following command :

    zypper in iptraf

### How to use these tools


### Using VNstat

To learn more about VNstat, check out the [Manual Page for VNstat](http://linux.die.net/man/1/vnstat).

Once you have installed and set up VNstat on your system, you need to
allow for at least ONE hour. After that time frame, your database will
contain data and begin showing you metrics.

**Common VNstat Uses**

Snapshot : **vnstat**


                          rx      /      tx      /     total    /   estimated
     eth0:
           Apr '12     26.68 MiB  /  196.70 MiB  /  223.38 MiB  /    1.38 GiB
         yesterday      6.35 MiB  /   37.71 MiB  /   44.06 MiB
             today      4.73 MiB  /   34.66 MiB  /   39.39 MiB  /      52 MiB

 Hourly Report : **vnstat -h**



     eth0                                                                     17:02
      |            t  t                    t  t  t  t              t  t  t
      |      t     t  t                    t  t  t  t     t     t  t  t  t
      |      t  t rt rt    rt  t  t        t  t  t  t  t  t  t  t  t  t  t  t
     -+--------------------------------------------------------------------------->
      |  18 19 20 21 22 23 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17
     h  rx (KiB)   tx (KiB)      h  rx (KiB)   tx (KiB)      h  rx (KiB)   tx (KiB)
    18        157        607    02        143        888    10        150       1878
    19        266       1389    03        169        548    11        212       1229
    20        259        918    04         72        449    12        191       1904

 Daily Report : **vnstat -d**



     eth0  /  daily
     eth0  /  daily
             day         rx      |     tx      |    total    |   avg. rate
         ------------------------+-------------+-------------+---------------
          04/01/12      4.91 MiB |   43.77 MiB |   48.67 MiB |    4.61 kbit/s
          04/02/12      6.65 MiB |   46.65 MiB |   53.30 MiB |    5.05 kbit/s
          04/03/12      4.04 MiB |   33.92 MiB |   37.96 MiB |    3.60 kbit/s
          04/04/12      6.35 MiB |   37.71 MiB |   44.06 MiB |    4.18 kbit/s
          04/05/12      4.73 MiB |   34.66 MiB |   39.39 MiB |    5.26 kbit/s
         ------------------------+-------------+-------------+---------------
         estimated         5 MiB |      47 MiB |      52 MiB |

 Weekly Report : **vnstat -w**


     eth0  /  weekly
                          rx      |     tx      |    total    |   avg. rate
       ---------------------------+-------------+-------------+---------------
        last 7 days     36.62 MiB |  256.09 MiB |  292.71 MiB |    4.13 kbit/s
          last week     42.62 MiB |  237.17 MiB |  279.78 MiB |    3.79 kbit/s
       current week     21.79 MiB |  152.97 MiB |  174.75 MiB |    4.46 kbit/s
       ---------------------------+-------------+-------------+---------------
          estimated        39 MiB |     286 MiB |     325 MiB |

 Monthly Report : **vnstat -m**


     eth0  /  monthly
          month        rx      |     tx      |    total    |   avg. rate
        ------------------------+-------------+-------------+---------------
          Apr '12     26.68 MiB |  196.70 MiB |  223.38 MiB |    4.50 kbit/s
        ------------------------+-------------+-------------+---------------
        estimated       165 MiB |    1.22 GiB |    1.38 GiB |





### Using IPtraf :

You can use IPtraf as soon as it is installed. IPtraf watches traffic in real time.

To learn more about IPtraf, check out the [Manual Page for IPtraf](http://linux.die.net/man/8/iptraf).

**IPtraf Commands**

-   General Output : **iptraf -g**

    <img src="{% asset_path rackspace-monitoring/monitoring-network-traffic/IMAGE1.png %}" alt="" />

-   Detailed Information on a Select Interface : **iptraf -d iface**

    <img src="{% asset_path rackspace-monitoring/monitoring-network-traffic/IMAGE2.png %}" alt="" />

-   Semi-Graphical Interface : **iptraf**

    <img src="{% asset_path rackspace-monitoring/monitoring-network-traffic/IPtrafe-IMAGE3.jpg %}" alt="" />




### Conclusion

Now that you have installed these packages, you should have full network
monitoring in place. VNstat monitors the servers' internal and
external network interfaces for all sent and received traffic. 
IPtraf allows you to use a utility from the shell to
gauge network traffic in real time. These tools are invaluable and
should provide a lot more insight into your overall operations.
