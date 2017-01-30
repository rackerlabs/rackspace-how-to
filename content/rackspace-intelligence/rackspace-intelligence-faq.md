---
permalink: rackspace-intelligence-faq/
audit_date:
title: Rackspace Intelligence FAQ
type: article
created_date: '2015-05-15'
created_by: Constanze Kratel
last_modified_date: '2016-01-20'
last_modified_by: Stephanie Fillmon
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

### Getting started

#### What is Rackspace Intelligence?

Rackspace Intelligence delivers an intuitive interface that gives you a
transparent view into the health of your infrastructure, along with
actionable insights to improve system performance and availability. It
provides a universal dashboard that enables you to obtain information
about any monitoring tools and entities regardless of your underlying
infrastructure. You can use it to configure monitoring on your entities,
such as servers and databases, and view their monitoring status. It also
provides visualizations that give you a view of the trends in your
resource use.

#### Who can use Rackspace Intelligence?

All Rackspace customers with a Cloud services account can use Rackspace
Intelligence.

#### How do I sign up for Rackspace Intelligence?

There is no separate sign-up process for Rackspace Intelligence. If you
have a Cloud services account, log in to
<https://intelligence.rackspace.com> using your Rackspace Cloud
credentials.

#### Can I use Rackspace Intelligence for both Cloud and Dedicated accounts?

Yes, both Cloud and Dedicated accounts have access to Rackspace Intelligence. For more information, see [Getting Started with Rackspace Intelligence for the cloud](/how-to/getting-started-with-rackspace-intelligence-for-the-cloud) and [Getting Started with Rackspace Intelligence for dedicated accounts](/how-to/getting-started-with-rackspace-intelligence-for-dedicated-accounts).

#### What are the benefits of using Rackspace Intelligence?

With this set of visualization and analytics tools, you no longer have
to set up, maintain, or pay for an additional set of tools.
Additionally, the intuitive dashboard enables collaboration with Support
Rackers.

#### How do I access Rackspace Intelligence?

Go to
[https://intelligence.rackspace.com](http://intelligence.rackspace.com)
and log in by providing the username and password for your Rackspace
Cloud account.

Alternatively, if you already logged in to the [Cloud Control
Panel](https://mycloud.rackspace.com), you can click the **Servers**
menu and then click **Rackspace Intelligence**. A new browser tab
displays the Rackspace Intelligence portal.

#### How much does Rackspace Intelligence cost?

Rackspace Intelligence is available at no charge for Rackspace customers
with a Cloud services account.

#### Is there an API for Rackspace Intelligence?

Rackspace Intelligence currently does not expose an API. However, many
monitoring-related features, such as the creation and editing of checks
and alarms, are built using the
[Rackspace Monitoring API](https://developer.rackspace.com/docs/rackspace-monitoring/v1/).

------------------------------------------------------------------------

### Account services

#### Are any features of Rackspace Intelligence limited to specific service levels?

All the features in Rackspace Intelligence are available to all service
levels (Managed Infrastructure and Managed Operations) for all Cloud
customers.

#### How can I provide feedback about Rackspace Intelligence?

If you want to suggest features to add to Rackspace Intelligence, or if
you discover any issues, click the **Feedback** link at the top of the
[Rackspace Intelligence Portal](https://intelligence.rackspace.com/).

------------------------------------------------------------------------

### Features

#### What is an entity?

An *entity* is a resource (for example, a website or server) that you
want to monitor.

#### Do I need to create entities manually to monitor them?

Rackspace Intelligence automatically creates entities for all of your
Rackspace cloud servers and databases. If you want to monitor other
systems, you must manually create entities for them.

#### What is a check?

A *check* specifies the aspect of the resource that you want to monitor.

#### What is an alarm?

An *alarm* is a set of rules that determine what status is returned
based on the result of the check.

#### Why are the concepts of checks and alarms separate?

We wanted to build a state-of-the-art monitoring platform, which
requires that data collection be separate from thresholds.

#### What is a notification?

A *notification* defines how the customer wants to be contacted in the
case of a system failure.

#### What is a notification plan?

A *notification plan* specifies a set of actions that are performed when
a certain status is returned by the check.

#### What features will be available in the future?

We plan to provide the following features in future releases:

-   **Available in GA** - Access to Rackspace Intelligence for Rackspace
    Dedicated customers: Provides the ability for Dedicated customers to also
    access Rackspace Intelligence for their devices.

-   **Available in future** - Customizable dashboards: Provides the ability to
    customize your dashboard in Rackspace Intelligence by adding widgets for
    graphs, drag-and-drop widgets, and more.
