---
permalink: setup-automatic-mysql-server-backups-to-cloud-files-from-windows/
audit_date:
title: Set up automatic MySQL server backups to Cloud Files from Windows
type: article
created_date: '2011-06-07'
created_by: Rackspace Support
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

This article shows how to set up automatic MySQL server backups from your Windows Cloud Server to your Rackspace Cloud Files container. Follow these three steps to perform this task.

1.  Download and build a small piece of software to upload a file to Cloud Files.
2.  Create a .bat file to take the backup of your MySQL server database and upload it to Cloud Files using the software created in the previous step.
3.  Create a scheduled task in Windows to run the above **.bat** file from step 2 at a scheduled date and time.

### Download and build the upload software

First you will need to download a small piece of C# software and compile it on a Windows Cloud Server. Use the following steps to build the Cloud Files upload software:

1. [Download the software](http://c16281.r81.cf2.rackcdn.com/chmouel-upload-to-cf-cs-0.1-0-g79abd66.zip).

2. Extract the software into your **C:** drive.

  For example, **C:/upload-to-cf-cs-0.1/**.

3. Download and install [NAnt](http://nant.sourceforge.net/), a free .Net Build tool.

4. After you have successfully installed NAnt, open a command prompt, navigate to the directory **C:/upload-to-cf-cs-0.1** and run `nant.exe`.

  You should see output similar to the following:

       C:\upload-to-cf-cs-0.1>..\nant-0.90\bin\NAnt.exe
       NAnt 0.90 (Build 0.90.3780.0; release; 5/8/2010)
       Copyright (C) 2001-2010 Gerry Shaw
       http://nant.sourceforge.net

       Buildfile: file:///C:upload-to-cf-cs-0.1/compile.build
       Target framework: Microsoft .NET Framework 2.0
       Target(s) specified: build

       build:
           [mkdir] Creating directory 'C:\upload-to-cf-cs-0.1\bin'.
             [csc] Compiling 1 files to 'C:\upload-to-cf-cs-0.1\bin\upload-to-cf.exe'.
            [copy] Copying 2 files to 'C:\upload-to-cf-cs-0.1\bin'.

        BUILD SUCCEEDED
        Total time: 1.9 seconds.  

  The above command will compile the binary file `upload-to-cf.exe`. You will be using this binary file to upload your backup files to Cloud Files. You can test this command using the following syntax:

        upload-to-cf.exe [cloud username] [cloud api_key] [container name] [file path]

### Create a .bat file for taking backups

Next, you need to create a **.bat** file to automate the MySQL database backup procedure. You should back up the MySQL database backup file to a date-stamped file. There are several ways to do this, but the easiest way is through a batch file. The command we'll be using is as follows:

        c:\<path-to-mysql>\bin\mysqldump -u[user] -p[password] --result-file="c:\<path>\backup.%DATE:~0,3%.sql" [database name]


Replace the values for `[user]`, `[password]`, and `[database name]` with your MySQL information. You can try this command from the normal command prompt to make sure that it works without any problems before actually including it in a **.bat** file. The above command should end up with a **.sql** file containing a full dump of the MySQL database, with the name you provided at the end of the above command.

After verifying that the above command works, create a **.bat** backup file (for example, **mysql-backup.bat**). It should look similar to the following:

        @echo off
        echo "Running dump... "
        c:\<path-to-mysql>\bin\mysqldump -u[user] -p[password] --result-file="c:\<path>\backup.%DATE:~0,3%.sql" [database name]
        echo "MySQL dump done!"
        echo "Uploading to cloud files"
        upload-to-cf.exe [cloud username] [cloud api_key] [container name] "c:\<path>\backup.%DATE:~0,3%.sql"
        echo "backup file uploaded to cloud files!"

**Note:** You need to replace the values in [] brackets with actual values for your system.

Now you should be able to run **mysql-backup.bat** from a command prompt. If it works, you should see a success message, and a file should be generated in the directory you specified. If not, make sure you have the correct username, password, and database values specified and then try it again.

### Create a Windows Scheduled Task

Now you have a **mysql-backup.bat** file that creates the backup of your MySQL database and uploads the file to Rackspace Cloud Files using the `upload-to-cf.exe` program. The next step is to create a Windows Scheduled Task so that all the above steps run automatically at a scheduled date and time. Follow the steps below to setup a scheduled task in Windows.

1. Click **Start > Run**, type "cmd", and then click **OK**.

2. At the command prompt, type "net start", and then press **ENTER** to display a list of currently running services.

  If Task Scheduler is not displayed in the list, type net start "task scheduler", and then press ENTER.

3. At the command prompt, type the following command and then press **ENTER**:

        schtasks /create /tn "MySQL_Backup" /tr c:\apps\mysql-backup.bat /sc Value /st HH:MM:SS /ed MM/DD/YYYY

  You might have to change the parameters for your situation. For example:

        C:\Documents and Settings\Administrator>schtasks /create /TN "MySQL_Backup" /TR c:/mysql-backup.bat /SC daily /ST 08:00:00 /ED 12/31/2014
        The task will be created under current logged-on user name ("win2k3r232bit\Administrator").
        Please enter the run as password for win2k3r232bit\Administrator: **********************

        SUCCESS: The scheduled task "MySQL_Backup" has successfully been created.

        C:\Documents and Settings\Administrator>schtasks

        TaskName                             Next Run Time            Status
        ==================================== ======================== ===============
        MySQL_Backup                         8:00:00 AM,              4/19/2011

This example schedules the MySQL_Backup program to run once a day, every day, at 8:00 A.M. until December 31, 2014. Because it omits the `/mo` parameter, the default interval of 1 is used to run the command every day.

During the task creation you will be asked your currently logged in user's password. After you enter the password, a new task will be created for you. You can view the newly created task with the `schtasks` command.
