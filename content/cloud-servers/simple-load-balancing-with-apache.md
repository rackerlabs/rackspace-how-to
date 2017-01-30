---
permalink: simple-load-balancing-with-apache/
audit_date:
title: Simple load balancing with Apache
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Kelly Holcomb
product: Cloud Servers
product_url: cloud-servers
---

**Note:** This article was written before the introduction of [Cloud
Load
Balancers](/how-to/cloud-load-balancers),
which is our recommended solution for load balancing. Because customers
might still want to try this procedure, it is available for legacy
support purposes.

This article describes how to create a simple software [load
balancer](http://www.rackspace.com/cloud/load-balancing/) by using a
[cloud server](http://www.rackspace.com/cloud/servers/).

This article uses Apache as the load balancer in conjunction with the
Apache module `mod_proxy` and `mod_proxy_balancer`. Both are available
through CentOS, and this article uses that as the base installation.

The main point of this articles is that you can use cloud servers to
scale horizontally. This is when you need horizontal expansion, adding
drone servers behind a smart host each working a piece of workload.

### Prerequisites

You need to have the following hardware and software in place before you
begin.

#### Hardware

You are going to use a total of three servers to start, but you can use
this as a model to scale horizontally.

-   One cloud server to be used as the load balancer
-   Two cloud servers to be used as dumb webheads



#### Software

The software for all three servers will be the same; they will be
running the same packages. You need to add only two software groups.
Perform the following steps.

1.  Update your system.

        # yum update

2.  Install Apache by using the CentOS `groupinstall` command.

        # yum groupinstall "Web Server"

3.  Optionally, install a text-based web browser in case you ever need
    to check that a particular webhead is displaying the page it is
    supposed to behind the load balancer.

        # yum groupinstall "Text-based Internet"

### Server configuration

Configure the servers as two webheads and one load balancer.



#### Web servers

Because the webheads are really just drones, they don't need any special
configurations. Just create a file called **index.html** in
**/var/www/html/index.html**. In this file, you can put any
distinguishing characteristics you want. For example, you could put "It
works you looking at WebHead \#" where \# is the numerical identifier of
that particular webhead.

#### Load balancer

This sections walks through each step and then brings it together at the
end, so you know what the end product should be. Place all of the
configurations that you define at the bottom of the
**/etc/httpd/conf/httpd.conf** file in a standard virtual host.

#### Unwanted requests

Turn off ProxyRequests to avoid any unwanted traffic.

    ProxyRequests off

#### Balance webheads

In this part of the virtual host, name the webheads and declare how you
will be balancing. The `BalanceMember` directive is how you declare the
webheads. You can add as many as you like, using these as templates. The
`ProxySet` directive declares how you want to balance. This example uses
a "byrequest" balancing algorithm, which is the same as a round robin,
so for each new request you get a new webhead. The order is sequential.
(Although better and smarter algorithms exist, this one is easy to
configure and you don't need to know networking theory.) All of this is
wrapped in `<Proxy>` tags, which is how Apache knows to send it to
`mod_proxy`. The `balancer://mycluster` identifier is only an
identifier; you could call it what you want as long as you use the
`balancer://` prefix.

**Note:** You will want to contact your webheads from the load balancer
by using their private IP addresses. Doing so minimizes your bandwidth
charges by keeping all communication between servers on the ServiceNet
network, where bandwidth is free.

    <Proxy balancer://mycluster>
        # WebHead1
        BalancerMember http://10.x.x.x:80

        # WebHead2
        BalancerMember http://10.x.x.x:80

        ProxySet lbmethod=byrequests

    </Proxy>

#### Balance-manager (optional)

The `balance-manager` is a tool packaged with the `mod_proxy_balancer`
tool, and it enables you to make configurations from a GUI tool through
the web browser. You can view it at
<http://domain.com/balancer-manager>. Consider that any changes made by
this tool end after you restart Apache.

    <Location /balancer-manager>

       SetHandler balancer-manager
    </Location>


#### ProxyPass

This is the last part of the configuration, and adds the situations that
will need to be proxied. You don't want to proxy the `balancer-manager`,
but you do want to proxy everything else.

       ProxyPass /balancer-manager !
       ProxyPass / balancer://mycluster/

### Summary

If you have all this configured in your **httpd.conf** file on your load
balancer cloud server, and you start Apache, you should be able to view
your domain name that is properly pointed to your load balancer. When
you refresh, it should hop between your two webheads, saying "It works
you looking at WebHead 1" or "It works you looking at WebHead 2". You
are now balancing.

The following code combines all the things that you've learned into a
helpful packaged VirtualHost. Just substitute all the necessary values
that are specific to your configuration, like the domain name and the IP
addresses to your webheads. Also, some security additions are explained
in the comments. Everything is commented so you don't have to refer back
to this article to make changes later.

**Note:** The preceding example is formatted for Apache 2.4. If you are
using 2.2, replace `Require all granted` with
`Order Deny,Allow | Deny from none | Allow from all`, and then replace
`Require host example.org` with
`Order deny,allow | Deny from all | Allow from example.org`.

    <VirtualHost *:80>
            ProxyRequests off

            ServerName domain.com

            <Proxy balancer://mycluster>
                    # WebHead1
                    BalancerMember http://10.176.42.144:80
                    # WebHead2
                    BalancerMember http://10.176.42.148:80

                    # Security "technically we aren't blocking
                    # anyone but this is the place to make
                    # those changes.
                    Require all granted
                    # In this example all requests are allowed.

                    # Load Balancer Settings
                    # We will be configuring a simple Round
                    # Robin style load balancer.  This means
                    # that all webheads take an equal share of
                    # of the load.
                    ProxySet lbmethod=byrequests

            </Proxy>

            # balancer-manager
            # This tool is built into the mod_proxy_balancer
            # module and will allow you to do some simple
            # modifications to the balanced group via a gui
            # web interface.
            <Location /balancer-manager>
                    SetHandler balancer-manager

                    # I recommend locking this one down to your
                    # your office
                    Require host example.org

            </Location>

            # Point of Balance
            # This setting will allow to explicitly name the
            # the location in the site that we want to be
            # balanced, in this example we will balance "/"
            # or everything in the site.
            ProxyPass /balancer-manager !
            ProxyPass / balancer://mycluster/

    </VirtualHost>
