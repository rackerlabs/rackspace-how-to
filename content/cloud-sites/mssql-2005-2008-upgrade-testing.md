---
permalink: mssql-2005-2008-upgrade-testing/
audit_date:
title: MSSQL 2005 - 2008 Upgrade Testing
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-30'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Pre-Migration Tasks:

If followed correctly, site impact during the migration process should
be minimal. With that said, it is highly suggested to perform this
migration at a non-peak time to minimize business impact. Here are some
tips for database migration:

-   You can set your default page to reflect that your site is currently
    under maintenance to limit the traffic that would be hitting
    the database.

-   Confirm that your current hosting plan has an adequate number of
    databases allotted. You may need to add additional databases to the
    plan to perform this migration successfully. If that's the case,
    please review the following article: [How do I modify the number of databases my site can have?](https://community.rackspace.com/products/f/26/t/285)

-   You can set the database to READ_ONLY mode to ensure there are no
    updates done to the database while the migration is performed. If
    you would like to do this, please make your backup *just prior* to
    setting the database to READ_ONLY mode; otherwise you will not be
    able to restore the backup to the new database server.
    -   To set the database to READ_ONLY you may use this query:

            ALTER DATABASE [NumXYZ_OldDbName] SET READ_ONLY

    -   When the new database is restored set it to READ_WRITE:

            ALTER DATABASE [NumXYZ_NewDbName] SET READ_WRITE

### Recommended Steps:

1. Create a new MSSQL 2008 database in the Cloud Sites Control Panel
under the "Features" tab of the domain your MSSQL2005 database is on.

  <img src="{% asset_path cloud-sites/mssql-2005-2008-upgrade-testing/createdb1.JPG %}" alt="createdb1.JPG" />

2. After the database has been created, please view its properties (as
shown below) and note the change in the hostname. The information for
you database will vary from the image depending on what data center your
account is hosted in. Please use this new MSSQL 2008 hostname to update
your connection strings.

  <img src="{% asset_path cloud-sites/mssql-2005-2008-upgrade-testing/dbinfo.JPG %}" alt="dbinfo.JPG" />

3. Next use the web based admin tool, MyLittleAdmin, to back up your
MSSQL 2005 database. The link for the online tool can be found in your
Cloud Sites Control Panel by clicking on the database under the
**Features** tab. For this backup please add "mlb" to the end of the
URL. It is important to add this to the URL and not to go through the
standard MyLittleAdmin link found in your Cloud Sites Control Panel.
Using the links instead of adding the "mlb" may cause session issues
between the two MyLittleAdmin versions. For example:
`https://mssqladmin.websitesettings.com/mlb`

  <img src="{% asset_path cloud-sites/mssql-2005-2008-upgrade-testing/mlb1.JPG %}" alt="mlb1.JPG" />

4. Login to your original MSSQL 2005 source database.

  <img src="{% asset_path cloud-sites/mssql-2005-2008-upgrade-testing/mlb2.JPG %}" alt="mlb2.JPG" />

5. Now back up your MSSQL 2005 database use the MyLittleAdmin tool. When
the backup has completed click on the file link to save the backup file
to your local machine.

6. Log in to the MyLittleAdmin link again using your MSSQL 2008 database
and login. Remember the login you use to restore will become the new
owner of the database. Choose restore and upload the backup file you
just downloaded in Step 5. Proceed with the restore.

  <img src="{% asset_path cloud-sites/mssql-2005-2008-upgrade-testing/mlb3.JPG %}" alt="mlb3.JPG" />

7. The restore tool may notify you that the old users have no login
mapping on the new SQL 2008 cluster. At this point your new database
will be ready. The only access, at this point, is allowed to the owner
login that you used to restore the database. If you need to change the
owner to another login you created in the Cloud Sites Control Panel or
remap users in your database to new logins please refer to the KB
article on remapping database users and changing ownership in MSSQL.
