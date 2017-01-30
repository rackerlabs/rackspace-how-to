---
permalink: getting-started-with-cloud-sites-managing-dns-records/
audit_date:
title: Getting Started With Cloud Sites - Manage DNS Records
type: article
created_date: '2011-11-09'
created_by: Rackspace Support
last_modified_date: '2016-06-20'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

This article provides a quick set of step-by-step instructions for
managing your DNS records via the Rackspace Cloud Control Panel.

1. Log in to the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com).
2. Navigate to **Hosting > Cloud Sites**.
3. Click any **Domain Name** (The Domain tab is accessible from the
   Domain Details screen of any of your websites. All DNS entries are
   visible and editable from the Domain tab).
4. Click the **Domain** Tab.
   The Domain Tab contains 4 sections:

    - Website domain information
    - DNS management
    - MX (Mail Exchanger) management
    - SPF (Sender Policy Framework) records

Let's take a closer look at each of these sections and review their
contents.

### Website domain information

This section allows you to manage your domains **nameserver
settings**, **register an unregistered domain (if applicable)** and
**transfer your domain (if applicable)**.

### DNS management

This section shows all of your DNS records, **add new records**,
**modify existing records** and **delete records**.

#### Add new record

-   To add a new record, choose **Add A Record**.

-   Fill in the **Domain Record** and **Content** with the desired
    values.

#### Modify Existing Record

1. Scroll down to the **DNS Management** portion of the **Domain Tab**.
   This area will provide you with all of the DNS entries for your
   currently-viewed domain within Cloud Sites.

2. Click the domain name next to the record **Type** you would like to modify.

3. Enter in the new **Value** for the DNS entry.

    **Note:** This value could be entered as an IP address for an A record change, or
    a FQDN for a CNAME record change.

4. Click **Save** to update the change in the DNS entry.

### MX (Mail Exchanger) Management

The Rackspace Cloud's network currently has two mail exchangers (MX
hosts) to provide you with a highly available mail solution. If you
choose to run your own DNS servers or host your DNS elsewhere, our
current MX record setup is as follows: (bind format)

-   yourdomain.com. 3600 IN MX 10 mx1.emailsrvr.com.
-   yourdomain.com. 3600 IN MX 20 mx2.emailsrvr.com.

Please check back often as we will add more MX hosts as our system
continues to grow.

For the best Rackspace Cloud mail experience we recommend keeping your
MX hosts up to date. Of course, if you host your DNS with The Rackspace
Cloud, you will not need to make any changes and all of the MX hosts
will be updated automatically.

### SPF (Sender Policy Framework) Records

A SPF record is a DNS TXT record and is added to our DNS zone in the
same manner that A records and MX records are added.

The SPF record (remember the record is associated with the domain)
specifies which mail server(s) the domain uses to send mail.

It does require the server receiving your mail to check the SPF record
to ensure it complies with the domain records but the majority of public
mail servers (such as your ISPs mail servers, google mail and so on)
will do so.

Having said that, we do not guarantee every ISP complies with the SPF
policy or, even if they do, that they do so correctly.

If the receiving server complies with the SPF policy correctly, and the
sent email does not conform to your domain records (i.e. comes from an
unknown server), it will be marked as fake and either deleted or marked
as spam.

One thing to note is that the SPF record allows mail to be quickly
assessed by compliant recipients as the checks are completed from
information in the header of the email. That is, before the body of the
message is loaded. This saves a great deal of time and resources if the
mail is a forgery.

In this section, you will be presented with two options:

1.  Use The Rackspace Cloud's default SPF records
2.  Do not use The Rackspace Cloud's default SPF records

Our suggestion is, if you are not familiar with SPF records and
are not comfortable configuring your own, then opt to use The Rackspace
Cloud's default SPF records.

If you would like to use your own SPF record you can add it to your
domain in a record of type "TXT" in the DNS Management section.

### Next section

[Using the Rackspace name servers](/how-to/getting-started-with-cloud-sites-rackspace-nameservers-and-creating-custom-nameservers)
