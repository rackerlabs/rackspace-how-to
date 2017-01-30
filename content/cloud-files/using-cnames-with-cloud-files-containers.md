---
permalink: using-cnames-with-cloud-files-containers/
audit_date:
title: Using CNAMEs with Cloud Files containers
type: article
created_date: '2011-04-27'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

A CNAME record is way to link your Cloud Files container to a branded
URL that you display instead of a CDN URL. For example, you might want
create a CNAME record that links your CDN URL (for example,
`http://c186397.r00.cf1.rackcdn.com`) to a shorter or branded URL (for
example, `http://images.mycompany.com`).

### Find your CDN URL

Before you can create the CNAME record, you need to know the CDN URL of
the container. You can find this in the Cloud Files section of the
[Cloud Control Panel](https://mycloud.rackspace.com) by clicking the
gear icon next to the container name and selecting **View All Links**. A
popup dialog box with the CDN links to the container is displayed:

<img src="{% asset_path cloud-files/using-cnames-with-cloud-files-containers/1080-2_2.png %}" width="492" height="246" />

Alternatively, you can request your container information via the Cloud
Files API.

### Set up CNAME records

You set up your CNAME record by managing your DNS. Within your DNS
settings, request a new record. Ensure that your CNAME record points to
your container's CDN URL and not your object's CDN URL.

If you are using Rackspace Cloud DNS, creating a CNAME record that uses
the example values introduced at the beginning of this article would
look as follows:

<img src="{% asset_path cloud-files/using-cnames-with-cloud-files-containers/cnameadd.png %}" width="516" height="282" />

If you want to edit or delete your CNAME record, you can also do that by
managing your DNS in your existing tool.

**Notes:**

-   You are not charged extra for using CNAMEs.
-   At this time, CNAMEs do not work with SSL (or HTTPS) delivery.


