---
permalink: hosted-microsoft-lync-at-rackspace-deployment-guide/
audit_date:
title: Hosted Microsoft Lync at Rackspace Deployment Guide
type: article
created_date: '2014-10-20'
created_by: Aaron Medrano
last_modified_date: '2018-01-18'
last_modified_by: William Loy
product: Microsoft Skype for Business
product_url: skype-for-business
---

Hosted Microsoft Lync is a unified communications tool that offers
secure instant messaging, video chat, file transfer, and presence to
users from desktop and mobile devices. It is available as an add-on
for Rackspace Hosted Exchange 2013 email platform.

Depending on the size of your organization and your IT infrastructure,
the rollout of the Rackspace Hosted Lync service to your users will
vary. The overall deployment plan has three basic steps, and this
article is designed to help you decide the best rollout method for your
environment.

### Set up DNS records for Lync

As the first step, you must create Auto-discover entries on your DNS
server.  If you have an internal DNS you must also set up these records
on your internal DNS.

We highly recommend that you perform this step because all of the Hosted
Lync features will work only if DNS is correctly configured. For
instructions, see [Set up Cloud Office Skype for Business DNS records](/how-to/set-up-dns-records-for-cloud-office-skype-for-business/).

**Note:** If you are a Rackspace Hosted Exchange customer, these
settings are in addition to what you might currently have for Hosted
Exchange Autodiscover.

### Activate Lync for users in the Email Administrator Control Panel

You can enable Lync for your entire domain or only for selected users.
In the Email Administrator Control Panel, click on the Lync hyperlink to
go to the Lync page, and then select the check box next to the users to
enable Lync for them.

### Deployment and distribute the client

Depending on the complexity of your environment, you have various
options for deploying Lync clients for desktops. The Lync 2013 client is
part of the Microsoft Office Professional Plus bundle. You can also
download a basic version for free.

-   [Lync
    client download](/how-to/download-a-skype-for-business-client)

-   [Lync client setup tool](https://emailhelp.rackspace.com/) - (Login
    for setting up Lync on your devices)

-   [Lync 2013 deployment guide on
    TechNet](http://technet.microsoft.com/en-us/library/jj204827.aspx)
