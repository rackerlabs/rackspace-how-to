---
permalink: choosing-the-right-database-with-rackspace-cloud-databases/
audit_date:
title: Choosing the right database with Rackspace Cloud Databases
type: article
created_date: '2014-07-16'
created_by: Ross Diaz
last_modified_date: '2016-12-20'
last_modified_by: Steve Croce
product: Cloud Databases
product_url: cloud-databases
---

Cloud Databases supports MySQL 5.1 and 5.6, Percona 5.6, and MariaDB 10 and 10.1.
Innovation is happening in each of these communities, and this article
highlights some of the key aspects to consider when choosing a MySQL
based datastore that best fits your application.

### MySQL

MySQL, an open-source database developed by Oracle, is the recommended
choice of the MySQL database administrator community, and is a good fit
for customers concerned about maintaining compatibility with upstream,
and who prefer a quick release schedule for upstream updates. For more information, see
the [MySQL documentation](http://dev.mysql.com).

### Benefit

Upstream is controlled by Oracle.

### Limitation

Bug fixes are delayed behind forks that might have already been resolved
by community patches.

### Percona server

Percona Server is a good solution for customers who want improved
performance right out of the box and want to maintain close (but not
exact) compatibility with the upstream source. It has many optimizer
improvements when compared to the upstream MySQL. Percona Server
includes XtraDB, a drop-in replacement for InnoDB with many
optimizations that improve performance on multicore systems. For more
information, see the [Percona Server
documentation](http://www.percona.com/software/percona-server).

### Benefits

-   Drop-in replacement for MySQL

-   Remerges with upstream source code after each new MySQL release, to
    maintain compatibility

-   Includes community patching

-   Improved performance on multiprocessor systems

-   Improved query optimizer

-   Increased log verbosity options, status and performance counters,
    and increased `INFORMATION_SCHEMA` content

-   Thread pool option without the need for Enterprise MySQL

### Limitation

After using features specific to Percona, you might not be able to
directly roll back the database.

### MariaDB

MariaDB was developed by many of the original developers of MySQL, and
has a long-term goal of maintaining compatibility with MySQL. It is a
good database choice for customers who are less concerned with
maintaining direct compatibility with upstream, and it offers the best
performance and features out of the box. It does not merge with code
provided by upstream, but attempts to re-implement features as they are
released, if they were not already provided. MariaDB contains the best
optimizer performance of all three solutions and has the largest
selection of storage engines by default. For more information, see the
[MariaDB documentation](https://mariadb.org/en/about/).

### Benefits

-   Drop-in replacement for MySQL

-   Re-implements features as they are released by Oracle

-   Fork of MySQL with many new features and a long-term goal to
    maintain binary compatibility

-   Includes community patching

-   Improved performance on multiprocessor systems

-   Improved query optimizer

-   Increased log verbosity options, status and performance counters,
    and increased `INFORMATION_SCHEMA` content

-   Thread pool option without the need of Enterprise MySQL

-   Increased Quantity of Storage Engines by default

### Limitations

-   After using features specific to MariaDB, you might not be able to
    directly roll back the database

-   Started from MySQL upstream, but much of the MySQL source code has
    been directly modified

-   Inmany cases, upstream bugs are already resolved, but not in all
    cases and you might need to await re-implementation of the patch
