---
permalink: managing-domain-reputation/
audit_date: '2018-09-24'
title: Managing domain reputation
type: article
created_date: '2018-09-13'
created_by: Ben Smith
last_modified_date: '2018-09-23'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

This article describes best practices for managing your domain reputation to ensure that your email is considered to be trustworthy.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Tools required:** DNS host admin access

### Manage domain reputation

Domain reputation, in terms of email, is a measure of how trustworthy others believe your domain's email to be. Every email recipient maintains their own specific measure of reputation, but there are many industry-accepted recommendations that domain owners can follow to build a solid reputation. As more and more email providers are strengthening their rules for what is considered untrustworthy, failure to follow these recommendations might lead to your mail being considered spam, rate limited, or rejected.

The three pillars of any domain reputation strategy are Sender Policy Framework (SPF), Domain Keys Identified Mail (DKIM), and Domain-based Message Authentication, Reporting, and Conformance (DMARC). These features are designed to provide two basic things:

1. A method of verifying that the email comes from a legitimate source specified by the domain owner.

2. A way for you, as the domain owner, to tell email providers what to do with messages that do not meet those legitimacy requirements.

Individually, these three pillars are limited in how much they can do, but together they form a fairly clear process for identifying legitimate email from your domain. Providing these clear indicators is fundamental to establishing a good domain reputation. Rackspace recommends the following 1, 2, 3 approach to establish domain reputation:

1. [Create an SPF record](/how-to/create-an-spf-policy). SPF is a DNS record that tells the world where your email is authorized to come from. This record typically contains entries for your email hosting provider and any email services you use, such as ticketing systems, Customer Relationship Management systems (CRMs), and bulk sending services.

2. [Enable DKIM](/how-to/enable-dkim-in-the-cloud-office-control-panel). DKIM applies an encrypted signature that is specific to your domain on every message sent from your domain. Most email service providers offer DKIM as a feature of their service. Typically, each sending service listed in your SPF record has its own DKIM signature that it adds to your email.

3. [Create a DMARC policy](/how-to/create-a-dmarc-policy). DMARC is built on SPF and DKIM. It combines the validation results from both SPF and DKIM, and adds a 'sender alignment check' to protect against many forms of spoofing. The policy part of DMARC is what allows you, as the domain owner, to specify what to do with email that fails these checks. It also includes a reporting aspect that is critical to long-term management of your domain's reputation. This reporting gives you visibility into the email being sent as your domain: where it's coming from (SPF), whether or not it's properly signed (DKIM), and whether or not it is passing your DMARC policy.

Because many companies have multiple domains and use many services that require email, managing reputation across several domains can become complicated. Here are some general recommendations for managing your business email needs across many domains. These recommendations are intended to help you scale the domain reputation strategy described above across your entire organization:

### Separate your email needs

You should always separate mail by purpose and class (marketing, sales, transactional, person-to-person, and so on) by using specific subdomains wherever possible. The following table shows different email purposes and their suggested domain naming conventions.

| Ticket system emails | Marketing emails | Newsletter emails |
| --- | --- | --- |
| support.mydomain.com | marketing.mydomain.com | news.mydomain.com |

In addition to separating email by purpose, the following recommendations help to properly manage your domain's reputation. 

- Never share DKIM keys between services. Each source should have its own DKIM key. Most services offer this as a feature. If a subdomain has multiple sending sources, then it has multiple SPF includes and DKIM keys. This is perfectly normal.

- Segregating emails enables you to lock down each mail stream, as well as isolate each mail stream from any issues the others might have. This is important when it comes to managing the sending reputation of your different email sources. When it comes to managing your domain’s (and subdomain's) reputation, different classes of email have different considerations.

- Configure SPF, DKIM, and DMARC for each subdomain.

- Keep your sending sources segregated and manageable for both SPF and DKIM records.

### Person-to-person corporate mail is special

For person-to-person corporate mail, consider the following best practices:

- Reserve your primary domain for only person-to-person email (your employees).

- Don’t use vanity addresses on your primary domain for automated systems, such as support@mydomain.com for your ticketing system.

- Configure an umbrella DMARC policy on the root domain, and create subdomain-specific DMARC policies based on the specific requirements and class of mail it represents.
   
   - For example, you might use `p=quarantine` on your primary domain (person-to-person email), but `p=reject` on your outbound-only transactional email (support tickets).
   - Taking this step also ensures that the root domain catches all DMARC reporting that might be missed or misconfigured at the subdomain level, as well as catching any unauthorized subdomains attempting to spoof your brand.
