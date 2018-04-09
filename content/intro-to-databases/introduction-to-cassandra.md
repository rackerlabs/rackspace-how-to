---
permalink: introduction-to-cassandra/
audit_date: '2018-03-21'
title: 'Introduction to Cassandra'
type: article
created_date: '2018-02-27'
created_by: Satyakam Mishra
last_modified_date: '2018-03-23'
last_modified_by: Kate Dougherty
product: Database Services
product_url: dba-services
---

Apache Cassandra is an open source, key-value NoSQL database. Cassandra is high-performing and horizontally scalable. It also offers operational simplicity.

Cassandra is fully distributed, with no single point of failure. Full distribution enables Cassandra to provide continuous availability. Cassandra uses a peer-to-peer distribution model that makes it easy to distribute data across multiple data centers and cloud availability zones.

Cassandra uses a partitioner, or partitioning key, to determine how data is distributed across the nodes that make up a database cluster. A partitioner is a hashing mechanism that takes a table row's primary key, computes a numerical token for it, and assigns it to one of the nodes in a cluster. While Cassandra has multiple partitioners from which to choose, the default partitioner is one that randomizes data across a cluster and ensures an even distribution of all of the data. In addition, Cassandra automatically maintains the balance of data across a cluster even when existing nodes are removed or new nodes are added to a system.

Cassandra is a good choice when you have a very large amount of data and consistency isn't a priority.

### Terminology and concepts

Many concepts in Cassandra have close analogs to concepts in relational databases such as Oracle Database. The following table compares the basic concepts in these systems:

| Cassandra   | Oracle Database |
| ----------- | --------------- |
| Keyspace    | Database/schema |
| Table       | Table           |
| Row         | Row             |
| Column      | Column          |
| Primary key | Primary key     |

### Feature comparison

The following table compares the features of Cassandra with the features of Oracle Database:

| Feature              | Cassandra | Oracle Database |
| -------------------- | --------- | --------------- |
| Rich data model      | Yes       | No              |
| Dynamic schema       | Yes       | No              |
| Typed data           | Yes       | Yes             |
| Data locality        | Yes       | No              |
| Field updates        | Yes       | Yes             |
| Easy for programmers | Yes       | No              |

### Query language

Both Cassandra and Oracle Database have their own rich query language. However, there are some differences between them. To handle advanced queries, Oracle Database supports procedures and functions for manipulating the data returned from the SELECT statement. In contrast, Cassandra uses the Cassandra Query Language (CQL). This language runs through the Cassandra shell, which is called cqlsh.

The following table provides a few examples of how CQL statements and SQL statements differ:

| Cassandra (CQL)                                                                                 | Oracle Database (SQL)                                                 |
|-------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| INSERT INTO users (first_name, last_name, display_name) <br />VALUES (‘Lebron’,‘James’,‘KingJames’); | INSERT INTO users (first_name, last_name, display_name) <br />VALUES ('Lebron', 'James', 'KingJames'); |
| SELECT * FROM users;                                                                            | SELECT * FROM users;                                                  |
| UPDATE users SET state = 'TX' <br />Where user_uuid=88b8fd18-b1ed-4e96-bf79-4280797cba80;             | UPDATE users SET status = 'C' <br />WHERE age > 25;                         |
Source: [Datastax. DSE 5.1 Administrator Guide](http://docs.datastax.com/en/dse/5.1/dse-admin/)

### Are Cassandra and Oracle Database used together?

Yes. There are many examples of hybrid deployments of Cassandra and Oracle Database. In some cases, new business requirements push organizations to adopt Cassandra so that they can incorporate next-generation components into their applications.

For example, both Cassandra and Oracle Database use conditional entry updates, composite keys, Unicode characters, and full text search. However, Cassandra also has auto-replication functions that automatically distribute and maintain data across a cluster. Replication in Cassandra is very straightforward and simple to configure and maintain.

While Oracle Database uses the ACID integrity model, Cassandra offers the AID portion of ACID, in which the data written is atomic, isolated, and durable. The AID model enables Cassandra users to decide exactly how strong data consistency should be for a transaction, or for a set of transactions that are batched together. Strength of data consistency refers to whether all nodes must respond, or if a single node responds while the others are being updated.

Cassandra users can tune data consistency within a single data center or across multiple data centers. However, Oracle Database offers integrity features that Cassandra doesn't offer, such as isolation, transactions, referential integrity, and revision control.  

Both Cassandra and Oracle Database are horizontally scalable and support data replication.

### Limitations of Cassandra

While there are several advantages to using Cassandra, there are also limitations that make Cassandra unsuitable for use as a general-purpose database. For example, because Cassandra doesn’t have built-in aggregation functionality, it does not group data by sum, min, or max. Any aggregations must be pre-computed and stored.

In addition, tables cannot be joined in Cassandra. Data must therefore be de-normalized before it is stored in the database.  

Finally, search is based on keys and indexes only. Cassandra does not support additional search clauses, additional conditions, or sorting on non-key fields.

### Next step

[Choosing between an RDBMS and NoSQL](/how-to/choosing-between-an-rdbms-and-nosql)
