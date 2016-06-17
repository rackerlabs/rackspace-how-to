---
permalink: mail-servers-for-cloud-sites/
audit_date:
title: Mail servers for Cloud Sites
type: article
created_date: '2011-03-23'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article refers to a feature that is no longer available for Cloud Sites. This article exists for legacy support only. Although we no longer offer free email service with Cloud Sites, you can connect to a mail service from your website by using PHPMail or another code library. You need a mail server to which you can connect; you can use our [Rackspace Email service](http://www.rackspace.com/apps/email_hosting/rackspace_email/ "Rackspace Email service"), [Mailgun](http://www.mailgun.com "Mailgun"), or another third-party service that allows SMTP connections.

Several mail servers are available to you. The following table lists some of them.

Server type | Server name | Port
--- | --- | ---
POP3 and IMAP | mail.(domain.com) | 110 (POP3) and 143 (IMAP)
POP3 and IMAP | mail.emailsrvr.com | 110 (POP3) and 143 (IMAP)
POP3 | pop.emailsrvr.com | 110
IMAP | imap.emailsrvr.com | 143
SMTP | smtp.emailsrvr.com | 25, 587, 8025, and 2525
SMTP | mail.emailsrvr.com | 25, 587, 8025, and 2525
SMTP | mail.(domain.com) | 25, 587, 8025, and 2525
POP3 with SSL | secure.emailsrvr.com | 995
IMAP with SSL | secure.emailsrvr.com| 993
SMTP with SSL | secure.emailsrvr.com | 25, 465, 587, 8025, and 2525

**Note:** Although port 25 is listed for SMTP service, most ISPs block it by default because of exploitation of the service. Therefore, port 25 might not work for all customers.

If you have any questions, contact Rackspace Support.
