---
permalink: migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services/
audit_date:
title: Migrate an application built on a LAMP stack from Amazon Web Services
type: article
created_date: '2013-07-02'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
---

**Previous section:** [Provision cloud resources when migrating from Amazon Web Services](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)

This article describes the migration of WordPress or other LAMP stack
(Linux, Apache, MySQL, PHP) applications from Amazon Web Services (AWS)
to the Rackspace Cloud. It takes an estimated 15 minutes to complete, if
you follow the instructions step by step.

The topology of the application in this scenario is presented in
the following figure:

<img src="{% asset_path cloud-servers/migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services/4.1-1a.jpg %}" width="650" />

### Prerequisites

-   LAMP stack on AWS with root access or appropriate privileges
-   Valid and enabled account on Rackspace Cloud

### Preparation

-   Identify the resources to migrate, including application and
    database resources.
-   Create a list of all the necessary software packages that are
    installed on your EC2 instance other than the LAMP stack.
-   Create a list of all additional Amazon services that are being used
    in the application - for example, Simple Email Service (SES) for email
    or Relational Database Service (RDS) for databases.
-   If you have not already, [create a Cloud Server instance](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)
    and any supporting Rackspace Cloud services.

### Install software packages

After your [cloud server is set up](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services),
install your LAMP stack and application. In this scenario, WordPress is
the target application.

1.  Log in to your server.
2.  In a terminal, enter the following command:

        sudo tasksel

3.  To install the application stack, select **LAMP server**.

    <img src="{% asset_path cloud-servers/migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services/4.1-5.png %}" width="650" />

4.  After the LAMP stack is installed, download and configure WordPress.

        sudo apt-get update
        sudo apt-get install wordpress
        sudo ln -s /usr/share/wordpress /var/www/wordpress
        sudo bash /usr/share/doc/wordpress/examples/setup-mysql -n wordpress localhost
        sudo chown -R www-data /usr/share/wordpress

5.  *(Optional)* If you plan to use Cloud Files to transfer your data, install OpenStack swift.

    1. Install the swift client to enable access from your server.

            sudo apt-get install python-novaclient glance-client swift

    2. Set the necessary environment variables by running the following commands, substituting your Rackspace Cloud account username and API key:

            export ST_USER=<yourLoginUsername>
            export ST_KEY=<yourApiKey>
            export ST_AUTH=https://identity.api.rackspacecloud.com/v1.0/

        You might want to define these variables in **.bashrc** or **.bash_profile**, and then reload the file with the `source` command.

            source .bashrc

    3. Type `swift list` and ensure that you can see the container you've created to hold your data.

### Back up data from AWS to Rackspace Cloud Files

Retrieve your data from EC2. You can transfer the data directly via
rsync or sftp, or you can use the OpenStack swift client to transfer
your data to Cloud Files, and from there transfer to the cloud server.

To use Cloud Files, follow these preparatory steps (this example
uses an existing container named WordPress):

1.  Using SSH, connect to your EC2 instance.

        ssh -i yourPrivateKey.pem user@ec2-xxx-xxx-xxx-xxx.compute-1.amazonaws.com

2.  Perform a database dump and back up your application and any other
    resources needed by the application (including logs and other
    directories of interest).

        mysqldump -u<databaseUsername> -p --triggers --routines --databases wordpress | gzip > ~/staging/db/wordpress.sql.gz
        sudo tar cvzf ~/staging/app/wordpress.tar.gz /usr/share/wordpress/*
        sudo tar cvzf ~/staging/app/apachelogs.tar.gz /var/log/apache2/*

3.  If you are using Cloud Files to transfer your files, use one of the
    following methods to perform the transfer. If you will transfer
    directly via rsync or sftp, skip to the final section of this
    article after the transfer.

    -   Upload your archives to the Cloud Files container via the swift client.

            swift upload WordPress wordpress.sql.gz
            swift upload WordPress wordpress.tar.gz
            swift upload WordPress apachelogs.tar.gz

    -   Upload your data into Cloud Files through the Cloud Control Panel.

        1.  Open your container (**Cloud Control Panel > Storage > Files > *containerName***).

        2.  Click **Upload Files**.

        3.  Click **Browse** and select the files to upload.

            **Note:** When you click the **Browse** button, you can select multiple files.

        4.  After you have selected the file or files, click **Open** or **Select** (depending on the browser and system).

        5.  Click **Upload File**.

### Restore data from Cloud Files to the cloud server

If you uploaded your data to Cloud Files, transfer it to your cloud
server with the following steps:

1.  Using SSH, connect to the Cloud Servers instance by using the
    PublicNet URL and the root password.
2.  Install and configure the swift CLI as described in the "Install
    software packages" section.
3.  Ensure that you can execute the `swift list` command and see the new container
    that you created in the results.
4.  Download the database dump from the backup that you took in the
    "Back up data from AWS to Rackspace Cloud Files" section and restore
    it locally.

        swift download WordPress wordpress.sql.gz
        gunzip < wordpress.sql.gz | mysql -u <databaseUsername> -p

5.  Download the applications and data, and restore them.

        sudo service apache2 stop #stop apache server
        swift download WordPress wordpress.tar.gz
        # make a backup of your existing wordpress directory
        sudo tar cvzf wordpress-bak.tar.gz /usr/share/wordpress/*
        # restore downloaded WordPress archive
        sudo tar xvzf wordpress.tar.gz /usr/share/wordpress

### Test your application

Access your newly migrated WordPress instance by opening a browser and
typing `http://<cloudServerIPAddress>/wp-admin`.

### Next step

[Post-migration considerations when migrating from Amazon Web Services](/how-to/post-migration-considerations-when-migrating-from-amazon-web-services)

For other migration scenarios, see the following articles:

-   [Migrate a .NET application from Amazon Web Services](/how-to/migrating-a-net-application-from-amazon-web-services)
-   [Migratie a Java web application from Amazon Web Services](/how-to/migrating-a-java-web-application-from-amazon-web-services)
-   [Migrate an application based on Backbone.js, Node.js, and MongoDB from Amazon Web Services](/how-to/migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services)
