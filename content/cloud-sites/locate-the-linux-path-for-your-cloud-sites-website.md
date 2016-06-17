---
permalink: locate-the-linux-path-for-your-cloud-sites-website/
audit_date:
title: Locate the Linux path for your Cloud Sites website
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

When you configure some Pre Hypertext Processor (PHP) web applications,
you might need to provide the absolute path, full path, or web root for
your website. If your web application uses PHP or your default site
technology is Linux, you'll typically want to use the Linux web
directory. If you don't know whether you need the Linux or Windows path,
consult a web developer or the web application vendor, or contact
support for a recommendation.

**Note:** If you need to find your website's Windows path, see [Locate the Windows path for your Cloud Sites website](/how-to/locate-the-windows-path-for-your-cloud-sites-website).

### Find the website's Linux path

1.  Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com).
2.  In the left navigation pane, click **Hosting > Cloud Sites**.
3.  Click on the name of the website for which you need to obtain the
    Linux path.
4.  Click the **Features** tab.
5.  Scroll to the bottom of the page to the **Server-side Paths**
    section.
    Under **Linux Info**, the absolute path to your Linux PHP site is
    the one labeled **Web directory**. The path should resemble the
    following format:

    **/mnt/stor1-wc1-dfw1/123456/www.domain.com/web/content/**
