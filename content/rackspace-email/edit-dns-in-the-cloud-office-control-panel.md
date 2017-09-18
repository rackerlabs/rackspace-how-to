---
permalink: edit-dns-in-the-cloud-office-control-panel/
audit_date:
title: Edit DNS in the Cloud Office control panel
type: article
created_date: '2017-09-18'
created_by: William Loy
last_modified_date: '2017-09-18'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to edit your domain's DNS settings in the Cloud Office Control Panel.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** Approximately 24-48 hour for DNS record changes to propagate
- **Tools required:**  Cloud Office Control Panel access, DNS hosting at Rackspace Cloud Office

If you are not sure who is hosting your domain's DNS, please reference [Find your DNS host](/how-to/find-dns-host)

To edit DNS records at Cloud Office, log in to the [Cloud Office Control Panel](https://cp.rackspace.com), and perform the following steps:

1.  From the **Go to section** menu, select **Domains**.

    <img src="{% asset_path rackspace-email/edit-dns-in-the-cloud-office-control-panel/go_to_domains.png %}" />

2.  In the **Manage** section, click **DNS Settings**.

    <img src="{% asset_path rackspace-email/edit-dns-in-the-cloud-office-control-panel/manage_dns_settings.png %}" />

3. You will see a list of your domains. Click **DNS Records** under the **Advanced Settings** column next to the domain you would like to edit .

    <img src="{% asset_path rackspace-email/edit-dns-in-the-cloud-office-control-panel/dns_settings.png %}" />

4.  This page is where you will edit your DNS records. Below is an example of the initial DNS record set up to start receiving email at Rackspace Cloud Office.


    <img src="{% asset_path rackspace-email/edit-dns-in-the-cloud-office-control-panel/rackspace_dns_setup.png %}" />

    Warning: Changes to your DNS will impact other services tied to your domain such as website hosting.

5. Once you have completed your edits, click **Save**.
