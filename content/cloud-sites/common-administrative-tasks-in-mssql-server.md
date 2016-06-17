---
permalink: common-administrative-tasks-in-mssql-server/
audit_date:
title: Common Administrative Tasks in MSSQL Server
type: article
created_date: '2012-05-16'
created_by: Rackspace Support
last_modified_date: '2016-06-16'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

This article contains examples of a few common administrative tasks that
you an perform on your Cloud Site running a Microsoft SQL Server
database.

- First you will want to connect to your MS SQL Server database using the *myLittleAdmin* link in your Control Panel.
- Once connected, click on the *Tools* NavBar in the lower-left frame.
- To submit a new query, click *New Query* from the Tools Menu and enter your query in the space provided in the center frame, then click *Submit*.

Following are the query commands for some common administrative tasks:

**Note:** When entering your query, replace the text in the
example, `myDbHere`, with the
correct name of the database that you are working on, making sure to
keep the value within brackets. The examples in this article have other
variables that you will need to replace with actual values. These
values have been highlighted below for your convenience. Only the
highlighted values in the examples need to be modified.

-  Enable containment on a database

       USE [master]
       GO
       ALTER DATABASE [myDbHere] SET CONTAINMENT = PARTIAL WITH NO_WAIT
       GO

-  Disable containment on a database

       USE [master]
       GO
       ALTER DATABASE [myDbHere] SET CONTAINMENT = NONE WITH NO_WAIT
       GO

-  Create a SQL user with password when using partial containment and add to DB owner role

       USE [myDbHere]
       GO
       CREATE USER [sqlUserName] WITH PASSWORD=N'ComplexPassHere'
       GO
       USE [myDbHere]

       GO
       ALTER ROLE [db_owner] ADD MEMBER [sqlUserName]
       GO

-  Drop SQL user inside database

  **Note:** Run this for deleting a SQL user used within containment. If
you created additional logins from the control panel, please use the
control panel to delete them.

       USE [myDbHere]

       GO
       DROP USER sqlUserName]
       GO
