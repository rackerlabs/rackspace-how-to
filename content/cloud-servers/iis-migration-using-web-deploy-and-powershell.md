---
permalink: iis-migration-using-web-deploy-and-powershell
audit_date:
title: IIS Migration Using Web Deploy and Powershell
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

### IIS Migration using Web Deploy and Powershell
When migrating to a new server if you need to migrate your IIS sites there are a few options, this article explains how to use PowerShell cmdlets that rely on Web Deploy to package up the site config and content. I will provide a few option including migrating just the config or content and both.  This article is just for a one off back-up/restore procedure when you have to migrate to a new server.  For information on syncing websites see the link at the bottom of this page.

### Install Web Deploy

The first thing you need to do is install Web Deploy, you can find this from the MS site or the easiest method is to download it through the Web Platform installer in IIS.

-From Web Platform Installer search for "Web Deploy"
-Select Web Deploy 3.6
The Web Hosting Providers package includes some common providers for web hosting environments. 

Dependencies such as SQL Server Management Objects and SQL Server are selected automatically for installation, and installed with the Web PI prerequisites, such as the Web Service Management Handler. The package includes some optional components, such as PHP and MySQL.

If you want to you can use MSDeploy to check for dependencies.  You need to ensure the destination server has the same IIS add-ons and features as the destination server. Otherwise when you move the config and content over the site may have issues starting.  This part needs to be done via the command line per site;

From cmd browse to the MSDeploy folder;
cd "C:\Program Files\IIS\Microsoft Web Deploy\"
(depending on version this could be located in "C:\Program Files\IIS\Microsoft Web Deploy V3")
msdeploy -verb:getDependencies -source:apphostconfig="Default Web Site"

### Working with the PowerShell cmdlets
Open PowerShell,  you need to add the PS Snappin, run the command below in PowerShell;

Add-PSSnapin WDeploySnapin3.0
When running the commands below you should be logged on with a user with permissions to access the sites and the content.

When working with the examples below update the C:\DestinationFolder\ or C:\SouceFolder\ section to match where you have saved your backup files;

### Backup all of IIS

The below command takes a complete backup off IIS including config and content.  I have specified a location, if you don't specify this it will save to a new folder in your users document folder.

Backup-WDServer C:\DestinationFolder\
The output of this command is a zip file which can be moved to the destination server to carry out the restore. Take note of the file name of the zip file and use this to update the command below.  This can be run on the destination server to import the IIS config and content.

Restore-WDServer -Package C:\SouceFolder\WIN2012R2_WebServer_20160215112313.zip

### Backup individual site

This command allows you to backup particular sites.  Using the same method above below are example commands of backing up and restoring these sites.

Backup-WDSite -Site "Default Web Site" C:\DestinationFolder\

Restore-WDSite -Package "C:\SouceFolder\WIN2012R2_AppHostConfig_Default Web Site_20160120135336.zip

### Excluding File or folders from Site/Server backup

The above commands assume you want all of the sites or all content in a site.  You can pick folders or files to exclude. A good example may be an images folder that is stored on the file cluster, as this can be accessed centrally and may be a big folder you can choose to exclude it. from the backup  You can specify one folder/file after the -SkipFileList/-SkipFolderList parameter, if you need to add multiple exclusions create an array of these first as shown below;

### Excluding some files from Site backup

$list = @('iisstart.htm','iis-85.png')

Backup-WDSite -Site "Default Web Site" -Output C:\DestinationFolder\ –SkipFileList $list
You can then carry out a normal restore Restore-WDSite

### Excluding Folders from an IIS Server backup
To exclude folders specify a individual folder or create an array of folders, these need to be in the format \\FolderName .
$list = @('\\images','\\Archive')

Backup-WDServer -Output C:\DestinationFolder\ –SkipFolderList $list

The SkipFileList and SkipFolderList parameters can be used with both the Backup-WDSite and Backup-WDServer.  If you have not excluded the files from the backup you can also use the commands to add exclusions when you carry out a restore.

### Backup config Only

To backup the config only simply add the -ConfigOnly switch to the end of your command.

Backup-WDSite -Site "Default Web Site" -Output C:\DestinationFolder\ -ConfigOnly

Backup-WDServer -Output C:\DestinationFolder\ -ConfigOnly

### Sites with Certificates
I have seen a few issues with customers trying to backup sites with SSL so updating the guide to include this, when you do this you may see an error like the one below;
To get round this you need to supply a password to encrypt the backup and use the same password to restore it.  I would use msdeploy to do this.

### Backup Site with SSL
From command line run the following;
cd "C:\Program Files\IIS\Microsoft Web Deploy V3" msdeploy -verb:sync  -source:apphostconfig="Default Web Site" -dest:package=c:\rs-pkgs\defaultsite.zip,encryptPassword=password

### Restore Site with SSL
From command line run the following;
cd "C:\Program Files\IIS\Microsoft Web Deploy V3" msdeploy -verb:sync -source:package=C:\rs-pkgs\defaultsite.zip,encryptPassword=password -dest:apphostconfig="Default Web Site"
Run the -whatif switch at the end of these commands to check it is working before actually executing them.
There are many more features and Web Deploy cmdlets that allow you to Sync Web-Sites as well as carrying out backup and restores.  For full details on the cmdlets available see the details in this link http://www.iis.net/learn/publish/using-web-deploy/web-deploy-powershell-cmdlets. 
