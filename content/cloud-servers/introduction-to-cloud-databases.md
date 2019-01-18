---
permalink: introduction-to-cloud-databases
audit_date:
title: Introduction to Cloud Databases
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

### What is it? 

Maintaining a high level of performance for databases in a shared environment can be challenging. Cloud Databases helps you architect around some of these challenges by providing a container-based solution for running relational databases on the Openstack platform. In addition to offering a data redundant platform for MySQL, Cloud Databases also takes care of the patching and maintenance of your databases. 
How do I use it? 

Cloud Databases is an option anytime you need to run a MySQL database in the cloud. You can deploy a new instance by first clicking on “Databases” in the product menu across the top of your control panel, and then click on “Create MySQL Instance” 
This creates an instance of Cloud Database, which is a single-tenant container that is associated with your account to host relational databases. You can host multiple databases within a single instance (container).
To create your instance of Cloud Databases you need to provide the following information:
* Instance Name
* Flavor (RAM)
* Instance Size (Disk) 
* Region
There is an option of creating a new database at the time the Cloud Database container is created by adding the following information. 

 

### Frequently Ask Questions

**Q: How much does Cloud Databases cost?**
Pricing information is available at the Cloud Databases pricing page. pricing page. Standard charges will apply for any Cloud Servers, Cloud Load Balancers, and/or Cloud Sites that are used to access your Cloud Database instances. 

**Q: Do you support importing and exporting data into the database?**
You can use standard MySQL client tools to import and export data to your instance.  Knowledge Center articles are available that walk through the processes of importing or exporting data.

**Q: Do you support backups and/or restores?**
We currently support manual backups and restores via the Cloud Databases API and the Trove command line tool (CLI). Control Panel support for Backups is coming in a future release.  While our service provides built-in data replication, as a best practice, we encourage our Cloud customers to back up their data. Customers who can't use the API for backups can perform manual backups of their data using MySQL client tools such as mysqldump. Customers with a Managed Cloud Service Level can request assistance with backups from their support team.

**Q: Do you support MySQL replication?**
Not at this time. We plan to support master/slave replication in a future release.

**Q: Do you support MySQL configuration (my.cnf) file modifications?**
We do not currently support modification to the my.cnf configuration. We plan to offer support for this in a future release.  Until this feature is supported requests for my.cnf changes (including via our support team) cannot be granted.

**Q: What level of access do I have to my database instance?**
We only allow access to MySQL over port 3306; shell-level access is not available. Full MySQL access can be obtained by enabling the root user on the database instance.

**Q: What are the benefits of using Cloud Databases?**
A database instance is beneficial for customers who want or need high performance and redundant storage, the ability to scale their instance and grow their storage as needed, or root level access for control of various MySQL settings and configurations.

**Q: What is the default storage engine?**
The default storage engine is InnoDB, but other storage engines included with MySQL 5.1, such as MyISAM, will also work for certain use cases.

**Q: Where can I find your documentation?**
Release notes, API documentation and a Getting Started Guide for Cloud Databases are all available on our API Documentation Site.

**Q: Can I create a Cloud Databases support ticket?**
Yes, a Cloud Databases support ticket category is available in the Cloud Control Panel.

**Q: What instance sizes do you currently support?**
Please reference the Cloud Databases website or the "List Flavors" section of the Cloud Databases API Developer Guide for the most up-to-date information on available instance sizes.

**Q: What is currently supported?**
Support coverage information is available at the Cloud Databases support matrix page.

**Q: Are there API and/or account (instance) limits?**
Yes. All accounts, by default, have a pre-configured set of thresholds (or limits) to manage capacity and prevent abuse of the system. The system recognizes two kinds of limits: rate limits and absolute limits. Rate limits are thresholds that are reset after a certain amount of time passes. Absolute limits are fixed at the account level. Please reference our API Developer Guide (in the Limits section) for the most up-to-date information on rate and absolute limits (which include instance and volume limits).

**Q: If my instance is unavailable, what happens to my data?**
If for some reason you are unable to access your Cloud Databases instance, your data is still protected on a redundant SAN.

**Q: What types of Rackspace products / accounts can use Cloud Databases?**
Any US or UK customer with a Cloud account will be able to provision multiple ServiceNet database instances, manage multiple databases and users (within resource limits). This service is also available to RackConnected Cloud Servers. Both First and Open Cloud Servers can connect to Cloud Databases, as well as any product with access to our internal ServiceNet network within the same regional datacenter.

**Q: How can I access my database instance?**
Cloud Databases provides several options for connecting to your database, giving you complete flexibility in how you access your database. For increased security, your database is only available on the Rackspace private network by default.  However, you can connect to your Cloud Database using several  methods described at the following links:

https://support.rackspace.com/how-to/public-and-private-access-for-cloud-databases/

https://support.rackspace.com/how-to/connect-to-a-cloud-databases-instance/

Additionally, you can use the Cloud Control Panel, API, or Command Line Tool (CLI) to manage your database instance. Some of the features are not available in the Control Panel but can be accessed through API or through the CLI.  More information on the API and CLI can be found in the Cloud Databases API documentation, in both the API Developers Guide and the Getting Started Guide.

**Q: Can I use the Cloud Databases even if I don't have Cloud Servers, Cloud Load Balancers, or Cloud Sites on my account?**
Technically, yes. However since instances are provisioned with only an internal network IP address, at least one Cloud Server would be needed in order to connect to your Cloud Database instance over our internal network (ServiceNet).

**Q: Can this service be used with Dedicated servers?**
No, the service is only available to customers with Cloud account credentials. Managed / Dedicated customers with Rack Connect (i.e. those customers who also have a Cloud account) have access, but can only use the service with/for their Rackspace Cloud product resources.

**Q: Is this available in the Control Panel?**
Yes, in the new Cloud Control Panel at https://mycloud.rackspace.com/. Cloud Databases is not available in the Cloud Sites Control Panel, but Cloud Sites customers can access Cloud Databases via the newer control panel. 
