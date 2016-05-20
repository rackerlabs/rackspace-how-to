---
permalink: transferring-your-dns-hosting-to-rackspace/
audit_date:
title: Transfer your DNS hosting to Rackspace
type: article
created_date: '2011-11-16'
created_by: Rae D. Cabello
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Rackspace enables you to manage your DNS through our control panel while allowing you to keep your domain registered with your current hosting provider. To do so, perform the following steps.

**Note:** The service has an annual fee of $5.

1. Contact our support team and request the **DNS Hosting** service for your domain. At this time, we will automatically set up your DNS according to your current DNS settings, so that you will not experience any interruption of service
when the nameservers transfer to point to Rackspace.

2. Contact your domain registrar and ask them to change your nameservers to point to the following. If you're unsure of who your domain registrar is, you can check your domain's registration info at the website who.is.
    - **Primary**: DNS1.NAME-SERVICES.COM
    - **Secondary**: DNS2.NAME-SERVICES.COM
    - **Secondary**: DNS3.NAME-SERVICES.COM
    - **Secondary**: DNS4.NAME-SERVICES.COM
    - **Secondary**: DNS5.NAME-SERVICES.COM

**Note:** DNS changes can take up to 48 hours to resolve. We recommend that you make this switch during non-business hours or when email activity is light. No email will be lost during this transition, but do not cancel your current DNS hosting service until the transfer is complete.
