---
permalink: optimize-your-website-on-cloud-sites/
audit_date:
title: Optimize your website on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

This article describes some best practices and suggestions for
optimizing your website on Cloud Sites.

### Using SSL

SSL might be right for your website, but it should be used only when
necessary. SSL traffic is encrypted and causes additional server
processing time. We recommend that you pass only the traffic that needs
to be secure to the SSL servers because the non-SSL clusters are more
robust and are better equipped to handle traffic spikes.

To accomplish this task, create a subdomain (for example,
**secure.example.com**) and enable SSL for the subdomain through which
only secure transactions will be processed. This action allows SSL
traffic to pass through a separate location and provides customers with
a visual cue that they are on a secure site.

For information about setting up a subdomain, see [Creating subdomains or domain aliases](/how-to/getting-started-with-cloud-sites-creating-sub-domains-andor-domain-aliases).

For details on adding SSL to a site, see [Configuring SSL on your websites](/how-to/getting-started-with-cloud-sites-configuring-ssl-on-your-websites).

### Serving static content

For the best performance, we recommend migrating all static media files
(images, video, audio, flash, and so on) to the content delivery network
(CDN) of your choice. We offer CDN integration with Akamai via our Cloud
Files offering, but any CDN will work.

This process gives your customers decreased latency when accessing media
because the content is cached and served by servers closest to their
physical location. For more information about using Cloud Files, see the
[Cloud Files introduction page](/how-to/cloud-files).

### Optimizing the database

A well-optimized database and database queries can increase the
performance of your website. An inefficiently designed database can slow
your website to a crawl. Optimizing queries, creating indexes, and
setting the most appropriate engine type (if MySQL) can increase the
performance of your website, when done correctly.

Consult a professional database administrator (DBA), if necessary.

### Coding efficiently

Efficient code always yields a better-performing website. This is
especially true for a busy website. Issues that are not evident during
light or normal traffic become noticeable when traffic to the website
increases.

Reducing the number of file system operations, external calls, and
includes, and reducing or optimizing database queries will allow your
website to perform and scale more efficiently.

#### Planning for high traffic

**Note:** If you are expecting an increase in traffic to your website, create a
Support ticket for your site with the following subject line: Expected
High Traffic *websiteName*.

In the ticket, provide information about the amount of expected traffic
and the date that you expect the traffic to begin to increase by
providing the following details:

-   Whether the site is provisioned as an SSL site
-   Target URLs
-   Source IP addresses (if known)
-   Date and time of the event, with the time zone
-   Duration of the event
-   Expected traffic volume (in requests per second)
-   Type of application (for example, proprietary, commercial,
    open source)
-   CMS (for example, WordPress, Drupal, Joomla) if applicable
-   Whether the application or site makes any third-party calls to
    domains outside of Cloud Sites (for example, RSS feeds, APIs, cURL)
-   Whether the application or site caches to a file system or database
-   Emergency contact information, including a cell phone number

Submit your ticket at least seven days before the expected high traffic
date. If applicable, disable comments and chat and traceback
functionality during your event.

### Additional resources for website optimization

See the following optimization articles that apply to your websites:

-   [Optimize SugarCRM](/how-to/optimize-sugarcrm-on-cloud-sites)
-   [Optimizing your Drupal site](http://www.rackspace.com/blog/optimizing-your-drupal-site/)
-   [Accelerating WordPress with Cloud Files and the W3 Total Cache Plugin](/how-to/accelerating-wordpress-with-cloud-files-cdn-and-the-w3-total-cache-plugin)
-   [Using WP-SuperCache to optimize Wordpress on Cloud Sites](/how-to/using-wp-supercache-to-optimize-wordpress-on-cloud-sites)
