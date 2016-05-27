---
permalink: connection-timeout-error-message-on-cloud-sites/
audit_date:
title: Connection timeout error message on Cloud Sites
type: article
created_date: '2012-04-05'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

When content is being served from your Cloud Sites websites, you might
occasionally receive the `Connection timed out - please try again` error
message. This article explains the causes of the error, provides steps
that you can take to improve the experience, and tells you about the
steps we have taken to mitigate the problem.

<img src="{% asset_path cloud-sites/connection-timeout-error-message-on-cloud-sites/Capture1.JPG %}" alt="" />

### What the error message means

The `Connection timed out - please try again` error message is displayed
when a script exceeds the maximum timeout value of 30 seconds. If the
load balancer that is serving the content does not receive data from the
server processing the data, the load balancer closes the connection and
the client immediately receives the error message. In most cases, the
script continues to execute until it reaches completion, generates an
error, or times out on the server; however, the page does not load on
the client as expected, and client instead receives the connection
timeout error.

### Why the error happens

The connection timeout can be a difficult issue to troubleshoot,
especially across all customer use cases. If you are seeing timeouts
intermittently, we recommend that you audit your code; intermittent
timeouts often indicate code that might need to be optimized or broken
down into smaller pieces.

Following are some specific causes and suggestions for troubleshooting:

-   Database queries can be a culprit. A large or poorly optimized
    database can cause otherwise small queries to take a long time to
    return data. This issue can usually be alleviated by optimizing the
    database to reduce overhead from MyISAM or reorganize information
    in InnoDB. We recommend using InnoDB as the table storage engine
    because the Cloud Sites database servers are tuned for using it,
    among other advantages inherent to the format.

-   For a longer running script in PHP, you can use the `exec` function
    to run the script in the background and write its status to a
    database or a file. You could then use AJAX to display a loading bar
    and check the script's status. After the script is completed, you
    can then remove the loading bar and proceed to a completion page.
    (This is just an example, but the concept is good for
    any situation.) Another option is to run the script as a cron job
    using PHP or Perl instead of HTTP, which is not subject to the load
    balancer's timeout and can run up to 15 minutes. For information
    about setting up a cron job, see
    </how-to/how-do-i-schedule-a-cron-job-for-cloud-sites>.

-   This error can also occur when a site is trying to load files that
    don't exist (404 errors). This dramatically slows a site down and in
    rare cases can cause a timeout.

-   A site that is loading data from an external location can experience
    load issues that cause a timeout. For example, if a site relies on
    Google Analytics, Authorize.net, or PayPal, and the corresponding
    service goes down or begins responding slowly, the site experiences
    a performance issue that, in some cases, can cause the page not to
    load or to load intermittently. This issue could be caused by many
    different plug-ins for popular content management systems such as
    WordPress and Drupal or by simple calls in hand-coded sites.

-   In extremely rare cases, you might see this error message because an
    invalid cookie is being stored by your browser. Invalid cookies can
    cause you to see the error message on pages that initiate a session
    on your site (such as login or member pages, or sometimes even your
    homepage). Although rare, you should clear your browser cache and
    try the page again to verify that this is not the case.

### The bottom line

In extremely rare cases, you might see this error message because an
invalid cookie is being stored by your browser. Invalid cookies can
cause you to see the error message on pages that initiate a session on
your site (such as login or member pages, or sometimes even your
homepage). Although rare, you should clear your browser cache and try
the page again to verify that this is not the case.

### What Rackspace is doing about it

-   Updated and made improvements to the Linux kernel for speed and
    stability
-   Increased the PHP memory allocation to improve performance
-   Enabled compiling and caching of PHP scripts to speed up performance
-   Moved PHP session state storage to a faster, dedicated system
-   Implemented safeguards to prevent long-running queries on MySQL from
    impacting multiple customers
-   Changed our storage units to reduce loading times on files and
    improve Time Till First Byte (TTFB) responses
-   Implemented safeguards on PHP processes to prevent them from
    impacting multiple customers

Rackspace is committed to constantly improving our infrastructure and
products to bring you the best possible customer experience. To learn
how to get more out of Cloud Sites, see the [Cloud Sites introduction](/how-to/cloud-sites).
