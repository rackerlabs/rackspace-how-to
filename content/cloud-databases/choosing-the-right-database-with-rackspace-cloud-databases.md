---
permalink: choosing-the-right-database-with-rackspace-cloud-databases/
audit_date:
title: Choosing the right database with Rackspace Cloud Databases
type: article
created_date: '2014-07-16'
created_by: Ross Diaz
last_modified_date: '2018-04-23'
last_modified_by: Kate Dougherty
product: Cloud Databases
product_url: cloud-databases
---

Cloud Databases supports MySQL 5.1 and 5.6, Percona 5.6, and MariaDB 10 and
10.1. This article highlights some key aspects to consider when
deciding which MySQL-based datastore best fits your application.

### MySQL overview

MySQL is an open-source database developed by Oracle, and the recommended
choice of the MySQL database administrator community. MySQL is a good fit
for customers who are concerned about maintaining compatibility with upstream,
and who prefer a quick release schedule for upstream updates. For more information, see
the [MySQL documentation](http://dev.mysql.com).

### Benefit of using MySQL

MySQL offers the following benefits:

-   Upstream is controlled by Oracle.

### MySQL limitations

MySQL has the following limitations:

-   Bug fixes are delayed behind forks that might have already been resolved
    by community patches.

### Percona Server overview

Percona Server is a good solution for customers who want improved
performance right out of the box and want to maintain close (but not
exact) compatibility with the upstream source. It has many optimizer
improvements when compared to the upstream MySQL. Percona Server
includes XtraDB, a drop-in replacement for InnoDB with many
optimizations that improve performance on multi-core systems. For more
information, see the [Percona Server
documentation](http://www.percona.com/software/percona-server).

### Benefits of using Percona Server

Percona Server offers the following benefits:

-   Drop-in replacement for MySQL.

-   Remerges with the upstream source code after each new MySQL release to
    maintain compatibility.

-   Includes community patching.

-   Improved performance on multi-processor systems.

-   Improved query optimizer.

-   Increased log verbosity options, status and performance counters,
    and increased `INFORMATION_SCHEMA` content.

-   Thread pool option without the need for Enterprise MySQL.

### Percona Server limitations

Percona Server has the following limitations:

-   After using features that are specific to Percona, you might not be able to
    directly roll back the database.

### MariaDB overview

MariaDB was developed by many of the original developers of MySQL and aims to
maintain compatibility with MySQL. It offers the best performance and features
out of the box. MariaDB is a good database choice for customers who are less
concerned with maintaining direct compatibility with upstream. For example, it
does not merge with code provided by upstream, but attempts to re-implement
features as they are released, if they were not already provided. MariaDB
offers the best optimizer performance of all three solutions and has the
largest selection of storage engines by default. For more information, see the
[MariaDB documentation](https://mariadb.org/en/about/).

### Benefits of using MariaDB

MariaDB offers the following benefits:

-   Drop-in replacement for MySQL.

-   Re-implements features as they are released by Oracle.

-   Fork of MySQL with many new features and a long-term goal to
    maintain binary compatibility.

-   Includes community patching.

-   Improved performance on multiprocessor systems.

-   Improved query optimizer.

-   Increased log verbosity options, status and performance counters,
    and increased `INFORMATION_SCHEMA` content.

-   Thread pool option without the need for Enterprise MySQL.

-   Increased quantity of storage engines by default.

### MariaDB limitations

MariaDB has the following limitations:

-   After using features that are specific to MariaDB, you might not be able to
    directly roll back the database.

-   While MariaDB started from MySQL upstream, much of the MySQL source code
    has been [directly
    modified](https://mariadb.com/kb/en/library/incompatibilities-and-feature-differences-between-mariadb-102-and-mysql-57/).

-   Upstream bugs aren't already resolved in all cases. You might need to wait
    for re-implementation of the patch.
