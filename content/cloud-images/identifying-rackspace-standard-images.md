---
permalink: identifying-rackspace-standard-images/
audit_date: '2018-03-19'
title: Identifying Rackspace Standard Images
type: article
created_date: '2014-01-14'
created_by: Cloud Images
last_modified_date: '2018-03-19'
last_modified_by: Kate Dougherty
product: Cloud Images
product_url: cloud-images
---

Standard images are images that are supplied by Rackspace and supported for
your Rackspace Cloud account's type and service level. The distinction
between standard and non-standard images is described in detail in the
article [Rackspace standard and non-standard images](/how-to/rackspace-standard-and-non-standard-images).

The set of standard images is not the same for all Rackspace Cloud
accounts. The standard images for an account differ based on the
account's support level (Managed Infrastructure or Managed Cloud Service
Level) and whether or not the account uses RackConnect.

### View standard images

The following filters in the Cloud Control Panel, Cloud Servers API, and
Cloud Images API enable you to see which images are standard images for
your account.

- **Cloud Control Panel**: When you are building a server in the [Cloud Control
Panel](https://mycloud.rackspace.com), select the Rackspace tab when
choosing the base image to list only standard images.

- **Cloud Servers API**: To identify standard images when using the [Cloud Servers API v2](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/),
make a [Retrieve list of images request](https://developer.rackspace.com/docs/cloud-servers/v2/api-reference/svr-images-operations/#retrieve-list-of-images) and
filter it to list images that have their `type` value set to `BASE`.

- **Cloud Images API**: To identify standard images when using the [Cloud Images API v2.0](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/),
make a [List images request](https://developer.rackspace.com/docs/cloud-images/v2/api-reference/images-operations/#list-images) and filter it to list images that
have their `visibility` value set to `public`.

### Support implications

For information on the support implications of the differences between
standard and non-standard images, see [Rackspace standard and non-standard images](/how-to/rackspace-standard-and-non-standard-images).
