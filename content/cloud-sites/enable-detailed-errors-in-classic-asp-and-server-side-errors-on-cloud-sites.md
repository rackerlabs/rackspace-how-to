---
permalink: enable-detailed-errors-in-classic-asp-and-server-side-errors-on-cloud-sites/
audit_date:
title: Enable detailed errors in classic ASP and server-side errors on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-06-23'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

You can enable detailed error messages for your classic ASP site on
Windows IIS by using a **web.config** file with the following code.

**Note:** This code is useful in diagnosing issues with a site, but for
security reasons should be turned off when the site is in production.

    <configuration>

      <system.webServer>
        <httpErrors errorMode="Detailed" />
      </system.webServer>
    </configuration>

For more information about the syntax and use of the `<httpErrors>`
element, see [the HTTP Errors article on www.iis.net](http://www.iis.net/ConfigReference/system.webServer/httpErrors).
