---
permalink: set-up-spf-records
audit_date:
title: Set Up SPF Records
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud DNS
product_url: cloud-dns
---
When you add SPF information to your DNS records, you are able to specify the email servers you use to send email from your domain. This validates your sending email address, which can improve your email deliverability rate. In other words, SPF helps to keep your domain’s email out of your recipients’ spam folders.
To get started, you must first contact your DNS hosting company and ask them to add the following SPF information to your DNS records. Or, if you can log into the control panel for your DNS, you can make this change yourself.

Hostname:
<@domain>

Record Type:    
TXT

Address:
v=spf1 [any combination of the below] ~all

Hosted Exchange and Email Hosting customers:
include:emailsrvr.com

If you send email from your own server (replace "1.2.3.4" with your mail server IP):    
ip4:1.2.3.4

For example, if your domain falls into both of these categories, the SPF would look like the following:
v=spf1 include:emailsrvr.com ip4:1.2.3.4 ~all

Repeat these steps for every domain from which you plan to send email.

Note: When you are composing an email, you must use a "From" address (or, specifically, a "Return-Path") that belongs to an SPF-enabled domain, otherwise SPF will not be in effect.
