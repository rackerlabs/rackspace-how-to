---
permalink: httphandlers-not-working-in-integrated-mode-for-aspnet-sites-on-cloud-sites/
audit_date:
title: HttpHandlers not working in integrated mode for ASP.NET sites on Cloud Sites
type: article
created_date: '2011-03-10'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

If your website is running in [integrated mode](http://www.code-magazine.com/Article.aspx?quickid=060103),
you might have noticed that your
[HttpHandlers](http://msdn.microsoft.com/en-us/library/aa903367(VS.71).aspx)
no longer function even though they are set in your **web.config** file.

### Explanation

This behavior is expected because integrated mode changed the way that
modules and handlers are defined in the **web.config** file, compared to
classic mode in IIS 7 or IIS 6. Integrated mode is the default for IIS 7
and currently the default for all new IIS/ASP.NET websites created in
the Rackspace Cloud. If your website code was originally written for
classic mode or using IIS 6, the **web.config** file might need to be
updated.

### Solutions

-   Peter Kellner's article, [How to use HttpHandlers such as .ashx files with IIS7 Integrated Mode](http://peterkellner.net/2008/09/06/iis7-httphandlers-handlers-integrated-mode-webfarm/),
    briefly covers the differences between the *old way* to set up
    handlers and the *new way*.
-   The Microsoft Developer Network also explains [how to set up HttpHandlers for each of the above situations](http://msdn.microsoft.com/en-us/library/46c5ddfy.aspx).
    This article covers the differences in detail.
