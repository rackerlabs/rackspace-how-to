---
permalink: rackspace-email-faq/
audit_date:
title: Rackspace Email FAQ
type: article
created_date: '2015-12-02'
created_by: Rackspace Support
last_modified_date: '2018-11-20'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

Get quick answers to common questions about [Rackspace Email](https://www.rackspace.com/email-hosting/webmail).

#### What is the maximum mailbox storage?

The maximum size of a Rackspace Email box is 25 GB.

#### What is the maximum size for an attachment?

The maximum size for an attachment in the Rackspace environment is 50 MB.

#### How do I add a signature to my email?

You can find instructions for this in [Add a signature to Rackspace Email](/how-to/adding-a-signature-to-rackspace-email).

#### How do I add an alias?

You can find instructions for this in [Add an alias with Rackspace Email](/how-to/adding-an-alias-with-rackspace-email).

#### How many group lists can I create?

You can create an unlimited number of group lists. Each group list can have an unlimited number of internal recipients and a maximum of 250 external recipients.

#### How can I view my email online?

You can view and manage your email at [https://apps.rackspace.com](https://apps.rackspace.com/).

#### How do I change my password?

A Rackspace Email user can change their password through [Webmail](https://apps.rackspace.com/). For more information, see [Change a Rackspace Email mailbox password](/how-to/change-rackspace-email-mailbox-password/).

#### What's the difference between IMAP and POP?

The main difference between IMAP and POP is that IMAP works with email directly on the server, while POP fetches mail from the server and works with it on your local computer. For more information, see [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

We strongly recommend using an IMAP connection with Rackspace Email.

#### Where can I view my billing invoice?

You can view your billing invoice through the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f). After you are logged in, click your account name in the upper-right corner and select **Billing & Payments**. The click the **Invoice History** link. You can then select any of your past invoices to view their history.

#### Help! I'm locked out of my control panel!

No worries! Just call our main support line so we can direct you to your dedicated support team for help: 1 800 961 4454.

#### How do I purchase more storage, mailboxes, licenses to my account?

To purchase or make an upgrade to your account, log in to your control panel, click your account name in the upper-right corner, and select **Upgrades & Services**. Click the link for the product you want to upgrade.

#### How can I add an admin to my account?

For instructions, see [Manage email administrators with the Cloud Office Control Panel](/how-to/manage-email-administrators-with-the-cloud-office-control-panel).

#### How do I submit a ticket?

Log in to your control panel and click the **Support** menu at the top of the screen. From the menu, select **View Tickets**. To create a new ticket, click **New Ticket** and fill out the information describing your request or issue and submit. You can also view a history of your most recent tickets.

#### How can I determine the Cloud Office system status?

To view the Cloud Office system status, go to <http://status.apps.rackspace.com/>.

#### How do TLS and SSL work in Cloud Office?

Transport Layer Security (TLS) and its predecessor, Secure Socket Layer
(SSL), are cryptographic protocols that provide security for
communications over networks. TLS and SSL encrypt the segments of
network connections at the application layer to ensure secure end-to-end
transit at the transport layer. For our purposes, they create an
encrypted tunnel through which we send plain text emails.

Cloud Office servers by default attempt a TLS connection for both
in and outbound email. For outgoing mail (any of our servers sending to
external MX servers), we perform TLS if it is advertised by the
remote server. When performing outgoing TLS, our servers are permissive
with the certificate (in other words, if the site is using an untrusted
or self-signed certificate, as long as it is a working certificate, we
should still accept it).

**Our outgoing SMTP servers use TLS in an opportunistic fashion.**
This means that our servers attempt to open an SMTP transaction
with the recipient server by using TLS. If TLS cannot be successfully
connected, the communication defaults back to an unencrypted
transmission of the data, also referred to as PLAINTEXT.

Our servers respond to TLS and SSL requests to send mail to us encrypted.
