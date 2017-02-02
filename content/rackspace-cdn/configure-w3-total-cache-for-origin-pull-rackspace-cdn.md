---
permalink: configure-w3-total-cache-for-wordpress-with-rackspace-cdn/
audit_date:
title: Configure W3 Total Cache for WordPress with Rackspace CDN
type: article
created_date: '2017-01-31'
created_by: Brian Huan
last_modified_date: '2017-01-31'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

This article shows the basic steps for setting up the W3 Total Cache plug-in to work with Rackspace Content Delivery Network (CDN). Rackspace CDN is an origin pull CDN, which automatically pulls the content from your web servers and stores a cached copy of the assets on the remote edge nodes. When you use an origin pull CDN, it is common to set up a subdomain and host only the static assets such as CSS, JavaScript, images, and so on.

**Note:** Origin pull CDNs work better for sites that experience a moderate to high level of traffic. If your site frequently experiences surges in traffic that may require servers to scale up and down, see [Configure W3 Total Cache for WordPress with Rackspace Cloud Files](/how-to/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn).

### Prerequisite

A WordPress website and database.

### Install and configure W3 Total Cache

1. Log in as admin to your WordPress blog.

2. In the navigation sidebar, click **Plugins > Add New**.

3. In the search box, enter **W3 Total Cache**.

4. In the search results, click **Install Now** in the W3 Total Cache box.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-Search-W3-Total-Cache.png %}" alt="click install now in the w3 total cache search result box" />

   After the plug-in is installed, the **Install Now** button changes to **Activate**.

5. Click **Activate** to enable the plug-in.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-Activate-W3-Total-Cache.png %}" alt="click activate in the w3 total cache search result box" />

6. In the navigation sidebar, click **Performance > General Settings**.

7. In the CDN section, select the **Enable** check box, and choose Rackspace CDN as the CDN type.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-Select-Rackspace-CDN.png %}" alt="select the enable check box and choose rackspace cdn as the cdn type. click save all settings" />

8. Click **Save all settings**.

### Set up a Rackspace CDN service

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Networking > CDN**.

3. On the Content Delivery Network (CDN) page, click **Create Service** and complete the following information:

   - **Service Name**: Specify a name that helps you identify this site.
   - **Choose Traffic Type**: Select **HTTP**.
   - **Domain Name**: Enter the subdomain to where W3 Total Cache will send your static assets.
   - **Origin**: Specify a subdomain from which Rackspace CDN will fetch a copy of the original data before caching it. This can also be the IP address of your server or load balancer.

4. Click **Create Service**.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-mycloud-Setup-Origin-CDN.png %}" alt="fill in the information to create a new service" />

You must set up the new CDN service in your domain's DNS before it is active. For information about enabling Rackspace CDN, see [Change DNS to enable Rackspace CDN](/how-to/change-dns-to-enable-rackspace-cdn).
