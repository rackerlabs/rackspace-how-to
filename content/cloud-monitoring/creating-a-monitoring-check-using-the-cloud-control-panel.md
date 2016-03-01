---
node_id: 2010
title: Creating a monitoring check using the Cloud Control Panel
type: article
created_date: '2012-08-15'
created_by: Susan Million
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: cloud-monitoring
---

This article describes how to create monitoring checks by using
Rackspace Monitoring through the Cloud Control Panel. Each of the
monitoring checks that you can create with the Cloud Control Panel are
based on predefined check templates.

You can view the settings for each check template in the [Rackspace
Monitoring Developer
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#alarm-example-operations).

You can also use
[raxmon](/how-to/getting-started-with-rackspace-monitoring-cli),
a command-line interface, to perform these and other actions on a
monitoring check.

For the latest information about Rackspace Monitoring pricing and other
general questions, see the [Rackspace Monitoring
FAQ](/how-to/cloud-monitoring-faq)
and the [Rackspace Monitoring main product
page](http://www.rackspace.com/cloud/monitoring/).

**Note:** With General Purpose servers, Rackspace Monitoring monitors
only the system disk. The data disk is not monitored.

### Contents

-   [Creating a Monitoring Check](#Create)
-   [The Check Region](#ChkRegion)
-   [The Check Status](#ChkStatus)

### Create a Monitoring Check


1.  Log in to the [Cloud Control
    Panel](https://mycloud.rackspace.com/) at
    <http://mycloud.rackspace.com>.
2.  In the list of servers, click the name of the server for which you
    want to create a check.
3.  On the server details page, scroll to the Monitoring Checks section
    and click **Create Check**.
4.  From the **Check Type** list, select the service that you want
    to monitor.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/CreateCheck.png" width="465" height="283" />

5.  Enter a descriptive name for the check in the Check Name box.
6.  If you selected the **HTTP Check (website)** check, enter the URL of
    the website that you want to monitor.

     <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/CheckDetails3.png" width="542" height="538" />

-   *(Optional: HTTP Check Only)* Click **Advanced Options** and enter a
    word or phrase in the **Body Match** box that will appear on the
    page when it loads successfully. For example, you can do a body
    match on the copyright date.



### The Check Region

Each check is configured by default to originate from the 3 regions:
DFW, ORD, and LON. Once your monitoring check has been created, you can
edit the Parameters under the Check Details to include additional
regions, including: IAD (Northern Virginia), HKG (Hong Kong), and SYD
(Sydney).

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/EditMonitoringParam.png" width="715" height="390" />



### The Check Status


The check status is calculated by determining if there is an agreement
from a majority of the monitoring zones (two out of three monitoring
zones running the check). This method helps to avoid reporting false
negatives. A check has to fail in two of the three monitoring zones
before the check state is deemed CRITICAL.

The combined results of the check from all three monitoring zones
determine the check's state. The check state can be one of the
following:

-   Green = OK

-   Yellow = WARNING

-   Red = CRITICAL. The Technical Contact (the primary contact on the
    Rackspace account) will receive an email describing the situation.

The following example shows a check in the OK state and one in the
CRITICAL state:

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Check%20Status_0.png" width="534" height="106" />
