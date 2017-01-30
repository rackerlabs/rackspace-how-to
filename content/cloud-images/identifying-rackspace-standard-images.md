---
permalink: identifying-rackspace-standard-images/
audit_date:
title: Identifying Rackspace Standard Images
type: article
created_date: '2014-01-14'
created_by: Cloud Images
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Images
product_url: cloud-images
---

Standard images are images supplied by Rackspace and supported for your
Rackspace Cloud account's type and service level. The distinction
between standard and non-standard images is described in detail in the
article [Rackspace Standard and Non-Standard Images](/how-to/rackspace-standard-and-non-standard-images).

The set of standard images is not the same for all Rackspace Cloud
accounts. The standard images for an account differ based on the
account's support level (Managed Infrastructure or Managed Cloud Service
Level) and whether or not the account uses RackConnect.

### View standard images

The following filters in the Cloud Control Panel, Cloud Servers API, and
Cloud Images API enable you to see which images are standard images for
your account.

- **Cloud Control Panel** - When you are building a server in the [Cloud Control
Panel](https://mycloud.rackspace.com), select the Rackspace tab when
choosing the base image to list only standard images.

- **Cloud Servers API** - You can identify standard images when using the [Cloud Servers API v2](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/)
by making a [List Images request](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#document-getting-started/create-server/list-images) and
filtering it to list images that have their `type` value set to `BASE`.

- **Cloud Images API** - You can identify standard images when using the [Cloud Images API v2](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/)
by making a List Images request and filtering it to list images that
have their `visibility` value set to `public`.

**Support Implications** - [Rackspace Standard and Non-Standard Images](/how-to/rackspace-standard-and-non-standard-images).
