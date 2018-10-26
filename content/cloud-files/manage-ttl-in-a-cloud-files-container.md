---
permalink: manage-ttl-in-a-cloud-files-container/
audit_date:
title: Manage Time to Live (TTL) in a Cloud Files container
type: article
created_date: '2016-02-10'
created_by: Stephanie Fillmon
last_modified_date: '2018-10-23'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

This article describes how to use the Time To Live (TTL) attribute and
how it works.

When you create a container in Cloud Files and you make that container
public, the files within that container have a designated TTL. The TTL
is the time interval after which the CDN will reread the contents of the
container. This attribute and its value can be modified in the CDN
through the Cloud Files user interface.

New values take effect after the current TTL cycle is completed. The TTL
can be any value between 15 minutes and 50 years. Use higher numbers for
static content that doesn't change often, and use smaller numbers for
content that changes more often. If you require a longer TTL, see the
following blog post about using the API to set TTL: Extending TTL for
Cloud Files CDN Users.

Use the following steps to modify a container's TTL within the Cloud
Control Panel:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).
2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3.  Select **Storage > Files**.
4.  If the container isn't already public, click the gear icon next to
    the container and select **Make Public (Enable CDN)**. In the popup
    box, click **Publish to CDN**.
5.  Click the gear icon next to the container again and select **Modify
    Time To Live (TTL)**.
6.  Enter the TTL for the container in seconds, and then click **Save
    TTL**.
