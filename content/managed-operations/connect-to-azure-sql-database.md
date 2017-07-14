---
permalink: connect-to-azure-sql-database/
audit_date: '2017-06-06'
title: Connect to Azure SQL Database
type: article
created_date: '2017-05-31'
created_by: Juan Garza
last_modified_date: '2017-05-31'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

When a change to an application works in a development environment but does not work in production, you might need to make that same change in your database. Microsoft Azure SQL Database uses the same tools as a SQL Server but with the capability of the Microsoft cloud. 

This article describes how to connect to an Azure SQL Database.

### Prerequisite

- Your login credentials for the Azure portal. For information about how to log in to the Azure portal, see [Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/).

### Install the latest version of SQL Server Management Studio

When you are working with SQL Database, you should always use the latest version of SQL Server Management Studio (SSMS). The latest version of SSMS is optimized to work with Azure and SQL Database and works for all supported versions of SQL Server. To help you stay up-to-date, the latest version prompts you when there is a new version available to download. 

To download and install the latest version of SMSS, see [Download SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms).

### Create a server-level firewall rule

By default, an Azure SQL Database firewall prevents external connectivity to your logical server and its databases. To enable you to connect to your server, you need to create a firewall rule for the IP address of the computer from which you connect by using the following instructions:

1. Log in to the [Azure portal](https://portal.azure.com/).

2. In the left navigation pane, click **All resources**, and select the SQL server (for example, **sccwest-web-sql**) to bring up SQL server pane.

3. On the SQL Server pane, click **Firewall** to open the Firewall pane for your server. The IP address of your client computer is displayed.

    <img src="{% asset_path managed-operations/connect-to-azure-sql/firewall-ip.png %}" alt="" />  

4. Click **Add client IP** on the toolbar to create a firewall rule for your current IP address. You can create a firewall rule for a single IP address or an entire range of addresses. Opening the firewall enables SQL administrators and users to log in to any database on the server for which they have valid credentials.

5. Click **Save** on the toolbar to save this server-level firewall rule, and then select **Ok** to close the Success dialog box.

### Connect to the server with SSMS

1. Open SQL Server Management Studio.

2. In the Connect to Server dialog box, enter your server name and then select **SQL Server Authentication**. Enter the username and password that you specified when you created your server level Firewall rule.

3. Click **Connect** to start the connection, and then open **Object Explorer** in SSMS.

### Backing up Azure SQL Database

SQL Database automatically performs weekly full database backups, hourly differential
database backups, and transaction log backups every five minutes. These backups are
stored for 35 days for databases in the Standard and Premium service tiers.

If you need to recover data that is older than 35 days, consider archiving your database
regularly to a BACPAC file (a compressed file that contains your database schema and
associated data) stored either in Azure blob storage or in another location.
