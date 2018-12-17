---
permalink: working-with-alarms/
audit_date: '2017-08-30'
title: Working with alarms
type: article
created_date: '2015-07-31'
created_by: Constanze Kratel
last_modified_date: '2017-08-26'
last_modified_by: Nate Archer
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

Rackspace Intelligence provides a wizard that guides you through the
process of creating an alarm for a check on an entity.

Before you can create an alarm, you must have [created a check](/how-to/working-with-checks).
The following table lists the alarms that are associated with each type of check in Rackspace Intelligence.

| Check type | Alarm name |
| --- | --- |
| **agent.cpu** | CPU usage |
| **agent.filesystem** | Filesystem usage |
| **agent.load_average** | High load average |
| **agent.memory** | Memory usage |
| **agent.mysql** | Connected threads |
| **agent.network** | Network transmit rate<br />Network receive rate |
| **remote.dns** | DNS record address match<br />SPF TXT record |
| **remote.http** | Body match - string found<br />Body match - string not found<br />Connection time<br />Status code<br />SSL certificate expiration time |
| **remote.ping** | Ping packet loss |
| **remote.ssh** | SSH fingerprint match |
| **remote.tcp** | Connection time |

Before you can create an alarm, you must have [created a check](/how-to/working-with-checks).

### Create an alarm

Use the following steps to create a new alarm:

1.  Log in to the [Rackspace Intelligence
    interface](http://intelligence.rackspace.com).

2.  On the Monitoring page, click the entity for which you want to define an alarm.

3.  In the **Monitoring Checks** section of the entity details page, click the check for which you want to create the alarm.

4.  On the check details page, scroll down to the **Monitoring
    Alarms** section, and click **Create Alarm**.
    Rackspace Intelligence automatically suggests the appropriate alarm
    for the check type that you select. For example, if you want to
    create an alarm for the CPU check type, Rackspace Intelligence
    automatically guides you through the steps for creating a CPU
    alarm.

       **Note:** If you want to create an alarm for an [agent check type](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#agent-check-types), you must install the Rackspace monitoring agent on the server. Rackspace Intelligence creates an alarm without the agent installed, but you cannot view any metrics for this alarm. See [Creating an alarm for an agent check type without an agent installed.](#createagenttypealarmwithoutagent).

5.   In the **Choose Alarm Type** section, select the type of alarm or Write your own alarm criteria (Advanced), and then click **Next Step**.

6.  In the **Alarm Details** section of the next page, type a name for
    the alarm, and then select a notification plan from the
    **Notification Plan** list.

7. If you selected a predefined alarm, set the criteria for it in the **Alarm Settings** section. 

   You must define a threshold for when a Warning is issued and a threshold for when the situation becomes critical. For a CPU alarm, for example, the following settings are recommended:

    - Warning Threshold = 60
    - Critical Threshold = 80
    - Consecutive Count = 1
    
8. If you selected to write your own alarm criteria, create a custom alarm script in the **Write Alarm Criteria** section. To view example criteria, expand the **Help Guide and Example Criteria** section.

9.  Click **Test Alarm**.

    - If you set the **Warning Threshold** and **Critical Threshold** values to a value that is greater than the **Current value** that is listed on the left side of the Alarm Settings section, the test alarm returns an **OK** result.
    - If you set the **Warning Threshold** and **Critical Threshold** values to a value that is less than the **Current value**, clicking **Test Alarm** returns either a **Warning** or **Critical** result.
    
9.  After you have tested your alarm, click **Create Alarm**.

The new alarm is displayed on the alarms details page.

### Edit an alarm

To edit an alarm, navigate to the details page for the alarm and click the **Actions** menu.

You can perform the following editing actions for alarms:

#### Rename an alarm

1.  From the **Actions** menu on the alarm details page, select **Rename
    Alarm**.
2.  In the Rename Alarm dialog box, type a new name in the **Alarm
    Name** box, and click **Save**.

#### Edit a notification plan

1.  From the **Actions** menu on the alarm details page, select **Edit Alarm
    Notification Plan**.
2.  in the Edit Notification Plan dialog box, select a different
    notification plan from the **Notification Plan** list, and click
    **Save**.

#### Edit the alarm criteria

1.  From the **Actions** menu on the alarm details page, select **Edit
    Criteria**.
    The Edit Alarm Criteria dialog box opens in basic mode. If you want
    to edit the criteria in advanced mode, see the note at the end of
    this procedure.
2.  Update any of the values for **Warning Threshold**, **Critical
    Threshold** and **Consecutive Count**.
3.  Click **Test Alarm** to test the alarm, and then click **Save** to
    save the alarm.

**Note:** If you want to edit the script that was generated for the
alarm, click the **Edit in Advanced Mode** link. On the **Advanced
Mode** page, the alarm script that Rackspace Intelligence automatically
generated is displayed. You can update the script by changing the values
for your alarm criteria, or by adding new conditions. To view example
criteria, click the arrow next to **Help Guide and Example Criteria**.

**Important:** If you update an alarm in advanced mode, you can no
longer view the alarm criteria in basic mode.

#### Delete an alarm

1.  From the **Actions** menu on the alarm details page,
    select **Delete**.
2.  In the dialog box, click **Delete Alarm**.

The alarm is deleted.

### Create alarms for different check types

This section provides examples of how to use Rackspace Intelligence to
create alarms for different check types.

#### Create an alarm for a remote check type

This example provides steps for creating an alarm for an HTTP check.
This alarm is remote and does not require a monitoring agent to be
installed. These steps assume that you already created an HTTP check.

1.  On the **Monitoring** page, click on the entity for which you want
    to define an alarm.
2.  In the **Monitoring Checks** section of the entity details page,
    click an HTTP check for which you want to create an alarm.
3.  On the check details page, click **Create Alarm**.
4.  In the **Choose Alarm Type** section of the Create HTTP Alarm page,
    select **Connection time**, and then click **Next Step**.
5.  On the next page, in the **Alarm Details** section, type a name for
    the alarm and select a notification plan from the list.
6.  In the Alarm Settings section, specify values for **Warning
    Threshold** and **Critical Threshold**. Use the value that is
    displayed for **Current value** on the left side of the section
    for guidance. To obtain a test result of OK, you must specify values
    that are greater than the current values for **Warning
    Threshold** and **Critical Threshold**.
7.  Click **Test Alarm** to test the alarm.

    **Note:** If your warning threshold is less than the value that is
    displayed for the current value, you receive a **Warning** result
    when you test the alarm. If you click **Create
    Alarm** after receiving a test result of type **Warning** or
    **Critical**, a warning message appears. You can still create the
    alarm, but creating the alarm will trigger an alert that is
    associated with your selected notification plan. If the current
    value is less than the values that you have specified for **Warning
    Threshold** and **Critical Threshold**, you receive an **OK** result
    when you click **Test Alarm**.

8.  After you have tested your alarm, click **Create Alarm**.

The new alarm is displayed on the alarm details page.

#### Create an alarm for an agent check type with an agent installed

This example provides steps for creating an alarm for a file system
check. This alarm is an agent-type alarm and requires a monitoring agent
to be installed. These steps assume that you already created a file
system check.

1.  On the **Monitoring** page, click on the entity for which you want
    to define an alarm.
2.  In the **Monitoring Checks** section of the entity details page,
    click a file system check for which you want to create an alarm.
3.  On the check details page, click **Create Alarm**.
4.  In the **Choose Alarm Type** section, select **Filesystem usage**,
    and then click **Next Step**.
5.  On the next page, in the **Alarm Details** section, type a name for
    the alarm and select the appropriate notification plan.
6.  In the **Alarm Settings** section, enter the appropriate values
    for **Warning Threshold** and **Critical Threshold**, and then
    click **Test Alarm**. To obtain a test result of OK, enter values
    that are greater than the **Current value** that is displayed on the
    left side of the section.
7.  After you have successfully tested your alarm, click **Create
    Alarm**.
    
    The new alarm is displayed on the alarm details page.

#### Create an alarm for an agent check type without an agent installed

This example provides steps for creating an alarm for a CPU check. This
alarm is an agent-type alarm and requires a monitoring agent to be
installed to generate metrics. In this example, however, the agent is
not yet installed. The steps assume that you already created a CPU
check.

1.  On the **Monitoring** page, click on the entity for which you want
    to define an alarm.
2.  In the **Monitoring Checks** section of the entity details page,
    click a CPU check for which you want to create an alarm.
    The check details page displays a warning that you need to have a
    monitoring agent installed to generate metrics.
3.  Click **Create Alarm**.
4.  In the **Choose Alarm Type** section, select **CPU usage**, and then
    click **Next Step**.
5.  On the next page, in the **Alarm Details** section, type a name for
    the alarm and select the appropriate notification plan.
6.  In the **Alarm Settings** section, enter appropriate values
    for **Warning Threshold** and **Critical Threshold**.

    **Note:** No current value is displayed to use as a basis for
    defining your threshold. Rackspace Intelligence does not display a
    current value because no monitoring agent is installed. A warning
    message also appears explaining that Rackspace Intelligence cannot
    generate any metrics until a monitoring agent has been installed on
    the server. You can still create the alarm, but you must install an
    agent before you can use the alarm.

7.  Click **Create Alarm**.

    A warning is displayed that you do not have a monitoring
    agent installed.
    
8.  Click **Create Alarm Anyway**.

The new alarm is displayed in the alarm details page. Because
no monitoring agent is installed, no monitoring metrics are displayed.
