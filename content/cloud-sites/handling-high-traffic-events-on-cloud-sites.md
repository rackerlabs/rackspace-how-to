---
permalink: handling-high-traffic-events-on-cloud-sites/
audit_date:
title: Handle High Traffic Events on Cloud Sites
type: article
created_date: '2012-10-10'
created_by: Tarun Bhatti
last_modified_date: '2016-01-05'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

Our environment is designed to scale from small to large volumes of
traffic, but since you know your business best we ask that you update us
on extra-large volume, high traffic events (HTE). For an idea of what to
expect you can compare your anticipated activity with these [high traffic event incidents](http://www.rackspace.com/blog/tag/high-traffic-events-hte/).

<img src="{% asset_path cloud-sites/handling-high-traffic-events-on-cloud-sites/traffic-spike.png %}" alt="" />

If you are expecting an abnormally high increase in traffic to your
website (ie. hundreds of thousands of visitors in a few hours) we
recommend reaching out to Support so we can monitor the event. Please
call or chat with us and we can create a ticket for you.

You may also submit a ticket with the subject line: "Expected High
Traffic Event for 'website name' on 'date'". We ask that you submit your
ticket at least 7 days before the expected high traffic date.

In the ticket please provide us with information on the expected volume
of traffic and the date you expect the traffic to begin to increase,
along with some other applicable information:

-   Whether the site is provisioned as an SSL site
-   Target URL(s)
-   Source IP address(es) (if known)
-   Date/time(s) of event (with time zone)
-   Duration of event
-   Expected traffic volume (in requests per second, estimate)
-   Type of application (proprietary, commercial, open source, etc.)
-   CMS, if applicable (Wordpress, Drupal, Joomla, etc.)
-   Any third-party calls from your app/site to domains outside of Cloud
    Sites (RSS feeds, APIs, curl, etc.)
-   Whether the app/site caches to a file system or database
-   Emergency contact info including cell phone number

If applicable, please plan to disable comments/chat and traceback
functionality during your event to reduce load.

Lastly, we recommend reviewing best practices for optimizing your web
site on Rackspace Cloud Sites. Read [Optimize your website on Cloud Sites](/how-to/optimize-your-website-on-cloud-sites) for
more information and details.
