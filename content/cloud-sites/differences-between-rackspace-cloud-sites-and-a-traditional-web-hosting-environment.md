---
permalink: differences-between-rackspace-cloud-sites-and-a-traditional-web-hosting-environment/
audit_date:
title: Differences between Rackspace Cloud Sites and a traditional web hosting environment
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-11-09'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

The Rackspace Cloud Sites environment differs from a traditional hosting
environment in the following ways:

-   More than one server serves a specific website's request because the
    load balancing capability is made available to all websites.
    Depending on file extensions, the load balancer directs traffic to
    appropriate servers.

-   Subdomains are treated as full websites.

-   The operational architecture of Cloud Sites uses a caching mechanism
    for media content and ASPX requests. As a result, some updates might
    not take effect immediately.

-   The databases needed to host a site are usually on different virtual
    machines and users can provision them through the control panel.
    They must provide the hostname and *not* the localhost in the
    database connection string.

-   Updating content by using FTP is different in the sense that only
    certain directories are accessible and the FTP address is determined
    by Cloud Sites. An account holder cannot upload files to a client's
    directories.

-   By default website statistics and raw logging are turned off. Users
    must explicitly enable them if needed. By default, PHP and cron job
    task logs are written to the logs directory.
