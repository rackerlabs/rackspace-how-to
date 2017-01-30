---
permalink: change-dns-to-enable-rackspace-cdn/
audit_date: 
title: Change DNS to enable Rackspace CDN
type: article
created_date: '2015-02-12'
created_by: Megan Meza
last_modified_date: '2016-06-01'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

After you create your CDN service, you must activate it by pointing the DNS records for your domain to the CDN network. This article describes the steps to do this.

### Get your CDN URL

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Storage** and then select **CDN**.

3. In the list of services, click the service for which you want to activate the CDN.

4. On the **CDN Service** page, in the **Domains** section, click on **Domain Not Configured** under **Status**.

5. Use the URL and the instructions in the box that opens, which is similar to the following figure, to configure your service.

   <img src="{% asset_path rackspace-cdn/change-dns-to-enable-rackspace-cdn/Screen%20Shot%202015-12-16%20at%204.56.08%20PM.png %}" width="531" height="272" alt="" border="1"  />

### Create a CNAME record with your DNS provider

After you obtain your CDN domain URL, go to your DNS provider to change your records.

Most DNS records for a domain already have an A record that maps your domain to the server that holds your website content. If no A record exists, follow your DNS provider's instructions for setting one up.

If the A record is already created, you must change it to a CNAME that points to the CDN Domain Access domain. Create a CNAME record that points your domain to the CDN domain URL that you retrieved from the Cloud Control Panel. You can see these URLs by hovering over each individual domain name for your CDN service.

If you host your domain with Rackspace, you can manage your DNS records by following the instructions at [Create DNS Records for cloud servers with the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel).

**Note:** Some DNS providers allow for a CNAME of the root of your domain. Do not use this because it breaks the geolocation of the CDN service. These types of DNS services do the DNS lookup and return the A record (IP address) to which to connect. The geolocation depends on the DNS lookup and locates the best possible CDN edge node based on that DNS lookup. If your DNS service does this lookup for you, it will provide the best possible CDN edge node based on the DNS service's geolocation and not your end-users' location. This causes slow network connections.

You need to use a subdomain for the CDN service. You can choose a subdomain, such as www, cdn, or static. If you want all your traffic to be routed over the CDN for your entire domain, you must set up a redirect from the root of your domain to the subdomain.

For example, if you set up a CNAME record that points the URL `www.example.com` to the CDN network, ensure that visitors who go to `example.com` are also served over the CDN network. To do this, redirect `example.com` to `www.example.com`, the URL that points to the CDN network.

When your CNAME record is complete, your domain traffic will be served over the CDN network.
