---
permalink: create-a-cron-job-to-back-up-a-cloud-sites-sql-server-database/
audit_date:
title: Create a cron job to back up a Cloud Sites SQL Server database
type: article
created_date: '2011-03-16'
created_by: Matt Costello
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

Microsoft SQL Server has a built-in backup feature that you can run as a
query or a stored procedure. You can configure the output file to write
to an FTP folder. This tutorial explains how to accomplish this task.

**Note:** The scripts in this tutorial were created by one of our forum
users. If you need further assistance, contact your developer.

### Create the folder

First, you need to create a folder to store the backup in your FTP
application.

1.  Connect your FTP client to the account that has the database that
    you want to back up.
2.  Create a folder called **backups** inside the **/web** directory.
    The path to the folder should look similar to the following example:

        /123456/www.domain.com/web/backups/

3.  In your FTP application, right-click the folder that you just
    created and set its permissions to **766**. Be aware that you are
    allowing all users write permissions for the folder). If your FTP
    client doesn't allow this, we recommend that you use a client that
    does, such as FileZilla, CoffeeCup FTP, or FireFTP (a
    Firefox plugin).

**IMPORTANT:** For this specific example to work, the permissions on the
**_/www.domain.com** and **/web** folders must be set to **751**.

### Create the stored procedure

You will also need to create a stored procedure that performs the backup
with an input parameter for the file name.

To do so, connect to your SQL Server database by using the client of
your choice, and run a query similar to the following one. In this
example, the stored procedure is named `FullBackup`.

    set ANSI_NULLS ON
    set QUOTED_IDENTIFIER ON
    GO

    CREATE PROCEDURE [dbo].[FullBackup]
     @FileName nvarchar(256)
    AS
    BEGIN

    SET NOCOUNT ON;

        BACKUP DATABASE [123456_YourDatabase] TO DISK = @FileName WITH COPY_ONLY, NOFORMAT, NOINIT, NAME = N'Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10

    END

### Create the web page

Next, you create a web page that has code to execute the stored
procedure. You can use any language we support on Windows, such as ASP
Classic or ASP.NET. For this task, we recommend ASP Classic, so that
there is no **.dll** file and no application restart is needed.

Create a new ASP page and call it **backupdb.asp**. Edit the location
path and SQL connection string. The contents of the file are as follows:

    <%@LANGUAGE="VBScript" CODEPAGE="65001"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Untitled Document</title>

    </head>

    <body>

    <%
        dim thismonth, thisday, thisyear, location, filename, ver, extention, abolutepath

    thismonth= datepart("m", now())
    thisday=datepart("d", now())
    thisyear=datepart("yyyy",now())

    location="\\fs1-n03\stor1wc1dfw\838249\2382489\www.yoursite.com\backups\"
    filename="dbBackup-" & thismonth & "-" & thisday & "-" & thisyear & "_"

    ver=1
    extention=".bak"

    absolutepath=location & filename & ver & extention

        set fso = Server.CreateObject("Scripting.FileSystemObject")

    while (fso.FileExists(absolutepath)=True)
    ver=ver+1
    absolutepath=location & filename & ver & extention
    wend

    'pre Create the file
    Dim fs,f
    Set fs=Server.CreateObject("Scripting.FileSystemObject")
    Set f=fs.CreateTextFile(absolutepath)
    set f=nothing
    set fs=nothing
    'finished creating the file

        Set cn = Server.CreateObject("ADODB.Connection")
        cn.connectionString= "Provider=SQLOLEDB;Server=mssql12xx.wc1;Database=123456_YourDatabase;Uid=123456_YourUsername; Pwd=Yourpassword;"

       cn.open

       Set cmd = Server.CreateObject("ADODB.Command")
       Set cmd.ActiveConnection = cn
       cmd.CommandText = "FullBackup"
       cmd.CommandType = 4 'adCmdStoredProc

       cmd.Parameters.Refresh
       cmd.Parameters(1) = absolutepath

       cmd.Execute

       cn.close

    %>

       Execution complete:  Filename=<%= filename & ver & extention%>

    </body>
    </html>

### Schedule the cron job

Schedule a cron job to call the web page.

1.  Open the Cloud Sites Control Panel.
2.  Click on the site with the database, and go to the **Features** tab.
3.  Under **Scheduled Tasks (Cron Jobs)**, click **Add New Task**.
4.  Specify a name for the job.
5.  Select the **Send me an email** check box and enter your
    email address.
6.  Select **http** as the script language.
7.  Enter the URL to the ASP script.
8.  Schedule the job to run daily at an off hour. Usually this is a
    late-night period, such as 1:00 a.m., when most sites experience
    less traffic.
