---
permalink: managing-domain-reputation/
audit_date:
title: Managing domain reputation
type: article
created_date: '2018-09-13'
created_by: Rackspace Support
last_modified_date: '2018-09-23'
last_modified_by: Ben Smith
product: Rackspace Email
product_url: rackspace-email
---


### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Tools required:** DNS host admin access

### How-To: Manage Domain Reputation

Domain reputation, in terms of email, is a measure of how trustworthy your domain's email is considered by the rest of the world. Every receiver of email maintains their own specific measure of reputation, but there are many industry accepted recommendations domain owners can follow to build a solid reputation. As more and more email providers are strengthening their rules for what is considered untrustworthy, failure to follow these recommendations may lead to your mail being considered spam, rate limited, or outright rejected.



There are three pillars that are the foundation of any domain reputation strategy today: SPF, DKIM, and DMARC. These features are designed to provide two basic things:

1. A method of verifying the email comes from a legitimate source specified by the domain owner.

2. A way for you, as the domain owner, to tell email providers what to do with messages that do not meet those legitimacy requirements.



Individually, these three features are limited in how much they can do, but together they form a fairly clear process for identifying legitimate email from your domain. Providing these clear indicators is fundamental to establishing a good domain reputation. Rackspace recommends a 1, 2, 3 approach to establishing domain reputation, which is outlined below:

- [Create an SPF record](/how-to/create-an-spf-policy). SPF, or Sender Policy Framework, is a DNS record that tells the world where your email is authorized to come from. Typically, this record contains entries for your email hosting provider, and any email services you use, such as ticketing systems, CRMs, and bulk sending services.

- [Enable DKIM](/how-to/enable-dkim-in-the-cloud-office-control-panel). DKIM, or Domain Keys Identified Mail, applies an encrypted signature that is specific to your domain, on every message sent from your domain. Most email service providers offer DKIM as a feature of their service. Typically each sending service listed in your SPF record would have it's own DKIM signature that it adds to your email.

- [Create a DMARC policy](/how-to/create-a-dmarc-policy). DMARC, or Domain Message Authentication Reporting and Conformance, is built on SPF and DKIM. It combines the validation results from both SPF and DKIM, and adds a 'sender alignment check' to protect against many forms of spoofing. The policy part of DMARC is what allows you, as the domain owner, to specify what to do with email that fails these checks. It also includes a reporting aspect that is critical to long-term management of your domain's reputation. This reporting gives you visibility into the email being sent as your domain: where it's coming from (SPF), whether or not it's properly signed (DKIM), and whether or not it is passing your DMARC policy.



Since many companies have multiple domains, and use many services that require email, managing reputation across several domains can become complicated. Here are some general recommendations for managing your business email needs across many domains. These recommendations are intended to help you scale the above domain reputation strategy across your entire organization:



### Separate Your Email Needs

You should always separate mail by purpose and class (marketing/sales, transactional, person-to-person, etc.) using specific subdomains wherever possible. Below is a table of different email purposes and their suggested domain naming conventions.

| Ticket System Emails |Marketing Emails | Newsletter Emails|
| --- | --- | --- |
|support.mydomain.com | marketing.mydomain.com | news.mydomain.com |


In addition to separating email by purpose, there are a few other recommendations to properly manage your domain's reputation.  

- Never share DKIM keys between services. Each source should have its own DKIM key. Most services offer this as a feature. If a subdomain has multiple sending sources, then it will have multiple SPF includes and DKIM keys. This is perfectly normal.

- The segregation both allows you to lock down each mail stream, as well as isolate each mail stream from any issues the other(s) may have. This is important when it comes to managing sending reputation of your different email sources. When it comes to managing your domain’s (and sub-domains) reputation, different classes of email have different considerations.

- Configure SPF, DKIM, and DMARC for each subdomain

- Keeps your sending sources segregated and manageable for both SPF and DKIM records.



### Person-to-Person Corporate Mail is Special

- Reserve your primary domain for only person-to-person email (your employees).

- Don’t use vanity addresses on your primary domain for automated systems, such as ‘support@mydomain.com’ for your ticketing system.

- Configure an umbrella DMARC policy on the root domain, and create subdomain-specific DMARC policies based on the specific requirements and class of mail it represents

- For example, you might use p=quarantine on your primary domain (person-to-person email), but p=reject on your outbound-only transactional email (support tickets)

- This also ensures that the root domain will catch all DMARC reporting that might be missed or misconfigured at the sub-domain level, as well as catching any unauthorized subdomains attempting to spoof your brand.
