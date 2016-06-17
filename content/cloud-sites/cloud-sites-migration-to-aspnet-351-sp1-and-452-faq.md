---
permalink: cloud-sites-migration-to-aspnet-351-sp1-and-452-faq/
audit_date:
title: Cloud Sites migration to ASP.NET 3.5.1 SP1 and 4.5.2 FAQ
type: article
created_date: '2015-01-30'
created_by: Thomas Hester
last_modified_date: '2015-02-17'
last_modified_by: Jered Heeschen
product: Cloud Sites
product_url: cloud-sites
---

### What is changing?

Cloud Sites is upgrading ASP.NET 4.0 IIS clusters to ASP.NET 4.5.2 and
ASP.NET 3.x clusters to 3.5.1 SP1. We are upgrading because some
installed versions of ASP.NET are reaching their support end-of-life
(EOL), and because the new versions provide new, beneficial features for
web applications. Although we don't expect any downtime for your site,
we will provide a test link in advance to help identify potential site
break changes that might occur.

### What is not changing?

Everything else is staying the same. No changes to DNS, site bindings,
FTP, or CIFS are required. However, you should proactively test and
upgrade applications for compatibility with the new versions of the .NET
Framework. For more information, see the following question.

### How does this change affect me?

The following sections provide links and other information detailing
what changes with the newer versions of .NET and how you can account for
those changes in your application, if necessary.

### .NET 4.x documentation

-   [Migration Guide to the .NET Framework 4.](http://msdn.microsoft.com/en-us/library/ff657133(v=vs.110).aspx)
-   [Moving to the .NET Framework 4.5.2](http://blogs.msdn.com/b/dotnet/archive/2014/08/07/moving-to-the-net-framework-4-5-2.aspx)
-   [Application Compatibility in the .NET Framework 4.5](http://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx)
-   [Application Compatibility in the .NET Framework 4.5.1](http://msdn.microsoft.com/en-us/library/dn458352(v=vs.110).aspx)
-   [Application Compatibility in the .NET Framework 4.5.2](http://msdn.microsoft.com/en-us/library/dn720543(v=vs.110).aspx)

### CMS compatibility with .NET 4.5 and later

-   [DNN](http://www.dnnsoftware.com/platform/start/install)
-   [Orchard](http://docs.orchardproject.net/Documentation/Installing-Orchard)
-   [Kentico](https://docs.kentico.com/display/K82/Server+and+hosting+requirements)
-   [mojoPortal](https://www.mojoportal.com/hosting-requirements.aspx)
-   [Umbraco](http://our.umbraco.org/documentation/Installation/system-requirements)
-   [Telerik Sitefinity](http://www.sitefinity.com/resources/system-requirements)

### General version break changes

-   Connections to SQL Server 1997 are no longer supported.
-   Connections to SQL Server databases using the Virtual Interface
    Adapter (VIA) protocol are no longer supported.
-   See the following information:
    -   [Application Compatibility in the .NET Framework
        4.5.1](http://msdn.microsoft.com/en-us/library/dn458352(v=vs.110).aspx)
    -   [Application Compatibility in the .NET Framework
        4.5.2](http://msdn.microsoft.com/en-us/library/dn720543(v=vs.110).aspx)
-   Consider the following information from the Microsoft [Application
    Compatibility in the .NET Framework
    4.5](http://msdn.microsoft.com/en-us/library/hh367887(v=vs.110).aspx):

    > "If *T* is an enumeration type, the method correctly returns data
    > from the database. Previously, enumeration types were not
    > supported, so the result was always cast to zero or converted to
    > the enumeration type. Underlying types that are not supported by
    > the Entity Framework, such
    > as [UInt16](https://msdn.microsoft.com/en-us/library/system.uint16%28v=vs.110%29.aspx), [UInt32](https://msdn.microsoft.com/en-us/library/system.uint32%28v=vs.110%29.aspx),
    > and [UInt64](https://msdn.microsoft.com/en-us/library/system.uint64%28v=vs.110%29.aspx);
    > still return zero or are converted to the enumeration type with an
    > underlying value of zero.
    >
    > "Support for enumerations is new in the Entity Framework in the
    > .NET Framework 4.5. However, if developer code depends on the
    > result to be zero, an application error could result, depending on
    > the specific code."

### .NET 3.5.1 SP1 documentation

General version break changes: [Changes in .NET Framework 3.5 SP1](https://msdn.microsoft.com/en-us/library/dd310284.aspx)

### Will I need to rebuild my application to make use of ASP.NET 4.5.2?

No. ASP.NET 4.5.2 is a compatible, in-place update to ASP.NET 4, ASP.NET
4.5, and ASP.NET 4.5.1. Applications built to target earlier ASP.NET 4.x
versions will continue to run on ASP.NET 4.5.2 without change. You will
not need to recompile applications.
