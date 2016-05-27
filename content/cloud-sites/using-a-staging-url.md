---
permalink: using-a-staging-url/
audit_date:
title: Use a staging URL
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2014-08-25'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Prerequisites

-   Administrative access to the Rackspace Cloud

### Procedure

-   Navigate to **Hosting > Cloud Sites**, from the list of domains click
    on the hyperlink of the domain and select **General Settings** tab
-   Scroll down to the **Viewing and Editing** section and check the testing
    URL link, this identifies the technology, cluster and data center
    used for this website.

  <img src="{% asset_path cloud-sites/using-a-staging-url/staging_url.png %}" alt="" />

-   All content and code uploaded to the site can now be accessed with
    the test or staging url
-   The website can be made public when needed. Site owner must log into
    the website for the domain registrar where they bought the
    domain--for example, **Godaddy.com** or **Register,com**, and set
    the DNS name servers for the domain **dns1.stabletransit.com** and
    **dns2.stabletransit.com**. Additionally you can use external name
    servers and modify DNS records as needed.
