---
permalink: cloud-server-error-or-stuck-after-build-from-a-saved-image
audit_date:
title: Cloud Server Error or Stuck After Build from a Saved Image
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This article will go over resolving issues when building a server from a saved image. A majority of the time, this issue is caused startup scripts that aren't configured properly. The services that cause these issues are xe-linux-distribution and nova-agent. We will not be covering these services in detail but we will discuss how these services should be configured on boot. Since this issue is more prominent on Debian based servers, we will be performing these steps on an Ubuntu 13.10 server. The process will also work on most other Linux Distros as well.

1. Remove the new server that's encountering issues and log into the source server via SSH. The source server is where the original image was created.

2. Run the following command. This will display the current order of the server's startup processes.
ls -al /etc/rc$(runlevel | cut -d " " -f 2).d/
The command should yield an output similar to the pic displayed below. Since this is a brand new server, nova-agent (S20) is set to start immediately after xe-linux-distribution (S14). After installing certain applications, however, this may result in the startup processes getting reordered and a service may get placed in between S14 and S20. If this occurs, nova-agent will not start immediately after xe-linux-distribution and this is where the conflict occurs.
If nova-agent is already listed immediately after xe-linux-distribution, feel free to contact a member of support as there may be another cause for the issue.

3. Since xe-linux-distribution is currently set to S14 and nova-agent is set to S20 in the startup scripts, it would be best practice to move these services' runlevels so that they start up consecutively and are the first services in the init.d boot process. The below commands will move xe-linux-distribution to S01 and nova-agent to S02. 
cd /etc/rc$(runlevel | cut -d " " -f 2).d/
mv S14xe-linux-distribution S01xe-linux-distribution && mv S20nova-agent S02nova-agent
Depending on your runlevels, the above command will vary. Make sure to use the appropriate numbers listed on your output.

4. Type in "ls -l" to ensure that xe-linux-distribution is set to S01 andnova-agent is properly set to S02, as shown below.

5. Once you have completed these steps, create/recreate your Server Image and then create the server based on the new Saved Image. If the issue persists, feel free to contact support or create a ticket for further evaluation.
