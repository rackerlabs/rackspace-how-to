---
permalink: migrate-a-cloud-site-from-mssql2005-to-mssql2008/
audit_date:
title: Migrate a Cloud Site from MSSQL2005 to MSSQL2008
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Pre-Migration Tasks

1.  If the procedure is followed correctly, site impact during the
    migration process should be minimal. We suggest that you perform
    this migration at a non-peak time to minimize business impact.
2.  To limit the traffic to your database, set your site's default page
    to reflect that it is currently undergoing maintenance.
3.  Confirm that your current hosting plan has an adequate number of
    databases allotted. You might need to add additional databases to
    the plan to perform this migration successfully.
4.  If you created any full text catalogs, you will have to drop them
    before making a backup of your 2005 database. While SQL 2008 does
    support full text catalogs, our current tools do not allow for them
    to be restored if they are in the backup file. Once you have
    restored to the new MSSQL2008 location please add your full
    text catalogs. The information at the following links will assist
    you in completing this task:
    -   [How to drop a full text catalog](http://msdn.microsoft.com/en-us/library/ms188403.aspx)
    -   [How to create a fulltext catalog](http://msdn.microsoft.com/en-us/library/ms189520.aspx)
5.  You can set the database to `READ-ONLY` mode to ensure there are no
    updates done to the database while the migration is performed with
    the following query:

        ALTER DATABASE [NumXYZ_OldDbName] SET READ_ONLY

    **Note:** Only set the database to READ_ONLY after making
    the backup, otherwise you won't be able to log into the
    new database.

6.  When the new database is restored set it to Read-Write:

        ALTER DATABASE [NumXYZ_NewDbName] SET READ_WRITE

### Cloud Site migration steps

1.  Create a new MSSQL 2008 database in the Cloud Sites Control Panel
    under the "Features" tab of the domain your MSSQL2005 database is
    on.

    <img src="{% asset_path cloud-sites/migrate-a-cloud-site-from-mssql2005-to-mssql2008/createdb1.JPG %}" alt="createdb1.JPG" />

2.  After the database has been created, please view its properties (as
    shown below) and note the change in the hostname. **You will
    need to change any connection strings you have to the database and
    this information will be required.** The information for you
    database will vary from the image depending on what data center your
    account is hosted in.

    <img src="{% asset_path cloud-sites/migrate-a-cloud-site-from-mssql2005-to-mssql2008/dbinfo.JPG %}" alt="dbinfo.JPG" />

3.  Next use the web based admin tool, MyLittleAdmin, to back up your
    MSSQL 2005 database. The link for the online tool can be found in
    your Cloud Sites Control Panel by clicking on the database under the
    **Features** tab. For this backup please add "mlb" to the end of
    the URL. It is important to add this to the URL and not to go
    through the standard MyLittleAdmin link found in your Cloud Sites
    Control Panel. Using the links instead of adding the "mlb" may cause
    session issues between the two MyLittleAdmin versions. For example:
    `https://mssqladmin.websitesettings.com/mlb`

    <img src="{% asset_path cloud-sites/migrate-a-cloud-site-from-mssql2005-to-mssql2008/mlb1.JPG %}" alt="mlb1.JPG" />

4.  Login to your original MSSQL 2005 source
    database.

    <img src="{% asset_path cloud-sites/migrate-a-cloud-site-from-mssql2005-to-mssql2008/mlb2.JPG %}" alt="mlb2.JPG" />

5.  Now back up your MSSQL 2005 database use the MyLittleAdmin tool.
    When the backup has completed click on the file link to save the
    backup file to your local machine.
6.  Log in to the MyLittleAdmin link again using your MSSQL 2008
    database and login. Remember the login you use to restore will
    become the new owner of the database. Choose restore and upload the
    backup file you just downloaded in Step 5. Proceed with the
    restore.

    <img src="{% asset_path cloud-sites/migrate-a-cloud-site-from-mssql2005-to-mssql2008/mlb3.JPG %}" alt="mlb3.JPG" />

7.  The restore tool may notify you that the old users have no login
    mapping on the new SQL 2008 cluster. At this point your new database
    will be ready. The only access, at this point, is allowed to the
    owner login that you used to restore the database. If you need to
    change the owner to another login you created in the control panel
    or remap users in your database to new logins please refer to the KB
    article [How to Change ownership and remap database users using the web based admin tool for MSSQL.](/how-to/remap-database-users-in-mylittleadmin)
8.  Once the migration is complete, update all connection strings to
    point to the new database. After you verify that everything is
    working from the MSSQL2008 database, delete your MSSQL2005 database
    and confirm with Cloud Sites Support that the migration is complete.
    This will ensure that you are not billed for the additional database
    in the future.
