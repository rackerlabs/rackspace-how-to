---
permalink: importing-data-into-cloud-databases/
audit_date:
title: Import data into Cloud Databases
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-20'
last_modified_by: Mike Asthalter
product: Cloud Databases
product_url: cloud-databases
---

This article describes how to import the data of an existing MySQL,
Percona, or MariaDB database into a Cloud Database. If you haven't
already created a Cloud Database instance and an empty database to
receive the imported data, you will need to do that first. There are a
number of ways to import data to a MySQL database, but the recommended
process for cloud databases is outlined below. However, for imports of 
very large data sets or imports to mission critical database instances, 
we recommend utilizing the Cloud Databases support team, which is included 
in the cost of the Database, to plan and determine the best course of action 
for your particular database. 

You can import from databases on Rackspace's public cloud, on another
cloud, or in your own datacenter. If the data is being imported from a
location without Rackspace ServiceNet access (another cloud, your
datacenter, etc.), you will either need to create a Cloud Server to copy
your import file to, or enable external access on your database via
either an HA Cloud Databases instance group or with a [Rackspace Cloud
Load
Balancer](/how-to/connect-to-a-cloud-databases-instance#lb).

### Importing using a Rackspace Cloud Server

Perform the following steps:

#### Creating a Cloud Database Instance

1.  Use the [Cloud Control Panel](http://mycloud.rackspace.com),
    [API](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#document-api-reference),
    or [command line
    client](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#id3)
    to create a Cloud Database instance with an empty database and a
    username and password to access it.
2.  If you need to change any configuration parameters, do so via
    [configuration
    groups](/how-to/managing-cloud-databases-configuration-groups-in-the-cloud-control-panel)
    on the new database instance. This is important to do before you
    import, because changing these after the import could have
    unexpected effects on the data and application connecting to it.
3.  When the database instance is created, click on it and take note of
    the Hostname. You'll use it in a later step. The Hostname looks
    something like this:

    <img src="{% asset_path cloud-databases/importing-data-into-cloud-databases/Hostname%20of%20Database.png %}" alt="Database Hostname" width="600" />

    **On your current database**

4.  On the machine where your existing database is currently located,
    run the following MySQL command to export your database:

        mysqldump -u username -p database_name > database_name.sql

      - `database_name` is the name of your existing database.

      - `database_name.sql` is the name of the exported database file.

      - Replace `username` with the username you use to access the
        original database.

      **Note**: If you are creating a dump from a Cloud Databases,
      see [exporting data](/how-to/exporting-data-from-mysql)
      for information on how to perform this dump.     

5.  Use SFTP to copy the exported .sql file to the Cloud Server that
    will access your Cloud Database.
6.  With the .sql file copied to your Cloud Server, use ssh to log into
    the Cloud Server.
7.  If you don't have a MySQL client installed on your server, install
    it now.

     - On Ubuntu and Debian, install the client with the following
       command:

            sudo apt-get install mysql-client

     - On Fedora and CentOS, install the client with this command:

            sudo yum install mysql

8.  Run the following MySQL import command, substituting that long
    public hostname you copied from the Control Panel for the `hostname`
    in the command:

        mysql -h 31blah2d.rackspaceclouddb.com -u username -p database_name < database_name.sql

          - Replace `username` with the username you use to access the database.

          - `database_name` is the name of the database.

  The database is imported and ready to accept new data.

### Importing to a Cloud Database with public access (HA group or Cloud Load Balancer)

Perform the following steps:

#### Creating a Cloud Database Instance

1.  Use the [Cloud Control Panel](http://mycloud.rackspace.com),
    [API](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#document-api-reference),
    or [command line
    client](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#id3)
    to create a Cloud Database instance (and load balancer if needed)
    with an empty database and a username and password to access it.
2.  If you need to change any configuration parameters, do so via
    [configuration
    groups](/how-to/managing-cloud-databases-configuration-groups-in-the-cloud-control-panel)
    on the new database instance. This is important to do before you
    import, because changing these after the import could have
    unexpected effects on the data and application connecting to it.
3.  When the database instance is created, take note of the Hostname.
    You'll use it in a later step. The public Hostname for an HA
    instance looks something like this:

    <img src="{% asset_path cloud-databases/importing-data-into-cloud-databases/HA_Group_Details_KC.png %}" width="600" />

    **On your current database**

4.  On the machine where your existing database is currently located,
    run the following MySQL command to export your database:

         mysqldump -u username -p database_name > database_name.sql

      - `database_name` is the name of your existing database.
      
      - `database_name.sql` is the name of the exported database file.
      
      - Replace `username` with the username you use to access the original database.

      **Note**: If you are creating a dump from a Cloud Databases
      Instance, see [exporting data](/how-to/exporting-data-from-mysql)
      for information on how to perform this dump. 

5.  Run the following MySQL import command, substituting that long
    public hostname you copied from the Control Panel for the `hostname`
    in the command:

         mysql -h hostname -u username -p database_name < database_name.sql

      - Replace `username` with the username you use to access the database.
      
      - `database_name` is the name of the database.

  The database is imported and ready to accept new data.

### Best Practices

Large imports to new HA or replicated Cloud Databases instances should
utilize a single instance for the import then convert to HA/add replicas
after import. Importing to a replicated database or HA group causes
every transaction to be replicated and can fill up binlogs quickly and
place additional load on the new instance. It is more efficient to
import to a single instance then convert.

If importing between MySQL versions or between different MySQL based
datastores (Example: MySQL 5.1 to MySQL 5.6, or MySQL to MariaDB),
always review the release notes of the destination datastore to ensure
that there are no possible issues that may modify the expected behavior
of your application. [Upgrading a database
instance](/how-to/upgrade-a-cloud-databases-instance-from-mysql-51-to-mysql-56)
for an example on how to upgrade from MySQL 5.1 to 5.6.

### Limitations

-   A full instance export (with users and settings) requires root
    access on both the original and new database instances.
    Import/export of individual databases does not require root access.
-   Attempts to export/import the 'mysql' system database tables (for
    example: mysql.user) can possibly lead to issues with functionality
    of your database instance and require support intervention
    to recover.
-   Imports of VIEWs, TRIGGERs, PROCEDUREs, FUNCTIONs that have a
    definer other than the database user importing data will fail due to
    a requirement for SUPER privilege.

### External Links

[MYSQL Documentation](http://dev.mysql.com/doc/)

<https://mariadb.com/kb/en/mariadb/documentation/>

<https://www.percona.com/software/mysql-database/percona-server>
