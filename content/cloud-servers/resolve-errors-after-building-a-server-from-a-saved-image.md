---
permalink: resolve-errors-after-building-a-server-from-a-saved-image/
audit_date: '2019-01-18'
title: Resolve errors after building a server from a saved image
type: article
created_date: '2019-02-19'
created_by: Rackspace Community
last_modified_date: '2019-02-19'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to resolve errors that might occur when you build a
server from a saved image. Most of these errors occur when startup scripts are
not properly configured.

The services that cause these errors are xe-linux-distribution and
nova-agent. The article does not discuss these services in detail, but does
show you how you how to configure these services on startup.

Because these errors are more prominent on Debian&reg;-based servers, the
example troubleshoots an Ubuntu&reg; 13.10 server. The instructions also work
on most other Linux&reg; distributions.

Use the following steps to troubleshoot errors that occur after you build a
server from a saved image:

1. Remove the new server that is experiencing issues and log in to the source
   server by using Secure Shell (SSH). The source server is where the original
   image was created.

2. Run the following command to display the current order of the server's
   startup processes:

       ls -al /etc/rc$(runlevel | cut -d " " -f 2).d/

   The output is similar to the following image:

   <img src="{% asset_path cloud-servers/resolve-errors-after-building-a-server-from-a-saved-image/picture1.png %}" />

   Because this is a new server, nova-agent (`S20nova-agent` in blue in the
   image, or s20) is set to start immediately after xe-linux-distribution
   (`S14xe-linux-distribution` in the image, or s14). However, if you
   install certain applications, the installation might reorder the startup
   processes and place another service in between S14 and S20. If this
   reordering occurs, nova-agent does not start immediately after
   xe-linux-distribution. This reordering is what causes the error.

3. Move the run levels for these services so that they start up consecutively
   and are the first services in the `init.d` startup process. The following
   commands move the xe-linux-distribution to S01 and nova-agent to S02:

       cd /etc/rc$(runlevel | cut -d " " -f 2).d/
       mv S14xe-linux-distribution S01xe-linux-distribution && mv S20nova-agent S02nova-agent

   Depending on your run levels (which determine how the system starts),
   the preceding command varies. Ensure that you use the appropriate numbers
   that display in your output.

4. Run the `ls -l` command to verify that xe-linux-distribution is set to `S01`
   and nova-agent is set to `S02`.

5. After you complete these steps, recreate your server image, and then create
  the server based on the new, saved image.
