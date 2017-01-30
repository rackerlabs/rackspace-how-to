---
permalink: rebuild-a-cloud-server/
audit_date:
title: Rebuild a Cloud Server
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

**Note:** Rebuilding your server from an image is not an option
currently available for OnMetal servers.

One advantage of rebuilding your server (versus creating a new server)
is that you retain the same IP address, which saves you from having to
update your DNS records and wait for DNS propagation.

**Note:** Rebuilding an image destroys all of the data on the server. Be
sure to back up any data you wish to keep in a safe location prior to
performing this task.

1.  From the Cloud Servers page, click the **Actions** menu next to the
    server name.
2.  Choose **Rebuild from Image**.
3.  Select a Rackspace image or one of your own previously saved images
    from the Saved tab, then click **Rebuild Server**.
4.  A pop-up screen appears with the new root password. Save this
    password as you won't be able to see it again once you dismiss
    the message.

The server's status changes to *Rebuilding*. When the build is complete,
the status changes back to *Active*.

**Next section:** [Resize standard servers](/how-to/managing-your-server-resizing-standard-and-general-purpose-servers)
