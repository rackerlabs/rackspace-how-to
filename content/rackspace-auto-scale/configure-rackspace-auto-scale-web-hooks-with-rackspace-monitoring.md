---
permalink: configure-rackspace-auto-scale-web-hooks-with-rackspace-monitoring/
audit_date:
title: Configure Rackspace Auto Scale web hooks with Rackspace Monitoring
type: article
created_date: '2015-06-04'
created_by: Jake Coe
last_modified_date: '2016-05-31'
last_modified_by: Stephanie Fillmon
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

Auto Scale uses webhooks to initiate scaling events. A webhook is an
industry-standard protocol for sending events between systems; for Auto
Scale, they are used to execute policies. A webhook consists of an HTTP
callback that is triggered by some user-defined event, such as an alarm
that is set through Rackspace Monitoring or another monitoring service.
When that event occurs, the source site makes an HTTP request to the URI
configured for the webhook. Therefore, correct configuration of the
webhooks is needed for the Auto Scale service to perform correctly.

### Before you begin

Before you can configure the webhooks, you must [create an Auto Scale group](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-group).

### Create Auto Scale policies

1.  In the Cloud Control Panel, select **Servers > Auto Scale**.
2.  Select your Auto Scale group from the list.
3.  Scroll down to **Policies** and click **Create Policy**.
4.  Create two policies, one for scaling up and one for scaling down.
    Specify the following values, and then click **Create Policy**:
    -   **Name:** Specify a name to identify each policy
    -   **Scale Trigger:**  Select **Webhook URL** for both policies
    -   **Amount:** Specify how many servers to scale up and how many to
        scale down.
    -   **Cooldown Period:** Specify the cooldown period, which prevents
        scaling up or down too fast. The policy will wait for the policy
        cooldown period to elapse, or the group's minimum cooldown to
        elapse, whichever is longer.

### Create a webhook

Create a corresponding webhook to activate each of the Auto Scale
policies you created.

1.  On the Scaling Group details page, click the gear icon next to the
    policy name and click **View Webhooks**.
2.  In the popup dialog box, click **Create Webhook.**
3.  In the popup dialog box, enter a name for the webhook, and then
    click **Save Webhook**.
4.  Copy the address created for the webhook. You will need it during
    the next set of steps.

    You can now execute a POST request against this URL in order to use
    your webhook manually via CURL. For more information, see the [Auto Scale Developer Guide](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#webhooks-and-capability-urls).

### Set up Rackspace Monitoring

1.  On the Scaling group details pages, click the cloud server at the
    bottom of the page.

2.  Log in to the server and [install the Rackspace Monitoring Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent).

3.  Open Rackspace  Intelligence and click **Notify**.

4.  Create a new **Notification Plan** called **AutoScale**.

5.  Select the notification plan from the list and Select **Add
    Notifications > Create a new notification.**

6.  In the popup dialog box, specify the following values:
    -   **Name**: This name should match the webhook name that you chose
        earlier, for example, **ScaleUp**.
    -   **Type:** Select **Webhook**.
    -   **URL:** Enter the webhook URL for your Auto Scale Policies. If
        you did not copy this URL in an earlier step, you can view it by
        selecting the gear icon next to the policy name and selecting
        **View Webhooks**.

7.  Click **Create and Select Notification**.

8.  At the bottom of the popup dialog box, specify what type of
    monitoring alarm will trigger the notification.

    For example, you
    could specify that the ScaleUp notification is triggered when an
    alarm of Critical or Warning occurs, and that ScaleDown is triggered
    if the monitoring is set to OK.

9.  Click Save **Notification Plan**.

10. At the top of the Rackspace Intelligence window, click
    **Monitor**.

    The cloud server is listed.

11. Click the cloud server name, and on the details page, click **Create
    Check** under Monitoring Checks.

12. Enter the following information:
    -   **Check Type:** You can select from the list a wide range of
        monitoring checks such as CPU or Memory. Select the type of
        check that is appropriate for your environment.
    -   **Check Name:** Enter a name to easily identify the check.

13. Click **Create Check**.

    The details page for the check is displayed.

14. To set up the alarm criteria that will trigger the monitoring check
    that you just created, click **Create Alarm**.
