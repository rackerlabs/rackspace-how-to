---
permalink: use-a-later-version-of-mysql-with-net-applications-on-cloud-sites/
audit_date:
title: Use a later version of MySQL with .NET applications on Cloud Sites
type: article
created_date: '2014-05-07'
created_by: Matt Costello
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

The version of MySQL installed on Cloud Sites that use Windows
technology is currently MySQL Connector Version 5.2.5.  If your .NET
application requires a later version of MySQL, you can perform what's
called a *bin deploy*, bundling a later version of the MySQL DLL into
your .NET application.

This article describes the two approaches to bin deploying a later
version of MySQL.

MySQL versions 6.4.6 (MySQL) and 6.4.4 (MySQL NuGet) are known to work in Cloud Sites and are medium trust
compliant.

### Perform a bin deploy with NuGet and Visual Studio 2013

1.  Open Visual Studio and your .NET application.

2.  In Visual Studio, select **Tools > NuGet Package Manager > Package Manager Console**.

    The console should appear near the bottom of the Visual Studio
    window, depending on how you've set up your views.

3.  To install MySQL from NuGet, copy the following command and paste it
    in the Package Manager Console area, changing the version number to
    the MySQL version:

        Install-Package MySql.Data -Version 6.4.4

4.  Check your application's **bin** directory for the
    **MySql.Data.dll** to confirm the MySQL installation.

5.  Publish your application and upload it to Cloud Sites.

### Perform a bin deploy with an MSI package from MySQL

We recommend running an MSI installation on a development machine to
avoid installing extra software on a production machine.

1.  Download a compliant MySQL Connector version from [the MySQL website](http://dev.mysql.com/downloads/connector/net/).
    Version 6.4.6 is known to work with Cloud Sites.

2.  Double-click the MSI file you downloaded (for example,
    **mysql-connector-net-6.4.6.msi**).

3.  Click **Next** to acknowledge that you're about to install
    MySQL Connectors.

4.  Choose **Typical Install**.

5.  Click **Install**.

6.  After MySQL Connector is installed, go to Windows Explorer and
    navigate to the directory for the MySQL version you will use.

    -   For .NET 3.5 applications, go to **C:\Program Files
        (x86)\MySQL\MySQL Connector Net 6.4.6\Assemblies\Version
        2.0**.
    -   For .NET 4.0 applications, go to **C:\Program Files
        (x86)\MySQL\MySQL Connector Net 6.4.6\Assemblies\version
        4.0**.

7.  Copy the **MySql.Data.dll** file from the directory in the previous
    step to your .NET application's **bin** directory.

8.  Publish your .NET application and upload it to Cloud Sites.
