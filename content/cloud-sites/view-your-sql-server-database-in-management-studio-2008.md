---
permalink: view-your-sql-server-database-in-management-studio-2008/
audit_date:
title: View your SQL Server database in Management Studio 2008
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-06-12'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

If you are having issues viewing your SQL Server 2005 database in
Management Studio 2008 and the database is provisioned correctly in the
Rackspace system, refer to the following blog post for troubleshooting
information:

<http://sqlblog.com/blogs/aaron_bertrand/archive/2008/07/07/a-little-management-studio-oops.aspx>

To fix the problem, you must connect to a SQL Server 2008 database
engine, click the **Databases** folder, right-click in the column
headers and uncheck **collation**. Then you can connect to a SQL Server
2005 database engine.

