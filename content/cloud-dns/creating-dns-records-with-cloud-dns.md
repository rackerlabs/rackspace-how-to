---
permalink: creating-dns-records-with-cloud-dns/
audit_date: '2018-05-16'
title: Create DNS records with Cloud DNS
type: article
created_date: '2012-07-15'
created_by: Rackspace Support
last_modified_date: '2018-10-23'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

You can easily create DNS records for your domain by using the
[Cloud Control Panel](https://login.rackspace.com/). This article shows you
how to create a Domain Name Service (DNS) zone for your domain and add basic
A, MX, and CNAME records by using the Cloud Control Panel. The article also
demonstrates how to delete records and domains.

### Add a domain

Use the following steps to add a domain:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Networking > Cloud DNS**.

4.  Click **Create Domain**.

5.  In the pop-up window, and enter the domain name, email address, and time to
    live (TTL), as shown in the following example:

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/2.png %}" alt="" />

    **Note**: Time to live indicates how long a DNS record is cached before it's updated.

6.  When you're finished entering information, click **Create
    Domain**. Your domain appears in the **Domain** section, along with
    options to create other DNS records.

### Add an A record for your domain

Use the following steps to add an A record for your domain:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Networking > Cloud DNS**.

4.  Select your domain from the list, and then select **Add Record**.
    Select **A/AAAA Record** for the type, and fill out the fields shown in
    the following image:

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/3.png %}" alt="" />

5.  When you're finished entering information, click **Add Record**.

### Add a CNAME record for your domain

Use the following steps to add a CNAME record for your domain:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Networking > Cloud DNS**.

4.  Select your domain from the list, and then select **Add Record**. Select
    **CNAME Record** for the type, and fill out the fields shown in the
    following image:

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/4.png %}" alt="" />

5.  When you're finished entering information, click **Add Record**.

### Add an MX record for your domain

Use the following steps to add an MX record for your domain:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Networking > Cloud DNS**.

4.  Select your domain from the list, and then select **Add Record**. Select
    **MX Record** for the type, and fill out the fields shown in the following
    image:

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/5.png %}" alt="" />

5.  When you're finished entering information, click **Add Record**.

### Delete a record from your domain

Use the following steps to delete a record from your domain:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Networking > Cloud DNS**.

4.  Click the gear icon next to the desired domain, and then click **Delete
    Record**, as shown in the following image:

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/6.png %}" alt="" />

### Delete a domain

Use the following steps to delete a record for a domain:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Networking > Cloud DNS**.

4.  Click the gear icon next to the desired domain, and then click **Delete
    Domain**, as shown in the following image:

    <img src="{% asset_path cloud-dns/creating-dns-records-with-cloud-dns/7.png %}" alt="" />

### Canonical DNS servers for Cloud Servers

If you're setting the canonical name servers (or the NS records) for your
domain with your domain registrar, use the following addresses:

    ns.rackspace.com
    ns2.rackspace.com
