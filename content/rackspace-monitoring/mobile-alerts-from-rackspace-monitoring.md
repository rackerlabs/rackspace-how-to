---
permalink: mobile-alerts-from-rackspace-monitoring/
audit_date:
title: Mobile alerts from Rackspace Monitoring
type: article
created_date: '2014-08-13'
created_by: Bekki Bolthouse
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: RackspaceMonitoring
product_url: rackspace-monitoring
---

Sometimes, an email alert isn't enough. If you are on call, on the go, or far from Wi-Fi, mobile alerts are a necessity. For the most critical problems, you can set up notifications from multiple form factors, combining SMS with any of our other [notification types](https://support.rackspace.com/how-to/rackspace-monitoring-checks-and-alarms/).

<img src="{% asset_path rackspace-monitoring/mobile-alerts-from-rackspace-monitoring/CMSMS1.png %}" alt="" width="320" height="254" border="2" />

### Get notified with SMS

As a Rackspace Monitoring customer, you can now leverage unlimited SMS worldwide, at no additional cost. SMS alerting has the following advantages:

- Ensures that you never miss a major incident
- Adds another layer of redundancy to your alerting
- Pushes alerts to your device, so that you don't need to pull them down from a mail server
- Supports the most basic devices and doesn't require an expensive data plan<sup>1</sup>
- Delivers alerts anywhere you have a cell signal<sup>2</sup>

<sup>1</sup> *Standard text messaging rates from your carrier apply*
<sup>2</sup> *Currently our service supports over 1,000 carriers in 196 countries*

If you are not yet using Rackspace Monitoring, sign up at no cost on [the Rackspace website](https://cart.rackspace.com/cloud/?cp_id=cloud_monitoring).

## Set up alerts

You configure SMS alerts for your account by adding one or more new notifications via the [raxmon CLI](/how-to/getting-started-with-rackspace-monitoring-cli). You can add SMS alerts to an existing notification plan, or you can create a new one. Be sure to attach the notification plan to one or more alarms. For step-by-step guidance, see the tutorial on setting up notifications and notification plans in the Rackspace Monitoring [_Getting Started Guide_](https://developer.rackspace.com/docs/rackspace-monitoring/v1/developer-guide/#document-api-operations/notifications-operations).

**Note:** You can create alarms and notifications in any order, but to create a new notification plan, you need to create a notification first.

### Tune out unwanted alerts

If you receive too many texts, or you don't want to get alerts during a maintenance period, you can perform the following actions:

- Set up [Suppressions](http://www.rackspace.com/blog/mute-cloud-monitoring-notifications-with-suppressions/) to mute alerts during planned events.
- Reconfigure your alerting preferences in the Cloud Control Panel or use the raxmon CLI.
- Tune your notification plans to ensure that only the most important notifications are sent by SMS.
- Reply STOP to any text. This action stops all SMS alerts for that phone number - for all alarms.

The SMS alerting functionality is available to US and UK Rackspace Monitoring customers.

### Contact and help

- freenode IRC #cloudmonitoring

- Continue to send us feature requests on the [Rackspace Monitoring Customer Forum](https://feedback.rackspace.com/forums/250746-cloud-hosting/category/81812-cloud-monitoring).

- Complete API documentation for [Rackspace Monitoring](https://developer.rackspace.com/docs/rackspace-monitoring/v1/developer-guide/#document-developer-guide)
