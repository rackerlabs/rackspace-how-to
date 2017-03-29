---
permalink: ras-sitecore-azuresql/
audit_date:
title: Connecting to Azure SQL
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/sitecore-faq)

### Getting Started

**Install the newest version of SQL Server Management Studio**

When working with SQL Database, you should always use the most recent version of SQL Server Management Studio (SSMS). The latest version of SSMS is continually updated and optimized to work with Azure and SQL Database. The latest version of SSMS works for all supported versions of SQL Server. To download and install the latest version, see:

[Download SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) 

In the Connect to Server dialog box, enter the necessary information to connect to your SQL server using SQL Server Authentication.
To stay up-to-date, the latest version of SSMS prompts you when there is a new version available to download.

[Sign in to the Azure portal](/how-to/sitecore-azure)

Create a server-level firewall rule

By default, an Azure SQL Database firewall prevents external connectivity to your logical server and its databases. To enable you to connect to your server, you need to create a firewall rule for the IP address of the computer from which you connect.

1. On the SQL server blade, click Firewall to open the Firewall blade for your server. Notice that the IP address is displayed for your client computer.

<img src="{% asset_path ras-sitecore/ras-sitecore-azuresql/sql-server-firewall.png %}" alt="SQL server firewall" />

2. Click Add client IP on the toolbar to create a firewall rule for your current IP address.
<img src="{% asset_path ras-sitecore/ras-sitecore-azuresql/add-client-ip.png %}" alt="Add client IP" />

3. Click Save on the toolbar to save this server-level firewall rule and then click OK to close the Success dialog box.
<img src="{% asset_path ras-sitecore/ras-sitecore-azuresql/save-firewall-rule.png %}" alt="save firewall rule" />

You can create a firewall rule for a single IP address or an entire range of addresses. Opening the firewall enables SQL administrators and users to log in to any database on the server for which they have valid credentials.

Connect to the server with SSMS

1. Open SQL Server Management Studio

2. In the Connect to Server dialog box, enter your fully qualified server name, select SQL Server Authentication, and then provide the login and password that you specified.

<img src="{% asset_path ras-sitecore/ras-sitecore-azuresql/sql-server-login.png %}" alt="SQL server login" />

3. Click Connect to initiate the connection and open Object Explorer in SSMS.

------------------------------------------------------------------------

Backing up Azure SQL

SQL Database automatically performs a combination of full database backups weekly, differential database backups hourly, and transaction log backups every five minutes to protect your business from data loss. These backups are stored in geo-redundant storage for 35 days for databases in the Standard and Premium service tiers.  If you need to be able to recover data from a period older than 35 days, consider archiving your database regularly to a BACPAC file (a compressed file containing your database schema and associated data) stored either in Azure blob storage or in another location of your choice.

[Export a database to a BACPAC file](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-export-portal)
