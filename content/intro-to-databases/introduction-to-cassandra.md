---
permalink: introduction-to-cassandra/
audit_date: '2018-03-21'
title: 'Introduction to Cassandra'
type: article
created_date: '2018-02-27'
created_by: Kate Dougherty
last_modified_date: '2018-03-21'
last_modified_by: Kate Dougherty
product: Database Services
product_url: https://www.rackspace.com/dba-services
---

Apache Cassandra is an open source, key-value NoSQL database. Cassandra is high-performing and horizontally scalable. It also offers operational simplicity.

Cassandra is fully distributed, with no single point of failure. Full distribution enables Cassandra to provide continuous availability. Cassandra uses a peer-to-peer distribution model that makes it easy to distribute data across multiple data centers and cloud availability zones.

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

Both Cassandra and Oracle Database have their own rich query language. However, there are some differences between them. To handle advanced queries, Oracle Database offers procedures for manipulating the data returned from the SELECT statement. In contrast, Cassandra uses the Cassandra Query Language (CQL). This language runs through the Cassandra shell, which is called cqlsh.

The following table provides a few examples of how CQL and SQL statements differ:

| Cassandra (CQL) | Oracle Database (SQL) |
| --- | --- |
| `INSERT INTO users (first_name, last_name, display_name) <br />VALUES (‘Lebron’,‘James’,‘KingJames’);` | `INSERT INTO users (user_id, age, status) <br />VALUES ('bcd001', 45, 'A');` |

### Next steps (optional)

[Types of databases](#)

### Related articles (optional)

Include any links to related content. Use a bulleted list if you have more than one link. For example:

- [Create an image from a server and restore a server from a saved image](/how-to/create-an-image-from-a-server-and-restore-a-server-from-a-saved-image)
- [About Cloud Server images](/how-to/about-cloud-server-images)
