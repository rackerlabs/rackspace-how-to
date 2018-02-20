---
permalink: Cloud-Load-Balancer-Troubleshooting/
audit_date: '2018-01-18'
title: Cloud Load Balancer (CLB) Troubleshooting
type: article
created_date: '2018-01-18'
created_by: Becky Geinzer
last_modified_date: '2018-02-20'
last_modified_by: Cat Lookabaugh
product: Cloud Load Balancers
product_url: cloud-load-balancers
---
### Use Cloud Load Balancers health monitoring

 To help with the trouble shooting process,  you should enable the health monitoring for Cloud Load Balancers. 
 This provides the ability to review historical Cloud Load Balancer actions.  If health monitoring is not enabled, few troubleshooting options exist.

#### Enable Cloud Load Balancers health monitoring

1. Open the customer portal for the identified load balancer.
2. Choose **optional features**, and click the pencil icon to the right of the health monitoring line.  This opens the **Health Monitoring Settings** panel.
3. Fill in the appropriate settings, and click **Save Monitoring Settings**.

### Use Cloud Monitoring

You might also want to install the Cloud Monitoring Service, which is provided for free to monitor the health of the nodes (or virtual instances) that are attached to the Cloud Load Balancer. For more information, see [Install and configure the Rackspace Monitoring Agent](https://support.rackspace.com/how-to/install-and-configure-the-rackspace-monitoring-agent/) and [Rackspace Monitoring checks and alarms](https://support.rackspace.com/how-to/rackspace-monitoring-checks-and-alarms/).

### Keep CLB resources in the same Datacenter

For the most part, Cloud Load Balancers communicate to attached nodes by using the service net IP address.  Normally, this is identified as starting with a 10.X.X.X IP address.  This means that the Cloud Load Balancer and any associated nodes must be located in the same data center (this includes testing with a known operational server.)

### Use CLB with RackConnect

RackConnect v2 and v3 are compatible with Cloud Load Balancers but require special setup considerations. For more information, see [Use Cloud Load Balancers with RackConnect](https://support.rackspace.com/how-to/using-cloud-load-balancers-with-rackconnect).


### Have you made recent changes to Cloud Load Balancers configuration?

If a Cloud Load Balancer suddenly stops working, it might be due to changes on the node(s) attached to the Cloud Load Balancer.  Review recent changes to the web service, firewall rules, and so on.  If changes were made, roll them back to see if the Cloud Load Balancer begins working again.  If a new node was added to the Cloud Load Balancer and the Cloud Load Balancer is automatically disabling this node, compare how the nodes were setup to identify any differences.
     
     
### Use Pitchfork to view statistics
 
 Pitchfork is a valuable tool which can be used to view different statistics concerning the Cloud Load Balancers in an account.
 
 To learn more, see [Pitchfork - Rackspace Cloud API Web Application](https://community.rackspace.com/products/f/public-cloud-forum/6432/pitchfork---rackspace-cloud-api-web-application).
 
### Cloud Load Balancer Issues
 
#### Error status displaying

An error status occurs when an update action from a customer (one that uses a command line interface call or the customer portal) cannot create, read, update, or delete a Cloud Load Balancer.  The Cloud Load Balancer is still operational, but no configuration changes can be made.
     
To resolve this condition, contact the Cloud Support Operations team and ask them to place the Cloud Load Balancer in an ``active`` status.  If the error was caused by a change (for example, SSL certificate installed), resolve the root cause to prevent the Cloud Load Balancer from entering the error state again.

#### Cloud Load Balancer is active but nodes are automatically disabled

This normally results when the Cloud Load Balancer is unable to connect to the attached nodes.

To resolve this condition, perform the following steps for each affected node:

1. Check the status of the node behind the Cloud Load Balancer.

2. Log into the customer portal, and open the emergency console for the node.
     
   If there are messages scrolling on the screen (for example, killing processes or a crash dump), the node should be rebooted.  Once the node is operational, check the status to make sure it is enabled.
  
3. Ping the service net IP of the affected node from a server that is located in the same data center as the Cloud Load Balancer.
  
   If pings are being returned, there are additional items to review.
  
4. ``ssh`` or remotely log into the affected node.  
  
   If you are unable to ``ssh``` (for example, if ``ssh`` hangs or there is no prompt for password), the issue might involve the overall load of the node itself.  If the ``ssh`` call finally returns but the command response is sluggish, review the load of the server for possible network saturation.  Log into the node by using the emergency console to research possible causes for the saturation.
    
   If you can ``ssh`` or remotely log into the node, ping another service net IP of a node in the same data center that is known to be operational.  Once logged on, check the services on the node and review any pertinent logs in the ``/var/log`` directory.
  
### Using cURL Commands

One troubleshooting method for a failing node is to log onto a good node in the same Cloud Load Balancer and perform curl commands to the node that is having issues.

#### cURL commands
  
To use the following helpful commands, install cURL and execute the comands from a terminal window.
  
       Test the load balancer:  `curl - <load balancer public IP address>`
       
       Test the node(s):  `curl -I <node service net IP address>`
       
       Test the port:  `telnet <node(s) service net IP address> 80`
       
       Test the load balancer with the node:  `curl -sik http://<Cloud Load Balancer public IP address> -H "host:<domain.com>"`
  
Further actions depend based on the results of the commands.
  
#### cURL command results
  
#####  cURL returns a 500 Internal error.
  
Health checks are not enabled on the Cloud Load Balancer.  All nodes behind the Cloud Load Balancer are failed or cannot communicate with the Cloud Load Balancer.  As a result of the missing health checks, the Cloud Load Balancer identifies failed nodes as ``OFFLINE`` and provides a generic ``500 Internal Server Error`` on behalf of the failed nodes.
    
##### cURL returns intermittent 503 Service Temporarily Unavailable.
  
Health checks are not enabled on the Cloud Load Balancer.  A node behind the Cloud Load Balancer is failing or cannot communicate to the Cloud Load Balancer.  As a result of the missing health checks, the Cloud Load Balancer continues to send requests to the failing node.  When the node does not respond in the default 30-second timeout, the Cloud Load Balancer sends the``503 Service Temporarily Unavailable`` response on behalf of the failing node.
  
##### cURL returns 200 Success, but Cloud Load Balancer is in an error state.
 
When a Cloud Load Balancer is in an error state but appears to be functioning normally (for example, cURL comamnds return ``200`` responses), the Cloud Load Balancer is likely stuck in an error status.  Resolve this by using either of the following options:
 
- Remove and re-add a node that is behind the Cloud Load Balancer.
  
- Disable or enable health monitoring on the Cloud Load Balancer. Make sure to copy the settings prior to disabling or enabling the health monitor so that you can easily reconfigure them.
  
