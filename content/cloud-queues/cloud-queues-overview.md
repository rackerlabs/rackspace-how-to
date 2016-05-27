---
permalink: cloud-queues-overview/
audit_date:
title: Cloud Queues Overview
type: article
created_date: '2013-10-16'
created_by: Megan Meza
last_modified_date: '2016-05-02'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

Cloud Queues is an open-source messaging system, designed to help
customers build and scale distributed applications in the cloud.  The
Cloud Queues API is built to be flexible, supporting a variety of
messaging patterns like producer-consumer, poll based
publisher-subscriber, and point-to-point.

Queuing systems like Cloud Queues are meant to decouple resources in an
application by serving as a communication layer between those resources. Instead of a server in an application telling another server do to a
task, they post a message to a queue.  Then, the server performing work
can check that queue for work when it is available. This prevents an
application from slowing down due to servers being busy, offline,
unavailable, etc. Using Cloud Queues as a middle layer means that
servers producing work can post messages to the queue as quickly as
needed, without caring if a server is available to do that work.
 Servers working on tasks can easily be scaled up and down as needed.
For pricing and service information, please see [the Cloud Queues product page](http://www.rackspace.com/cloud/queues/) on our website.

### Example use cases

Most distributed applications will have the need for a queuing system,
but here are some specific examples for some common messaging patterns:

#### Producer-Consumer

A producer-consumer model is the most popular
way to use a queuing system.  A good example of this is a website that
allows users to signup for the company's newsletter.  As customers fill
out the online form, they need to be sent a confirmation email to ensure
they own the email address.  Web servers responsible for running the
website will place a message on a queue every time a customer submits
their form, "send_conf_email" for example.  Applications servers
responsible for sending email will be checking the queue every minute to
see if any new jobs are ready to for work.  A server will claim the
message, ensuring no other servers attempt to do the same work, it will
complete the tasks, and then delete the message, signifying the task is
complete.  Many applications will use multiple queues for different
types of tasks.  For example, another job called "update_salesforce"
may be triggered by this same event.

#### Publisher-Subscriber

The publisher-subscriber pattern is often
used as the underlying component of a notifications service.  One of the
most common examples is an RSS feed.  Customers signup online to receive
alerts when an event happens, for example, when their company name is
mentioned in an online article.  In this example, there is an agent
looking online at all times for certain keywords.  As it finds articles,
a message will be posted to the queue that contains the article's
information.  Servers responsible for alerting, the "subscribers" in
this case, will poll the queue every 1-5 minutes to see if any new
updates have been posted.  If so, they will email anyone who has signed
up for updates.

Please see the [Cloud Queues FAQ](/how-to/cloud-queues-faq)
for more information on features, limits, support, and more.
