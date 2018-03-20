---
permalink: article-title/
audit_date: '2018-03-20'
title: 'Properties of RDBMS and NoSQL databases'
type: article
created_date: '2018-02-27'
created_by: Kate Dougherty
last_modified_date: '2018-03-20'
last_modified_by: Kate Dougherty
product: Database Services
product_url: https://www.rackspace.com/dba-services
---

This page presents the characteristics of RDBMS and NoSQL databases.

### Properties of relational databases

Relational databases are efficient, which makes them a common choice for storing financial records, logistical information, personnel data, and other information in new databases. Relational databases frequently replace legacy hierarchical databases and network databases because they are easier to understand and use than NoSQL databases.

Relational databases have the following properties:

- Values are atomic
- All of the values in a column have the same data type
- Each row is unique
- The sequence of columns is insignificant
- The sequence of rows is insignificant
- Each column has a unique name
- Integrity constraints maintain consistent data across multiple tables

#### Properties of NoSQL databases

NoSQL is a schema-less alternative to SQL and RDBMS designed to store, process, and analyze extremely large amounts of unstructured data.

In NoSQL databases, the basic principle of ACID (atomicity, consistency, isolation, and durability) is reduced. In addition, the process of normalization is not mandatory in NoSQL. Due to size and speed of modern data, NoSQL databases prefer de-normalized databases.

- NoSQL databases have the following properties:
- Higher scalability
- Distributed computing
- Lower cost
- Flexible schema
- Able to process unstructured and semi-structured data
- No complex relationships, such as the ones between tables in RDMSs

### Next step

[Reasons to use a SQL database](/how-to/reasons-to-use-a-sql-database)
