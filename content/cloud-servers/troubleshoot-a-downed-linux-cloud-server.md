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

This article is meant to assist with issues in which customers are not able to connect to servers due to the server being down, the site on the server not loading, not being able to login to the server, and receiving many alerts for the server. 


As Managed Infrastructure customers administer the servers on their end, this article intends to assist in diagnosing if the server is experiencing an issue that should be remedied from the customer side, or if the issue is something that should be escalated to a member of Rackspace support, additionally pointing out helpful pieces of information that can be included when creating a ticket to receive an expedited response.

**Before starting the process below, check status.rackspace.com for open issues that could be impacting your server instance. Also, check current support tickets to assure that there is not an incident that is causing the lack of accessibility of the server. In many cases, a customer's server is inaccessible due to issues on the host machine, so if there is an open support ticket, it means that Rackspace Support is working on the issue and that ticket will be updated as progress is made. If there is no open support ticket about the server in question, proceed with the troubleshooting steps below.**

1. Check the console of the server in question. For the steps on how to connect to the cloud server, see https://support.rackspace.com/how-to/connect-to-a-cloud-server.  If able to successfully connect via a terminal, then skip to step 4. If unable to connect to a terminal, then the Emergency Console can be used. To get to the Emergency Console option, first click the “Rackspace Cloud” option at the top of the Cloud Control panel (located after logging in to mycloud.rackspace.com
<image 1>
2. Click on the “Servers” option in the dashboard, and then click “Cloud Servers” from the drop-down box:
<image 2>
3. From the list of servers that populates, find the server in question and click the gear icon to the left of its name. From the drop-down menu, choose the “Emergency Console” option:
<image 3>
4. The terminal screen should now be viewable responsiveness can be tested by clicking in the terminal and pressing “Enter” on your keyboard a few times. If you are seeing a command prompt and the server is responding to your entries then the server is responsive and you should now move on to the "Ping/Nmap IP Address" troubleshooting step:
<image 4>
5. If the console is not responding to entries, or is displaying errors such as being out of system resources, move on to the "Attempt Reboot" troubleshooting step:
<image 5>

### Attempt Reboot

1. If the console is not responding, it is likely that a hard reboot can remedy the issue and make the console responsive again.  To reboot the server, return to the server list in the Cloud Control panel and click the gear icon next to the server’s name. From the drop-down, choose the "Reboot Server" option:
<image 6>
2. A message will present itself that explains what the Hard Reboot will actually do to the server. After reviewing, click “Reboot Server”:
<image 7>
3. Check the console again as with the previous troubleshooting step.  If the console is responsive, move on to the "Ping/Nmap IP Address" troubleshooting step. If the console is still not responsive, check for open tickets about an incident that impacts the server in question. If there is no ticket with an update as to the server being impacted, contact a member of the Rackspace support team and be sure to explain the troubleshooting steps that have been completed as to expedite the process.

### Ping/Nmap IP Address

1. From the cloud server details page, scroll to the “Networks and Security Groups” section and then copy the Public IPv4 address:
<image 8>
2. In a terminal window, run a ping command followed by the copied IP address.  Take note if a response is received or not:
<image 9>
3. In a terminal window, run the command "nmap -sV -Pn" followed by the copied IP address. Please note that the nmap "state" can be misleading by its name. "closed" means that the port is open but the service is not running, "filtered" means that the port is closed in the firewall, and "open" means that the port is open and the service is running on the instance:
<image 10>
4. If these commands return a response, then the server is healthy and the issues are at the operating system level and Rackspace support would not be able to diagnose the problem further on Managed Infrastructure accounts. If the account is a Managed Operations account, please feel free to create a support ticket and provide the troubleshooting that has been completed.

If these troubleshooting steps have been followed but the commands are not returning responses, contact a member of the Rackspace Support team via a ticket and include all of the troubleshooting steps that have been followed to expedite the issue.
