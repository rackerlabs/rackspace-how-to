---
permalink: manage-ttl-in-a-cloud-files-container/
audit_date:
title: Manage Time to Live (TTL) in a Cloud Files container
type: article
created_date: '2016-02-10'
created_by: Stephanie Fillmon
last_modified_date: '2016-02-10'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

This article describes the use of the Time To Live (TTL) attribute and
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

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2.  In the top navigation bar, select **Storage > Files**.
3.  If the container is not already public, click the gear icon next to
    the container and select **Make Public (Enable CDN)**. In the popup
    box, click **Publish to CDN**.
4.  Click the gear icon next to the container again and select **Modify
    Time To Live (TTL)**.
5.  Enter the TTL for the container in seconds, and then click **Save
    TTL**.
