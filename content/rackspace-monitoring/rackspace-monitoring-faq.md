---
permalink: rackspace-monitoring-faq/
audit_date:
title: Rackspace Monitoring FAQ
type: article
created_date: '2015-12-10'
created_by: Stephanie Fillmon
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

### Getting Started

#### How many zones can I monitor my resources from?

There are six monitoring zones:

-   Blacksburg (IAD)
-   Dallas-Fort Worth (DFW)
-   Chicago (ORD)
-   London (LON)
-   Hong Kong (HKG)
-   Sydney (SYD)

Using multiple monitoring zones eliminates the need for maintenance and
upgrade downtime, as well as ensures your monitoring services remain
uninterrupted even in the event of a datacenter failure. You can find an
up-to-date list of monitoring zones in the [Rackspace Monitoring
Developer
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-index).

#### What are the various terms I need to know when using Rackspace Monitoring?

For more information, see the
[Concepts](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-concepts)
section in the Rackspace Monitoring Developer Guide.

#### How do I configure my monitoring system?

Rackspace Monitoring is an API-based system. You can access it using the
following methods:

-   [Cloud Control
    Panel](/how-to/available-checks-for-rackspace-monitoring)
-   [raxmon command-line
    interface (CLI)](/how-to/getting-started-with-rackspace-monitoring-cli)
-   [Rackspace Monitoring
    API](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/)

To set a monitoring check using the Cloud Control Panel, log into the
Control Panel and go the **Server Details** page of a Cloud Server. Then
scroll down to the **Monitoring Checks** section and click **Create Check**.

If you would like to practice setting up a monitoring check using the
CLI, consult the [Rackspace Monitoring Getting Started
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-getting-started).

For a complete list of Rackspace Monitoring API endpoints, see the
[Rackspace Monitoring Developer's
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/).

#### What are the ways to receive an alert when my website is down?

We currently support email, SMS, PagerDuty, VictorOps and webhook. You
can find the most up-to-date information in the [Notification
types](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notification-type-operations)
section in the Rackspace Monitoring Developer's Guide.

#### What does Rackspace Monitoring actually monitor?

Anything with a URL or an IP address that is not blocked by a firewall.
You can find more information in the
[Checks](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/check-operations)
section in the Rackspace Monitoring Developer's Guide.

#### Why do I need Rackspace Monitoring?

As the complexity of your business increases with the number of
products, customers, websites, etc., there is an increasing possibility
of one or more of your resources suffering from a variety of system
failures. Learning of a problem from your customers means that you've
already lost business, and your customers are already having a negative
experience using your website or application. Preventing this is what
Rackspace Monitoring is all about.

#### What is Rackspace Monitoring?

Rackspace Monitoring is an API driven cloud service built for
infrastructure monitoring. It offers a simple yet powerful feature-set,
allowing extreme flexibility in configuration and execution. Very
simply, we help answer the question, "Is my service up and running?"" To
do that, we have two simple objectives; to alert the resource owner
before their customer knows, and to take measure against allowing the
system to go down in the first place.

### Account Services

#### Can I use a UK account as well as a US account?

Yes, you can use both US and UK accounts. This is a global system that
works with both identities. Use the identity server where your tenant
lives and pass that token and tenantId to the Rackspace Monitoring
system.

#### What is High Availability?

High availability is a feature unique to Rackspace Monitoring. Because
we provide Monitoring as a Service hosted in the cloud, we are able to
keep that service up and running without any downtime. When implementing
improvements to the system, we can take a region down for an upgrade,
even lose another data center due to a localized disaster or event, and
Rackspace Monitoring will continue to monitor your resources and send
you notifications.

#### Where can I tell Rackspace about features I would like added or issues I discover while using Rackspace Monitoring?

Please let us know of any features you would like added or any issues
you find via the [Rackspace Product
Feedback](https://feedback.rackspace.com/) forums. For more immediate
assistance with a time-sensitive issue, please file a ticket or contact
your account team.

#### Will you support SNMP traps?

Not yet, but we are planning on starting in the near future.

#### How is Rackspace Monitoring billed?

Rackspace Monitoring bills you by how much you use. While other monitoring
services lock you into a month-long or even year-long contract, with Rackspace
Monitoring, you are billed by the hourly usage based on how many checks were
running in that hour, and from how many monitoring zones were involved.
Adjusting your usage is quick and easy, and this flexibility can help
reduce unnecessary costs. Never again will you have to pay for more
than what you use.

### Notification Plans

#### What is a notification plan?

A notification plan contains a set of actions that Rackspace Monitoring
executes when triggered by an alarm. You may have multiple notification
plans in your cloud account.

#### How are notifications used?

Each monitoring check can reference one notification plan. When an alarm
for that check triggers the critical state, the notification plan
associated with the check is used.

#### What does the default notification plan, Technical Contracts - Email, do?

If you do not set up a custom notification plan, then by default, email
is sent to all of the technical contacts on your account. If your
account lists no technical contacts, then the primary contact is
emailed. You can view the list of contacts for your account on the User
Management Page in the [Cloud Control
Panel](https://mycloud.rackspace.com).

#### What does the Rackspace Managed Notifications plan do?

It creates a support ticket within your account. This feature is
available only to customers with a Managed Operations service level.

#### How do I set up a custom notification plan?

You can use the Rackspace Monitoring API. For instructions, see the
[Rackspace Monitoring Developer
	Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/).

#### Where can I download the Rackspace Monitoring CLI?

You can find the download for the Rackspace Monitoring CLI on the
[Python
website](https://pypi.python.org/pypi/rackspace-monitoring-cli/0.4.5).

#### Where can I find the API documentation for Rackspace Monitoring notification plans?

You can find information about Rackspace Monitoring [notification
plans](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notification-plans-operations)
in the Rackspace Monitoring Developer Guide.

### Monitoring and Troubleshooting

#### Aren't my cloud resources already being monitored?

We will only notify you when there is a problem with our infrastructure
that impacts your Cloud resource. We do not run monitoring checks on
your individual Cloud Servers, Cloud Load Balancers, or websites to
verify functionality. This leaves a lot of exposure in situations where
the infrastructure is working fine, but a given application or resource
in your Cloud setup has stopped functioning correctly, leaving your site
performance degraded, or totally inaccessible.

#### What kind of additional monitoring is available for my cloud resources?

It can take a lot of administrative overhead in order to correctly
configure and maintain a robust monitoring application. If there is no
built-in redundancy for the monitoring application, you could lose all
monitoring services if the server hosting your monitoring application
runs into trouble. A simpler option, with built-in redundancy, is to use
the newly available Rackspace Monitoring service. It provides you with
four key pieces of information that can help you manage your business as
well as address and prevent infrastructure problems before they affect
your customers.

#### How do I set up Rackspace Monitoring?

Rackspace Monitoring is released through the cloud without need for
software installation on servers or computers. By eliminating the need
for installation, Rackspace can upgrade the monitoring service without
involving the customer. This process hides the complexity of the upgrade
and maintenance processes from the customer, giving them a simple and
reliable experience.

#### Can I view historical metrics for monitoring checks?

You can access metrics for a check directly by using the [Rackspace
Monitoring
API](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/metrics-operations).
You can also access metrics by using the [Rackspace Intelligence
portal](https://intelligence.rackspace.com/).

#### How do I submit commands through the Rackspace Monitoring API?

As with any commands you will submit to your Cloud resources through the
API, you must first authenticate through the API in order for the
commands to be correctly processed.

In the [Rackspace Monitoring Developer
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/),
we show the detailed configuration options available with this service
offering, and the necessary components to build functioning monitoring
checks. This will require you to work with the following components:

-   Account - An account contains attributes describing your account.
    This description contains mostly read only data; however, a few
    properties can be modified with the API.
-   Entities - An entity is a resource that you want to monitor. Some
    examples are a server, a website, or a service.
-   Checks - Checks explicitly specify how you want to monitor
    an entity.
-   Check Types - These are the available service monitoring checks that
    you can configure, such as PING, HTTPS, SMTP (and many more).
-   Monitoring Zones - A monitoring zone is the "launch point" of
    a check. You can launch checks from multiple monitoring zones.
-   Alarms - An alarm contains a set of rules that determine when a
    notification is triggered.
-   Notifications - A notification is an informational message sent to
    one or more addresses when an alarm is triggered.
-   Notification Plans - A notification plan is a set of notification
    rules to execute when an alarm is triggered.

### General

#### Is there a discount for companies that need to monitor in bulk?

Please contact our sales department in order to make a custom service
plan that will both cover your monitoring needs and fit your budget.

#### If I am a Managed Servers customer, may I use this?

Yes, but you will need a Cloud account. You configure your own
notifications, so alerts may only go to you (the user). A Racker will
not respond to your alarms unless they are included in the
notifications.

#### Will this be available globally or US only?

This is a global product which is supported in both the US and UK. We
have a primary datacenter in the UK that can process alerts on its own
if the link between the US and UK goes down, as well as other
data centers that act as safety nets in case of localized data center
failure; no matter what, your monitoring service will remain functional.

#### What is a Monitoring Zone?

A monitoring zone is the launch point of a check. You can launch
checks from multiple monitoring zones.

#### What is an Alarm?

An Alarm is a set of rules that determine what status is returned based
on the result of the check.

#### What mechanism do we use to check that the site content is reliably correct?

At this time, we don't do "synthetic transactions" (a simulated set of
actions.) However, we do support checking the HTML of the response. We
follow redirects but don't check content within a frame/iframe.

#### What is a Notification Plan?

A Notification Plan is a set of actions undertaken when a certain status
is returned by the check.

#### Do we have a detailed recipe or plan for how to monitor a hosted app?

Right now we have a Getting Started Guide which is an evolving document
that is updated on a regular basis. This guide includes situations set
up as well as just an overview of how to use some of the tools to start
getting value. We are working on setting up a feedback site for dealing
with customer feature requests.

#### What is a notification?

A notification defines how the customer wants to be contacted in the
case of a system failure.

#### How secure is the Rackspace Monitoring system?

The Rackspace Monitoring system is extremely secure. Before releasing
the product, an independent firm assessed the level of security of the
Rackspace Monitoring systems and API, and all reported issues have been
addressed. You can have confidence that Rackspace Monitoring is both
safe and secure.

#### What is a check?

A check specifies what aspect of the resource you wish to monitor.

#### What is the most important aspect of Rackspace Monitoring?

The user experience. At Rackspace, we strive to make your interactions
with us and our products as easy as possible, and we work towards
improving that experience every day. Rackspace Monitoring was built
first and foremost with the user in mind - we want your experience to be
even easier than ours when using the product.

#### What is an entity?

An entity is the resource (website, server, etc) you wish to monitor.

#### Once I've made a check, how will I know it works?

We have an on-demand simulation feature which allows the user to test
the functionality of their monitoring system by simulating a normal
operating situation.

#### Why do you not have everything other monitoring services have?

Rackspace Monitoring was built as a means, not an end. Although just as
(and in many aspects, more) advanced than the other monitoring services,
Rackspace Monitoring has promoted reliable functionality and a solid
foundation over superficial "whizz bang" features. This is by no means
the final product - we plan to continue innovating and improving on what
we have already, which is a solid, reliable foundation for the future.
Customer feedback remains a very valuable source of input concerning the
direction of Rackspace Monitoring.

#### How responsive is the system to change, especially in large numbers?

Rackspace Monitoring tries very hard to make sure that if a change fails
it let's the customer know. Deliberate action is necessary in a
monitoring system. Along with that scalability has been one of our
priorities from the beginning. Even if a customer adds thousands of
Cloud Servers in minutes, Rackspace Monitoring can instantly begin
monitoring all of them.

#### How does this compare to open source solutions like Nagios?

It is targeted at replacing these type of tools. Right now we don't
offer all the features of Nagios; however, Rackspace Monitoring is
hosted as a service, API driven and built for the cloud. Rackspace
Monitoring also provides geographically redundant checks which is
something that is generally very difficult to get with any solution.
Customers will get to leverage our big datacenter footprint, incredible
scalability, and our continuous release feature. Future improvements to
the service will be released as they become functional (no need to wait
for an upgrade package, and no need for downtime).

#### Will there be an API call or published URI to get all the collector IPs as with Cloudkick?

Listing monitoring zones will give you CIDRs of the set of collectors
in that zone. To get the most accurate list possible use this API call.

### Does "60 day retention" mean "default 60 days on all customer alert log data"? If so, can customers ask that it be less than 60 days for some bizarre reason?

Not today, we will have more flexibility in setting policies in the
future though.

#### Are there good patterns to use to better leverage the alarm language?

Most of the interesting patterns are represented here. Let us know in
the comments if there are additional examples you'd like to contribute.

#### How are email notifications sent? Do I need to worry they will end up in my SPAM folder?

Email notifications are sent via Mailgun. They make sure that email will
be sent properly and not placed into SPAM folders.

#### Why separate out the check/alarm concept?

We wanted to build a state of the art monitoring platform. This requires
the data collection to be separate from the thresholding. On the CLI/API
level, this is a more complex user experience, but provides the most
flexibility. The dashboard GUI simplifies the process for those users
who don't want to work with a CLI.

#### I've heard about alarm language. How does it work?

The alarm language is one of the coolest features in the product. In
past experiences, we've discovered that building an API around
thresholds was really cumbersome. So we decided to represent thresholds
in a javascript-like language. It gives you the ability to write some
very concise thresholds. For a list of examples, see [Best practices for
creating
alerts](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#best-practices-for-creating-alerts)
in the Rackspace Monitoring Developer Guide.

#### What is the production URL?

The production URL is <https://monitoring.api.rackspacecloud.com>.

#### Is there a set of command line tools to use with Rackspace Monitoring?

Yes. Check out the [raxmon
project](https://github.com/racker/rackspace-monitoring-cli). It uses
the Apache Libcloud framework for building a reliable API implementation
that functions well.

To avoid repeating the raxmon installation on each new Cloud Server,
install it on your workstation and not your server.

**Note**: raxmon requires Python 2.5, 2.6 or 2.7.

#### Is there a good tutorial for customers unfamiliar with monitoring in general?

Yes - please visit our [Rackspace Monitoring Getting Started
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-getting-started),
which can guide you through the steps in creating your Rackspace
Monitoring setup from scratch.

#### Why would I want to monitor from multiple monitoring zones?

Monitoring from multiple monitoring zones allows you to monitor the
experience of customers from many locations, which is important for
companies that do business in more than one region. Consider this: your
website might be working fine in the Western United States, but users
from the Eastern half of the country are experiencing high load times
and non-responsive web pages. Monitoring from just a western data center
would report an OK status, but if you also monitor from the eastern data
center, you will be alerted to this problem before it affects your
customers.

If you're only monitoring from a single zone, and for some reason there
is an error with a check, you may get false notifications that your site
has a problem, when in reality it is working fine. Using multiple
monitoring zones helps prevent these false alarms by verifying a system
failure from multiple sources before alerting you. Or, you can have it
send you a message if even just one check returns a failure status - the
level of customization possible through our alarm language is
incredible.

### API

#### How do you see monitors for both your Dedicated and Cloud Servers?

Through the API by using a check:
[here](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/check-operations).

Through the Raxmon CLI:
[here](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#using-the-raxmon-client).

#### How fast and easy is it to work with the API?

You must set up your account at the Rackspace Cloud account signup
process [here](https://cart.rackspace.com/cloud/).  Once complete,
adding incremental monitoring is fast and easy, especially in the [Cloud
Control Panel](https://mycloud.rackspace.com/).
