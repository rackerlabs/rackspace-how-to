---
permalink: rackspace-cloud-essentials-tips-and-tricks-for-htaccess-and-webconfig/
audit_date:
title: 'Rackspace Cloud Essentials: Tips and Tricks for .htaccess and web.config'
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

In this article we're going to take a look at the **.htaccess** file and
the **web.config file.** We'll discuss what they are, and how they're
used with Cloud Sites.

If you are using Windows IIS, ASP/.NET then please skip ahead to the **web.config** portion of the article.

If you are using Linux as your primary technology, then please continue
reading below.

### What is .htaccess and what is it used for?

[Wikipedia](http://en.wikipedia.org/wiki/Htaccess)
explains the **.htaccess** file as follows:

"In several web servers (most commonly Apache), .htaccess (hypertext
access) is the default name of a directory-level configuration file that
allows for decentralized management of web server configuration. The
.htaccess file is placed inside the web tree, and is able to override a
subset of the server's global configuration; the extent of this subset
is defined by the web server administrator. The original purpose of
.htaccess was to allow per-directory access control (e.g. requiring a
password to access the content), hence the name. Nowadays .htaccess can
override many other configuration settings, mostly related to content
control."

For more information, and several examples, the following links are
highly recommended:

-   [.htaccess-Guide.com](http://www.htaccess-guide.com/)
-   [JavascriptKit.com's "Comprehensive guide to .htaccess"](http://www.javascriptkit.com/howto/htaccess.shtml)

For a more comprehensive technical overview, please see [the Apache documentation on .htaccess files](http://httpd.apache.org/docs/2.0/howto/htaccess.html).

On the Rackspace Cloud Sites platform, **.htaccess** can be used for
handling certain points of website security, PHP configuration changes,
as well as website operations. Following is an example of how an **.htaccess**
file is used for security.

-   [Deny certain IP addresses access to web site](/how-to/controlling-access-to-linux-cloud-sites-based-on-the-client-ip-address)

### What is web.config and what is it used for?

[Wikipedia](http://en.wikipedia.org/wiki/Htaccess) explains
the **web.config** file as follows:

**Web.config** is the main settings and configuration file for an [ASP.NET](http://en.wikipedia.org/wiki/ASP.NET) web application. The file is an [XML document](http://en.wikipedia.org/wiki/XML_document) that defines configuration information regarding the web application. The web.config file contains information that control module loading, security configuration, [session state](http://en.wikipedia.org/wiki/ASP.NET_state_management) configuration, and application language and compilation settings. **Web.config** files can also contain application specific items such as database [connection strings](http://en.wikipedia.org/wiki/Connection_string).

For more information and several examples, the following links are
highly recommended:

-   [ASP.NET Configuration](http://msdn.microsoft.com/en-us/library/w7w4sb0w.aspx)
-   [Format of ASP.NET Configuration Files](http://msdn2.microsoft.com/en-us/library/ackhksh7(VS.71).aspx)

Following are some of the most commonly used functions for the **web.config**
file:

1.  [How do I add impersonation to my ASP/.NET Cloud Site](/how-to/add-impersonation-to-your-aspnet-cloud-site)
2.  [How do I enable detailed errors in Classic ASP and server side errors in Cloud Sites](/how-to/enable-detailed-errors-in-classic-asp-and-server-side-errors-on-cloud-sites)
3.  [How do I setup customErrors in ASP/.NET on Cloud Sites](/how-to/set-up-custom-error-messages-in-aspnet-on-cloud-sites)
4.  [How to rebuild an ASP/.NET application in Cloud Sites](/how-to/rebuild-an-aspnet-application-in-cloud-sites)
5.  [How do I bin deploy an ASP/.NET application on Cloud Sites](/how-to/bin-deploy-an-aspnet-assembly-on-cloud-sites)
6.  [Why are my HttpHandlers not working for my ASP/.NET site on Cloud Sites](/how-to/httphandlers-not-working-in-integrated-mode-for-aspnet-sites-on-cloud-sites)
7.  [How do I rectify an invalid view state error with an ASP/.NET application](/how-to/cloud-sites-faq)
8.  [ASP/.NET Integrated Mode](/how-to/aspnet-integrated-mode-on-cloud-sites)
9.  [Overview of Cloud Sites modified Medium Trust](/how-to/modified-medium-trust-on-cloud-sites)

### Next section

[Configuring SSL on your website(s)](/how-to/getting-started-with-cloud-sites-configuring-ssl-on-your-websites)
