---
permalink: rackspace-monitoring-faq/
audit_date: '2017-01-24'
title: Rackspace Monitoring FAQ
type: article
created_date: '2015-12-10'
created_by: Stephanie Fillmon
last_modified_date: '2017-01-24'
last_modified_by: Nate Archer
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

### Getting started

#### What is Rackspace Monitoring?

Rackspace Monitoring is an API-driven cloud service built for infrastructure monitoring.
It provides a simple yet powerful feature set that allows flexibility in configuration and
execution. Rackspace Monitoring helps keep your applications up and running. Remote
monitoring tests connectivity from regional zones deployed throughout our global data
centers, and agent-based monitoring gathers information from inside each resource.

#### How do I set up Rackspace Monitoring?

Rackspace Monitoring is released through the cloud without need for
software installation on servers or computers. By eliminating the need
for installation, Rackspace can upgrade the monitoring service without
involving the customer. This process hides the complexity of the upgrade
and maintenance processes from the customer, giving them a simple and
reliable experience.

#### Where can I monitor my resources from?

There are six monitoring zones:

-   Blacksburg, VA (IAD)
-   Dallas-Fort Worth (DFW)
-   Chicago (ORD)
-   London (LON)
-   Hong Kong (HKG)
-   Sydney (SYD)

Using multiple monitoring zones eliminates the need for maintenance and upgrade
downtime, and ensures that your monitoring services remain uninterrupted even if a
data center failure occurs. 

#### What are the various terms I need to know when using Rackspace Monitoring?

See the [Concepts](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/concepts/)
section in the Rackspace Monitoring Getting Started Guide.

#### How do I configure my monitoring system?

Rackspace Monitoring is an API-based system. You can access it using the and [start creating monitoring checks](/how-to/available-checks-for-rackspace-monitoring/) by using the following methods:

-   [Cloud Control Panel](/how-to/creating-a-monitoring-check-using-the-cloud-control-panel/)
-   [raxmon command-line interface (CLI)](/how-to/getting-started-with-rackspace-monitoring-cli/)
-   [Rackspace Monitoring API](https://developer.rackspace.com/docs/rackspace-monitoring/v1/)


#### How will I receive an alert when my website is down?

The service currently supports email, SMS, PagerDuty, VictorOps, and webhook
notifications. For more information, see the [Notification types](https://developer.rackspace.com/docs/rackspace-monitoring/v1/api-reference/notification-type-operations/)section in the Rackspace Monitoring API Reference.

#### What does Rackspace Monitoring actually monitor?

The service monitors anything with a URL or an IP address that is not blocked by a firewall.
For more informatio,n see [Checks](https://developer.rackspace.com/docs/rackspace-monitoring/v1/api-reference/check-operations/) section in the Rackspace Monitoring API reference.

#### Why do I need Rackspace Monitoring?

As the complexity of your business increases with the number of products, customers,
and websites, the possibility that one or more of your resources will fail also increases.
Learning of a problem from your customers means that you've already lost business,
and your customers are already having a negative experience using your website or
application. Rackspace Monitoring prevents these types of problems from occurring


### Account services

#### Can I use a UK account as well as a US account?

Yes, you can use both US and UK accounts. This is a global system that
works with both identities. Use the identity server where your tenant 
lives and pass that token and tenant ID to the Rackspace Monitoring
system.

#### What is high availability?

Because we provide monitoring as a service (MaaS) hosted in the cloud, we are able to keep that service up
and running without any downtime. Even if we take a region offline for an upgrade, or
lose a data center because of a localized disaster or event, Rackspace Monitoring
continues to monitor your resources and send you notifications.

#### How can I tell Rackspace about features I would like added or issues I discover while using Rackspace Monitoring?

Please let us know of any features you would like added or any issues
you find via the [Rackspace Community
](https://community.rackspace.com/) forums. For more immediate
assistance with a time-sensitive issue, please file a ticket or contact
your account team.

#### Does the service support SNMP traps?

Not at this time.

#### How is Rackspace Monitoring billed?

Rackspace Monitoring bills by hourly usage based on how many checks were running in
that hour, and from how many monitoring zones were involved. Adjusting your usage is
quick and easy, and this flexibility can help reduce unnecessary costs. 

### Notification plans

#### What is a notification plan?

A notification plan defines the actions that are performed when a certain status is
returned by the check. You may have multiple notification plans in your cloud account.

#### How are notifications used?

Each monitoring check can reference one notification plan. When an alarm for that
check triggers the critical state, the notification plan associated with the check is used.

#### What does the default notification plan, Technical Contracts - Email, do?

If you do not set up a custom notification plan, then email is sent to all of the technical
contacts on your account. If your account lists no technical contacts, then the primary
contact is emailed. You can view the list of contacts for your account on the User
Management page in the [Cloud Control Panel](https://mycloud.rackspace.com).

#### What does the Rackspace Managed Notifications plan do?

It creates a support ticket within your account. This feature is available only to customers with a Managed Operations service level.

#### How do I set up a custom notification plan?

You can use the Rackspace Monitoring API. For instructions, see the
[Rackspace Getting Started Guide](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/create-first-monitor/#creating-a-notification-plan).

#### Where can I find the API documentation for Rackspace Monitoring notification plans?

Information about Rackspace Monitoring [notification plans](https://developer.rackspace.com/docs/rackspace-monitoring/v1/api-reference/notification-plans-operations/)
is located Rackspace Monitoring API Reference.


### General

#### Is there a discount for companies that need to monitor in bulk?

To create a custom service plan that covers your monitoring needs and fits your budget,
contact our sales department.

#### Can Managed Servers customers, use Rackspace Monitoring?

Yes, but you need a Cloud account. You configure your own notifications, so alerts
might go only to you (the user). Rackers can’t respond to your alarms unless they are
included in the notifications.

#### Is this service available globally or only in the US only?

Rackspace Monitoring is a global product supported in both the US and the UK. Our UK
data center can process alerts on its own if the link between the US and UK goes offline,
and other data centers act as safety nets in case of localized data center failure. No
matter what, your monitoring service will remain functional.

#### What is a monitoring zone?

A monitoring zone is the launch point of a check. You can launch
checks from multiple monitoring zones.

#### What is an alarm?

An alarm is a set of rules that determine what status is returned based
on the result of the check.

#### What mechanism does Rackspace use to check that the site content is reliably correct?

At this time, Rackspace doesn't use "synthetic transactions" (a simulated set of
actions.) However, we do support checking the HTML of the response. We
follow redirects but don't check content within a frame/iframe.

#### What is a notification?

A notification defines how the customer wants to be contacted in the
case of a system failure.

#### How secure is the Rackspace Monitoring system?

The Rackspace Monitoring system is extremely secure. Before releasing
the product, an independent firm assessed the level of security of the
Rackspace Monitoring systems and API, and all reported issues have been
addressed. 

#### What is a check?

A check specifies what aspect of the resource you wish to monitor.

#### What is an entity?

An entity is the resource (for example, website or server) that you want to monitor

#### After I create a check, how do I know it works?

The service provides an on-demand simulation feature that you can use to test the
functionality of the monitoring system by simulating a normal operating situation.

#### How responsive is the system to change, especially in large numbers?

Scalability has been a priority from the beginning. Even if a customer adds thousands of
cloud servers in minutes, Rackspace Monitoring can instantly begin monitoring all of
them.

#### How does Rackspace Monitoring compare to open source solutions like Nagios?

Rackspace Monitoring is intended to replace these type of tools. Although Rackspace
Monitoring doesn’t offer all the features of Nagios, it is hosted as a service, API driven,
and built for the cloud. Rackspace Monitoring also provides geographically redundant
checks, which is generally difficult to get with any solution. Customers can leverage our
big data center footprint, incredible scalability, and our continuous release feature.
Future improvements to the service are released as they become functional, so there is
no need to wait for an upgrade package, and no need for downtime.

#### Can I request to retain alert log data for less than 60 days?

Not at this time.

#### How are email notifications sent? Do I need to worry they will end up in my spam folder?

Email notifications are sent via Mailgun. They ensure that email is sent properly and not
placed into spam folders.

#### Why separate out the concepts of checks and alarms?

To build a state-of-the-art monitoring platform, data collection should be separate from
the thresholds. On the CLI/API level, this is a more complex user experience, but it
provides the most flexibility. The UI simplifies the process for those users who don't
want to work with a CLI.

#### I've heard about alarm language. How does it work?

Building an API around thresholds can be cumbersome. So we decided to represent
thresholds in a JavaScript-like language. It gives you the ability to write some very
concise thresholds. For a list of examples, see [Best practices for creating alerts](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/alert-triggers-and-alarms/#best-practices-for-creating-alerts) in the
Rackspace Monitoring Technical Reference.

#### Is there a set of command line tools to use with Rackspace Monitoring?

Yes. Check out the [Raxmon project](https://github.com/racker/rackspace-monitoring-cli). It uses
the Apache Libcloud framework for building a reliable API implementation that functions well.

To avoid repeating the Raxmon installation on each new cloud server, install it on your workstation and not on your server.

**Note**: Raxmon requires Python 2.5, 2.6, or 2.7.

#### Is there a good tutorial for customers unfamiliar with monitoring in general?

Yes - please visit our [Rackspace Monitoring Getting Started Guide](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/), which can guide you through the steps in creating your Rackspace Monitoring setup from scratch.

#### Why would I want to monitor from multiple monitoring zones?

Monitoring from multiple monitoring zones allows you to monitor the experience of
customers from many locations, which is important for companies that do business in
more than one region. Consider that your website might be working fine in the western
United States, but users from the eastern half of the country are experiencing high load
times and unresponsive web pages. Monitoring from just a western data center would
report an OK status, but if you also monitor from an eastern data center, you will be
alerted to this problem before it affects your customers.

If you're only monitoring from a single zone, and for some reason there is an error with
a check, you might get false notifications that your site has a problem, when in reality it
is working fine. Using multiple monitoring zones helps prevent false alarms by verifying
a system failure from multiple sources before alerting you. Or, you can have it send you
a message if even just one check returns a failure status.

### API

#### How can I see monitors for both your dedicated and cloud servers?

Through the API by using a check. For more information, see the [Checks section](https://developer.rackspace.com/docs/rackspace-monitoring/v1/api-reference/check-operations/) of the API refrence.

Through the Raxmon CLI see
[Using raxmon to configure Rackspace Cloud Monitoring](https://developer.rackspace.com/blog/using-raxmon-to-configure-rackspace-cloud-monitoring/).

#### Can I view historical metrics for monitoring checks?

You can access metrics for a check directly by using the [Rackspace Monitoring API](https://developer.rackspace.com/docs/rackspace-monitoring/v1/api-reference/metrics-operations/).
You can also access metrics by using the [Rackspace Intelligence portal](https://intelligence.rackspace.com/).

#### How do I submit commands through the Rackspace Monitoring API?

As with any commands you submit to your cloud resources through the API, you must first authenticate through the API for the commands to be correctly processed.

In the [Rackspace Monitoring Developer Guide](https://developer.rackspace.com/docs/rackspace-monitoring/v1/),
provides the detailed configuration options available with this service
offering and the necessary components to build functioning monitoring
checks.

#### Is there an API call or published URI to get all the collector IP addresses as with Cloudkick?

Listing monitoring zones gives you the CIDRs of the set of collectors in that zone.
