---
permalink: create-an-spf-txt-record/
audit_date:
title: Create an SPF TXT record
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-04-13'
last_modified_by: Stephanie Fillmon
product: Cloud DNS
product_url: cloud-dns
---

Email spammers commonly forge the sender address in an email; they send
email from their mail servers but with your domain as the sending email.
The Sender Policy Framework (SPF) attempts to control forged email by
giving domain owners a way to specify which email sources are legitimate
for their domain and which ones aren't. For detailed information about
SPF, see [Sender Policy Framework Project Overview](http://www.openspf.org/).

You can add an SPF record to your DNS zone as a TXT record. The SPF
record is associated with your domain and specifies which mail server or
servers the domain uses to send email.

### Considerations for setting the SPF

To correctly set the SPF for your domain, answer the following
questions:

- **From what server or servers will email from the domain originate?**

  If you are sending email from your workstation by using your ISP's mail servers, you might want to consider their servers. All possible (legitimate) sending servers need to be taken into account.

- **How do you want illegitimate email to be handled?**

  Do you want it to be rejected outright, or do you want the message to be classified as a "soft fail," meaning that the email will be subjected to further scrutiny.

### Create an SPF rule

Suppose you have the following considerations for your email on a
specific domain:

-   Authorized servers are your cloud server (that is, the incoming MX
    details also send mail) and Google mail.
-   No other servers are authorized.

You would create the following rule and add it to a TXT record:

    v=spf1 mx include:_spf.google.com -all

Each part of the record is defined as follows:

-   `v=spf1` sets the SPF version being used.

-   `mx` allows the domain's MX details to send email.

-   `include:_spf.google.com` includes Google mail servers as
    authorized servers.

-   `-all` indicates that servers that are not listed previously are
    *not* authorized to send email. If an unauthorized server does send
    email, action is taken according to the receiving mail server's own
    policy (for example, delete the email or mark it as spam).

#### About the all setting

The `all` setting is an important aspect of the record and has the
following basic markers:

- `-all` - Any server not previously listed is not authorized to
    send email, no questions asked.

- `~all` - If mail is received from a server that is not previously
    listed, it is marked as a soft fail, which allows the email to be
    scrutinized further.

- `+all` - Allow any server to send email from your domain.
    Naturally, you should never use this option.

### Add an SPF TXT record

To add an SPF TXT record by using the Cloud Control Panel, follow these
steps:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2.  In the top navigation bar, select **Networking > Cloud DNS**.

3.  Click the action gear next to the name of the domain that you want
    to modify, and select **Add DNS Record**.

    <img src="{% asset_path cloud-dns/create-an-spf-txt-record/SPF%20Record%20DNS.png %}" alt="DNS SPF Record" />

4.  Select **TXT Record** for the record type.

5.  Enter the rule in the **Text** area. For example, enter
    `v=spf1 mx -all` to indicate that all email is sent from this server
    and no other mail servers are authorized.

6.  Specify the Time To Live (TTL).

7.  Click **Add Record**.

#### Related articles

[Creating a DKIM TXT Record](/how-to/create-a-dkim-txt-record)
