---
permalink: migrate-your-dns-records/
audit_date:
title: 'Migrate your DNS records'
type: article
created_date: '2020-03-18'
created_by: Karoline Mills
last_modified_date: 
last_modified_by:
product: Cloud DNS
product_url: cloud-dns
---

## Migrate your DNS records

This article shows you how to migrate your DNS records to a new DNS hosting provider. It covers a step-by-step guide on how to efficiently migrate your records.

### Migration Process
You need the following information to perform the migration:
-	You current DNS hosting provider (this allows you to export your current DNS zone file)
-	Nameservers of new DNS hosting provider
-	Your domain registrar

To gather this information and proceed with the migration, we recommend the following steps:

#### 1. Find your current DNS hosting provider

-	If you are running Windows, please review this article:
[Checking DNS records on Windows](https://support.rackspace.com/how-to/nslookup-checking-dns-records-on-windows).
It explains the steps to query the ‘primary name server’ of the domain. The primary name server is the location where your DNS zone file is hosted.

-	If you are running Linux, you can run the following command: 
dig NS +short example.com.
The output will be the authoritative nameservers for the domain. It shows you where your DNS zone file is hosted. Please review the following article for a more in-depth guide:
[Use dig to query nameservers](https://support.rackspace.com/how-to/using-dig-to-query-nameservers).

-	Alternatively, you can use one of the many free third party tools and websites to query the DNS records for your domain. When looking at the results, the authoritative nameservers will be listed under the NS record.

If you are unsure which company a nameserver belongs to, a quick Google search should provide you an answer.

#### 2.	Find which nameservers your new DNS hosting provider uses
If you are looking to host your DNS with Rackspace, you will use two of the following nameservers:
-	ns.rackspace.com    
-	ns2.rackspace.com

or

-	dns1.stabletransit.com
-	dns2.stabletransit.com
	
If you are looking to host your DNS elsewhere, please inquire the authoritative nameservers from your new hosting provider.

#### 3.	Export your DNS zone file from your current DNS hosting provider

If your DNS is hosted with us, you can export your domain to a bind9-formatted file by using the API:
[Rackspace Cloud DNS API 1.0](https://developer.rackspace.com/docs/cloud-dns/v1/?_ga=2.82690198.1048316456.1584305948-1177037268.1583792228).
Alternatively, you can open a support ticket, and we will assist you in exporting your DNS zone file.

If your DNS is hosted with another hosting provider, please contact them for assistance.
After the export has taken place, it is important that you don’t make any changes to the DNS records as this could cause conflicts during the migration period.

#### 4.	Import your DNS zone file at your new DNS hosting provider

If you are looking to host your DNS with us, you can import a valid bind9-formatted zone file by using the Cloud API:
[Rackspace Cloud DNS API 1.0](https://developer.rackspace.com/docs/cloud-dns/v1/?_ga=2.82690198.1048316456.1584305948-1177037268.1583792228).
Alternatively, you can open a support ticket, and we will assist you in importing a bind9-formatted  zone file.
If your are switching to another hosting provider, please contact them for assistance in importing your zone file.

#### 5.	Change the nameservers at your domain registar
After following the above steps, your DNS zone file should be residing with both your current and new DNS hosting provider. It is important to keep both DNS zone files identical and live until you are sure that the migration has completed successfully. It is recommend that you wait for about a week before you delete your zone file with your old hosting provider to ensure worldwide propagation.
Log into the portal of your domain registrar (where your domain is hosted), and update the nameservers to the nameservers of your new DNS hosting provider. Please keep in mind that Rackspace is not a domain registrar, like Namecheap, Dreamhost, or GoDaddy. If you are unsure who your domain registrar is, you can use a lookup tool like [Whois](http://whois.domaintools.com/).

#### 6.	Verify that the NS records have been updated successfully

Now you can verify that your NS records have been updated to the new nameservers by performing a DNS lookup as outlined in **Step 1** above. Please allow for up to 48 hours for the DNS records to update correctly. 

#### 7.	Delete DNS records with previous DNS provider
Once you have verified that the new nameservers have propagated correctly, wait for about a week before you delete the DNS records with your old DNS provider.

### Related Articles

[How to Cloud DNS](https://support.rackspace.com/how-to/cloud-dns/)

[Cloud DNS Supported record types](https://support.rackspace.com/how-to/rackspace-cloud-dns-additional-resources/)
