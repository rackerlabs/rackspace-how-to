---
permalink: AIOP's-tier2-situations/
audit_date: '2020-08-24'
title: Ticket configuration guide
type: article
created_date: '2020-08-24'
created_by: Rose Morales
last_modified_date: '2020-08-24'
last_modified_by: Rose Morales
product: Account Management
product_url: account-management
---

### About this guide

Rackspace Technology is deploying AIOP's which is a feature that applies artificial intelligence (AI) to your monitoring system. The AIOP's feature changes the way in which you work with alerts. The purpose of this guide is to provide existing customers with the following information:

- A description of what is changing, how the change impacts you, and the benefits you will receive
- An introduction to situations tickets and how to interpret them
- How to view related alerts in Notifications
- How to modify notification preferences to limit email notifications

**Intended audience:** This guide is written for existing Rackspace Technology customers who are familiar with how the current monitoring and alerting system works.
</br>

### Overview of what's changing

The Rackspace Technology monitoring system collects raw data, called events, from our monitoring systems and applies machine learning to deduplicate them into alerts. Rather than notifying you each time an alert occurs, AIOP's analyzes and groups them together based on their similarity. These groups are known as **Situations**.

Situation tickets offer the following benefits:

- By identifying situations, AIOP's reduces noise and alert fatigue, granting you the ability to resolve the issues that are most critical to your system as they arise.
- Instead of multiple Rackspace Technology support representatives working to resolve multiple alerts, there is a one Rackspace Technology support representative working on one, situational ticket.

Before AIOP's, each alert generated a ticket and then any related alerts also created tickets. The Rackspace Technology support team then worked individual tickets independently. This approach resulted in on a flood of tickets and subsequent updates where multiple Rackspace Technology support representatives handled multiple alerts for the same issue.

For example, if a server went down because it ran out of RAM, the monitoring system generated a **Memory Threshold Reached** alert and ticket. The server down scenario then generated an **Apache Service is down** alert and ticket. If the problem continued, the monitoring system also generated an **SSH alert** because the server cannot be reached. AIOP's gather these three alerts into a situation that can be worked by a single Rackspace Technology support representative.

IMAGE

After the AIOP's integration, a situation (a collection of one or more alerts) is created and a single corresponding ticket is created referencing the situation. The support teams required to work the situation are notified and engaged and you receive updates from the single ticket.

IMAGE
</br>

### About situation tickets

AIOP's ingests the data collected by your monitoring systems, the event properties are mapped to the AIOP's data fields and the source event becomes an AIOP's event. The events are deduplicated and they become an alert, this prevents the duplicate alerts from being worked on separately. Events are clustered into **situations** based on their similarities using algorithms with machine learning capability and there are a variety of ways to cluster alerts, some might be clustered purely by their arrival time, while others may be clustered by the time, text string or description. There may be some deterministic logic setup by your administrator to cluster certain alerts in a specific way.

AIOP's also correlates the situation information with the information from other systems. At the enrichment phase may be tied to a ticket and at this point the right people will be notified to respond. When you receive a notification, you can jump right into the war room, and once the case is resolved the data becomes referenceable automatically, as the new situations form AIOP's will identify similar cases from the past record and propose them for easy reference.
</br>

### Interpret a situation ticket

This section describes how to interpret the following sections of a situation ticket:

- Subject line
- Initial and additional comments
- Ticket summary
</br>

#### Subject line

Situations tickets are dynamic and updated continuously. As the ticket is generated and alerts are added to situation, the subject line is updated to reflect the most recent information.

The following image illustrates the subject line of a situation ticket.

![](RackMultipart20200824-4-1yql7i_html_ac538a0c83f106af.png)

The following table describes each part of the subject line of a situation ticket:

| **Section** | **Description** |
| --- | --- |
| **Situation number** | Each situation ticket is assigned a unique situation number. |
| **Alert description** | Provides a short summary of why the alert fired. |
| **Device count** | The number of devices included in the scope of the situation ticket. |
| **Alert count** | The number of alerts associated with the situation ticket. |
| **Ticket number** | Each situation ticket is assigned a unique ticket number. |
</br>

#### Initial and additional comments

The situation ticket is updated when an alert is added to the situation. The update includes the new alert along with a link to the situation and the Rackspace Notification System (RNS).

The following image illustrates an updated sample situation ticket.

IMAGE

Refer to the following table to understand how to interpret a situation ticket.

| **Section** | **Description** |
| --- | --- |
| **A** | **Notifications Link** : Click the link to view the associated alerts on the **Notifications** page of the Rackspace Technology Customer Portal. **Important** : You do not see notifications for devices for which you do not have permissions. If you do not see any related notifications, review your device permissions. After you adjust the permissions, you will see alerts generated from that point forward. |
| **B** | **Situation Details** : Shows the unique situation number, the Account Number associated with the situation, and the date/time the system generated the situation ticket. |
| **C** | **Clustered Alerts** : Lists the alerts associated with the situation ticket. |
</br>

#### Ticket summary

When a situation is cleared, the system updates the situation ticket with summary information.

**Note:** The summary includes all alerts associated with the ticket. Alerts that were initially internal to Rackspace Technology and not visible to you are included.

IMAGE

Refer to the following table to understand how to interpret a situation ticket summary.

| **Section** | **Description** |
| --- | --- |
| **A** | **Situation Cleared** : When a situation is resolved, the system updates the situation ticket as cleared. |
| **B** | **Clustered Alerts** : Lists the alerts associated with the situation ticket that have also been cleared. |
</br>

### Navigate to alerts in RNS

The Rackspace Notification System (RNS) contains all alerts associated with a situation ticket. From within the ticket, you can navigate to the **Notifications** page in the Rackspace Technology Customer Portal.

To navigate to the **Notifications** page, click the link in the ticket.

IMAGE

The list of alerts that appears on the **Notifications** page is filtered to include only the notifications associated with the selected situation ticket.

- Use the left panel to select the alert you want to view.
- Use the right panel to see the alert message, view its details, and see the associated device.
- Click **Actions** to reply to the ticket or modify preferences so that you do not receive notifications emails for each alert posted to the **Notifications** page.

IMAGE

You can also complete the following steps to navigate to the **Notifications** page:

1. Log in to the [Rackspace Technology Customer Portal](http://login.rackspace.com/).
2. On the top toolbar, click **Notifications**.

The unfiltered list of notifications appears in the left pane. When you click on an alert notification that has related alert notifications, all related alert notifications highlight.

IMAGE

#### Notification emails

By default, the notification system sends you an email for each alert associated with a situation ticket. This default setting means that you will receive an email for each situation ticket and all associated alerts. To receive email just for the situation ticket, refer to Configure notification email preferences.

The following image shows you an example notification email.

IMAGE
</br>

### Configure notification email preferences

By default, you receive an email for a situation ticket and for associated alert notifications. This setting can produce many emails. For example, when a server goes down you will receive a ticket email and separate alert notification email informing you of insufficient memory, unavailable apache service, and an SSH error.

You can modify notification preferences to reduce the number of emails you receive. You can turn off email notifications globally for all devices or you can select the devices for which you do not want to receive email notifications.

**Important** : When you turn off email notifications either globally or for specific devices, you will not receive any notification emails, including warning notifications that are not associated with a situation ticket.

- For example, consider a disk usage scenario where the monitoring system generates a warning alert at 75% usage and an error alert at 90% usage. In this scenario, the 75% warning alert appears in RNS, but a ticket is not generated. When disk usage exceeds 90%, the monitoring system generates a ticket.

You must configure notification preferences for each user. You cannot modify notification preferences for all users, in bulk.

Complete the following step to configure notification email preferences:

1. Log in to the Rackspace Technology Customer Portal and click  **Notifications**.

2. Click  **Edit Preferences**.

3. Click a username.

4. Perform one of the following:

    - To turn off email notifications globally for all devices, click the slider to the off position, and click **Update Preferences**.

    - To turn off email notifications for a device, expand the **Monitoring** section, clear the checkbox for each device for which you do not want to receive notification emails, and click **Update Preferences**.

IMAGES
