---
permalink: dns-record-definitions/
audit_date:
title: DNS  record definitions
type: article
created_date: '2017-05-17'
created_by: William Loy
last_modified_date: '2017-05-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

**Applies to:** Account Administrator or User


## Overview
This is a brief overview of common email related DNS records. If you need to configure your DNS for Rackspace Cloud Office Email products click [here](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

## DNS Record Definitions
 Record definitions include an example of how to configure these records at your DNS hosting provider.


[**A Record**](#a-record)

[**MX Record**](#mx-record)

[**CNAME Record**](#cname-record)

[**TXT Record**](#txt-record)

[**DNS Propagation**](#dns-propagation)


### A Record  
**A Record** (Address Record) is the most basic DNS record type. It’s function is to point a domain or subdomain to an IP address

Example:

|Type    |Hostname          |Destination    |Priority    |TTL    |
|--------|------------------|---------------|------------|-------|        
|A       |blog.example.com  |XXX.XX.XX.XXX  |10          |3600   |

### MX Record
**MX Record** (Mail Exchanger Record) specifies a mail server responsible for accepting messages addressed to your domain. Without these records, emails addressed to your domain do not know how to find your mailbox.  Think of it as sending a letter to an address that does not exist; it will be returned to sender if the MX records are missing.

Example:

|Type    |Hostname          |Destination        |Priority    |TTL    |
|--------|------------------|-------------------|------------|-------|        
|MX      |         @        |mx1.emailsrvr.com  |10          |3600   |
|MX      |         @        |mx2.emailsrvr.com  |20          |3600   |

*Note: Email hosts may ask for multiple MX record entries. The examples are actually the MX records for Rackspace Cloud Office. We require two records entries, in case the first MX server experiences a disruption. This is a redundancy to ensure you still receive your email.*

### CNAME Record
**CNAME Record** (Canonical Name Record) record specifies that domain name is an alias for another domain.

Example:

|Type    |Hostname                  |Destination                 |TTL    |
|--------|--------------------------|----------------------------|-------|        
|CNAME   |autodiscover              |autodiscover.emailsrvr.com  |3600   |


*Note: A common CNAME record entry is an Autodiscover Record. The example shown is the CNAME record used by our Rackspace Cloud Office users to redirect their subdomain, autodiscover.example.com to our Autodiscover server (autodiscover.emailsrvr.com).*

### TXT Record
**TXT Record** (Text Record) is referenced by external sources to check for domain specific polices such as SPF, DKIM, and DMARC.

Example:

|Type    |Hostname                  |Destination                            |TTL    |
|--------|--------------------------|---------------------------------------|-------|        
|TXT     |           @              |v=spf1 include:emailsrvr.com ~all      |3600   |

**Common email-related TXT Records**

-	**SPF record – “Sender Policy Framework"** SPF records are defined as a TXT record in your domain’s DNS. SPF records help recipient mail servers identify unauthorized use of your domain in the form of forgeries (spoofing).
*Note: If you send email from other providers on behalf of your domain, be sure to include their sending server in the same SPF record entry. Do not create multiple SPF records.*

-	**DMARC record – “Domain Message Authentication Reporting and Compliance”**  DMARC indicates to recipient mail servers that messages sent from that domain are employing DKIM and SPF sending policies. The recipient mail server then validates the message you sent them using your DKIM and SPF policies.

-	**DKIM record – “DomainKeys Identified Mail”**  This record assigns a digital signature to mail sent from your domain marking it as authorized mail sent from your domain. If you require instruction to enable DKIM for your Rackspace Cloud Office email please reference [Enable DKIM in the Cloud Office Control Panel](/how-to/enable-dkim-in-the-cloud-office-control-panel/).

*Note: Why are SPF, DMARC, and DKIM important?  With “Spoofing” and “Phishing” attempts increasing dramatically, mail recipients are adopting these methods of sender authentication to combat malicious email. This not only protects those you are sending mail to, but it helps identify mail you are sending as legitimate.*

### DNS propagation
When one of the above records is added/edited in your DNS zone file, it must go through a propagation period.
It takes time to tell the rest of the internet that changes were made to your domain. The industry standard for DNS propagation time is 24-48 hours.

For example if you change your domain's MX records, the change may take up to 24-48 hours to complete. The reason this takes so long is that your domain is associated to an IP address at thousands of databases worldwide. This is how you are able to communicate with email addresses around the world. You send an email, and the message is given a destination by some database somewhere in the world. In short, when you make a change to your domain's DNS, it takes some time to spread the word to databases across the entire globe.
