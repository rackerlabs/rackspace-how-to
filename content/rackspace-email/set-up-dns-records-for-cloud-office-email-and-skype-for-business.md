---
permalink: set-up-dns-records-for-cloud-office-email-and-skype-for-business/
audit_date:
title: Set up DNS records for Cloud Office Email
type: article
created_date: '2014-08-15'
created_by: Cody Jobson
last_modified_date: '2017-05-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---
**Applies to:** Account Administrator

**Difficulty:** Moderate

**Time Needed:** 30 minutes to configure/24-48 hours to propagate

**Tools Required:** DNS host administrator access

## Overview
This article will guide you through initial configuration of your domain's DNS to start receiving email at Rackspace Cloud Office.


## Initial Domain (DNS) Configuration to Send/Receive Email

DNS tells the world how email should be handled and routed for your domain. This guide will allow you to setup your domain to allow proper routing of incoming and outgoing email as well as easy user client setups.

*Note: It is important to follow all steps and carefully input settings exactly as described below.*

#### Before Continuing
This guide will require access to update DNS entries for your domain.
If you do not know where your DNS is hosted please read: [How do I find out who my DNS host is?](/how-to/find-dns-host#how-do-i-find-out-who-my-dns-host-is)

#### DNS Settings
The following DNS entries are required to properly use email services at Rackspace.

**MX Records** tell other email providers where to send email. In this case, you would like to set your MX Records to point to Rackspace. [More on MX Records](/how-to/dns-record-definitions#mx-record).

**SPF Records** reduce unwanted SPAM, spoofing from your domain, as well as help ensure best-possible deliverability of your outgoing emails. [More on SPF Records](/how-to/dns-record-definitions#txt-record)

**Autodiscover Records** allow for full functionality of calendar features (free/busy information) and easier email client setups. [More on Autodiscover Records](/how-to/dns-record-definitions#cname-record)


*Warning: Changing DNS settings for a domain that was previously hosting email elsewhere will require user email clients and devices to be reconfigured to point to Rackspace. Send your users to [https://emailhelp.rackspace.com](http://emailhelp.rackspace.com) to assist them with new settings.*

1.	Log into your domain DNS host control panel, as identified above.
2.	Set the DNS entries to the following (ensure there are no other MX record entries or you will experience email complications). [How do I edit/add entries for my DNS host?](/how-to/find-dns-host#how-do-i-add-or-edit-entries-for-my-dns-host)

    *Note: The field headings below may vary slightly depending on your DNS host. Reference your DNS host for further information.*

     |Type    |Hostname                   |Destination                      |Priority    |TTL                           |
     |--------|---------------------------|---------------------------------|------------|------------------------------|        
     |MX      | @ or left blank           |mx1.emailsrvr.com                |10          |3600 seconds or lowest allowed|
     |MX      | @ or left blank           |mx2.emailsrvr.com                |20          |3600 seconds or lowest allowed|   
     |TXT     | @ or left blank           |v=spf1 include:emailsrvr.com ~all| N/A        |3600 seconds or lowest allowed|
     |CNAME   |autodiscover               |autodiscover.emailsrvr.com       | N/A        |3600 seconds or lowest allowed|

3.	Save your changes.
4.	Wait for up to 48 hours for your new settings to propagate to the world. [Why does it take so long for these settings to propagate?](/how-to/dns-record-definitions#dns-propagation)
5.	You have now successfully setup your DNS for your domain, allowing users to send and receive email from your Rackspace Hosted Email solution.


Need help setting up DNS for Skype for Business? Please follow this link for instructions: [Cloud Office Skype for Business DNS](/how-to/set-up-dns-records-for-cloud-office-skype-for-business)
