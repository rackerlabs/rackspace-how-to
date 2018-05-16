---
permalink: creating-dns-records-with-cloud-dns/
audit_date: '2018-05-16'
title: Create DNS records with Cloud DNS
type: article
created_date: '2012-07-15'
created_by: Rackspace Support
last_modified_date: '2018-05-16'
last_modified_by: Cat Lookabaugh
product: Cloud DNS
product_url: cloud-dns
---

You can easily create DNS records for your domain by using the
[Cloud Control Panel](https://mycloud.rackspace.com). In this article, we
look at creating a DNS zone for your domain and adding basic A, MX, and
CNAME records by using the Cloud Control Panel. We also demonstrate deleting records
and domains.

### Add a domain

Use the following steps to add a domain:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com)
    and select **Networking** -> **Cloud DNS**.

2.  Click **Create Domain**.

3.  In the pop-up window, and enter the domain name, email address, time to live
    (TTL), as shown in the following example.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/2.png %}" alt="" />

    **Note**: Time to live indicates how long a DNS record is cached before it's updated.

3.  After you have entered everything, click **Create Domain**. Your domain is
    listed in the domain section, along with options to create other DNS records.

### Add an A record for your domain

Use the following steps to add an A record for your domain:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com)
    and select **Networking** -> **Cloud DNS**.
2.  Select your domain in the list, and then select **Add Record**.
    Select **A/AAAA Record** for the type, and fill out the following fields.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/3.png %}" alt="" />

3.  After you have entered everything, click **Add Record**.

### Add a CNAME record for your domain

Use the following steps to add a CNAME record for your domain:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com)
    and select **Networking** -> **Cloud DNS**.
2.  Select your domain in the list, and then select **Add Record**. Select
    **CNAME Record** for the type, and fill out the following fields.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/4.png %}" alt="" />

3.  After you have entered everything, click **Add Record**.

### Add an MX record for your domain.

Use the following steps to add an MX record for your domain:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com)
    and select **Networking** -> **Cloud DNS**.
2.  Select your domain in the list, and then select **Add Record**. Select
    **MX Record** for the type, and fill out the following fields.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/5.png %}" alt="" />

3.  After you have entered everything, click **Add Record**.

### Delete a record from your domain

Use the following steps to delete a record from your domain:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com)
    and select **Networking** -> **Cloud DNS**.
2.  Click the gear icon next to the desired domain, and then click **Delete Record**.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/6.png %}" alt="" />

### Delete a domain

Use the following steps to delete a record a domain:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com)
    and select **Networking** -> **Cloud DNS**.
2.  Click the gear icon next to the desired domain, and then click **Delete Domain**.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/7.png %}" alt="" />

### Canonical DNS servers for Cloud Servers

If you're setting the canonical name servers (or the NS records) for your domain
with your domain registrar, use the following addresses:

    ns.rackspace.com
    ns2.rackspace.com
