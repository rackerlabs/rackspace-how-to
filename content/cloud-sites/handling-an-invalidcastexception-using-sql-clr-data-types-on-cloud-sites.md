---
permalink: handling-an-invalidcastexception-using-sql-clr-data-types-on-cloud-sites/
audit_date:
title: Handle an InvalidCastException using SQL CLR Data Types on Cloud Sites
type: article
created_date: '2012-12-14'
created_by: Jered Heeschen
last_modified_date: '2013-02-04'
last_modified_by: Jered Heeschen
product: Cloud Sites
product_url: cloud-sites
---

Our clusters now have the MSSQL 2012 data types installed (assembly version 11.0) in addition 
to the MSSQL 2008 data types (assembly version 10.0).  This may introduce errors for some 
custom applications.

In particular you may see this error when referencing SQLTypes from assembly version 11.0:

    System.InvalidCastException: Unable to cast object of type 'Microsoft.SqlServer.Types.SqlGeometry' to type 'Microsoft.SqlServer.Types.SqlGeometry'.

This issue can be worked around in code or by specifying a value of "SQL Server 2012" for 
the "Type System Version" attribute in your connection string.

For code examples and more details, please see the "SQL CLR Data Types" section of this 
Microsoft document on changes in the SQL Server 2012 database engine:

[Breaking Changes to Database Engine Features in SQL Server 2012](http://msdn.microsoft.com/en-us/library)
