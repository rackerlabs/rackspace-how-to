---
permalink: properties-of-rdbms-and-nosql-databases/
audit_date: '2018-03-20'
title: 'Properties of RDBMS and NoSQL databases'
type: article
created_date: '2018-02-27'
created_by: Satyakam Mishra
last_modified_date: '2018-03-23'
last_modified_by: Kate Dougherty
product: Database Services
product_url: https://www.rackspace.com/dba-services
---

This page presents the characteristics of RDBMS and NoSQL databases.

### Properties of relational databases

Relational databases are efficient systems. Because they are efficient, they're a common choice for storing financial records, logistical information, personnel data, and other information in new databases. Relational databases also frequently replace legacy hierarchical databases and network databases because they're easier to understand and use than NoSQL databases.

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

In NoSQL databases, the principles of ACID (atomicity, consistency, isolation, and durability) are reduced. In addition, the process of normalization is not mandatory in NoSQL. Due to the size and speed of modern data, it is preferable for NoSQL databases to be de-normalized.

NoSQL databases have the following properties:

- Higher scalability
- Distributed computing
- Lower cost
- Flexible schema
- Able to process unstructured and semi-structured data
- No complex relationships, such as the ones between tables in RDMS

The following table shows the types of non-relational databases and the features associated with them.

| Type                 | Performance | Scalability      | Flexibility | Complexity |
| -------------------- | ----------- | ---------------- | ----------- | ---------- |
| Key-value store      | High        | High             |   High      |  High       |
| Column store   | High        | High             | Moderate    | Low        |
| Document store | High        | Variable to high | High        |     Low        |
| Graph-based          | Variable    | Variable         | High        |    High       |

### Next step

[Reasons to use an SQL database](/how-to/reasons-to-use-an-sql-database/)
