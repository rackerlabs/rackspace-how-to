---
node_id: 64
title: Create a reverse DNS record
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud DNS
product_url: cloud-dns
---

In this article we discuss how to add a reverse DNS record (also known
as an RDNS record and a PTR record) to map your server's IP address to a
domain name (for example, 1.2.3.4. to example.com). We use the Cloud
Control Panel.

### Why reverse DNS lookups?

Reverse DNS records are essential for those running a mail server since
many recipient servers reject, or mark as spam, all email that
originates from an "unauthenticated" server.

This means that after the sending IP address is checked, if the reverse
DNS does not match the sending domain, then it is classed as
"unauthenticated".

We put "unauthenticated" in quotes because having a Reverse DNS record
attached to your domain does not automatically guarantee acceptance of
email originating from your domain by the recipient's email server. It's
just that non-matching or generic reverse DNS lookup settings are often
rejected out of hand. Having a reverse DNS record for your domain will
prevent email originating from your domain from getting immediately
rejected.

RDNS can also be very useful when tracking down network issues and was
the original driving force of RDNS. When pinging a website or IP
address, one part of the output is the server's RDNS record.

### How does it work?

When you enter a domain name into your browser, the DNS system will find
the IP address of the server the domain is associated with.

A reverse DNS lookup does the opposite. It establishes what domain is
associated with the IP address. This is a useful setting to configure
for anyone, but it is essential for customers running an outgoing mail
server on their Cloud Server.

### How do I set it up?

You can easily set up reverse DNS through the control panel. Just
perform these steps:

1.  Log in to your Rackspace account with the [Cloud Control Panel](http://mycloud.rackspace.com).
2.  On the Servers tab, click the link for your Cloud Server from your
    Servers List.
3.  On the **Server Details** screen, click **Add Record** next to the
    Reverse DNS.

    ![Add record link for Reverse DNS under Server Details](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/reverse%20DNS_add.png)

4.  In the Add Record pop-up window:
    -   Enter your domain name (for example **mail.example.com**) in the
        **Hostname** field.
    -   Set the Time to Live (TTL) for the record.
    -   Click **Save Record**.

5.  Back at the Server Details screen, you will now see 1 record listed
    next to Reverse DNS. Click this link to display the details for the
    reverse DNS you just added.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Article64-3.jpeg" width="713" height="173" />
