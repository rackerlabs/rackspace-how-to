---
permalink: rewrite-urls-from-aspnet-on-cloud-sites/
audit_date:
title: Rewrite URLs from ASP.NET on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

All new ASP.NET sites created on the Rackspace Cloud have the URL
Rewrite Module available, which allows you to define URL rewrite rules
in the the **web.config** file.

For older sites on the Cloud Sites platform, we recommend using a
third-party solution to deploy an HttpModule to handle URL rewrites.

### IIS 7 URL Rewrite Module

This section provides examples of using the URL Rewrite Module to define
rewrite rules in the **web.config** file.

### Example 1: Rewrite ASP, ASPX, and HTML pages

You can use the URL Rewrite Module to rewrite ASP, ASPX, and HTML pages.
In this example, we match **example.asp**, **example.aspx**, and
**example.html**, and display the contents of **rewrite.aspx**:

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
      <system.webServer>
        <rewrite>
         <rules>
          <rule name="Rewrite ASP">
           <match url="example.asp" />
           <action type="Rewrite" url="rewrite.aspx" />
          </rule>
          <rule name="Rewrite ASPX">
           <match url="example.aspx" />
           <action type="Rewrite" url="rewrite.aspx" />
          </rule>
          <rule name="Rewrite HTML">
           <match url="example.html" />
           <action type="Rewrite" url="rewrite.aspx" />
          </rule>
         </rules>
        </rewrite>
      </system.webServer>
    </configuration>

### Example 2: Use regular expressions

The URL Rewrite Module also supports [regular expressions](http://www.regular-expressions.info/).
You can match characters in the incoming URL and then use **{R:\#}**
(for example, {R:1} and {R:2}) to reference them in the resulting URL.
In this example, we want to match **article/*id*/*title*** and have it
processed by **article.aspx** as a standard GET request:

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
      <system.webServer>
        <rewrite>
         <rules>
          <rule name="Rewrite Articles">
           <match url="^article/([0-9]+)/([_0-9a-z-]+)" />
           <action type="Rewrite" url="article.aspx?id={R:1}&title={R:2}" />
          </rule>
         </rules>
        </rewrite>
      </system.webServer>
    </configuration>

### Example 3: Create a catch-all rewrite rule

The URL Rewrite Module also provides a method to create a *catch-all*
rewrite rule. This is similar to the way that applications like
WordPress use the Apache mod\_rewrite module to create pretty permalinks
or friendly URLs, by having a single page load content based on the
incoming URL. In this example, we use the URL Rewrite Module and a
simple regular expression to catch anything that isn't a file or
directory and send it to **default.aspx**:

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
      <system.webServer>
        <rewrite>
         <rules>
          <rule name="Rewrite All" stopProcessing="true">
                <match url="^(.*)$" />
                <conditions logicalGrouping="MatchAll">
                    <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="true" />
                    <add input="{REQUEST_FILENAME}" matchType="IsDirectory" negate="true" />
                </conditions>
                <action type="Rewrite" url="article.aspx" />
          </rule>
         </rules>
        </rewrite>
      </system.webServer>
    </configuration>

### Example 4: Create redirects

The following example shows an IIS rewrite reading the host header to
perform a 301 redirect. The example takes a non-www domain and redirects
to a **www.mydomain.com domain**.

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
      <system.webServer>
        <rewrite>
          <rules>
            <rule name="301 Redirect" stopProcessing="true">
              <match url=".*" />
              <conditions>
                            <add input="{HTTP_HOST}" pattern="^mydomain.com$" />
              </conditions>
              <action type="Redirect" url="http://www.mydomain.com/{R:0}" redirectType="Permanent" />
            </rule>
          </rules>
        </rewrite>
      </system.webServer>
    </configuration>

### References

The following references are on [iis.net](http://www.iis.net/), the official
Microsoft IIS site:

-   [Using the URL Rewrite Module](http://learn.iis.net/page.aspx/460/using-url-rewrite-module/)
-   [Creating Rewrite Rules for the URL Rewrite Module](http://learn.iis.net/page.aspx/461/creating-rewrite-rules-for-the-url-rewrite-module/)
-   [URL Rewrite Module Configuration Reference](http://learn.iis.net/page.aspx/465/url-rewrite-module-configuration-reference/)

### Third-party solutions

Prior to the URL Rewrite Module, web developers had to create this
functionality by using application code or by generating their own
assemblies. Many third parties realized the necessity of this feature
and created modules that could be deployed to add this functionality
with little effort on the part of the web developer. Some of these
third-party modules are as follows:

-   [UrlRewriter.NET](http://www.urlrewriter.net/)
-   [UrlRewritingNet](http://www.urlrewriting.net/)
-   [Helicon Tech's ISAPI\_Rewrite](http://www.isapirewrite.com/)

For older sites on the Cloud Sites platform, we recommend deploying an
HttpModule to handle URL rewrites. This article describes using
[UrlRewriter.NET](http://www.urlrewriter.net/) to
do this.

### Get started

To get started, [bin-deploy UrlRewriter.NET on Cloud Sites](/how-to/bin-deploy-an-aspnet-assembly-on-cloud-sites).

### Use UrlRewriter.NET

UrlRewriter.NET provides a [full reference guide](http://urlrewriter.net/index.php/support/reference)
and examples of [common rules](http://urlrewriter.net/index.php/support/using).
When you [bin-deployed UrlRewriter.NET](/how-to/bin-deploy-an-aspnet-assembly-on-cloud-sites),
you added a `<configSections>` element, which causes the `rewriter`
configuration section to be processed by UrlRewriter.NET. The following
examples show rewrite rules that use this configuration element.

### Example 1: Match info to info.aspx

In this example, we match **info** and display the contents of
**info.aspx**:

    <rewriter>
      <rewrite url="~/info" to="~/info.aspx" />
    </rewriter>

### Example 2: Use regular expressions

UrlRewriter.NET also supports [regular expressions](http://www.regular-expressions.info/).
You can match characters in the incoming URL and then use **\$\#** (for
example, \$1 and \$2) to reference them in the resulting URL. In this
example, we want to match **products/*id*** and have it processed by
**products.aspx** as a standard GET request:

    <rewriter>
      <rewrite url="~/products/(.+)" to="~/products.aspx?category=$1" />
    </rewriter>

### References

-   [Tip/Trick: Url Rewriting with ASP.NET](http://weblogs.asp.net/scottgu/archive/2007/02/26/tip-trick-url-rewriting-with-asp-net.aspx)
    from Scott Guthrie's blog, particularly approach 3
-   [UrlRewrite.NET home page](http://urlrewriter.net "http://urlrewriter.net")
