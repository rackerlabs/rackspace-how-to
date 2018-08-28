---
permalink: shut-down-a-server/
audit_date: '2018-08-28'
title: Shut down a server
type: article
created_date: '2018-08-28'
created_by: Rackspace Support
last_modified_date: '2018-08-28'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

A common use case for shutting down a server is to determine whether the
server is still actively in use. Sometimes shutting down a server is
the quickest and easiest way to make this determination. Shutting
down the server will *not* end the charges for the server. As long as
the server is utilizing resources, it will accrue charges.

Use the following commands to shut down a server:

- Linux: `shutdown -h now`
- Windows: Open a command prompt and run `shutdown`

These commands shut down the server, and the server no longer
accepts connections. This enables you to determine if the server is
still actively used.

After you know if the server is being used, you can determine your next
steps. If the server is not being used, you might be able to remove it. If you
want to save the content on the server, you can use Cloud Images and Cloud
Backups to back up your content into Cloud Files before removing the server
from the account.

If the server is actively used, you should bring it back online. You can
do this by rebooting the server from the Cloud Control Panel by using
the following steps:

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).
2. In the top navigation bar click **Servers > Cloud Servers**.
3. Click the action cog next to the server that you want to reboot and select **Reboot**.

This brings your server back online.
