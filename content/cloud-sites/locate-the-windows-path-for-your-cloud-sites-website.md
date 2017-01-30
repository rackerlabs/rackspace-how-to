---
permalink: locate-the-windows-path-for-your-cloud-sites-website/
audit_date:
title: Locate the Windows path for your Cloud Sites website
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

When you configure some ASP or ASP.NET web applications, you might need
to provide the absolute path, full path, or web root for your website.
If your web application uses ASP, ASP.NET, or your default site
technology is Windows, you'll typically want to use the Windows web
directory. If don't know whether you need the Windows or Linux path,
consult a web developer or the web application vendor, or contact
support for a recommendation.

**Note:** If you need to find your website's Linux path, see [Locate the Linux path for your Cloud Sites website](/how-to/locate-the-linux-path-for-your-cloud-sites-website).

### Find the website's Windows path

1.  Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com).
2.  In the left navigation pane, click **Hosting > Cloud Sites**.
3.  Click on the name of the website for which you need to obtain the
    Windows path.
4.  Click the **Features** tab.
5.  Scroll to the bottom of the page to the **Server-side Paths**
    section.
    Under **Windows Info**, the absolute path to your ASP Windows site
    is the one labeled **Web directory**. The path should resemble the
    following format:

    **\\\\fs1-n01\\stor1wc1dfw1\\123456\\www.domain.com\\web\\content\\**
