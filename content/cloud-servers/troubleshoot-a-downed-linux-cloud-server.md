---
permalink: troubleshoot-a-downed-linux-cloud-server/
audit_date:
title: Troubleshoot a downed Linux cloud server
type: article
created_date: '2018-08-03'
created_by: Shaun Crumpler
last_modified_date:
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article is intended to help customers with issues were they are no able to connect to a Linux cloud server due to the server being down. Signs of downed server can include the the site on the server not loading, not being able to log in to the server, and receiving connection related alerts to the server.


Specifically, the information in this article empowers Managed Infrastrucutre customers to diagnose if the issue the server can be solved by you, or if you should escalate the issue the Rackspace support. It also specifies helpful information to include what you create a support ticket in order to expediate Rackspace's response.


### Check Rackspace system status

Before diagnosing a downed Linux cloud server yourself, visit the [Rackspace System Status](https://rackspace.service-now.com/system_status/) page and check for open issues that might
be impacting the service.

### Check support tickets

Check your open support tickets for information about any incidents that might be affecting the service. To check
your open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click
**Tickets > Ticket List** in the top navigation bar.

### Check the console of the downed Linux cloud server

1. Connect to your cloud server and check the console. For steps on how to connect to the cloud server, see [Connect to a cloud server](/how-to/connect-to-a-cloud-server).  

   - If you are able to successfully connect using the command line application, such as terminal or powershell, then skip to step 5.

   - If you can not connect using a command line application, use the Emergency console in [Cloud Control Panel](https://mycloud.rackspace.com/). Directions for finding the emergency console are found in steps 2 - 4.

2. In the Cloud Control Panel, click **Servers** > **Cloud Servers**.

3. Find the downed server in question and click the gear icon to the left of its name.

4. Select **Emergency Console**. This will bring a command line application.

4. Test the responsiveness of your server by clicking into the command line and pressing **Enter**.

  - If you see a response, the server is responsive. Skip to the **Ping/Nmap IP Address** section.
  <image 4>

  - If the console is not responding or is displays errors such as being out of system resources, go the the **Attempt Reboot** section.
  <image 5>

### Attempt Reboot

If your server is not responding through the command line, a hard reboot might make the server responsive again.

1. Return to the server list in the Cloud Control panel and click the gear icon next to the downed server’s name. From the drop-down, select **Reboot Server** option.


2. Review the message on the screen. After you're reviewed the message, click **Reboot Server**.


3. Repeat the steps in the **Check the console** section.  

   - If the server is responsive, move on to the **Ping/Nmap IP Address** troubleshooting step.

   - If the console is still not responsive, check for either the status page or any open support tickets about an incident that impacts the server in question. If you can't find any information regarding the status of your server, create a support ticket. Give a brief description of the troubleshooting steps you performed to expedite response time.

### Ping/Nmap IP Address

1. From your cloud server's details page, go to the “Networks and Security Groups” section and then copy the Public IPv4 address.

2. In your command line application or console, enter `ping <ipv4-addresss>`.  Take note if a response is received or not.

3. In a terminal window, run the command `nmap -sV -Pn` followed by the copied IP address. Please note that the nmap `state` can be misleading. `closed` means that the port is open but the service is not running. `filtered` means that the port is closed in the firewall. `open` means that the port is open and the service is running on the instance.

4. If these commands return a response, then the server is healthy and the issues are at the operating system level. Rackspace support will not be able to diagnose the problem further on Managed Infrastructure accounts. If the account is on the Managed Operations service level, create a support ticket and provide the troubleshooting that has been completed.

   If these troubleshooting steps have been followed but the commands are not returning responses, contact a member of the Rackspace Support team via a ticket and include all of the troubleshooting steps that have been followed to expedite the issue.
