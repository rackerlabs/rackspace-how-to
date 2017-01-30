---
permalink: redirect-a-subdomain-to-a-subdirectory-with-asp/
audit_date:
title: Redirect a subdomain to a subdirectory with ASP
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

You can redirect a subdomain to a subdirectory by using ASP or ASP.NET
code.

When the requests are redirected by using an ASP file, the URL in the
browser for redirected domains shows the correct domain name and the
directory name where the request is being redirected. You can also
redirect the requests to a specific file.

**Examples:**

    http://subdomain1.YourHostedDomainName.com > http://subdomain1.YourHostedDomainName.com/subdomain1

    http://subdomain2.YourHostedDomainName.com > http://subdomain2.YourHostedDomainName.com/subdomain2

    http://subdomain3.YourHostedDomainName.com > http://subdomain3.YourHostedDomainName.com/subdomain3/home.asp

You can use the following sample script to redirect a subdomain. You
will need to place it as the default document on your document root.

    <%
    If InStr( UCase(Request.ServerVariables("SERVER_NAME")),  UCase("subdomain1.YourHostedDomainName.com") ) > 0 Then
            Response.Redirect("/subdomain1")
    ElseIf InStr( UCase(Request.ServerVariables("SERVER_NAME")), UCase("subdomain2.YourHostedDomainName.com") ) > 0 Then
            Response.Redirect("/subdomain2")
    ElseIf InStr( UCase(Request.ServerVariables("SERVER_NAME")), UCase("subdomain3.YourHostedDomainName.com") ) > 0 Then
            Response.Redirect("/subdomain3/home.asp")
    End If
    %>

**Notes:**

-   Replace `subdomain#.YourHostedDomainName.com` with your actual
    subdomain URL.
-   Replace `/subdomain#` with your actual subdirectory name.
-   The last redirection statement in the example shows how to redirect
    to a specific file.
