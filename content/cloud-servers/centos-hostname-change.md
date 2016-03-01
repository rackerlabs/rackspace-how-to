---
node_id: 90
title: CentOS - Hostname change
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Kelly Holcomb
product: Cloud Servers
product_url: cloud-servers
---

By default, your server is started with the server's given name as the
hostname. Some software, such as cPanel, requires a valid Fully
Qualified Domain Name (FQDN) for the hostname to be used during their
licensing verification system. This article describes how to change a
server hostname in CentOS.

### Change a server hostname

1.  Using a text editor, open the **/etc/sysconfig/network** file.
2.  Modify the `HOSTNAME=` value to match your FQDN hostname.

        # sudo nano /etc/sysconfig/network
        HOSTNAME=myserver.domain.com

3.  For internal networking, change the host that is associated with the
    main IP address for your server, (found at **/etc/hosts**).

    ![hosts.png](http://cdn.cloudfiles.rackspacecloud.com/c42672/CentOS%20-hostname%20change/hosts.png)

4.  Run the `hostname` command. This command lets you change the
    hostname on the server that the command line remembers, but it does
    not actively update all programs that are running under the
    old hostname.

    ![hostname.png](http://cdn.cloudfiles.rackspacecloud.com/c42672/CentOS%20-hostname%20change/hostname.png)

5.  Restart networking on your server to ensure that changes will
    persist on restart.

        # /etc/init.d/network restart
