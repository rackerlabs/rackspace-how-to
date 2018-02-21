---
permalink: Cloud-Load-Balancer-Troubleshooting/
audit_date: '2018-02-20'
title: Cloud Load Balancers troubleshooting
type: article
created_date: '2018-01-18'
created_by: Becky Geinzer
last_modified_date: '2018-02-20'
last_modified_by: Cat Lookabaugh
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

This article provides troubleshooting instructions for Cloud Load Balancers.

### Use Cloud Load Balancers health monitoring

To help with the troubleshooting process, you should enable the health monitoring for Cloud Load Balancers. 
This feature provides the ability to review historical load balancer actions.  If health monitoring is not enabled, few troubleshooting options exist.

#### Enable Cloud Load Balancers health monitoring

To enable health monitoring for your load balancer, use the following steps:

1. Open the customer portal for the identified load balancer.
2. Choose **optional features**, and click the pencil icon to the right of the health monitoring line.  This opens the **Health Monitoring Settings** panel.
3. Fill in the appropriate settings, and click **Save Monitoring Settings**.

### Use Cloud Monitoring

You might also want to install the Cloud Monitoring service, which is provided at no cost to monitor the health of the nodes (or virtual instances) that are attached to Cloud Load Balancers. For more information, see [Install and configure the Rackspace Monitoring Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent/) and [Rackspace Monitoring checks and alarms](/how-to/rackspace-monitoring-checks-and-alarms/).

### Keep Cloud Load Balancers resources in the same Datacenter

For the most part, Cloud Load Balancers communicate to attached nodes by using the service net internat protocaol (IP) address.  Normally, this address is identified as starting with 10.X.X.X.  This means that the Cloud Load Balancers and any associated nodes must be located in the same data center. (This includes testing with a known operational server.)

### Use Cloud Load Balancers with RackConnect

RackConnect v2 and v3 are compatible with Cloud Load Balancers but require special setup considerations. For more information, see [Use Cloud Load Balancers with RackConnect](/how-to/using-cloud-load-balancers-with-rackconnect).


### Have you made recent changes to the Cloud Load Balancers configuration?

If a load balancer suddenly stops working, it might be due to changes on the node(s) attached to the load balancer.  Review recent changes to the web service, firewall rules, and so on.  If changes were made, roll them back to see if the load balancer begins working again.  If a new node was added to the load balancer and the load balancer is automatically disabling this node, compare how the nodes were setup to identify any differences.
     
     
### Use Pitchfork to view statistics
 
 Pitchfork is a valuable tool that can be used to view different statistics concerning the Cloud Load Balancers in an account.
 
 To learn more, see [Pitchfork - Rackspace Cloud API Web Application](https://community.rackspace.com/products/f/public-cloud-forum/6432/pitchfork---rackspace-cloud-api-web-application).
 
### Cloud Load Balancers issues

The following sections describe some possible load balancer issues and troubleshoooting procedures:
 
#### Error status displaying

An error status occurs when an update action from a customer (one that uses a command line interface call or the customer portal) cannot create, read, update, or delete a load balancer.  The load balancer is still operational, but you cannot make any configuration changes.
     
To resolve this condition, contact the Cloud Support Operations team and ask them to place the load balancer in an ``active`` status.  If the error was caused by a change (for example, an SSL certificate installed), resolve the root cause to prevent the load balancer from entering the error state again.

#### Load balancer is active but nodes are automatically disabled

This situation normally results when the load balancer is unable to connect to the attached nodes.

To resolve this condition, perform the following steps for each affected node:

1. Check the status of the node behind the load balancer.

2. Log into the customer portal, and open the emergency console for the node.
     
   If there are messages scrolling on the screen (for example, killing processes or a crash dump), you should reboot the node.  Once the node is operational, check the status to make sure it is enabled.
  
3. Ping the service net IP address of the affected node from a server that is located in the same data center as the load balancer.
  
   If pings are returned, there are additional items to review.
  
4. ``SSH`` or remotely log in to the affected node.  
  
   If you are unable to use ``ssh`` (for example, if ``ssh`` hangs or there is no prompt for the password), the issue might involve the overall load of the node itself.  If the ``ssh`` call finally returns but the command response is sluggish, review the load of the server for possible network saturation.  Log in to the node by using the emergency console, and research possible causes for the saturation.
    
   If you can ``ssh`` or remotely log in to the node, ping another service net IP of a node in the same data center that is known to be operational.  After you are logged on, check the services on the node, and review any pertinent logs in the ``/var/log`` directory.
  
### Using cURL commands

One troubleshooting method for a failing node is to log on to a good node in the same load balancer and send cURL commands to the node that is having issues.

#### cURL commands
  
To use the following helpful commands, install cURL, and execute the commands from a terminal window.
  
       - Test the load balancer:  ``curl - <load balancer public IP address>``
       
       - Test the nodes:  ``curl -I <node service net IP address>``
       
       - Test the port:  ``telnet <node(s) service net IP address> 80``
       
       - Test the load balancer with the node:  ``curl -sik http://<Cloud Load Balancer public IP address> -H "host:<domain.com>"``
  
Further actions depend based on the results of the commands.
  
#### cURL command results

Following are the results that you might see from your cURL commands:
  
#####  cURL returns a 500 Internal error.
  
Health checks are not enabled on the load balancer.  All nodes behind the load balancer are failed or cannot communicate with the load balancer.  As a result of the missing health checks, the load balancer identifies failed nodes as ``OFFLINE`` and provides a generic ``500 Internal Server Error`` on behalf of the failed nodes.
    
##### cURL returns intermittent 503 Service Temporarily Unavailable.
  
Health checks are not enabled on the load balancer.  A node behind the load balancer is failing or cannot communicate to the load balancer.  As a result of the missing health checks, the load balancer continues to send requests to the failing node.  When the node does not respond in the default 30-second timeout, the load balancer sends the``503 Service Temporarily Unavailable`` response on behalf of the failing node.
  
##### cURL returns 200 Success, but the load balancer is in an error state.
 
When a load balancer is in an error state but appears to be functioning normally (for example, cURL commands return ``200`` responses), the load balancer is likely stuck in an error state.  Resolve this situation by using either of the following options:
 
- Remove and re-add a node that is behind the load balancer.
  
- Disable or enable health monitoring on the load balancer. Make sure to copy the settings prior to disabling or enabling the health monitor so that you can easily reconfigure them.
  
