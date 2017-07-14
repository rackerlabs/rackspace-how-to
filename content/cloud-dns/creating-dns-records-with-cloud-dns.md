---
permalink: creating-dns-records-with-cloud-dns/
audit_date:
title: Create DNS records with Cloud DNS
type: article
created_date: '2012-07-15'
created_by: Rackspace Support
last_modified_date: '2017-05-11'
last_modified_by: Cat Lookabaugh
product: Cloud DNS
product_url: cloud-dns
---

It is easy to create DNS records for your domain by using the
[Cloud Control Panel](https://mycloud.rackspace.com). In this article, we
look at creating a DNS zone for your domain and adding basic A, MX, and
CNAME records by using the Cloud Control Panel. We also demonstrate deleting records
and domains.

### Add a domain

1.  Log into the [Cloud Control Panel](https://mycloud.rackspace.com),
    and from the **Networking** menu at the top, select **Cloud DNS**.

2.  Select **Create Domain** under **Cloud DNS**, and enter in the domain
    name, email address, Time To Live (TTL), and then select **Create
    Domain **once more.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/2.png %}" alt="" />

    **Note**: Time To Live indicates how log a DNS record is cached before it's updated.

3.  Now, your domain is listed in the domain section, along with options to create other DNS
    records.

### Add an A record for your domain.

1.  Log into the [Cloud Control Panel](https://mycloud.rackspace.com),
    and from the **Networking** menu at the top, select **Cloud DNS**.
2.  Select your domain in the list, and then select **Add Record** under Records. Select
    **A/AAAA Record** for the type, and fill out the following fields accordingly.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/3.png %}" alt="" />

3.  After you have entered everything, select **Add Record**, and you are finished!

### Add a CName record for your domain.

1.  Log into the [Cloud Control Panel](https://mycloud.rackspace.com),
    and from the **Networking** menu at the top, select **Cloud DNS**.
2.  Select your domain in the list, and then select **Add Record** under Records. Select
    **CNAME Record** for the type, and fill out the following fields accordingly.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/4.png %}" alt="" />

3.  After you have entered everything, select **Add Record**, and you are finished!

### Add an MX record for your domain.

1.  Log into the [Cloud Control Panel](https://mycloud.rackspace.com),
    and from the **Networking** menu at the top, select **Cloud DNS**.
2.  Select your domain in the list, and then select **Add Record** under Records. Select
    **MX Record** for the type, and fill out the following fields accordingly.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/5.png %}" alt="" />

### Delete a record from your domain.

1.  Log into the [Cloud Control Panel](https://mycloud.rackspace.com),
    and from the **Networking** menu at the top, select **Cloud DNS**.
2.  Click the gear icon next to the desired domain, and then select **Delete Record**.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/6.png %}" alt="" />

### Delete a domain

1.  Log into the [Cloud Control Panel](https://mycloud.rackspace.com),
    and from the **Networking** menu at the top, select **Cloud DNS**.
2.  Click the gear icon next to the desired domain, and then select **Delete Domain**.

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/7.png %}" alt="" />

### What are the canonical DNS servers for Cloud Servers?

If you're setting the canonical name servers for your domain with your
domain registrar (the NS records), use the following addresses:

    ns.rackspace.com
    ns2.rackspace.com
