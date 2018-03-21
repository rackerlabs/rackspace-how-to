---
permalink: types-of-databases/
audit_date:
title: 'Types of databases'
type: article
created_date: '2018-02-27'
created_by: Kate Dougherty
last_modified_date: '2018-03-20'
last_modified_by: Kate Dougherty
product: Database Services
product_url: https://www.rackspace.com/dba-services
---

There are two main types of databases: SQL and NoSQL. They are traditionally known as relational and non-relational databases, respectively. They differ in how they are built, the types of information they store, and how they store that information.

### Relational databases

A database, as a collection of information, can be organized so that a Database Management System can access and pull specific information. A Relational Database Management System (RDBMS) is a Database Management System (DBMS) based on the Relational model invented by Edgar F. Codd, of IBM's San Jose Research Laboratory fame.

A relational database is a database that enables related data to be stored across multiple tables and linked by establishing a relationship between the tables. All RDBMSs must satisfy the ACID properties. This requirement provides an efficient way to store data because you can enter data once, then reference it from elsewhere in the database.

Relational databases have the following characteristics:

- Values are atomic.
- Column values are of the same kind.
- No redundancy in data, each Row is Unique.
- The sequence of columns is insignificant.
- The sequence of rows is insignificant.
- Each column has a Unique Name.
- Consistency of data across multiple tables by using integrity constraints
- The relationship between data sets are classified as follows:
  - One-to-One: One table record relates to one record in another table.
  - One-to-Many: One table record relates to many records in another table.
  - Many-to-One: More than one table record relates to one table record in another table.
  - Many-to-Many: More than one table record relates to more than one record in another table.

#### NoSQL databases

The term NoSQL refers to databases that do not follow traditional RDBMS principles. NoSQL is an open source database technology designed to handle big data. It was developed by Amazon, Google, LinkedIn, Twitter, and similar companies as they looked for ways to handle unprecedented data volumes and operation volumes under tight latency constraints.

NoSQL databases are designed to overcome the limitations of transactional databases. NoSQL databases handle structured data, semi-structured data, and unstructured data. Unstructured data can include sensor data, information on social sharing, personal settings, photos, location-based information, online activity, usage metrics, and more. NoSQL databases store semi-structured and unstructured data as documents in JSON or XML format. For this reason, NoSQL databases are also referred to as _document-oriented databases_.

NoSQL can process unstructured big data very quickly. Analyzing high-volume, real-time data such as website clickstreams can provide significant business advantages.

### Next step

[Properties of RDBMS & NoSQL databases](how-to/properties-of-rdbms-&-nosql-databases/)
