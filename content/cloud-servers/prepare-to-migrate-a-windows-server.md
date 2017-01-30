---
permalink: prepare-to-migrate-a-windows-server/
audit_date: '2016-11-18'
title: Prepare to migrate a Windows server
type: article
created_date: '2015-01-22'
created_by: Hounsou Dansou
last_modified_date: '2016-11-14'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article provides recommended actions to perform before
you migrate your Windows server to mitigate common issues and optimize
your server for a faster transition. These recommendations are based on
common issues identified by Rackspace support technicians and are not required
operations. Some of these recommendations can cause significant
downtime, so schedule them accordingly.

For Linux migration preparation, see [Prepare to migrate a Linux server](/how-to/prepare-to-migrate-a-linux-server).

### Back up your data

Before you perform a migration, create a tested, file-level backup of
important data. Rackspace offers a backup solution, Cloud Backup, which
requires a backup agent on the server. For instructions
on installing this agent, see [Rackspace Cloud Backup - Install the agent (Windows)](/how-to/rackspace-cloud-backup-install-the-agent-on-windows).

To set up your backup directory and a schedule for exporting your backup
to Cloud Files, see the instructions at [Rackspace Cloud Backup - Create a Backup](/how-to/rackspace-cloud-backup-create-a-backup).

**Note**: Cloud Backup does not back up live databases. If you want to use data from a live database, we recommend that you configure Microsoft SQL Server to create a local backup, and then use the Cloud Backup agent to create a backup of the database. For
more information about configuring SQL Server to create local backups, see [Create a maintenance backup place in SQL Server 2008 R2](/how-to/create-a-maintenance-backup-plan-in-sql-server-2008-r2-using-the-wizard).

For more information about Cloud Backup, see <http://www.rackspace.com/cloud/backup>.

### Verify that the server is fully patched

If the server is not fully patched,
remaining patches might be installed during the migration, which will delay the operation.
To prevent this issue, install all pending updates before beginning the
migration. Use the following instructions appropriate for your server
version.

**Windows Server 2008 and 2008 R2**

1.  Click **Start > Control Panel**.
2.  Click **Windows Update** to view the information related to updates
    ready to be installed.

    If a green shield appears on the Windows Update page, the server
    has all patches applied. Otherwise, proceed with the installation of any pending updates.

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

To ensure that your server comes online after the migration, determine whether there
are pending Windows updates that require a reboot or whether a reboot is already
pending because of updates. Pending Windows updates can cause errors when run on a
newly migrated server, so it is important to ensure that updates are completed before
imaging or migrating a server and that any pending reboots are performed.

**Windows Server 2008 and 2008 R2**

1.  Click **Start > Control Panel**.
2.  Click **Windows Update**.

    If there is a pending reboot, the page will display a message to
    restart the server. Reboot the server and apply the updates
    on reboot.

**Windows Server 2012 and 2012 R2**

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

Rackspace recommends limiting disk activity during the migration because it increases
the total amount of time needed to migrate the server. Normally the biggest contributor
to disk activity is the database service Mssql. Before you begin this step, ensure that you
have a maintenance page that informs your customers about ongoing maintenance.

#### Option 1: Put the database in read-only mode

During the migration, consider running your database in read
only mode to stop all create and update operations. Run the following TSQL query
on the database server.

    ALTER DATABASE databaseName
    SET READ_ONLY
    WITH NO_WAIT

To make the server roll back all open connections, run the
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
2.  In the SQL Server Configuration Manager window, expand SQL
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
4.  In the SQL Server Configuration Manager window, expand SQL Server
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
2.  In the Services Management window, double click a service that
    you want to configure to automatically start, and set the startup
    type to **Automatic**.

**Windows Server 2012 and 2012 R2**

1.  Move the cursor to the bottom right corner of the screen and
    activate the Charms bar.
2.  Click the search icon and type **services.msc**. On the ribbon under
    the search field, click **services.msc**.
3. In the Services Management window, double-click a service that you want to configure to automatically start, and set the startup type to **Automatic**.

### Postmigration tasks

After the server migration is complete, perform the following tasks:

- Ensure that the server is online. Run the `ping` command followed by your server's IP address.

- Ensure that the remote connection to the server works by initiating an RDP session to the server.
- Ensure that all sites or applications load.

- Ensure that the database is running and accessible. If you turned off the database service before the migration, turn on the database service.

- If you have more than one server, ensure that they can communicate.
