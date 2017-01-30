---
permalink: changing-dns-settings-on-linux/
audit_date: '2016-06-29'
title: Change DNS settings on Linux
type: article
created_date: '2011-07-20'
created_by: Jered Heeschen
last_modified_date: '2016-08-17'
last_modified_by: Kyle Laffoon
product: Cloud DNS
product_url: cloud-dns
---

You might need to change your server's DNS settings, either
because you find that they are misconfigured or because you want to use your
own. This article describes how to change your server's DNS settings.

### Add name servers to the configuration file

On Linux, the DNS servers that the system uses for name resolution are defined
in the **/etc/resolv.conf** file. That file should contain at least one
`nameserver` line. Each `nameserver` line defines a DNS server. The name
servers are prioritized in the order the system finds them
in the file. Use the IP addresses of the name servers when entering
them, because the system won't know what to do with domain names until
after it knows how to get to the DNS servers.

1. Open the **resolv.conf** file with an editor, such as `nano`, to make the
   necessary changes (if it doesn't exist already, this command creates the
   file):

    sudo nano /etc/resolv.conf

2. Add lines for the name servers that you want to use. The following table
   displays which name server IP addresses to use depending on which datacenter
   houses your cloud servers. The "Name server IP address" column shows the
   lines to add to the configuration file:

   | Data center | Name server IP address |
   |---|---|
   | Hong Kong (HKG) | nameserver 120.136.32.62 <br /> nameserver 120.136.32.63 |
   | Northern Virginia (IAD) | nameserver 69.20.0.164 <br /> nameserver 69.20.0.196 |
   | London (LON) | nameserver 83.138.151.80 <br /> nameserver 83.138.151.81 |
   | Chicago (ORD) | nameserver 173.203.4.8 <br /> nameserver 173.203.4.9 |
   | Dallas/Fort Worth (DFW) | nameserver 72.3.128.240 <br /> nameserver 72.3.128.241. |
   | Sydney (SYD) | nameserver 119.9.60.62 <br /> nameserver 119.9.60.63. |

3. Save the file.

4. To ensure that your new settings are working, `ping` the domain name:

    ping -c 3 rackspace.com

You should see a result similar to the following one:

    PING rackspace.com (173.203.44.122) 56(84) bytes of data.
    64 bytes from 173.203.44.122: icmp_req=1 ttl=249 time=25.3 ms
    64 bytes from 173.203.44.122: icmp_req=2 ttl=249 time=25.2 ms
    64 bytes from 173.203.44.122: icmp_req=3 ttl=249 time=25.2 ms

    --- rackspace.com ping statistics ---
    3 packets transmitted, 3 received, 0% packet loss, time 2002ms
    rtt min/avg/max/mdev = 25.236/25.292/25.392/0.147 ms

If you receive an `unknown host` message, double-check the IP addresses that
you set as your DNS servers.

#### Add same servers with IPv6 addresses

If you're using IPv6 on your server, you might need to add the IPv6
addresses of your name servers to the **resolv.conf** file. You can see if a DNS
server has an IPv6 address by performing the following steps:

1. Use `host` to get the name of the server:

       $ host 72.3.128.240
       240.128.3.72.in-addr.arpa domain name pointer cachens1.dfw1.rackspace.com.

2. Use the domain name you got back in another `host` lookup:

       $ host cachens1.dfw1.rackspace.com
       cachens1.dfw1.rackspace.com has address 72.3.128.240
       cachens1.dfw1.rackspace.com has IPv6 address 2001:4800:d::1

If an IPv6 address is returned, you can add that as another `nameserver`
line in the **resolv.conf** file, as follows:

    nameserver 2001:4800:d::1

Then test as previously shown, by using the `ping6` command instead of the
regular `ping` command to force the system to use IPv6.
