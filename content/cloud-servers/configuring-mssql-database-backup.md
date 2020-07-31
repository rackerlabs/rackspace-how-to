---
permalink: configuring-mssql-database-backup/
audit_date:
title: ‘Configuring MSSQL database backups’
type: article
created_date: '2020-07-31'
created_by: Karoline Mills
last_modified_date:
last_modified_by:
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to perform SQL Server database backups using SSMS (SQL Server Management Studio) and PowerShell.

### Backup Limitations
-	Backups that have been created with a newer version of SQL Server cannot be restored to older versions of SQL Server
-	A full database backup has to be taken before differential and transaction log backups can be performed
-	**Backup database** and/or **Backup log** permissions are needed to perform backup operations. By default, these permissions are granted to the **sysadmin** fixed server role and the **db_owner** and **db_backupoperator** fixed database roles.


### Using SQL Server Management Studio to create a database backup

1.	Connect to your database instance and expand the **databases** section on the left-hand side
2.	Right-click on the database you wish to back up and select **Back Up…**
3.	Select the desired backup type (full, differential or log) from the drop-down list
4.	Choose the desired backup destination and select **OK** to start the backup process

Alternatively, you can use the following queries to initiate a backup operation:
1.	When logged into the correct database instance, select **New Query** 
2.	Use the following query when backing up to a disk. Replace the location and database name with the respective names on your server:

USE SQLTestDatabase;
GO
BACKUP DATABASE SQLTestDatabase
TO DISK = 'd:\backups\SQLTestDatabase.bak'
   	WITH FORMAT,
      MEDIANAME = 'SQLServerBackups',
      NAME = 'Full Backup of SQLTestDatabase';
GO

### Using Powershell to create a database backup

You can also create database backups by using Powershell. First, open PowerShell with administrator permissions and type **Install-Module -Name SqlServer**. This will install the SQL Server module, which is needed to perform backup operations in PowerShell.
Use the following example to perform a full database backup to the default backup location (replace the location and database name with the respective names on your server):

$credential = Get-Credential
Backup-SqlDatabase -ServerInstance Computer[\Instance] -Database <SQLTestDatabase> -BackupAction Database -Credential $credential

Please review the official Microsoft documentation [here](https://docs.microsoft.com/en-us/powershell/module/sqlserver/backup-sqldatabase?view=sqlserver-ps) regarding syntax and examples for different backup operations.
