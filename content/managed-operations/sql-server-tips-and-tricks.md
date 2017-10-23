---
permalink: sql-server-tips-and-tricks/
audit_date: '2018-03-31'
title: SQL Server tips and tricks
type: article
created_date: '2017-09-25'
created_by: Catherine Richardson
last_modified_date: '2017-09-25'
last_modified_by: Catherine Richardson
product: Managed Operations
product_url: managed-operations
---

To help you learn about a few of the capabilities and features of Microsoft
SQL Server 2016, we have compiled our favorite tips and tricks.

If you have any questions, contact
[us](https://www.tricoresolutions.com/about-us/contact-us/).

### Use the Cycle Clipboard Ring feature

SQL Server Management Studio (SSMS) stores multiple copies of the code that
you copy and cut in the clipboard. SSMS maintains a history of this code so
that you can paste it into other code. This feature is known as
**Cycle Clipboard Ring**.

To use it, click **Edit > Cycle Clipboard Ring**, or use the keyboard shortcut
**Ctrl+Shift+V**.

### Use code snippets

The code snippets feature helps you write code quickly. Code snippets provide
you with templates for specific tasks. Use the following steps to insert
a snippet template and change the values:

1. In SQL Server Management Studio (SSMS), right-click **Query Window**.

2. Select **Insert Snippet**.

3. Select the snippet category from the list that is displayed.

4. Select the task from the list that is displayed.

5. Change the values and run the code.

### Debug a SQL script

You can use the following methods to debug a SQL script:

* Open or write the script and then press **Alt+F5**, which opens the debug
interface.

* Click the **Debug** button in the SQL Editor tool bar to open the debug
interface.

### Classify server categories by using colors

In SQL Server Management Studio (SSMS), you can specify the colors of the
status bars for the servers. For example, you can specify red for production
servers, yellow for test servers, and green for development servers.

Use these steps to categorize servers by color:

1. While connected to the server, click **Option** in the
**Connect to Database Engine** dialog box.

2. Select the **Connection Properties** tab.

3. Click **Use Custom Color** and select the color you want.

### View metadata

You can quickly get the metadata and properties for objects.

In the query window, select the object and press **Alt+F1**. The metadata and
properties of the selected objects are shown.

**Note**: The result type depends on the selected object type. If no object is
selected, a list of all objects in the database is returned.

### Use the Surround With snippet

The Surround With snippet is a template that you can use as a starting
point for enclosing a set of Transact-SQL statements in a BEGIN, IF, or WHILE
block.

Use the following steps to insert a Surround With snippet:

1. In the query window, select the code that you want to enclose with the
snippet around.

2. Right-click and select **Surround With**.

3. Select the type of block that you want to use. For example, select
**Code Snippet for While loop**.

   The code is then enclosed with the selected block type.
