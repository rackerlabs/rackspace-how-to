---
permalink: rebuild-an-aspnet-application-in-cloud-sites/
audit_date:
title: Rebuild an ASP.NET application in Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-04-30'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

There are two methods that you can use the rebuild an ASP.NET
application in IIS.

-   Use the **Rebuild App** link in the **General Settings** tab of your
    Cloud Sites Control Panel. To access this link, go to **Hosting &gt;
    Cloud Sites**, click on the name of the website, and then scroll
    down the **General Settings** tab until you see the **Rebuild App**
    link on the right.

-   Delete and reupload your **web.config** file. The file must be
    deleted and then reuploaded; if you simply overwrite the file, the
    application will not be rebuilt.
