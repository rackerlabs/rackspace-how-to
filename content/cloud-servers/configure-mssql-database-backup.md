---
permalink: configure-mssql-database-backup/
audit_date: '2020-08-19'
title: 'Configure MSSQL database backups'
type: article
created_date: '2020-07-31'
created_by: Karoline Mills
last_modified_date: '2020-08-19'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to perform SQL Server&reg; database backups by using SQL Server Management Studio (SSMS) and
PowerShell&reg;.

### Backup limitations

Backups have the following limitations:

-	You cannot restore backups that were created with a newer version of SQL Server to older versions of SQL Server.
-	You must take a full database backup  before you can perform differential and transaction log backups.
-	You need **Backup database** or **Backup log** permissions to perform backup operations. By default, the system
   grants these permissions to the **sysadmin** fixed server role and the **db_owner** and **db_backupoperator** fixed
   database roles.

### Use SQL Server Management Studio to create a database backup

1.	Connect to your database instance and expand the **databases** section on the left-hand side.
2.	Right-click on the database you want to back up and select **Back Up…**.
3.	Select the desired backup type (full, differential, or log) from the drop-down list.
4.	Choose the desired backup destination and select **OK** to start the backup process.

Alternatively, you can use the following steps to initiate a backup operation:

1.	When logged into the correct database instance, select **New Query**. 
2.	Use the following query when backing up to a disk. Replace the location and database name with the respective names
   on your server:

        USE SQLTestDatabase;
        GO
        BACKUP DATABASE SQLTestDatabase
        TO DISK = 'd:\backups\SQLTestDatabase.bak'
       	 WITH FORMAT,
          MEDIANAME = 'SQLServerBackups',
          NAME = 'Full Backup of SQLTestDatabase';
        GO

### Use PowerShell to create a database backup

You can also create database backups by using PowerShell. 

First, open PowerShell with administrator permissions and type `Install-Module -Name SqlServer`. This commmand installs the
SQL Server module, which you need to perform backup operations in PowerShell.

Next, use the following example to perform a full database backup to the default backup location, replacing the location
and database name with your server's respective names:

    $credential = Get-Credential
    Backup-SqlDatabase -ServerInstance Computer[\Instance] -Database <SQLTestDatabase> -BackupAction Database -Credential $credential

Finally, to learn more about syntax and examples for different backup operations, review the 
[official Microsoft documentation](https://docs.microsoft.com/en-us/powershell/module/sqlserver/backup-sqldatabase?view=sqlserver-ps).
