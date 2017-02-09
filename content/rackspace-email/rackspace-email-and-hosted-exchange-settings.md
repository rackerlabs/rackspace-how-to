---
permalink: rackspace-email-and-hosted-exchange-settings/
audit_date: '2016-07-18'
title: Rackspace Email and Hosted Exchange settings
type: article
created_date: '2014-08-27'
created_by: Cody Jobson
last_modified_date: '2016-07-18'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

To set up your email hosted by Rackspace on either your desktop email
client (like Outlook or Mac Mail) or on your mobile device, you can
use our Email Help Tool or enter the settings manually.

### Email Help Tool

The Email Help Tool guides you through the entire setup process. The tool automates the setup process for supported email accounts and clients, or provides instructions for manually
configuring your client.

Access the tool at [Rackspace Email Help Tool](https://emailhelp.rackspace.com/).

### Manual configuration settings

If the Email Help Tool doesn't offer instructions for your mail client
or if you want to set up your client directly, you can manually
configure your email client or device by using the settings in this section.

**Note:** If your email uses an Exchange mailbox and you don't want to
set up the connection as IMAP or POP, you can find information for specific clients and devices in [Configure email clients and mobile devices for email hosted on Exchange](/how-to/configure-email-clients-and-mobile-devices-for-email-hosted-on-exchange).

To learn more about the differences between IMAP and POP, see [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison). We
recommend using IMAP for the incoming mail connection.

#### Secure settings (recommended)

The following server settings provide a secure (SSL) connection:

| Protocol | SSL server name | SSL port number |
| --- | --- | --- |
| POP3 (incoming) | secure.emailsrvr.com | 995 |
| IMAP (incoming) | secure.emailsrvr.com | 993 |
| SMTP (outgoing) | secure.emailsrvr.com | 465 |

#### Alternative settings

**Warning:** The following alternative server settings do *not* use SSL and therefore do not make a secure connection to the mail server.

| Protocol | Server name | Port number |
| --- | --- | --- |
| POP3 (incoming) | pop.emailsrvr.com | 110 |
| IMAP (incoming) | imap.emailsrvr.com | 143 |
| SMTP (outgoing) | smtp.emailsrvr.com | 25, 587, 8025, or 2525 |
