---
permalink: prepare-to-migrate-a-windows-server/
audit_date:
title: Prepare to migrate a Windows server
type: article
created_date: '2015-01-22'
created_by: Hounsou Dansou
last_modified_date: '2016-01-07'
last_modified_by: Renee Rendon
product: Cloud Servers
product_url: cloud-servers
---

This article provides recommended actions that you can perform before
you migrate your Windows server to mitigate common issues and optimize
your server for a faster transition. These recommendations are based on
common issues identified by our support technicians and are not required
operations. Some of these recommendations can cause significant
downtime, so you should schedule them accordingly.

For Linux migration preparation, see [Prepare to migrate a Linux server](/how-to/prepare-to-migrate-a-linux-server).

### Back up your data

Before you perform any migration, create a tested, file-level backup of
important data. Rackspace offers a backup solution, Cloud Backup, which
requires a backup agent to be installed on the server. For instructions
on installing this agent, see [Rackspace Cloud Backup - Install the agent (Windows)](/how-to/rackspace-cloud-backup-install-the-agent-on-windows).

**Note**: Cloud Backup does not back up live databases. The first step
for backing up a Microsoft SQL Server database is through Microsoft SQL
Server Management Studio.

To set up your backup directory and a schedule for exporting your backup
to Cloud Files, see the instructions at [Rackspace Cloud Backup - Create a Backup](/knowledge_center/rackspace-cloud-backup-create-a-backup).

You can find more information about Cloud Backup
at <http://www.rackspace.com/cloud/backup>.

### Verify that the server is fully patched

If the server is not fully patched, it will likely attempt to install
remaining patches during the migration, which will delay the operation.
To prevent this issue, install all pending updates before beginning the
migration. Use the following instructions appropriate for your server
version.

**Windows Server 2008 and 2008 R2**

1.  Click **Start > Control Panel**.
2.  Click **Windows Update** to view the information related to updates
    ready to be installed.

    If there is a green shield on the Windows Update page, the server
    has all patches applied.

    Otherwise, proceed with the installation of any pending updates.

**Windows Server 2012 and 2012 R2**

1.  Move the cursor to the bottom-right corner of the screen and
    activate the Charms bar.
2.  Click the search icon and type **Control Panel** for the
    search term.
3.  On the ribbon under the search field, click **Control Panel**.
4.  Click **System and Security** and then **Windows Update** to see if
    there are pending updates to install.
5.  If so, install the updates at a convenient time.

### Check the pending reboot status

A migration can require a server reboot if you're performing a full
server migration. Verify whether your server is already pending a reboot
because of updates, and if it is, perform the reboot before the
migration.

To ensure your server comes online after the migration, confirm that
there are no pending Windows Updates that require a reboot. Pending
Windows updates can cause errors when run on a newly migrated server, so
it is especially important to make sure updates are completed before
imaging or migrating a server.

**For Windows Server 2008 and 2008 R2**

1.  Click **Start > Control Panel**.
2.  Click **Windows Update**.

    If there is a pending reboot, the page will display a message to
    restart the server. Reboot the server and apply the updates
    on reboot.

**For Windows Server 2012 and 2012 R2**

1.  Move the cursor to the bottom right corner of the screen and
    activate the Charms bar.
2.  Click on the search icon and type **Control Panel** for the
    search term.
3.  On the ribbon under the search field, click **Control Panel**.
4.  Click **System and Security** and then **Windows Update** to see if
    Windows is pending a reboot or restart.
    If any pending updates are present, reboot the server and apply the
    updates on reboot.

### Prune and archive old data

Remove or export all large or unused files. You can use Cloud Backup to
export large files to Cloud Files.

Delete old logs.

### Truncate the database log

If your database log is large, consider truncating it. Microsoft
provides instructions at
<http://msdn.microsoft.com/en-us/library/ms189493.aspx>.

### Stop all create and update operations in the database

Rackspaces recommends limiting disk activity during the migration as
this will only increase the total amount of time to migrate the server.
Normally the biggest contributor to disk activity is the database
service Mssql. Before you begin this step, ensure that you have a great
maintenance page to inform your customer about an ongoing maintenance.

#### Option 1: Put the database in read-only mode

During the migration, you may consider running your database in read
only mode to stop all create and update operations. The TSQL query below
must be executed on the Database server.

    ALTER DATABASE databaseName
    SET READ_ONLY
    WITH NO_WAIT

If you want to make the server roll back all open connections, run the
following query instead:

    ALTER DATABASE databaseNeme
    SET READ_ONLY
    WITH ROLLBACK IMMEDIATE

#### Option 2: Stop the database service

If you prefer to stop the database service instead of putting the
database in read only mode, use the following steps to stop the database
service.

**Windows Server 2008 and 2008 R2**

1.  Click **Start > All Programs > Microsoft SQL
    Server > Configuration Tools > SQL Server Configuration
    Manager**.
2.  In the **SQL Server Configuration Manager**, expand SQL
    Server **Services**.
3.  In the right pane, right-click **SQL Server (*instanceName*)** and
    stop the service.

    **Note**: *instanceName* is the instance name of the database server.

**Windows Server 2012 and 2012 R2**

1.  Move the cursor  to the bottom right corner of the screen and
    activate the Charms bar.
2.  Click on the search icon, and type "SQL Server
    Configuration Manager".
3.  On the ribbon under the search field, click **SQL Server
    Configuration Manager**.
4.  In the SQL **Server Configuration Manager**, expand SQL Server
    **Services**.
5.  In the right pane, right click **SQL Server (*instanceName*)** and
    stop the service.

    **Note**: *instanceName* is the instance name of the database server.

### Ensure that all critical services are set to start automatically

Review and confirm that all of the services critical to your processes
are set to start automatically.

**Windows Server 2008 and 2008 R2**

1.  Click the **Start** menu, type **services.msc** in the search field
    and press **Enter**.
2.  In the **Services Management** window, double click a service that
    you want to configure to automatically start, and set the startup
    type to **Automatic**.

**Windows Server 2012 and 2012 R2**

1.  Move the cursor to the bottom right corner of the screen and
    activate the Charms bar.
2.  Click the search icon and type "services.msc". On the ribbon under
    the search field, click **services.msc**.
3.  When the **Services Management** window opens, double click on a
    service that you want to configure to auto start and set the startup
    type to **Automatic**.

### Postmigration tasks

-   Ensure that the server is online. You can ping the IP address by
    running the ping command followed by your server's IP address.
-   Ensure that the remote connection to the server works by initiating
    an RDP session to the server.
-   Ensure that all sites or applications load.
-   Ensure that the database is running and accessible. If you turned
    off the database service before the migration, turn on the database
    service again.
-   If you have more than one server, ensure that they can communicate.
