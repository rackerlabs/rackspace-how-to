---
node_id: 1869
title: Using Cloud Databases with your Cloud Site
type: article
created_date: '2012-08-01'
created_by: Chris Farmer
last_modified_date: '2014-11-13'
last_modified_by: David Hendler
product: Cloud Sites
product_url: cloud-sites
---

Cloud Databases is part of the Cloud Control Panel. One of the
advantages of Cloud Databases is that it makes it easier to provision
your MySQL instance, add databases, and effectively manage your users.
This also includes the security and performance benefits of having your
own dedicated database instance. Another big plus is how easy it is to
connect to your Cloud Database from Cloud Sites.

### Creating A Cloud Database

1. First thing we'll do is login to the [Cloud Control Panel](https://mycloud.rackspace.com) and select
**Databases** at the top.

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/6.png)

2. Next, select the **Create MySQL Instance** option and you'll then be
taken to the **Create MySQL Instance** screen. Fill out the fields with
your desired specifications to creating your Database and then select
**Create Instance** when finished.

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/2_0.png)

  **Note**: We recommend creating your Database in the same region as your
Cloud Site. You can find out the location of your Cloud Site by looking
for **ORD** or **DFW** in the testing link for your Cloud Site.

3. Your database will then begin the process of building. Once complete,
you'll see your status go from an Orange color to a green which
indicates it's active. Selecting your Instance will display all
information relating to that particular Instance.

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/4_0.png)

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/15.png)

### Working with your MySQL instance

There are a different ways on how you can work with and manage your
MySQL instance. If you happen to have a Cloud Server in the same region
as your Cloud Database, you can connect to it using an SSH session on a
Linux box, installing your favorite database management software, or by
installing a phpMyAdmin on your Cloud Site and use that to connect and
manage your database instance. The steps below will focus on using a
database management interface on your local machine (MySQL Workbench).
Let's get started!

1. In order to access your instance from your local workstation, let's
create a Load Balancer. This will allow you to have a public IP address
against your instance. The first thing you'll do is log in to the [Cloud Control Panel](https://mycloud.rackspace.com) and select **Networking > Load
Balancers** at the top.

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/13.png)

2. Next, select **Create A Load Balancer** and fill out the fields with
your desired specifications. When you approach the **Add Nodes**
section, select **Add External Node** and in the **IP or
Hostname** field, enter in the Hostname of the Cloud Database Instance
we just created and then select **Create Load Balancer**.

  **Note:** You can grab the hostname of your Instance by selecting the
Instance name in the Databases section.

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/9.png)

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/16.png)

3. Once your Load Balancer is created (Active), select the Load Balancer
and you may then grab the public IP address to create a new connection.
Plug the IP address into the Hostname field in MySQL Workbench, your
database credentials, and also the standard port (**3306**) in the port
field.

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/14.png)

4. Connect your MySQL workbench by selecting OK and you can then import
your database, edit user permissions, etc.

### Using your MySQL instance on your Cloud Site

In this last section, we're going to use Wordpress as an example;
however, the same concept applies to any CMS or application on your
website. All you need to do is plug in your database name, user name,
and your database host (this will be your MySQL instance hostname, not
your load balancer IP address, you do not need a load balancer to
connect to your database from your website) and you're good to go!

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/8.png)

There you have it! You've created a MySQL instance and database using
Cloud Databases, a Load Balancer to connect and manage your database,
and have connected that dedicated database to your Cloud Sites
application.

**Note:** Cloud Sites will continue to offer the current shared MySQL
databases for you to consume, so you are not required to use Cloud
Databases. However, should you find that you need more dedicated
performance, security, and database management features, we highly
recommend using Cloud Databases to meet your DB needs. You can feel free
to consume both shared Cloud Sites databases as well as Cloud databases
as your hosting needs change. Please remember that all management and
updates to your Cloud Databases must be done via the Cloud Control Panel,
and will not be integrated into the Cloud Sites Control Panel. This is
intentional, so you have access to the latest features when they go live
in the Cloud Control Panel.
