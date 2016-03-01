---
node_id: 3552
title: Draining a load balanced server
type: article
created_date: '2013-06-26'
created_by: Kyle Laffoon
last_modified_date: '2016-01-08'
last_modified_by: Kyle Laffoon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

Server *draining* is the redirection of incoming calls and new
connections from the specified server to other servers connected to the
same load balancer. Draining is used to minimize service
interruption when taking a server offline for maintenance.
Sessions started before the server is put into draining status 
continue until completion.  When all sessions have ended, the
server is considered drained and can then be taken offline. The
following steps help to ensure minimal service interruption
when removing a cloud server from an active load balancer.

1.  Select the **Load Balancers** tab.
2.  Click the name of the applicable load balancer to view the
    connected servers.
3.  Click the gear icon next to server to be drained.
4.  Select **Edit Node Condition** from the options presented.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/EditNodeConditionwitharrow.jpeg" alt="Edit Node Connection" width="340" height="226" />

5.  Select **Draining Connections** for the server condition and click
    **Save Condition**.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Drainingconnections_0.jpg" width="371" height="416" />

6.  Monitor the applicable port of the currently draining node for
    continued activity (for a Linux server check
    [netstat](/how-to/checking-listening-ports-with-netstat)
    for new connections).
7.  When activity has ceased, repeat the first 5 steps above (as needed)
    and select **Disabled** in the repeated 5th step.

After a server is disable, it can be removed from the load balancer and the
application can be stopped or the instance deleted, depending on your
needs.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Removefromloadbalancer.jpeg" alt="Remove from Load Balancer" width="340" height="226" />

