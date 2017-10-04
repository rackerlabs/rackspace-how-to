---
permalink: working-with-checks/
audit_date: '2017-08-15'
title: Working with checks
type: article
created_date: '2015-08-05'
created_by: Constanze Kratel
last_modified_date: '2017-08-15'
last_modified_by: Nate Archer
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

Rackspace Intelligence provides an interface that you can use to create new checks to generate metrics for your entities, and to update existing checks.

Each check has a designated *type*. The type instructs the monitoring system how to
check the monitored resource. Check types are divided into two categories: agent
checks and remote checks.

Check types are divided into two categories: agent checks and remote checks.

### Agent checks

*Agent checks* monitor an entity's resource utilization. Agent checks are performed by the monitoring agent that is running on a server. For example, a Memory check monitors a server's memory use and can trigger an alarm if it detects memory use above a specified percentage. 

Rackspace Intelligence supports the following agent checks:

- Apache
- CPU
- Custom Plugin
- Disk
- Filesystem
- Load Average
- Memory
- MySQL
- Network
- Redis
- SQL Server Buffer Manager
- SQL Server Memory Manager
- SQL Server Plan Cache
- SQL Server Statistics
- SQL Server Version
- Windows PerfOS

For detailed descriptions of these agent checks, see [Agent check types](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#agent-check-type-ref). For information
on how to install the monitoring agent, see [Install and configure the agent](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/install-configure/).

### Remote checks

*Remote checks* monitor an entity's internet connectivity. Remote checks are performed by attempting to contact the entity from outside the entity. For example, a *Ping* check attempts to ping a server and can trigger an alarm if it detects packet loss above a specified percentage. 

Rackspace Intelligence supports the following remote checks:

- DNS
- FTP Banner  
- HTTP
- IMAP Banner
- Ping
- POP3 Banner
- SMTP
- SMTP Banner
- SSH
- TCP
- Telnet Banner

For detailed descriptions of these remote checks, see [Remote check types](https://developer.rackspace.com/docs/rackspace-monitoring/v1/#remote-check-type-ref).

### Checks available through CLI or API

Hostinfo checks, which are a special class of checks that run on demand, cannot be
created in the Rackspace Intelligence interface. However, you can create them by using
the Rackspace Monitoring CLI or API. These checks are described in [Rackspace Cloud Monitoring Checks and Alarms](/how-to/rackspace-monitoring-checks-and-alarms).

### Checks and alerts

Checks can generate alerts. You can observe open alerts within the Rackspace Intelligence dashboard, as explained at
[Monitor open alerts with Rackspace Intelligence](/how-to/monitoring-open-alerts-with-rackspace-intelligence).
You can also choose to notify someone (for example, on-call technical support) or to suppress notification (for example, during scheduled maintenance).

### Create a check

To create a new check, complete the following steps:

1. Log in to the [Rackspace Intelligence interface](http://intelligence.rackspace.com).
2. On the Monitoring page, click the entity for which you want to create the check.
3. In the **Monitoring Checks** section of the entity details page, click **Create Check**.
4. On the Create a Check page, click the **Check Type** box and select the appropriate check type from the list.
5. In the **Check Name** box, type a name for the check.
6. Specify any other values for the type of check that you are creating.
7. Optionally, create an alarm for the check. The **Create Alarm** option appears for certain check types and is automatically selected.  You can provide alarm threshold values or clear the check box if you don’t want to create an alarm at this time.
8. Click **Create Check** or **Create Check and Alarm**.
    
   After successfully creating the check, Rackspace Intelligence displays a deatils page with the name of the check.
   
### Edit a check

To edit a check, navigate to the check's details page and click the **Actions** menu.

You can perform the following editing actions for checks. 

#### Rename a check

1.  From the **Actions** menu on the check details page, select **Rename Check**.
2.  In the Rename Check pop-up box, type the new name and then click **Rename**.

#### Add an alarm

For instructions on adding an alarm for a check, see the "Create an alarm" section of
[Working with alarms](/how-to/working-with-alarms).

#### Modify the status of a check

1.  From the **Actions** menu on the check's details page, select **Modify Status**.
2.  To enable the check, select **Enabled**. To disable the check, select **Disabled**.
3.  Click **Save Status**.

#### Modify the parameters of a check

1.  From the **Actions** menu on the check's details page, select **Modify Parameters**.
2.  In the dialog box, type the new parameter values, and then
    click **Save Parameters**.

#### Delete a check

1.  From the **Actions** menu on the check's details page, select **Delete Check**.
2.  To permanently delete the check, click **Delete Check**.
