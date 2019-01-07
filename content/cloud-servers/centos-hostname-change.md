---
permalink: centos-hostname-change/
audit_date: '2019-01-07'
title: Change a server's hostname in CentOS
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2019-01-07'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

By default, your server is started with the server's given name as the
hostname. Some software such as cPanel&reg; requires a valid fully
qualified domain name (FQDN) for the hostname to be used during their
licensing verification system. This article describes how to change a
server hostname in CentOS&reg;.

### Change a server's hostname

1.  Using a text editor, open the server's **/etc/sysconfig/network** file.
    The following example shows how to open this file in the GNU nano text
    editor:

         # sudo nano /etc/sysconfig/network

2.  Modify the `HOSTNAME=` value to match your FQDN hostname,
    as shown in the following example:

         HOSTNAME=myserver.domain.com

3.  Open the file at /etc/hosts. To update the information for internal
    networking, change the host that is associated with the main IP address
    for your server, as shown in the following example:

         127.0.0.1      localhost localhost.localdomain

         123.45.67.89   hostname.domain.com   hostname

         ~

         ~

         ~

         ~

         -- INSERT --                         2,43-57    ALL

4.  Run the `hostname` command. This command enables you to change the
    hostname on the server that the command line remembers, but it does
    not actively update all of the programs that are running under the
    old hostname. The following code provides an example:

         [root@defiant ~]# hostnamectl set-hostname hostname.domain.com

         [root@defiant ~]# hostname

         hostname.domain.com

         [root@defiant ~]#

5.  Use the following command to restart networking on your server to ensure
    that changes persist on restart:

         # /etc/init.d/network restart

<script type="application/ld+json">
 {
 "@context": "http://schema.org/",
 "@type": "HowTo",
     "name":"Change a server's hostname in CentOS",
 	  "description": "This article describes how to change a server hostname in CentOS.",
 	  "step": [
 	   	{
 	   	"@type": "HowToSection",
 	   	"name": "Change a server's hostname",
 	       "position": "1",
          "itemListElement": [
   	     		{
   	          "@type": "HowToStep",
   	          "position": "1",
   	     		  "text": "Using a text editor, open the server’s /etc/sysconfig/network file."
   	     		},{
   	          "@type": "HowToStep",
   	          "position": "2",
   	          "text": "Modify the HOSTNAME= value to match your FQDN hostname."
   	     		},{
   	          "@type": "HowToStep",
   	          "position": "3",
   	          "text": "Open the file at /etc/hosts. To update the information for internal networking, change the host that is associated with the main IP address for your server."
   	          }]
	    }]}
	</script>
