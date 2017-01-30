---
permalink: mysql-engines-myisam-vs-innodb/
audit_date:
title: MySQL Engines - MyISAM vs Innodb
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

MySQL supports several different types of *table engines*, also known as *table types*. A database's tables can be a mix of different table engine types or all the same type. The [MySQL documentation](http://dev.mysql.com/doc/refman/5.0/en/storage-engines.html) provides more information about each of the types of table engines that MySQL offers.

The two most commonly used table engines on [Cloud Sites MySQL servers](http://www.rackspace.com/cloud/sites/web-hosting/mysql/) are Innodb and MyISAM.

The purpose of this article is to briefly describe these two types and identify which ones are recommended under certain circumstances in the Cloud Sites environment. This article does *not* compare the performance of the two engine types via running specific SQL test benchmarks. If you are interested such comparisons, see the following links:

- [http://www.mysqlperformanceblog.com/2007/01/08/innodb-vs-myisam-vs-falcon-benchmarks-part-1/](http://www.mysqlperformanceblog.com/2007/01/08/innodb-vs-myisam-vs-falcon-benchmarks-part-1/)

- [http://tag1consulting.com/MySQL\_Engines\_MyISAM\_vs\_InnoDB\#comment-115](http://tag1consulting.com/MySQL_Engines_MyISAM_vs_InnoDB#comment-115)

MyISAM is the default table engine type for MySQL 5.0, but the Cloud Sites environment defaults the storage engine to Innodb. In other words, Cloud Sites is partial to Innodb if you do not explicitly specify your engine type in your table DDL. The database servers have also been tuned to generally perform better when using the Innodb engine type.

### MyISAM versus Innodb

The following table provides a brief comparison of the engine types. The abbreviation ACID stands for Atomicity, Consistency, Isolation, Durability.

MyISAM | Innodb
--- | ---
Not ACID-compliant and non-transactional | ACID-compliant and hence fully transactional with ROLLBACK and COMMIT and support for Foreign Keys
MySQL 5.0 default engine | Rackspace Cloud default engine
Offers compression | Offers compression
Requires full repair and rebuild of indexes and tables | Provides automatic recovery from crashes via the replay of logs
Changed database pages written to disk instantly | Dirty pages converted from random to sequential before commit and flush to disk
No ordering in storage of data | Row data stored in pages in PK order
Table-level locking | Row-level locking

If you want more details about each of these engine types, see the following MySQL documentation:

-   Innodb Storage Engine:
    [http://dev.mysql.com/doc/refman/5.0/en/innodb-storage-engine.html](http://dev.mysql.com/doc/refman/5.0/en/innodb-storage-engine.html)
-   MyISAM Storage Engine:
    [http://dev.mysql.com/doc/refman/5.0/en/myisam-storage-engine.html](http://dev.mysql.com/doc/refman/5.0/en/myisam-storage-engine.html)

### When MyISAM tables are mostly useful

There can be several other reasons that fit your requirement for choosing the MyISAM engine. For example, reads can be faster on MyISAM, despite the general claims in the MySQL documentation, when a MyISAM table has a fixed (not dynamic) row size, for example, when it uses more CHARs then VARCHARs. Another reason why you might choose MyISAM over Innodb is because Innodb must perform additional checks because of ACID compliancy. For example, a FK check must be performed, which could potentially cause an operational overhead.

#### When the conversion of the table engine from MyISAM to Innodb is most beneficial

- If you need ACID compliance and need your database to be transactional.
- If you are not disproportionately read-only heavy and are doing a mix of reads (not requiring full text indexing) and writes.
- If you face frequent table lock escalations for long periods of time.
- If a read is slow or hasn't completed, and a read-write is waiting on the first read to finish. In such cases, the MyISAM table referenced in the read is held in a locked state till the result set is made available to the query. This also causes a rise in the load average on the server and slows your site down. During this time no reads or writes can complete because MyISAM only has table-level locking.

To summarize, the queries that are victims of lock escalations under heavy but slow reads would do much better as a table converted to Innodb.

### Change your table engine type from MyISAM to Innodb

You do so by simply issuing the `ALTER TABLE` DDL statement:

    ALTER TABLE tableName ENGINE=INNODB;

Following is a step-by-step process for altering a table in PHPMyAdmin.

1. Log in to the PHPMyAdmin utility through your Control Panel. If you are unsure how, see [Working with a MySQL database](/how-to/rackspace-cloud-sites-essentials-phpmyadmin-database-management-interface).
2. Select the database that contains the table.
3. Click the **SQL** tab.
4. Paste in the preceding query. Be sure to replace `tableName` with the correct name of your table.
5. Click **GO**.

**Note:** A MyISAM table that is using full-text indexing can't be converted to an Innodb table engine type.
