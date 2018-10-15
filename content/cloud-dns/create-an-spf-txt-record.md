---
permalink: create-an-spf-txt-record/
audit_date: '2018-10-12'
title: Create an SPF TXT record
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2018-10-15'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

Email spammers commonly forge the sender address in an email. They send
email from their own mail servers, but with your domain as the
sending email. The Sender Policy Framework (SPF)
attempts to control forged email by giving domain owners a way to specify
which email sources are legitimate for their domains and which ones aren't. 
For detailed information about SPF, see the
[Sender Policy Framework Project Overview](http://www.openspf.org/).

You can add an SPF record to your Domain Name System (DNS) zone as a text
(TXT) record. The SPF record is associated with your domain and specifies
which mail server or servers the domain uses to send email.

### Considerations for setting the SPF

To correctly set the SPF for your domain, answer the following
questions:

- **From what server or servers will email from the domain originate?**

  If you're sending email from your workstation by using your internet service
  provider's (ISP) mail servers, you might want to consider their servers. You
  must take all possible (legitimate) sending servers into account.

- **How do you want illegitimate email to be handled?**

  Do you want it to be rejected outright, or do you want the message to be
  classified as a _soft fail_, meaning that the email will be subjected to
  further scrutiny.

### Create an SPF rule

The example in this section assumes that you have the following considerations
for your email on a specific domain:

-   The authorized servers are your cloud server (that is, the incoming mail
    exchange (MX) details also send mail) and Google mail.
-   No other servers are authorized.

In this situation, you would create the following rule and add it to a TXT
record:

    v=spf1 mx include:_spf.google.com -all

The following list shows how each part of the record is defined:

-   `v=spf1`: Sets the SPF version that is used.

-   `mx`: Allows the domain's MX details to send email.

-   `include:_spf.google.com`: Includes Google Mail servers as
    authorized servers.

-   `-all`: Indicates that servers that are not listed previously are
    not authorized to send email. If an unauthorized server does send
    email, action is taken according to the receiving mail server's own
    policy. For example, the email is deleted or marked as spam.

#### About the all setting

The `all` setting is an important aspect of the record and has the
following basic markers:

- `-all`: Any server that is not previously listed is not authorized to
  send email.

- `~all`: If mail is received from a server that is not previously
   listed, it is marked as a soft fail, which allows the email to be
   scrutinized further.

- `+all`: Allows any server to send email from your domain.

   **Note**: This last option should never be used.

### Add an SPF TXT record

To add an SPF TXT record by using the Cloud Control Panel, use the following
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

6.  Specify the Time to Live (TTL).

7.  Click **Add Record**.

#### Related resources

For more information, see the following resources:

- [Create a DKIM TXT record](/how-to/create-a-dkim-txt-record)

- [SPF Record Testing Tools](https://www.kitterman.com/spf/validate.html)
