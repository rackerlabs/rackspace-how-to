---
permalink: Cloud-Load-Balancer-Troubleshooting/
audit_date:
title: Cloud Load Balancer (CLB) Troubleshooting
type: article
created_date: '2018-01-18'
created_by: Becky Geinzer
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---
**Background**

 >In order to assist in the trouble shooting process,  the health monitoring MUST be enabled 
 for the CLB.  This provides a means to review historical actions concerning the CLB.  Without this being enabled, there is very little troubleshooting that can be done for the
 CLB or to determine why the CLB did not appear to be online

 To enable health monitoring:

 >Open up the customer portal for the identified load balancer and scroll down to the optional features and click
 the pencil to the right of the health monitoring line.  This will bring up another panel with the requirements for
 setting up health monitoring.
 
Another valuable service to have installed is the CLoud Monitoring Service that is provided (free) to monitor the health of the nodes (virtual instances) that are attached to the CLB.

For the most part, CLBs communicate to the nodes attached to it via the service net IP.  Normally this is identified as starting with a 10.X.X.X IP address.  This means that the CLB and any associated nodes must be located in the same data center (this includes testing with a known operational server.)

RackConnet v2 and v3 are compatible with CLBs but require special setup considerations.

This is the link to the RackConnect v2 knowledge article:

<https://support.rackspace.com/how-to/using-cloud-load-balancers-with-rackconnect>

This is the link to the RackConnect v3 knowledge articke:

<https://support.rackspace.com/how-to/rackconnect-v30-compatibility>

**Changes**

If a CLB suddenly stops working, it might be due to changes on the node(s) attached to the CLB.  Please review to determine if any changes(changes to the web service, firewall rules,etc) were done prior to the CLB not working.  If so, please roll back these changes.  If another node is added to the CLB and the CLB is automatically disabling these nodes, this is a clear indication there are differences in how these nodes were setup.
     
     
 **Pitchfork**
 
 Pitchfork is a valuable tool which can be used to view different statistics concerning the CLB9s) in an account.
 
 The knowledge article for this tool is:
 
 <https://community.rackspace.com/products/f/25/t/6432>
 
 **Cloud Load Balancer Status**
 
**Error status**

Error status is when an update action from a customer using the command line interface (cli) call or the customer portal cannot create,read,update or delete a CLB.  The CLB is still operational but no configuratio changes can be made.
     
To resolve this status, the Cloud Support Operations team will need to contacted in order to place the CLB in an active status.  If the error was caused by a change (for example: SSL certificate installe), the issue with that action will nee to be resolved or the CLB will enter the error state again.

**CLB is active but nodes are automatically disabled**

This is normally caused by the CLB not able to connect to the node(s) attached to it.

Actions:

Check the status of the node(s) behind the CLB

  Log into the customer portal and open the emergency console for that node(s).
     
  >If there are messages scrolling on the screen (killing processes or it looks like a crash dump), the node should be rebooted.  Once the node has become operational, check the status to see if enabled or not.
  
  On a server that is located in the same data center as the CLB, ping the service net IP of the affected node.
  
  If pings are being returned, there are additional items to review.
  
  ssh or remotely log into the affected node(s).  
  
  >If unable to ssh (ssh hangs and there is no prompt for password), there is probably an issue incolving the overall load of the node itself.  If ssh call finally returns but the command response is sluggish, review the load of the server or possible network saturation.  Log into the node via the emergency console and research possible cause for this.
    
  >If able to ssh or remotely log into the node, ping another service net IP of a node in the same data center that is known to be operational.  Once logged on, check the services on the node(s) and review any pertinent logs in /var/log directory.
  
  **Curl Commands**
  
  All of these commands are executed in a terminal and will need to have curl installed.
  
       Test the load balancer:  `curl - <oad balancer public IP>`
       
       Test the node(s):  `curl -I <node service net IP.`
       
       Test the port:  `telnet <node(s) service net ip> 80`
       
       Test the load balancer with the node:  `curl -sik http://<CLB public ip> -H "host:<domain.com>"`
  
  Further actions will depend based on the results of the commands.
  
  **Curl command results**
  
  curl returns a 500 Internal error.
  
  >Health checks are not enabled on the CLB.  All nodes behind the CLB are failed or unable to communicate with the CLB.  As a result of no health checks, the CLB will identify failed nodes as OFFLINE and provide a generic 500 Internal Server Error on behalf of the failed nodes.
    
  curl returns intermittent 503 Service Temporarily Unavailable.
  
  >Health Checks are not enabled on the CLB.  A node behind the CLB is failing or unable to communicate to the CLB.  As a result of no health checks, the CLB will continue to send request to the failing node.  When the node does not respond in the default 30 second timeout, the 503 Service Temporarily Unavailable response will be provide by the CLB on behalf of the failing node.
  
 Using another node to check the node that is failing.  
 
 >Log onto the node and perform curl commands to the node that is having issues from another node that is located in the same data.
 
 **CLB is in an error state**
 
 >There are times when a CLB is in an error state and it appears to be functioning normally (curl comamnds return 200's).  This is caused by the CLB being "stuck" in an error status.  Thie can be resolved by doing either one of the following:
 
  * Remove and re-add a node that is behind the CLB.
  
  * Disable/enable health monitoring on the CLB.  if the settings are important, ensure you make a copy of the settings prior to disabling/enable the health monitor.
  
  

