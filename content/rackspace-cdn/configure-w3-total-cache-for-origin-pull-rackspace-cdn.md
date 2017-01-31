---
permalink: configure-w3-total-cache-for-wordpress-with-origin-pull-rackspace-cdn/
audit_date:
title: Configure W3 Total Cache for WordPress with origin pull Rackspace CDN
type: article
created_date: '2017-01-31'
created_by: Brian Huan
last_modified_date: '2017-01-31'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

This article shows the basic steps for setting up the W3 Total Cache plug-in to work with the origin pull Rackspace Content Delivery Network (CDN). Origin pull CDNs automatically pull the content from your web servers and store a cached copy of the assets on the remote edge node locations. It is common to set up a subdomain and host only the static assets such as CSS, JavaScript, images and so on.

### Prerequisites

- A WordPress website and database.

### Install and configure W3 Total Cache

1. Log in as admin to your WordPress blog.

2. In the navigation sidebar, click **Plugins > Add New**.

3. In the search box, enter "W3 Total Cache".

4. In the search results, click **Install Now** in the W3 Total Cache box.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-Search-W3-Total-Cache.png %}" alt="click install now in the w3 total cache search result box" />

5. After the plug-in is installed, the **Install Now** button changes to **Activate**. Click **Activate** to enable the plug-in.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-Activate-W3-Total-Cache.png %}" alt="click activate in the w3 total cache search result box" />

6. In the navigation sidebar, click **Performance > General Settings**.

7. In the CDN section, select the **Enable** check box, and choose Rackspace CDN as the CDN type. Then, click **Save all settings**.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-Select-Rackspace-CDN.png %}" alt="select the enable check box and choose rackspace cdn as the cdn type. click save all settings" />

### Set up a Rackspace CDN service

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Networking > CDN**.

3. On the Content Delivery Network (CDN) page, click **Create Service** and complete the following information:

   - **Service Name** - a name that helps you identify this site.
   - **Choose Traffic Type** - select HTTP from the drop-down menu.
   - **Domain Name** - the subdomain to which W3 Total Cache will change your static assets. This can be anything you want, and will be visible only in your source code for JavaScript, CSS, images, and so on.
   - **Origin** - typically a subdomain that the Rackspace CDN will fetch a copy of the original data before caching it. This can also be the IP address of your server or load balancer.

   Click **Create Service**.

   <img src="{% asset_path rackspace-cdn/configure-w3-total-cache-for-origin-pull-rackspace-cdn/configure-w3-mycloud-Setup-Origin-CDN.png %}" alt="fill in the information to create a new service" />

You must set up the new CDN service in your domain's DNS before it is active. For information about enabling Rackspace CDN, see [Change DNS to enable Rackspace CDN](/how-to/change-dns-to-enable-rackspace-cdn).

### Related article

[Configure W3 Total Cache for WordPress with Rackspace Cloud Files and CDN](/how-to/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn)
