---
permalink: find-dns-host/
audit_date:
title: Find your DNS host
type: article
created_date: '2017-05-17'
created_by: William Loy
last_modified_date: '2017-05-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

**Applies to:** Account Administrator

**Difficulty:** Easy

**Time Needed:** 10 minutes

**Tools Required:** Internet Browser


## Overview:
Instructions for locating your domain’s DNS host. If you need to configure your DNS for Rackspace Cloud Office Email products click [here](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

## Find your DNS host

#### How do I find out who my DNS host is?
You can use the following steps to identify where you can add/edit entries for your domain (DNS).

1.	Search for your domain at [https://who.is/](https://who.is/)
2.	Look for the field titled “Name Server” – this is the location of your DNS host.
3.	If any of the following server names are listed in the field “Name Server” for your domain, Rackspace is most likely your DNS host and can assist with editing of your DNS records [here](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

    |   Name Server   |   
    |-----------------|
    |NS.RACKSPACE.COM |
    |NS2.RACKSPACE.COM|

    |      Name Server     |
    |----------------------|
    |DNS1.STABLETRANSIT.COM|
    |DNS2.STABLETRANSIT.COM|

    |     Name Server      |
    |----------------------|
    |DNS1.NAME-SERVICES.COM|
    |DNS2.NAME-SERVICES.COM|
    |DNS3.NAME-SERVICES.COM|
    |DNS4.NAME-SERVICES.COM|
    |DNS5.NAME-SERVICES.COM|

4.	To find the company that is hosting your domain's DNS (in order to access and edit your DNS records) you can google the entry found in the “Name Server” field from above.
5. If this search does not work, try contacting any company you pay for webhosting as they are likely who is hosting your DNS. Rackspace Cloud Office does offer DNS hosting but we do not offer website hosting.

#### How do I add or edit entries for my DNS host?

You can find links to articles with instructions to modify your DNS records for some of the more common DNS hosts below. If your host is not listed below, please search their knowledge base or contact their support for assistance with modifying your DNS.

**GoDaddy**
[https://www.godaddy.com/help/manage-dns-680](https://www.godaddy.com/help/manage-dns-680)

**BlueHost**
[https://my.bluehost.com/cgi/help/559](https://my.bluehost.com/cgi/help/559)

**HostGator**
[http://support.hostgator.com/articles/changing-dns-records](http://support.hostgator.com/articles/changing-dns-records)

**Network Solutions**
[http://www.networksolutions.com/support/how-to-manage-advanced-dns-records/](http://www.networksolutions.com/support/how-to-manage-advanced-dns-records/)

**1&1**
[https://help.1and1.com/domains-c36931/manage-domains-c79822/dns-c37586](https://help.1and1.com/domains-c36931/manage-domains-c79822/dns-c37586)
