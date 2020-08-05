---
permalink: create-a-reverse-dns-record-in-the-my-rackspace-portal/
audit_date: '2020-07-27'
title: 'Create a reverse DNS record in the My Rackspace Portal'
type: article
created_date: '2020-07-18'
created_by: Morgan Marion
last_modified_date: '2020-07-27'
last_modified_by: Rose Morales
product: dedicated-hosting
product_url: dedicated-hosted
---

Reverse Domain Name Service (RDNS) records are also known as pointer (PTR) records. Typically, when you enter a domain
name into your browser, the DNS system locates the IP address of the server hosting the domain. A reverse DNS lookup does
the opposite. It instead associates a domain to an IP address.

RDNS or PTR records are helpful for those running a mail server. Many recipient email servers check the sending IP address
of the message, and if the Reverse DNS does not match the sending domain, the system might reject messages or mark them as
spam. However, all email systems have different approaches to spam prevention, so don't consider this as guaranteed.

### Create a reverse DNS record

Use the following steps tp map your server’s IP address to a domain name:

1. Log in to the **MyRackspace.com** portal.

2. Navigate to **Network > Domains (DNS) > Actions > PTR Records (Reverse DNS)**.

3. Find the device IP address you want to edit and click on the pencil icon on the right.

4. Enter the domain information for the selected IP address and click **Save Changes**.
