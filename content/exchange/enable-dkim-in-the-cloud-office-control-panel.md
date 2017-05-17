---
permalink: enable-dkim-in-the-cloud-office-control-panel/
audit_date:
title: Enable DKIM in the Cloud Office Control Panel
type: article
created_date: '2017-04-28'
created_by: Ben Smith
last_modified_date: '2017-04-28'
last_modified_by: Ben Smith
product: Rackspace Email
product_url: rackspace-email
---

Enable DKIM for supported domains.

DKIM adds a secure signature to your domain to authenticate email sent from users in your company. DKIM is an industry best practice that increases the security of your email domains

### Limitations

DKIM is not available for domains on Hosted Exchange 2007. Please contact our Support team to determine the best upgrade path to a DKIM-supported product.

### Procedure

To enable DKIM for a domain, log in to the [Cloud Office Control Panel](https://cp.rackspace.com), and perform the following steps:

1.  From the **Domains** section of the home page, click the link for **Sender Authentication (DKIM)**.  
<!--![alt text](HomePage_Domains.png "Home Page - Domains")-->

2.  On the **Sender Authentication (DKIM)** page, select the domain to enable DKIM from the domain list.  
<!--![alt text](DKIM_Domain_Listing.png "DKIM Domain Listing")-->

3.  Click the **Enable DKIM for <your domain>** button.  
  a.  If your domain's DNS is managed through your Cloud Office Control Panel, then DKIM enabling is automatic.

4.  If your domain's DNS is managed through another service, then you will be provided with the DNS key and value information for adding the new TXT record. Consult the help documentation of your DNS hosting provider for instructions on adding a new TXT record for your domain.  
<!--![alt text](DKIM_Verify_Page.png "DKIM Verify Page")-->

5.  Once you have added the DKIM TXT record, click the **Verify TXT Record** button to ensure the new DKIM record is publicly available in DNS and is correct.  
  a.  If validation fails, then an appropriate error message will display to guide you in correcting the problem.  
<!--![alt text](DKIM_Verify_Failed.png "DKIM Verify Failed")-->

Once enabled, all new outgoing email messages are signed using your new DKIM key. You can repeat the DKIM enabling process on other supported domains.  
<!--![alt text](DKIM_Domain_Enabled.png "DKIM Domain Enabled")-->
