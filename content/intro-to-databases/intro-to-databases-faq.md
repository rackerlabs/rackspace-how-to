---
permalink: intro-to-databases-faq/
audit_date: '2018-04-06'
title: Introduction to databases FAQ
type: article
created_date: '2018-02-27'
created_by: Satyakam Mishra
last_modified_date: '2018-04-09'
last_modified_by: Kate Dougherty
product: Database Services
product_url: https://www.rackspace.com/dba-services
---

### NoSQL databases

#### Are NoSQL databases secure, reliable, and scalable?

NoSQL databases offer greater scalability and higher performance than
relational databases. In addition, the data model that NoSQL databases use
addresses several issues that the relational model is not designed to address.
For example, NoSQL databases are able to store semi-unstructured and
unstructured data.

However, in order to support reliability and security, developers must
implement their own code, which makes NoSQL systems more complex. This
complexity limits the number of applications that can rely on NoSQL databases
for secure and reliable transactions.

#### Can NoSQL databases be used for all types of applications?

NoSQL databases are well-suited for applications in social media, analytics,
and big data. However, relational databases are still preferable for
applications that require ACID (Atomicity, Consistency, Isolation, Durability)
transactions, such as banking applications.

#### What kind of data security, backup, and recovery work is required with NoSQL databases, including database tuning and monitoring?

Because NoSQL databases are decentralized, most have their own automatic
backup and recovery processes. By fine-tuning certain database elements such
as index use, query structure, data models, system configuration (such as
hardware and operating system settings), and application design, you can significantly impact the overall performance of your application.

#### How do I create databases and objects and read and write data without SQL?

NoSQL databases are designed to enable the insertion of data without a
predefined schema. Every NoSQL database has a unique way of creating databases
and objects. While few NoSQL databases use query languages to build the
database and read and write the data, some enable users to perform these tasks
by using Java or Python scripting.

### Rackspace Managed Database Services

#### Does Rackspace tune my database?

Yes, based on the service level agreement (SLA), Rackspace tunes your database.

#### What is the cost for Managed Database Services?

For full pricing information for Managed Database Services, see the <Managed Servers Pricing Page>.

#### What is included with Managed Database Services?

Managed Database Services offers varying levels of support. The level of
support that is included depends on your SLA.

The Managed Databases team maintains the availability and security of your
database in accordance with your SLA. Based on the SLA, we regularly back up
your database and also perform required patches at regular intervals. The
Managed Operations team proactively monitors and responds to alerts.

#### How do I contact the Managed Operations team?

You can contact the Managed Operations team by submitting a ticket or chat
request through the [Cloud Control Panel](https://mycloud.rackspace.com/), or by calling 1 800 961 4454.
