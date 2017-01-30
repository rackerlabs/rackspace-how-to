---
permalink: spam-filtering-technologies/
audit_date:
title: Spam filtering technologies
type: article
created_date: '2016-11-28'
created_by: Thomas Hester
last_modified_date: '2016-11-28'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

We continuously update the spam filtering system we use for our mailboxes in a multi-layered process that eliminates 98% of spam with nearly zero false positives. Spam filtering is included at no additional cost with all mailboxes.

This article describes the three layers of spam filtering that are included with your mailboxes.


### LAYER 1: THE GATEWAY SCAN

As soon as an email arrives, our gateway servers try to match the sending IP address to an aggregated blacklist compiled from multiple spammer tracking systems. The servers analyze the email message in comparison to other arriving mail. If a large number of emails arrive simultaneously from a single IP, or are addressed to users that do not exist in our system, it could signify a spam attack, and the servers block the offending email. If the sending address is from a domain in our system but the mailbox does not exist, the servers block the email.

### LAYER 2: THE CLOUDMARK&reg; SCAN

All email is scanned with Cloudmark's industry-leading spam detection software. Cloudmark uses Advanced Message Fingerprinting&trade; to detect viruses, spam, and phishing. Advanced Message Fingerprinting uses algorithms that detect spam across all languages and character formats. These algorithms update every 60 seconds based on worldwide feedback loops and the latest spam tactics.

### LAYER 3: THE MESSAGE SNIFFER SCAN

Message Sniffer, from ARM Research Labs, relies on pattern recognition and machine learning technology to detect spam and malware. It searches the entire message for spam and malware features, including unusual headers, message source behaviors, structural artifacts, obfuscation techniques, binary and image signatures, email and URL targets, unusual code fragments, and even coding styles.


