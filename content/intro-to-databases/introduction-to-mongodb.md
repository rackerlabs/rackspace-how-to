---
permalink: introduction-to-mongodb/
audit_date: '2018-03-21'
title: 'Introduction to MongoDB'
type: article
created_date: '2018-02-27'
created_by: Kate Dougherty
last_modified_date: '2018-03-21'
last_modified_by: Kate Dougherty
product: Database Services
product_url: https://www.rackspace.com/dba-services
---

MongoDB is an open-source NoSQL database. MongoDB stores data in JSON-like documents that can vary in structure. Because MongoDB uses dynamic schemas, users can create records without defining the data structure first.

MongoDB stores related information together, which enables queries to process more quickly. To retrieve information, users leverage the MongoDB query language.

### Terminology and concepts

Many concepts in MongoDB have close analogs to concepts in relational databases such as Oracle Database. The following table compares the basic concepts in these systems:

| MongoDB                     | Oracle Database |
| --------------------------- | --------------- |
| Collection                  | Table           |
| Document                    | Row             |
| Field                       | Column          |
| Embedded documents, linking | Joins           |

### Feature comparison

The following table compares the features of MongoDB with the features of Oracle Database:

| Feature              | MongoDB | Oracle Database |
| -------------------- | ------- | --------------- |
| Rich data model      | Yes     | No              |
| Dynamic schema       | Yes     | No              |
| Typed data           | Yes     | Yes             |
| Data locality        | Yes     | No              |
| Field updates        | Yes     | Yes             |
| Easy for programmers | Yes     | No              |

### Query language

Both MongoDB and Oracle Database have their own rich query language. However, there are some differences between them. To handle advanced queries, Oracle Database supports procedures and functions for manipulating the data returned from the SELECT statement. In contrast, MongoDB uses callback functions for advanced queries. The mongo shell uses the JavaScript programming language to run these functions.

### Are MongoDB and Oracle Database used together?

Yes. There are many examples of hybrid deployments of MongoDB and Oracle Database, particularly among ecommerce applications. The flexible data model that MongoDB uses is a good fit for product catalogs, which typically include multiple products with different attributes. However, Oracle Database is generally used for checkout systems, which require complex transactions.

Oracle Database is better suited to handle such transactions because it uses ACID as its integrity model. This model gives Oracle Database integrity features that MongoDB doesn't offer, such as isolation, referential integrity, and revision control.

In other cases, new business requirements push organizations to adopt MongoDB so that they can incorporate next-generation components into their applications. For example, both MongoDB and Oracle Database use conditional entry updates, composite keys, Unicode characters, and full-text search. However, MongoDB also has a built-in map-reduce function for aggregating large amounts of data.

### Next step

[Introduction to Cassandra](/how-to/introduction-to-cassandra/)
