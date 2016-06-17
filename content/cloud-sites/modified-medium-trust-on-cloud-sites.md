---
permalink: modified-medium-trust-on-cloud-sites/
audit_date:
title: Modified Medium Trust on Cloud Sites
type: article
created_date: '2011-03-15'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

The Rackspace Cloud's Windows environment operates in modified Medium
Trust.

### Overview

The "trust level" refers to permissions set in the Web.config file that
dictate what operations can and cannot be performed by web applications.
Our ASP.NET 3.5 servers use the default **Medium Trust** level with the
addition of **OleDbPermission**, **OdbcPermission**,
**ConfigurationPermission**, **ReflectionPermission**, a
less-restrictive **WebPermission** and **SocketPermission** as detailed
below:

-   WebPermission Unrestricted="true"
-   OleDbPermission Unrestricted="true"
-   OdbcPermission Unrestricted="true"
-   SocketPermission Unrestricted="true"
-   ConfigurationPermission Unrestricted="true"
-   ReflectionPermission Unrestricted="true"

Using a Medium Trust level prevents applications from accessing shared
system resources and eliminates the potential for application
interference. Adding **OleDbPermission** and **OdbcPermission** allows
applications to use those data providers to access databases.
**WebPermission** is modified to allow outbound HTTP and HTTPS traffic.
**SocketPermission** is modified to allow better access to payment
services. Adding **ConfigurationPermission** allows methods or classes
to access configuration files. Adding **ReflectionPermission** allows
access to non-public types and members.

Applications operating under a Medium Trust level have no registry
access, and no access to the Windows event log. Both network and file
system access will be limited.

### Running Applications under Medium Trust

**DotNetNuke**

DotNetNuke can be installed in our modified Medium Trust environment by
following [our guide](/how-to/install-dotnetnuke-on-cloud-sites). If you do
encounter any issues with the installation of the CMS, please report the
issue to our support team, post in our forums, or [visit DotNetNuke's community forums](http://www.dotnetnuke.com/tabid/795/default.aspx).

**ASPDotNetStoreFront**

Per [this article at ASPDotNetStoreFront's website](https://support.aspdotnetstorefront.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=105):

"Beginning with version 7.0.2.5, the software will run in Medium Trust
natively. Customers on earlier versions than that will need to contact
[ASPDotNetStoreFront's support](http://www.aspdotnetstorefront.com/t-support.aspx)
with their original order number for a special medium trust build."

**Umbraco**

[Umbraco](http://umbraco.com/) can be configured to run in a Medium
Trust environment.

**BlogEngine**

BlogEngine works in our modified Medium Trust environment. If you do
encounter any issues with the installation of the CMS, please report the
issue to our support team, post in our forums, or [visit BlogEngine's community forums](http://www.codeplex.com/blogengine/Thread/List.aspx).

**mojoPortal**

mojoPortal works in our modified Medium Trust environment. If you do
encounter any issues with the installation of the CMS, please report the
issue to our support team, post in our forums, or [visit mojoPortal's community forums](http://www.mojoportal.com/forums.aspx).

### Partially Trusted Callers

If you do experience trust-related issues, it may relate to assemblies
that do not allow *Partially Trusted Callers*. For additional
information on this, please review Microsoft's documentation regarding
Partially Trusted Callers
[here](http://msdn.microsoft.com/en-us/library/wyts434y.aspx)
and
[here](http://msdn.microsoft.com/en-us/library/ms364059%28VS.80%29.aspx#prtltrstpro_topic7)
(these are components that will **NOT** work with Partially Trusted
Callers).

Many components also have support documentation concerning functioning
in a Medium Trust.

### Other Items

**AspJpeg**

The Rackspace Cloud has been working with Persists, the creator of
AspJpeg, to determine if their component will work under .NET in our
modified Medium Trust environment. It should be noted, however, that the
AspJpeg component is fully functional under Classic ASP.

**Configurations**

To facilitate your ability to test your applications on your local
development machine, we have made our modified Medium Trust
configuration available:

-   [Click here to download modified Medium Trust configuration file for .NET 3.5](http://c4959820.r20.cf2.rackcdn.com/web_customtrust.config)
-   [Click here to download modified Medium Trust configuration file for .NET 4</span>.0](http://c4959820.r20.cf2.rackcdn.com/web_custom40.config)
