---
permalink: troubleshoot-a-downed-windows-cloud-server/
audit_date: '2018-09-24'
title: Troubleshoot a downed Windows cloud server
type: article
created_date: '2018-09-13'
created_by: Shaun Crumpler
last_modified_date: '2018-09-24'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

If the website on your server is not loading, you can’t log in to your server, or you receive connection-related alerts for your server, your server is down. 

If you are a Managed Infrastructure customer, you can use the following troubleshooting steps to diagnose whether you can solve the issue or should escalate the issue to Rackspace support. This article also specifies helpful information to include when you create a support ticket in order to expedite Rackspace’s response.


### Check Rackspace system status

Before diagnosing a downed Linux cloud server yourself, visit the [Rackspace System Status](https://rackspace.service-now.com/system_status/) page and check for open issues that might
be impacting the service.

### Check support tickets

Check your open support tickets for information about any incidents that might be affecting the service. To check
your open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click
**Tickets > Ticket List** in the top navigation bar.

### Check the console of the downed cloud server

Use the following steps the check the downed server's console:

1. Connect to your cloud server and check the console. For steps on how to connect to the cloud server, see [Connect to a cloud server](/how-to/connect-to-a-cloud-server).  

   - If you are able to successfully connect using the **Remote Desktop** application, such as terminal or powershell, then skip to step 4.

   - If you cannot connect using a command line application, use the Emergency console in the [Cloud Control Panel](https://mycloud.rackspace.com/). Directions for finding the emergency console are found in steps 2 - 4.

2. In the Cloud Control Panel, click **Servers** > **Cloud Servers**.

3. Find the downed server in question and click the gear icon to the left of its name.

4. Select **Emergency Console**. This starts a browser based command line application.

5. Test the responsiveness of your server by clicking into the command line and pressing **Enter**.

  - If you see a response, the server is responsive. Skip to the **Ping/Nmap IP Address** section.

  - If the console is not responding or displays errors such as being out of system resources, go the the **Attempt Reboot** section.


### Attempt Reboot

If your server is not responding through the command line, a hard reboot might make the server responsive again.

1. Return to the server list in the Cloud Control panel and click the gear icon next to the downed server’s name. From the drop-down, select **Reboot Server**.
2. Review the message on the screen. After you're reviewed the message, click **Reboot Server**.
3. Repeat the steps in the **Check the console** section.  

   - If the server is responsive, move on to the **Ping/Nmap IP Address** troubleshooting step.

   - If the console is still not responsive, check for either the status page or any open support tickets about an incident that impacts the server in question. If you can't find any information regarding the status of your server, create a support ticket. Give a brief description of the troubleshooting steps you performed to expedite response time.

### Ping/Nmap IP Address

1. From your cloud server's **Details** page, go to the **Networks and Security Groups** section and then copy the Public IPv4 address.

2. In the PowerShell window, enter `ping <ipv4-address>`.  Take note if a response is received or not.

3. In the PowerShell window, run the command `nmap -sV -Pn` followed by the copied IP address. 

   **Note:** The nmap state can be misleading. `closed` means that the port is open but the service is not running. `filtered` means that the port is closed in the firewall. `open` means that the port is open and the service is running on the instance.

If these commands return a response, then the server is healthy and the issues are at the operating system level. If the account is a Managed Infrastructure account, Rackspace support will not be able to diagnose the problem further. If the account is on the Managed Operations service level, create a support ticket and provide the troubleshooting that has been completed.

If your server is not returning responses for any of the commands in the previous troubleshooting steps, open a support ticket and include all of the steps that you have attempted to expedite the issue.
