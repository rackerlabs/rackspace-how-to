---
permalink: force-ssl-on-your-asp-or-aspnet-site-on-cloud-sites/
audit_date:
title: Force SSL on your ASP or ASP.NET site on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

This article provides examples of how to force SSL on your ASP or
ASP.NET site.

### web.config file

If your website has the IIS Rewrite Module available, you can use
rewrite rules in your **web.config** file to force SSL on all pages, as
shown in the following example.

If you are unsure whether the IIS Rewrite Module is available for your
site, contact Support.

    <?xml version="1.0" encoding="UTF-8"?>
    <configuration>
    <system.webServer>

      <rewrite>
        <rules>
          <rule name="Redirect to HTTPS" stopProcessing="true">
            <match url=".*" />

            <conditions>
              <add input="{HTTP_CLUSTER_HTTPS}" pattern="^on$" negate="true" />
              <add input="{HTTP_CLUSTER_HTTPS}" pattern=".+" negate="true" />

            </conditions>
            <action type="Redirect" url="https://{HTTP_HOST}{SCRIPT_NAME}" redirectType="SeeOther" />
          </rule>

        </rules>
      </rewrite>
    </system.webServer>
    </configuration>

You could modify the example to force SSL on one page or specific pages.
For more information about the IIS Rewrite Module, see [Creating Rewrite
Rules for the URL Rewrite
Module](http://learn.iis.net/page.aspx/461/creating-rewrite-rules-for-the-url-rewrite-module/ "http://learn.iis.net/page.aspx/461/creating-rewrite-rules-for-the-url-rewrite-module/")
and [URL Rewrite Module Configuration
Reference](http://learn.iis.net/page.aspx/465/url-rewrite-module-configuration-reference/ "http://learn.iis.net/page.aspx/465/url-rewrite-module-configuration-reference/")
on the Microsoft IIS site.

### ASP.NET (not MVC 3)

Using ASP.NET, you can use the following code to force SSL on a page on
your site:

    <%@ Page Language="C#" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

    <script runat="server">
      protected void Page_Load(object sender, System.EventArgs e)
      {
        if(Request.ServerVariables["HTTP_CLUSTER_HTTPS"] != "on")
        {
          if(Request.ServerVariables.Get("HTTP_CLUSTER_HTTPS") == null)
          {
            string xredir__, xqstr__;

            xredir__ = "https://" + Request.ServerVariables["SERVER_NAME"];
            xredir__ += Request.ServerVariables["SCRIPT_NAME"];
            xqstr__ = Request.ServerVariables["QUERY_STRING"];

            if (xqstr__ != "")
                xredir__ = xredir__ + "?" + xqstr__;

            Response.Redirect(xredir__);
          }
        }
        Response.Write("SSL Only");
      }

    </script>

    <html>
    <head id="Head1" runat="server">
      <title>SSL Only</title>
    </head>

    <body>
    </body>
    </html>

### ASP.NET (MVC 3)

You can use the following code when using the `RequireHttps` attribute
to decorate actions within your MVC application:

``` {.p1}
protected void Application_BeginRequest(Object sender, EventArgs e)
{
            if (HttpContext.Current.Request.IsSecureConnection() == false)
            {
                        Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"] + HttpContext.Current.Request.RawUrl);
            }
}
public static class Extensions
{
            /// <summary>
            /// Gets a value which indicates whether the HTTP connection uses secure sockets (HTTPS protocol). Works with Rackspace Cloud Sites' load balancer
            /// </summary>
            /// <param name="request"></param>
            /// <returns></returns>
            public static bool IsSecureConnection(this HttpRequestBase request)
            {
                        const string rsSSLvar = "HTTP_CLUSTER_HTTPS";
                        return (request.IsSecureConnection || (request.ServerVariables[rsSSLvar] != null || request.ServerVariables[rsSSLvar] == "on"));
            }
            /// <summary>
            /// Gets a value which indicates whether the HTTP connection uses secure sockets (HTTPS protocol). Works with Rackspace Cloud Sites' load balancer
            /// </summary>
            /// <param name="request"></param>
            /// <returns></returns>
            public static bool IsSecureConnection(this HttpRequest request)
            {
                        const string rsSSLvar = "HTTP_CLUSTER_HTTPS";
                        return (request.IsSecureConnection || (request.ServerVariables[rsSSLvar] != null || request.ServerVariables[rsSSLvar] == "on"));
            }
}
```

### Classic ASP

Using classic ASP, you can use the following code to force SSL on a page
on your site:

    <%
    Response.Buffer = True
    If (Request.ServerVariables("HTTP_CLUSTER_HTTPS") <> "on") Then
      If IsEmpty(Request.ServerVariables("HTTP_CLUSTER_HTTPS")) Then
        Dim xredir__, xqstr__

        xredir__ = "https://" & Request.ServerVariables("SERVER_NAME") & _
                   Request.ServerVariables("SCRIPT_NAME")
        xqstr__ = Request.ServerVariables("QUERY_STRING")

        If xqstr__ <> "" Then xredir__ = xredir__ & "?" & xqstr__

        Response.Redirect xredir__
      End If
    End If

    Response.Write("SSL Only")
    %>

