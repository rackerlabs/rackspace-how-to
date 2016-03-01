---
node_id: 1157
title: Changing DNS settings on Linux
type: article
created_date: '2011-07-20'
created_by: Jered Heeschen
last_modified_date: '2016-01-27'
last_modified_by: Ross Diaz
product: Cloud DNS
product_url: cloud-dns
---

### Manual DNS

There may be times you need to change your server's DNS settings, either
because you find they're misconfigured or because you want to use your
own. Fortunately there isn't a lot of work involved in changing the [DNS servers](http://www.rackspace.com/cloud/dns/), just a quick edit in the
right place.

### resolv.conf

On Linux the DNS servers the system uses for name resolution are defined
in the file:

    /etc/resolv.conf

It's spelled just like that, with no "e" at the end of "resolv".

In that file we'll want to have at least one `nameserver` line (two is
better, so we have a fallback). Each line defines a DNS server.

The name servers will be prioritized in the order the system finds them
in the file. Use the IP addresses of the name servers when entering
them, since the system won't know what to do with domain names until
after it knows how to get to the DNS servers.

Open **resolv.conf** with an editor like nano to make the necessary changes
(if it doesn't exist already this will create the file for us):

    sudo nano /etc/resolv.conf

#### Rackspace Cloud Hong Kong

If your Cloud Server is in the Hong Kong (HKG) datacenter you should
use:

    nameserver 120.136.32.63
    nameserver 120.136.32.62

#### Rackspace Cloud UK

If you're on Rackspace Cloud UK you can use our closest DNS servers by
making the contents of the **/etc/resolv.conf** file read:

    nameserver 83.138.151.80
    nameserver 83.138.151.81

#### Rackspace Cloud USA - ORD

If your Cloud Server is in the US Chicago (ORD) datacenter you should
use:

    nameserver 173.203.4.8
    nameserver 173.203.4.9

#### Rackspace Cloud USA - DFW

If your Cloud Server is in the US Dallas/Fort Worth (DFW) datacenter you
should use:

    nameserver 72.3.128.240
    nameserver 72.3.128.241

#### Rackspace Cloud AUS - SYD

If your Cloud Server is in the Sydney, Australia datacenter you should
use:

    nameserver 119.9.60.63
    nameserver 119.9.60.62

### A quick test

Once you have your DNS servers set, save the file. And you're done. No
reboot required.

The easiest way to make sure your new settings are good ones is to try
to `ping` a domain name:

    ping -c 3 rackspace.com

You should see a result like:

    PING rackspace.com (173.203.44.122) 56(84) bytes of data.
    64 bytes from 173.203.44.122: icmp_req=1 ttl=249 time=25.3 ms
    64 bytes from 173.203.44.122: icmp_req=2 ttl=249 time=25.2 ms
    64 bytes from 173.203.44.122: icmp_req=3 ttl=249 time=25.2 ms

    --- rackspace.com ping statistics ---
    3 packets transmitted, 3 received, 0% packet loss, time 2002ms
    rtt min/avg/max/mdev = 25.236/25.292/25.392/0.147 ms

If you get an `unknown host` message back you should double-check the IP
addresses you set as your DNS servers.

### IPv6

If you're using IPv6 on your server you may need to add the IPv6
addresses of your name servers to **resolv.conf**. You can see if a DNS
server has an IPv6 address with two steps.

First, use `host` to get the name of the server:

    $ host 72.3.128.240
    240.128.3.72.in-addr.arpa domain name pointer cachens1.dfw1.rackspace.com.

Then use the domain name you got back in another `host` lookup:

    $ host cachens1.dfw1.rackspace.com
    cachens1.dfw1.rackspace.com has address 72.3.128.240
    cachens1.dfw1.rackspace.com has IPv6 address 2001:4800:d::1

If an IPv6 address is returned you can add that as another `nameserver`
line in **resolv.conf**, as in:

    nameserver 2001:4800:d::1

Then test as above, using the `ping6` command instead of the regular
`ping` command to force the system to use IPv6.

### Summary

It's that simple - change or add those name servers and once the
settings are saved the system will use them right away. Make sure the
changes take with a quick ping to test it and you'll be done.
