---
permalink: migrate-your-dns-records/
audit_date: '2020-03-24'
title: 'Migrate your DNS records'
type: article
created_date: '2020-03-18'
created_by: Karoline Mills
last_modified_date: '2020-03-24'
last_modified_by: Stephanie Fillmon
product: Cloud DNS
product_url: cloud-dns
---

This article shows you how to migrate your DNS records to a new DNS hosting provider.

### Prerequisites

You need the following information before you can perform the migration:

- Your current DNS hosting provider (this allows you to export your current DNS zone file)
- Name servers of the new DNS hosting provider
- Your domain registrar

To gather this information and proceed with the migration, use the following steps:

### Find your current DNS hosting provider

If you are running Windows, see [Checking DNS records on Windows](https://support.rackspace.com/how-to/nslookup-checking-dns-records-on-windows). This article explains the steps to query the *primary name server* of the domain. The primary name server is the location where your DNS zone file is hosted.

If you are running Linux, you can run the following command: 
    
    dig NS +short example.com.
    
The output is the authoritative name servers for the domain. It shows you where your DNS zone file is hosted. See
[Use dig to query nameservers](https://support.rackspace.com/how-to/using-dig-to-query-nameservers) for a more in-depth guide.

Alternatively, you can use one of the many free third-party tools and websites to query the DNS records for your domain. When you look at the results, the authoritative name servers are listed under the NS record.

If you are unsure which company a name server belongs to, a quick Google search should provide you an answer.

### Find which nameservers your new DNS hosting provider uses

If you want to host your DNS with Rackspace, you use two of the following name servers:

- ns.rackspace.com    
- ns2.rackspace.com

or

- dns1.stabletransit.com
- dns2.stabletransit.com
	
If you want to host your DNS elsewhere, inquire the authoritative name servers from your new hosting provider.

### Export your DNS zone file from your current DNS hosting provider

If Rackspace hosts your DNS, you can export your domain to a bind9-formatted file by using the API:
[Rackspace Cloud DNS API 1.0](https://developer.rackspace.com/docs/cloud-dns/v1/?_ga=2.82690198.1048316456.1584305948-1177037268.1583792228).

Alternatively, you can open a support ticket, and we assist you in exporting your DNS zone file.

If another hosting provider hosts your DNS, contact them for assistance.

After you export the DNS zone file, be sure not to make any changes to the DNS records because this can cause conflicts during the migration period.

### Import your DNS zone file at your new DNS hosting provider

If you want to host your DNS with Rackspace, you can import a valid bind9-formatted zone file by using the Cloud API:
[Rackspace Cloud DNS API 1.0](https://developer.rackspace.com/docs/cloud-dns/v1/?_ga=2.82690198.1048316456.1584305948-1177037268.1583792228).

Alternatively, you can open a support ticket, and we assist you in importing a bind9-formatted  zone file.

If you are switching to another hosting provider, contact them for assistance in importing your zone file.

### Change the nameservers at your domain registrar

After following the previous steps, your DNS zone file should be residing with both your current and new DNS hosting provider. It is important to keep both DNS zone files identical and live until you are sure that the migration has completed successfully. We recommend that you wait for about a week before you delete your zone file with your old hosting provider to ensure worldwide propagation.

Log in to the portal of your domain registrar and update the name servers to the name servers of your new DNS hosting provider. Keep in mind that Rackspace is not a domain registrar, like Namecheap, Dreamhost, or GoDaddy. If you are unsure who your domain registrar is, you can use a lookup tool like [Whois](http://whois.domaintools.com/).

### Verify that the NS records are successfully updated

Now you can verify that your NS records are successfully updated to the new nameservers by performing a DNS lookup as described in the section **Find your current DNS hosting provider**. Allow for up to 48 hours for the DNS records to update correctly. 

### Delete DNS records with previous DNS provider

After you have verified that the new name servers have propagated correctly, wait for about a week before you delete the DNS records with your old DNS provider.

### Related Articles

- [How to Cloud DNS](https://support.rackspace.com/how-to/cloud-dns/)
- [Cloud DNS Supported record types](https://support.rackspace.com/how-to/rackspace-cloud-dns-additional-resources/)
