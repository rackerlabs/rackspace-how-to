---
permalink: oracle-business-intelligence-12c-release-new-features/
audit_date: '2017-10-04'
title: Oracle Business Intelligence 12c new release features
type: article
created_date: '2017-09-26'
created_by: Catherine Richardson
last_modified_date: '2017-09-26'
last_modified_by: Catherine Richardson
product: Managed Operations
product_url: managed-operations
---

Oracle® Business Intelligence Enterprise Edition (OBIEE) 12c is the latest
analytics suite release of the Oracle Business Intelligence (BI) system. It
introduces major changes to architecture and updated feature sets, such as
visual analyzer, better life cycle management, and data mashups. This article
provides information about some of the new features.

### Architecture

The Oracle home location has been redefined, and there is no longer a
middleware home. The Oracle Process Manager and Notification Server (OPMN) is
no longer used in Oracle Fusion Middleware. Instead, system components
are managed by the Oracle WebLogic Management Framework, which includes the
WebLogic Scripting Tool (WLST), Node Manager. All Oracle BI metadata,
including the repository, the Oracle BI Presentation Services catalog, and
user authentication, are stored in Oracle BI application archive (BAR) files.
The BAR file is a mechanism for managing or moving a self-contained set of
Oracle BI metadata between environments.

Parameters are now changed directly in files. Parameter changes are no longer
handled in WebLogic Server® MBeans or with the Oracle Enterprise Manager. A
new command enables you to synchronize mid-tier database connection details
when they have changed. A new script enables you to collect the diagnostic
bundles that are needed by Oracle support or development to help resolve
issues.

The Oracle Platform Security Services (OPSS) Security Store (Policy and
Credential Store) is configured in a relational database rather
than in a file. The database is the same as the one that is used by the
Repository Creation Utility (RCU) that is available with Fusion Middleware.
Globally unique identifiers (GUIDs) have been replaced with user names to make
administration easier. Accordingly, GUIDS no longer need to be refreshed. BI
System and BISystemUser have been removed, and the system handles their
functions internally. Consequently, corrupted system credentials are less of a
problem.

### Visual Analyzer

The Oracle BI Cloud Service Visual Analyzer is an interactive, web-based tool
that is used to explore and analyze data. It enables you to perform rapid data
discovery by using standard Oracle BI Subject Areas or by using your own
external data sources (such as spreadsheets).The Visual Analyzer allows you to
create different analyses and reports in the same place and shows the results
immediately in the same page.

### Repository (RPD) modeling

Repository (RPD) modeling includes the following new command-line utilities:  

* Download Repository
* Upload Repository
* List Connection Pool
* Update Connection Pool
* Rename Application Role
* Delete Application Role
* Rename Users
* Delete Users
* List Repository Variables
* Update Repository Variables  

Oracle BI Server now accepts the **DISPLAY** and **SORTKEY**  keywords in the
**SQL  ORDER  BY** expression. You can use the **DISPLAY** keyword to
override an assigned sort order column of a logical column.  

### Visualizations

All views are enhanced so that you can right-click graphs and views
to sort, drill, keep, or review the column from the views. Under
**Column Properties > Data Format**, the **Scale  for  %  (x  100)**  option
has been added so that you can specify whether to multiply data by 100 to
display it as a percentage when setting the properties of a column.  

A new view, the Heat Matrix view, represents the two-dimensional data.

### Administration

The new release includes the following improvements for administration:

* You can invoke WLST from a single location.
* The Oracle Home location has been redefined, and there is no middleware home.
* OPMN is no longer available in Fusion Middleware.
* Oracle Web Cache is not part of Fusion Middleware.
* The move from test to production is carried out differently.
* There are new commands for process control.
* You can manage metadata in BAR files.
* There is a single enterprise installation. No separate software-only or
  simple installation is available.
* Configuration is simplified.
* You can manage system component instances by using commands.
* You can collect diagnostic bundles.
* You can configure the Database Security Store.
* SSL configuration is easier.
* You can migrate catalog groups to application roles.
* You can migrate the Oracle BI 11g metadata to 12c, which a two-step process
  that is carried out by using the BI migration script (migration-tool.sh).

### Data blending

Data blending is a new concept in OBIEE 12c that enables you to blend your own
data with corporate data.

You can include dimensions and measures from external data sources in your
analyses. The external data is loaded to the database, but is not part of the
BI metadata catalog. You can create an analysis that includes only data from
an external source, or you can blend dimensions and measures from the
external data source with dimensions and measures defined in the BI metadata
catalog. The external data must be stored in a Microsoft® Excel® format
spreadsheet file. You import the data from the spreadsheet file into
the OBIEE database as an external data source. You then add columns from the
external data source to your analyses. When the data in spreadsheet file
changes, you can refresh the database with the changes. Also you
can add an external data source like an Excel file through the
**Add Data Source** option.

### External Subject Area cache

The External Subject Area (XSA) cache is a mechanism for caching Excel
files for data mashups in databases. Enabling the XSA cache improves
the performance of uploaded content.

#### Create XSA cache schema

Use the following steps to create an XSA cache schema:

1. Connect to Oracle 11g or 12c databases by using SQL Developer or SQLPlus.

2. Create a schema owner. For example:

   ``CREATE USER XSA_CACHE IDENTIFIED BY welcome1;``

3. Grant session and create table privileges to the schema owner. For example:

   ``GRANT CREATE SESSION TO XSA_CACHE;``

   or

   ``GRANT CREATE TABLE TO XSA_CACHE;``

4. Create a table space and note the correct data file path. For example:

   ``CREATE TABLESPACE XSA_CACHE_TABLESPACE DATAFILE    '/``
   ``scratch/app/12c/oradata/CEAL/datafile/xsa_cache_tablespace.dbf' SIZE 5G``

5. Alter the schema owner to use the table space created above. For example:

   ``ALTER USER XSA_CACHE DEFAULT TABLESPACE XSA_CACHE_TABLESPACE;``

   or

   ``ALTER USER XSA_CACHE QUOTA UNLIMITED ON XSA_CACHE_TABLESPACE;``

#### Prepare the live repository

Use the following steps to prepare the live repository:

1. Open a live repository in online mode by using the OBIEE 12.2.1
   Administration Tool on Windows 2012 R2. You can execute this step in
   offline mode as well.

2. Create a physical data source. For example:

   ``XSACache``

3. Create a physical schema under the physical data source thatyou just
   created in the previous step. For example:

   ``XSA_CACHE``

4. Create a connection pool for the physical data source. For example:

   ``CP``

5. Add ``Connect String``, ``User Name``, and ``Password`` for the schema
   that you created in step 3. For example:

   ``Connect String =``
   ``"DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=hostname)(PORT=xxxx))``
   ``(CONNECT_DATA=(SERVER=DEDICATED)(SID= xxxx)))"``
   ``User Name = "XSA_CACHE"``
   ``Password = "welcome1"``

6. Check in the online changes and save the online repository, or save the
   offline repository. Don’t do the consistency check.

#### Validate the XSA cache setup

Use the following steps to validate the XSA cache setup:

1. Open the ``obis1-diagnostic.log`` file located at
   ``<ORACLE_HOME>/user_projects/domains/bi/server/obis1/logs``.

2. Search for the keywords ``External Subject Area Cache``.

   If the configuration is correct, you should see following lines:

   ``[2017-01-13T12:30:39.123-08:00] [OBIS] [NOTIFICATION:1] [] [] [ecid: ]``
   ``[sik:ssi] [tid: 69cc1720] [101001]``
   ``External Subject Area cache is started successfully using``
   ``configuration from the repository with the logical name ssi.``
   ``[2017-01-13T12:30:39.123-08:00] [OBIS] [NOTIFICATION:1] [] [] [ecid: ]``
   ``[sik:ssi] [tid: 69cc1720] [101017]``
   ``External Subject Area cache has been initialized. Total number of``
   ``entries: 0 Used space: 0 bytes Maximum``
   ``space: 107374182400 bytes Remaining space: 107374182400 bytes. Cache``
   ``table name prefix is XC3561241260.``
