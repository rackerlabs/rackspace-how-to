---
permalink: sql-server-tips-and-tricks/
audit_date: '2018-03-31'
title: SQL Server tips and tricks
type: article
created_date: '2017-09-25'
created_by: Catherine Richardson
last_modified_date: '2017-09-25'
last_modified_by: Catherine Richardson
product: undefined
product_url: undefined
---

Gain real-time insights across your transactional and analytical data with SQL
Server 2016 – a secure, scalable database platform that has everything built
in, from advanced analytics to unparalleled in-memory performance.

The release of Microsoft SQL Server 2016 was highly anticipated throughout the
data management community. You've had some time to explore the exciting
capabilities, build BI applications, work with in-database advanced analytics,
use in-memory capabilities optimized for all workloads, and experience
on-premises to cloud consistency.

It’s easy to get caught up in all the capabilities, performance
benchmarks, and new features of SQL Server 2016. So we have complied
our favorite tips and tricks for SQL Server in this article. Our goal is for
you to learn a few new things that can help you save time and effort.
If you have any questions or would like to discuss any of the
information covered here further, reach out to
[us](https://www.tricoresolutions.com/about-us/contact-us/).

We simplify the SQL Server monitoring and management process and provide
services to increase performance, decrease costs, and improve overall
performance. Additionally, we deliver proactive maintenance services –
monitoring the customers’ systems daily for a proactive check of your
environment, ensuring system integrity and availability. 

### Use Cycle Clipboard Ring

SQL Server Management Studio (SSMS) stores multiple copies in the clipboard.

The code that you copy or cut gets stored in the clipboard. SQL server
maintains a history of cut and copied text on the clipboard that you can use
to paste into other code.

This feature is known as **Cycle Clipboard Ring**. To use it, click on
**Edit > Cycle Clipboard Ring**, or you can use the keyboard shortcut
**Ctrl+Shift+V**.

### Use code snippets

The code snippets feature helps you write code quickly. Code snippets provide
you with the template for specific tasks. Use the following steps to insert
the snippet template and change the values, and you’re all set.

1. Right click on **Query Window** in SQL server Management studio.

2. Select **Insert Snippet**.

3. Select the snippet category from the list that is displayed.

4. Select the task from the list that is displayed.

5. The code is ready. Change the values and run it.

### Debug a SQL script

This task explains how to use the script debugger.

One option is to open or write the script and then press
**Alt+F5**, which opens the debug interface.

Another option is to click the **Debug** button in the SQL Editor tool bar to
open the debug interface.

### Classify server categories by using colors

SQL Server Management Studio (SSMS) allows you to specify the colors of the
status bars for the servers. For example, you can specify red for production
servers, yellow for test servers, and green for development servers.

Use these steps to categorize servers by color:

1. While connecting to the server, click **Option** in the
**Connect to Database Engine** dialog box.

2. Select the **Connection Properties** tab.

3. Click **Use Custom Color** and select the desired color.

### View metadata

You can quickly get the metadata and properties for objects.

In the query window, select the object and press **Alt+F1**. The metadata and
properties of the selected objects are shown.

**Note**: The result type depends on the selected object type. If no object is
selected, a list of all objects in the database is returned.

### Use the Surround With snippet

The **Surround With** snippet is a template that you can use as a starting
point for enclosing a set of Transact-SQL statements in a BEGIN, IF, or WHILE
block.

Use the following steps to insert a **Surround With** snippet:

1. In the query window, select the code that you want to insert the snippet
around.

2. Right click and select **Surround With**.

3. Select the type of type of block that you want to use. For example, select
**Code Snippet for While loop**.

   The code is then enclosed with the selected block type.
