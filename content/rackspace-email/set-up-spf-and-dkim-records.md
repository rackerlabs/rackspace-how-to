---
permalink: set-up-spf-and-dkim-records/
audit_date:
title: Set up SPF and DKIM records
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-11'
last_modified_by: Rose Contreras
product: Rackspace Email
product_url: rackspace-email
---

DomainKey Identified Mail (DKIM) and Sender Policy Framework (SPF) are two methods that can protect you from email spamming, spoofing, and phishing attempts.

- The SPF method lets you specify which email servers are legitimate servers for your domain.
- The DKIM method lets you attach a DomainKey signature to your outgoing mail. The receiving server then verifies the validity of the key and either accepts or rejects the mail.

SPF and DKIM are frequently used in combination since they attack email problems from two different angles.

For instructions on how to create DNS TXT records for DKIM and SPF, see the following articles:

- [Create a DKIM TXT record](/how-to/create-a-dkim-txt-record "Creating a DKIM TXT Record")

- [Create a SPF TXT record](/how-to/create-an-spf-txt-record "Creating a SPF TXT Record")
