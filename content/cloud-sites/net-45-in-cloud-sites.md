---
permalink: net-45-in-cloud-sites/
audit_date:
title: .NET 4.5 in Cloud Sites
type: article
created_date: '2012-12-12'
created_by: Jereme Hancock
last_modified_date: '2016-06-22'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Cloud Sites: .NET 4.5 Now Available

Rackspace Cloud Sites now offers .NET version 4.5. Please take some time
to familiarize yourself with the changes, benefits, and features of .NET
4.5 here - <http://msdn.microsoft.com/en-us/library/ms171868.aspx>

.NET 4.0 is still available in the Cloud Sites Control Panel as a
technology option.

If your websites are currently .NET 4.5-compatible we recommend that you
perform the .NET 4.5 upgrade. Customers can upgrade to .NET 4.5 by
selecting the .NET 4.5 technology option from the Features page of the
control panel. This migration is a very easy process. Follow
these steps:

Ensure that your applications or CMS solutions are running
the latest .NET 4.5-compatible version prior to upgrading from .NET 4.0
to .NET 4.5. Most CMS solutions have an automatic upgrade process and
should be compatible with .NET 4.5 (if you are unsure, please check with
your CMS vendor).

In your Cloud Sites Control Panel, navigate to **Hosting > Cloud
Sites** and click on your site.  Next select the **Features** tab and
click **Change Technology**.

Select the appropriate .NET 4.5 option and click **Change
Technology**.

Your Site may take up to 2 minutes to migrate to the new .NET 4.5
cluster.  Repeat this process for each site that you host that is
running .NET 4.0.

**Note**: Changing the default technology from .NET 4.0 to .NET
4.5 will change the site's IP address. If you are managing your DNS with
Rackspace Cloud (your site is pointing to our name servers:
dns1.stabletransit.com or dns2.stabletransit.com) your IP address will
be automatically updated. If you are managing your own DNS (your site is
not pointing to our name servers) you will need to update your DNS to
point the site to the new IP address.

That's it, you are now migrated to .NET 4.5.
