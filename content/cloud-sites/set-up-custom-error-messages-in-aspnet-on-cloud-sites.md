---
permalink: set-up-custom-error-messages-in-aspnet-on-cloud-sites/
audit_date:
title: Set up custom error messages in ASP.NET on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

You can enable custom error messages for your ASP.NET application on
Windows IIS by using a **web.config** file with a **customErrors**
setting configured.

For security purposes and coding best practices, set the
**customErrors** mode to **RemoteOnly** or **On** instead of **Off**.
The Off mode is primarily useful for debugging, and it should not be
used in a production environment because of the details that it can
expose about your server.

To configure a custom error page for ASP.NET 3.5 SP1 and later, follow
this example:

    <configuration>
       <system.web>
          <customErrors mode="On" redirectMode="ResponseRewrite" defaultRedirect="~/error.aspx" />

       </system.web>
    </configuration>

The following example is for ASP.NET 2.0 to 3.5 without SP1:

    <configuration>
      <system.web>
          <customErrors mode="On" defaultRedirect="~/error.html" />

      </system.web>
    </configuration>

For more information about security, see the following ASP.NET security
references:

-   [Important: ASP.NET Security Vulnerability](http://weblogs.asp.net/scottgu/archive/2010/09/18/important-asp-net-security-vulnerability.aspx)
-   [Understanding the ASP.NET Vulnerability](http://blogs.technet.com/b/srd/archive/2010/09/17/understanding-the-asp-net-vulnerability.aspx)
