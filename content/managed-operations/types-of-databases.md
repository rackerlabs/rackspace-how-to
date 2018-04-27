---
permalink: types-of-databases/
audit_date: '2018-03-20'
title: 'Types of databases'
type: article
created_date: '2018-02-27'
created_by: Satyakam Mishra
last_modified_date: '2018-04-23'
last_modified_by: Kate Dougherty
product: Managed Operations
product_url: managed-operations
---

There are two main types of databases: SQL and NoSQL. They are traditionally
known as relational and non-relational databases, respectively. They differ in
how they are built, the types of information they store, and how they store
that information.

### Relational databases

A relational database is a database that enables related data to be stored
across multiple tables and linked by establishing a relationship between the
tables. A relational database management system (RDBMS) is a database
management system (DBMS) that is based on this relational model.

All RDBMSs must satisfy ACID properties (atomicity, consistency, isolation, and
durability). This requirement provides an efficient way to store data because
it enables you to enter data once, and then reference it from elsewhere in the
database.

The relationships between data sets are classified as follows:

- One-to-one: One table record relates to one record in another table.
- One-to-many: One table record relates to many records in another table.
- Many-to-one: More than one table record relates to one table record in
  another table.
- Many-to-many: More than one table record relates to more than one record in
  another table.

### Non-relational databases

The term NoSQL refers to databases that do not follow traditional RDBMS
principles. NoSQL is an open source database technology designed to handle big
data. It was developed by Amazon, Google, LinkedIn, Twitter, and similar
companies as they looked for ways to handle unprecedented data volumes and
operation volumes under tight latency constraints.

NoSQL databases are designed to overcome the limitations of transactional
databases. NoSQL databases handle structured data, semi-structured data, and
unstructured data. Unstructured data can include sensor data, information on
social sharing, personal settings, photos, location-based information, online
activity, usage metrics, and other data. NoSQL databases can store
semi-structured and unstructured data as documents in JSON or XML format.
These types of NoSQL databases are referred to as _document-oriented
databases_. However, there are also NoSQL _graph databases_ that store
information about networks, such as professional or social connections.   

NoSQL can process unstructured big data very quickly. Analyzing high-volume,
real-time data such as website clickstreams can yield significant business
advantages.

### Next step

[Properties of RDBMSs and NoSQL databases](/how-to/properties-of-rdbmss-and-nosql-databases/)
