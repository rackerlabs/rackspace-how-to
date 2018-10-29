---
permalink: provisioning-cloud-resources-when-migrating-from-amazon-web-services/
audit_date: '2017-10-24'
title: Provision cloud resources when migrating from Amazon Web Services
type: article
created_date: '2013-07-02'
created_by: Rackspace Support
last_modified_date: '2018-10-25'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [High-level steps for migrating from Amazon Web Services](/how-to/high-level-steps-for-migrating-from-amazon-web-services)

This article describes how to provision your Rackspace Cloud services when
migrating from Amazon Web Services (AWS).

### Provision a new Cloud Server

Use the following instructions to provision a new Cloud Server:

1. Log in to the [Rackspace Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Servers > Cloud Servers**.

4. On the **Servers** page, click **Create Server**.

5. Name the server and select a region for it.

6. Select an OS that matches your OS from AWS.

7. Select the size (flavor) that matches your EC2 instance (RAM and disk space),
   and click **Create Server**.

   For information about instance size mapping, see
   [Mapping of Amazon Web Services resources to Rackspace resources](/how-to/mapping-of-amazon-web-services-resources-to-rackspace-resources).

   **Note**: You can add more storage to your cloud server after it is created
   by adding a Cloud Block Storage volume. For instructions, see
   [add a Cloud Block Storage volume](#add-a-cloud-block-storage-volume).

8. When your root admin password is displayed, copy the password to a secure
   location and then click **Dismiss Password**.

    **Note**: It is important that you copy and save your root admin password
    for future reference. You need this password to log in to your server. After
    you click **Dismiss Password**, the password will not be displayed again.

### Create a custom password (optional)

Use the following instructions to create a custom password for your server:

1. In the top navigation bar of the Cloud Control Panel, click **Servers**.

2. Click the gear icon next to the server in the server list and select
**Change Password**.

3. Enter a new password and click **Change Password**.

### Add a Cloud Block Storage volume (optional)

If you had additional Amazon Elastic Book Store (EBS) volumes attached to your
server, or if you prefer to have more storage space for your server, add
additional Cloud Block Storage volumes as follows:

1. In the top navigation bar of the Cloud Control Panel, click **Servers**, and
then chose your server from the list.

2. In the **Storage Volumes** section, click **Create Volume**.

3. Name the volume, select its type (SATA or SSD), and select the size.

4. Click **Create Volume**.

    <img alt="" height="349" src="{% asset_path cloud-servers/provisioning-cloud-resources-when-migrating-from-amazon-web-services/Step%201-3.png %}" width="543" />

### Create a Cloud Files container (optional)

If you plan to use a Cloud Files container for the application to back up files
or to assist with your application migration, create your container now.

1. In the top navigation bar of the Cloud Control Panel, select
**Storage > Object Storage and CDN > Files**.

2. On the **Cloud Files/Containers** page, click **Create Container**.

3. Name the container, assign it to the same region as the server that you created, and select the container type.

4. Click **Create Container**.

### Create a Cloud Databases instance (optional)

If you do not have your own database server, create a Cloud Databases instance.

1. In the top navigation bar of the Cloud Control Panel, select **Databases** ->
**MySQL Instance**.

2. Name the instance and assign it to the same region as your server.

3. Select the type of database instance (datastore), and specify its size (in
RAM and disk space).

4. *(Optional)* Add your first database by assigning it a name, user name, and password.

    **Note:** You cannot name your user as root.

5. Click **Create Single Instance**.

### Connect to the Cloud Server

1. In the top navigation bar of the Cloud Control Panel, click **Servers**, and
then chose your server from the list.

2. Under **Networks**, note the **PublicNet (Internet) IPv4** address.

3. Using SSH, connect to your Cloud Server by using the following command and
the PublicNet address:

        ssh root@<ipAddress>

    If you're connecting from a Windows computer,
    [use PuTTY](/how-to/connecting-to-linux-from-windows-by-using-putty) or a
    similar `SSH` command to connect to your server's IP address.

4. Enter your root password to log on.

### Next steps

After your Rackspace Cloud services are provisioned, you can build your
applications and transfer your data from AWS. The following articles provide
detailed descriptions of migration scenarios:

- [Migrate an application built on a LAMP stack from Amazon Web Services](/how-to/migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services)
- [Migrate a .NET application from Amazon Web Services](/how-to/migrating-a-net-application-from-amazon-web-services)
- [Migrate a Java web application from Amazon Web Services](/how-to/migrating-a-java-web-application-from-amazon-web-services)
- [Migrate an application based on Backbone.js, Node.js, and MongoDB from Amazon Web Services](/how-to/migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services)
