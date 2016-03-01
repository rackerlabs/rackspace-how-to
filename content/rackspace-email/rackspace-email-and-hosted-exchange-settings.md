---
node_id: 4214
title: Rackspace Email and Hosted Exchange settings
type: article
created_date: '2014-08-27'
created_by: Cody Jobson
last_modified_date: '2016-01-14'
last_modified_by: Rose Coste
product: Rackspace Email
product_url: rackspace-email
---

To set up your email hosted by Rackspace on either your desktop email
client (like Outlook or Mac Mail) or on your mobile device, you can
perform the configuration with the help of our Email Help
Tool or you can enter the settings
manually.

### Email Help Tool

The Email Help Tool guides you through the setup process from start to
finish. The tool automates the setup process for supported email
accounts and clients or provides instructions for manually
configuring your client.

Access the tool at [Rackspace Email Help Tool](https://emailhelp.rackspace.com/).

### Manual configuration settings

If the Email Help Tool doesn't offer instructions for your mail client
or if you want to set up your client directly, you can manually
configure your email client or device by using the settings in this section.

**Note:** If your email uses an Exchange mailbox and you don't want to
set up the connection as IMAP or POP, you can find additional
information for specific clients and devices in [Configure email clients
and mobile devices for email hosted on
Exchange](/how-to/configure-email-clients-and-mobile-devices-for-email-hosted-on-exchange).

To learn more about the differences between IMAP and POP, see [IMAP and POP mail protocol
comparison](/how-to/imap-and-pop-mail-protocol-comparison). We
recommend using IMAP for the incoming mail connection.

#### Secure settings

**Recommended:** The following server settings provide a secure (SSL) connection:

- For protocol **POP3 (incoming)**, use SSL server name `secure.emailsrvr.com` at SSL port number `995`.
- For protocol **IMAP (incoming)**, use SSL server name `secure.emailsrvr.com` at SSL port number `993`.
- For protocol **SMTP (outgoing)**, use SSL server name `secure.emailsrvr.com` at SSL port number `465`.

#### Alternative settings

**Warning:** The following alternative server settings do *not* use SSL and therefore do not make a secure connection to the mail server:

- For protocol **POP3 (incoming)**, use non-SSL server name `pop.emailsrvr.com` at non-SSL port number `110`.
- For protocol **IMAP (incoming)**, use non-SSL server name `imap.emailsrvr.com` at non-SSL port number `143`.
- For protocol **SMTP (outgoing)**, use non-SSL server name `smtp.emailsrvr.com` at non-SSL port number `25`, `587`, `8025`, or `2525`.
