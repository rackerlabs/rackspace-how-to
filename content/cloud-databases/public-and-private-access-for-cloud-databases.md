---
permalink: public-and-private-access-for-cloud-databases/
audit_date:
title: Public and Private Access for Cloud Databases
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-06'
last_modified_by: Cat Lookabaugh
product: Cloud Databases
product_url: cloud-databases
---

Cloud Databases provides several options for connecting to your
database, giving you complete flexibility in how you access your
database. For increased security, your database is available on the
Rackspace private network by default. However, you can connect to your
Cloud Database using any of the following methods:

-   **Connect using the database Hostname string (private access within
    the same Rackspace region)**

If you have additional Rackspace cloud resources, such as Cloud Servers,
Cloud Sites, and Cloud Load Balancers, you can create a private
connection from these resources to your database using the database
Hostname string. To use this connection method, the resources must be
located in the same region. This connection method does not incur
bandwidth charges. Keep this in mind when choosing a region for Cloud
Servers, Cloud Load Balancers, and Cloud Databases.

-   **Connect using an ssh tunnel (public access)**

You can create a secure connection to a Cloud Server using an ssh
tunnel. Once you're connected to your server, you can use the MySQL
client, or a similar tool, to manage your database. This method lets you
connect external, non-Rackspace resources to your Cloud Database.

-   **Connect using a Cloud Load Balancer (public access)**

This connection method places a Cloud Load Balancer in front of your
database and provides public access to your database. If the load
balancer and database are in the same region, no bandwidth charges are
incurred for this connection. Any data sent outside of the data center
incurs normal bandwidth charges.

Here's a visual representation of how you connect to your Cloud
Database. Choose the connection method that works best for your
implementation.

![Accessing a Cloud
Database](http://c691244.r44.cf2.rackcdn.com/cloud-databases-network-illustration-rev2.png)

### Related Information

[Connecting to Your Cloud
Database](/how-to/connect-to-a-cloud-databases-instance "Connecting to Your Cloud Database")

