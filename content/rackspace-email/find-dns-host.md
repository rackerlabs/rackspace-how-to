---
permalink: find-dns-host/
audit_date: '2017-05-30'
title: Find your DNS host
type: article
created_date: '2017-05-17'
created_by: William Loy
last_modified_date: '2017-05-30'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to locate your domain’s DNS host. 

If you need to configure your DNS for Rackspace Cloud Office Email products, see [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email).

### Prerequisites

- **Applies to:** Administrators
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Internet browser

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Find the DNS host

1. Go to <https://who.is/> and search for your domain.

   In the search results, the section labeled **Name Servers** shows the location of your DNS host.
   
   If any of the following server names are listed in the **Name Servers** section for your domain, Rackspace is most likely your DNS host and can assist you with editing your DNS records.
   
   For more information, see [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email).
   
   - NS.RACKSPACE.COM
   - NS2.RACKSPACE.COM
   - DNS1.STABLETRANSIT.COM
   - DNS2.STABLETRANSIT.COM
   - DNS1.NAME-SERVICES.COM
   - DNS2.NAME-SERVICES.COM
   - DNS3.NAME-SERVICES.COM
   - DNS4.NAME-SERVICES.COM
   - DNS5.NAME-SERVICES.COM

2.	To find the company that is hosting your domain's DNS (if it is not Rackspace), search Google for the entry found in the **Name Servers** section.

3. If this search does not work, try contacting any company that you pay for website hosting (one of them likely hosts your DNS).

   **Note:** Rackspace Cloud Office offers DNS hosting but not website hosting.

### Add or edit entries for your DNS host

The following websites provide instructions for editing your DNS records for some of the more common DNS hosts. If your host is not listed here, search the provider's knowledge base or contact its support for assistance with modifying your DNS.

- [GoDaddy](https://www.godaddy.com/help/manage-dns-680)
- [BlueHost](https://my.bluehost.com/cgi/help/559)
- [HostGator](http://support.hostgator.com/articles/changing-dns-records)
- [Network Solutions](http://www.networksolutions.com/support/how-to-manage-advanced-dns-records/)
- [1&1](https://help.1and1.com/domains-c36931/manage-domains-c79822/dns-c37586)
