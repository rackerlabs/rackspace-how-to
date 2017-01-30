---
permalink: use-cloud-databases-with-your-cloud-site/
audit_date:
title: Use Cloud Databases with Cloud Sites
type: article
created_date: '2012-08-01'
created_by: Chris Farmer
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

Cloud Databases is part of the Rackspace Public Cloud and is available through the Cloud Control Panel. Cloud Databases makes it easy to provision your MySQL instances, add databases, and effectively manage your users, and provides the security and performance benefits of having your own dedicated database instance.

Another advantage of using Cloud Databases is the ease with which you can connect to a database instance from Cloud Sites.

### Create a cloud database

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2. At the top of the panel, select **Databases > MySQL**.
3. Click **Create Single Instance**.
 4. On the **Create Instance** page, complete the fields with
your required specifications to create your instance, and then click
**Create Single Instance**.

   **Note**: We recommend that you create your instance in the same region as your
   Cloud Sites website. You can find the location of your website by looking
   for **ord** or **dfw** in the testing link for your site.

5. When the instance status changes to green, indicating that the instance is active, select the instance to display all
information about the instance.

### Work with your MySQL instance

There are a few different ways to work with and manage your
MySQL instance.
 - If you happen to have a cloud server in the same region
   as your database instance, you can connect to your instance by using an SSH
   session on a Linux machine.
 - You can install and use database management software on your local machine.
 - You can install phpMyAdmin on your site and use that to connect and manage
   your database instance.

The  following steps describe how to use a database management interface, MySQL
Workbench, on your local machine. To access your instance from your local
machine, you must create a load balancer, which enables you to have a public
IP address for your instance.

1. Install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/).
2. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
3. At the top of the panel, select **Networking > Load Balancers**.
4. Click **Create Load Balancer** and complete the fields in the
   **Identification** and **Configuration** sections with your required
   specifications. In the **Add Nodes** section, perform the following steps:
  1. Click **Add External Node**.
  2. In the pop-up dialog box, select **Hostname** in the **Type** menu.
  3. In the **Hostname** field, enter the hostname of the MySQL instance that
     you just created. You can copy the hostname of your instance by selecting
     the instance name in the Databases section of the control panel.

5. Click **Create Load Balancer**.
6. After the load balancer is created (active), select it in the Cloud Load
   Balancers list.
7. Copy the public IP address to create a new connection.
8. Open MySQL Workbench, and past the IP address in the **Hostname** field.
   Also, enter your database credentials and the standard port (**3306**).
9. Click **OK** to connect your MySQL workbench to your instance.
10. Import your database, edit user permisions, and so on.

### Use your MySQL instance with your website

In this section, WordPress is used as an example, but the same concept applies
to any CMS or application on your website.

When prompted for database information in WordPress, enter the database name,
your database username, and the database host, which is your MySQL instance
hostname, not your load balancer IP address, (you do not need a load balancer
to connect to your database from your website).

That completes the set up process. You've now created a MySQL instance and
database using Cloud Databases, created a load balancer to enable you to
connect to and manage your database, and connected that dedicated database to
your Cloud Sites application.

**Note**: Although Cloud Sites offers the current shared MySQL
databases for you to consume, you are not required to use Cloud
Databases. You can consume both shared Cloud Sites databases and cloud
databases as your hosting needs change.

**Note**: All management and updates to your cloud databases must be done
via the Cloud Control Panel, and will not be integrated into the Cloud Sites
Control Panel. This is intentional, so you have access to the latest features
when they go live in the Cloud Control Panel.
