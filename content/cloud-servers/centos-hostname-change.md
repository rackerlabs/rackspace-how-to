---
permalink: centos-hostname-change/
audit_date: 2016-06-07
title: Change a server's hostname in CentOS
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2016-06-08'
last_modified_by: Renee Rendon
product: Cloud Servers
product_url: cloud-servers
---

By default, your server is started with the server's given name as the
hostname. Some software, such as cPanel, requires a valid Fully
Qualified Domain Name (FQDN) for the hostname to be used during their
licensing verification system. This article describes how to change a
server hostname in CentOS.

### Change a server's hostname

1.  Using a text editor, open the server's **/etc/sysconfig/network** file.

         # sudo nano /etc/sysconfig/network

2.  Modify the `HOSTNAME=` value to match your FQDN hostname.

         HOSTNAME=myserver.domain.com

3.  For internal networking, change the host that is associated with the
    main IP address for your server (found at **/etc/hosts**).

         127.0.0.1      localhost localhost.localdomain
    
         123.45.67.89   hostname.domain.com   hostname
    
         ~
    
         ~
    
         ~
    
         ~
    
         -- INSERT --                         2,43-57    ALL

4.  Run the `hostname` command. This command lets you change the
    hostname on the server that the command line remembers, but it does
    not actively update all programs that are running under the
    old hostname.

         [root@defiant ~]# hostname hostname.domain.com
    
         [root@defiant ~]# hostname
    
         hostname.domain.com
    
         [root@defiant ~]#

5.  Restart networking on your server to ensure that changes will
    persist on restart.

         # /etc/init.d/network restart
