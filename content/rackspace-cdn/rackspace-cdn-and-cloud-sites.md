---
permalink: rackspace-cdn-and-cloud-sites/
audit_date:
title: Rackspace CDN and Cloud Sites
type: article
created_date: '2015-04-27'
created_by: Megan Meza
last_modified_date: '2016-06-02'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

This article provides information about how to use Rackspace CDN with
Rackspace Cloud Sites.

To get your website set up with Rackspace CDN, you need to create a
Rackspace CDN service and then change the DNS for your site. You can use
the DNS management tool in the Cloud Sites Control Panel to create,
modify, and delete DNS records. For more information about the DNS
management tool in Cloud Sites, see [Getting Started with Cloud Sites - Managing DNS records](/how-to/getting-started-with-cloud-sites-managing-dns-records).

### Create a CDN service

To create a CDN service to use with your webiste, you need to know the
IP address of your site (your origin) and and the **www** address of
your site (your domain). For complete instructions for creating a CDN
service, see [Create a CDN service with Rackspace CDN](/how-to/create-a-rackspace-cdn-service).

1. Log in to the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com).

2. From the **Storage** or **Networking** menu, select  **CDN**.

3. Click **Create Service**.

   A pop-up dialog box displays with the following fields: **Service Name**, **Choose Traffic Type**, **Domain Name**, and **Origin**.

   -  In the **Domain Name** field, enter the **www** address for your site.
   - In the **Origin** field, enter the IP address for your site. You can find the IP address on the **General Settings** tab in the Cloud Sites Control Panel.

4. Click **Create Service**.

   After the service is created, the service details page is displayed.

5. In the Service Details section, hover over the **Domain Name** value
and copy the **CDN Domain** URL that is displayed in the pop-up menu.
You need this URL in the next section, to update your DNS records.

   <img src="{% asset_path rackspace-cdn/rackspace-cdn-and-cloud-sites/Screen%20Shot%202015-09-16%20at%204.21.48%20PM.png %}" width="647" height="377" />

### Update DNS

After you have created your Rackspace CDN service, use the Cloud Sites
DNS management tool to update the DNS for your **www** domain by
performing the following steps.

1. In the Cloud Sites Control Panel, click the **DNS** tab for your
site.

2. Delete the existing A record by selecting it, clicking on **Delete
Selected**, and confirming the deletion.

3. In the DNS Management section, click **Add Record**.

4. Create a new CNAME record. For **Record Name**, enter **www** domain.
For Content, enter the CDN domain URL that you copied at the end of
"Create a CDN service."

   <img src="{% asset_path rackspace-cdn/rackspace-cdn-and-cloud-sites/Screen%20Shot%202015-09-16%20at%204.37.58%20PM.png %}" width="666" height="391" />

   **Note:** After you have updated the CNAME and verified that the change has been propagated, you can then access any files stored within the origin via the specified domain name. In the example for this article, anything stored on **www.brandedexample.com** is now available via the CDN.

### Create caching rules

Caching rules determine how long your content lives on the edge servers
(or nodes) before checking the origin server for an update. If your
content changes frequently, then set up a time to live (TTL) rule that
pulls content from the origin server every few minutes. If your content
does not change frequently, then set a longer TTL of 12-24 hours. If you
create multiple caching rules, order them from the least specific to the
most specific.

The best content to cache is static files such as images, videos, CSS,
and JavaScript. Most sites are well organized and keep that content
together, which makes it easier to choose what to cache. If you are not
sure, contact your developer or post your question at the [Rackspace
Community](https://community.rackspace.com/) forum.

For more information about caching rules and other Rackspace CDN edge
rules, see [Rackspace CDN edge
rules](/how-to/rackspace-cdn-edge-rules).
