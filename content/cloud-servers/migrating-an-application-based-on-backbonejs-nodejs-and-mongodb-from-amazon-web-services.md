---
permalink: migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services/
audit_date: '2018-10-04'
title: 'Migrate an application based on Backbone.js, Node.js, and MongoDB from Amazon Web Services'
type: article
created_date: '2013-07-02'
created_by: Rackspace Support
last_modified_date: '2018-11-06'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Provision cloud resources when migrating from Amazon Web Services](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)

This scenario shows you how to migrate a Backbone.js, Node.js, and
MongoDB&reg; application from Amazon Web Services (AWS) to the
Rackspace Cloud. It takes about 30 minutes to complete.

The following diagram shows the topology of the application:

<img src="{% asset_path cloud-servers/migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services/4.4-diagram.png %}" width="650" />

### Prerequisites

This scenario has the following prerequisites:

-   An application stack on AWS with root access or appropriate privileges
    for individual instances and services.
-   A valid and enabled account on Rackspace Cloud.

### Preparation

Complete the following steps before you start the scenario:

-   Identify the resources that you want to migrate, including application and
    database resources.
-   Create a list of all of the necessary software packages that are
    installed on your Amazon Elastic Compute Cloud (EC2) instances other than
    Backbone.js, Node.js, and MongoDB.
-   Create a list of all additional Amazon services that your application
    uses, such as Simple Email Service (SES) for email or Relational Database
    Service (RDS) for databases.
-   If you haven't already, [create a Cloud Server
    instance](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services) and any supporting Rackspace Cloud services.

### Install software packages

This section provides instructions for installing the required and optional
software packages.

#### Install Git and cURL

You need to use Git and cURL to get dependent components such as Node.js.

Run the following command to install git and cURL:

    sudo apt-get -y install git curl

#### Install Python (optional)

Ubuntu&reg; version 12.0.4 Long Term Support (LTS) includes Python&reg;
version 2.7.2. If you need a different version, you can install it from the
[Python downloads page](http://www.python.org/download/).

#### Install OpenJDK

Use the following steps to install OpenJDK&trade;:

1. Using Secure Shell (SSH), connect to the Cloud Servers instance by using
   the PublicNet URL and the root password.

2. Install OpenJDK 7 by entering the following command:

        sudo apt-get -y install openjdk-7-jre

3. Determine the location of `JAVA_HOME` by entering the following command:

        ll /etc/alternatives/java

    In the following example output, `JAVA_HOME` is located at
    `/usr/lib/jvm/jre-1.7.0-openjdk-amd64`:

        /etc/alternatives/java -> /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java*

#### Install Tomcat 7 on the cloud server

Use the following steps to install Apache&reg; Tomcat&reg;:

1. Enter the following command to install Tomcat 7:

        sudo apt-get -y install tomcat7

    If you want to install a different version of Tomcat or install Tomcat
    manually, select the version from the [Tomcat 7 Software Downloads
    page](http://tomcat.apache.org/download-70.cgi).

2. Copy the URL of the `tar.gz` file (for example,
   **http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz**).

3. Change directory to `/usr/share` (or the directory that you want to use)
   and download the binary file by entering the following commands:

        cd /usr/share
        sudo wget http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz

4. Change permissions by entering the following command:

        sudo chmod 775 apache-tomcat-7.0.39.tar.gz

5. Extract file contents by entering the following command:

        sudo tar zxvf apache-tomcat-7.0.39.tar.gz

6. After Tomcat is extracted, remove the `tar.gz` files to save space by
   entering the following command:

        sudo rm apache-tomcat-7.0.39.tar.gz

7. Set the environment variables in the `catalina.sh` file by entering the
   following commands:

        cd /usr/share/apache-tomcat-7.0.39/bin
        sudo vi catalina.sh

8. Add the following line immediately after `\#!/bin/sh`:

        JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64

9. Save your changes and exit the file.

10. Automate Tomcat startup by using the following commands:

        cd /etc/init.d
        sudo vi tomcat

11. Add the following information to the file. Ensure that `JAVA_HOME`,
   `TOMCAT_HOME`, `START_TOMCAT`, and `STOP_TOMCAT` refer to the correct
   directories.

        #!/bin/bash
        # chkconfig: 234 20 80
        # description: Tomcat Server basic start/shutdown script
        # processname: tomcat
        JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
        export JAVA_HOME
        TOMCAT_HOME=/usr/share/apache-tomcat-7.0.39/bin
        START_TOMCAT=/usr/share/apache-tomcat-7.0.39/bin/startup.sh
        STOP_TOMCAT=/usr/share/apache-tomcat-7.0.39/bin/shutdown.sh
        start() {
        echo -n "Starting tomcat: "
        cd $TOMCAT_HOME
        ${START_TOMCAT}
        echo "done."
        }
        stop() {
        echo -n "Shutting down tomcat: "

        cd $TOMCAT_HOME
        ${STOP_TOMCAT}
        echo "done."
        }
        case "$1" in
        start)
        start
        ;;
        stop)
        stop
        ;;
        restart)
        stop
        sleep 10
        start
        ;;
        *)
        echo "Usage: $0 {start|stop|restart}"
        esac
        exit 0

12. Save your changes and exit the file.

13. Set file permissions, set up Tomcat as a system service, and test the
    setup by entering the following commands:

        sudo chmod 755 tomcat
        sudo /sbin/chkconfig --add tomcat
        sudo /sbin/chkconfig --level 234 tomcat on
        sudo /sbin/chkconfig --list tomcat

     The output should be similar to the following example:

        tomcat 0:off 1:off 2:on 3:on 4:on 5:off 6:off

14. Because Tomcat is running on port 8080, ensure that iptables doesn't
    interfere with connectivity.

     To learn about iptables, see [Introduction
     to iptables](/how-to/introduction-to-iptables).

15. Test Tomcat by looking up the Internet Protocol (IP) address for the cloud
    server from the Rackspace Cloud Control Panel and opening the URL in a
    browser (for example, **http://<ip_address>:8080/**).

     The Apache Tomcat landing page appears.

     **Note**: You can start and stop Tomcat by using the following commands:

        sudo /sbin/service tomcat stop
        sudo /sbin/service tomcat start

#### Install MongoDB on your cloud server

You can find instructions for installing MongoDB on the Rackspace Cloud at the
[MongoDB Documentation
website](http://docs.mongodb.org/ecosystem/platforms/rackspace-cloud/).

For a production deployment, you should use a replica set with at least
three nodes.

For a single-node installation, perform the following steps:

1. Add the GNU Privacy Guard (GPG) key to `apt-get` to create a _trusted_
   source by entering the following command:

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

2. Use the following commands to create a custom `10gen` repository file
   containing the location of the MongoDB binary files:

        sudo sh -c 'echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list'

3. Update `apt-get` to pick up new packages by entering the following command:

        sudo apt-get -y update

4. Install MongoDB by entering the following command:

        sudo apt-get -y install mongodb-10gen

5. Verify that MongoDB is running by entering the following command:

        ps aux | grep mongo

**Note**: MongoDB uses `/var/lib/mongodb` as the default data path. If you
want to change this path, you can shut down the MongoDB instance and update
the configuration file at `/etc/mongodb.conf`.

#### Set up a Node.js server

If your services are backed by Node.js instead of Python, use the following
steps to set up a Node.js server on your cloud instance:

1. Install Node.js by entering the following command:

        sudo apt-get -y install nodejs npm

2. Test the installation by using the following command to get the version of
   Node.js that you are running:

        node --version

#### Install OpenStack Swift (optional)

If you plan to use Cloud Files to transfer your data, use the following steps
to install the OpenStack&reg; Swift client to enable access from your server:

1. Install the Swift client by entering the following command:

        sudo apt-get install python-novaclient glance-client swift

2. Set the necessary environment variables by running the following commands,
   substituting your username and application programming interface (API) key:

        export ST_USER=<yourLoginUsername>
        export ST_KEY=<yourApiKey>
        export ST_AUTH=https://identity.api.rackspacecloud.com/v1.0/

    You might want to define these variables in the `.bashrc` or
    `.bash\_profile` file, then reload the file with the following `source`
    command, substituting `.bash\_profile` if necessary:

        source .bashrc

3. Type `swift list` and ensure that you can see the container that you
   created to hold your data.

### Back up data from AWS to Rackspace Cloud Files

This section shows you how to back up data from AWS to Rackspace Cloud Files.
The example uses an existing container named AppData.

First, retrieve your data from EC2. You can transfer the data directly in one
of the following ways:

- Use [rsync](/how-to/migrating-a-linux-server-from-the-command-line-1)
  or SSH File Transfer Protocol (SFTP).

- Use the OpenStack Swift client to transfer your data to Cloud Files, and
  then transfer it from Cloud Files to the Cloud Server.

To use Cloud Files, follow these preparatory steps:

1.  Using SSH, connect to your EC2 instance by entering the following command:

        ssh -i your_private_key.pem user@ec2-xxx-xxx-xxx-xxx.compute-1.amazonaws.com

2.  Perform a dump of MongoDB. Use the `-host` and `-port` options if MongoDB
    is running on a different instance, as shown in the following example:

        mongodump --host mongodb1.yourdomain.com --port 3017 --username $USERNAME --password $PASSWORD --out ~/backup/mongodump-2013-05-03
        tar czvf backbonedb-2013-05-03.tar.gz ~/backup/db/mongodump-2013-05-03/*

3.  Use the following commands to back up your application and any resources
    that the application needs, including logs and other directories:

        # Backup backbone resources
        sudo tar cvzf ~/backup/app/backhone.tar.gz /usr/share/tomcat/webapps/YOURAPP/*
        # Backup node.js resources
        sudo tar cvzf ~/backup/app/nodejs.tar.gz /usr/local/nodejs/YOURAPP/*

4.  If you're using Cloud Files to transfer your files, use one of the
    following methods to perform the transfer. If you're using rsync or SFTP,
    complete the transfer and skip to the final section of this article.

    -   Upload your archives to the Cloud Files container by using the
        Swift client and the following commands:

            swift upload AppData backbonedb-2013-05-03.tar.gz
            swift upload AppData backhone.tar.gz
            swift upload AppData nodejs.tar.gz

      - Use the following steps to upload your data into Cloud Files by using
        the Cloud Control Panel:

        1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

        2. In the top navigation bar, click **Select a Product > Rackspace
           Cloud**.

        3. Select **Storage > Files > containerName** to open your container.

        4. Click **Upload Files**.

        5. Click **Browse** and select the files that you want to upload.
           Then click **Open** or **Select** (depending on your browser and system).

        6.  Click **Upload File**.

### Restore data from Cloud Files to Cloud Servers

If you uploaded your data to Cloud Files, transfer it to Cloud
Servers by using the following steps:

1.  Using SSH, connect to the Cloud Servers instance by using the
    PublicNet URL and the root password.
2.  Install and configure the Swift command-line interface (CLI) as described
    in the "Install software packages" section.
3.  Execute the `swift list` command and ensure that you see the new
    container that you created in the results.
4.  Download the database dump from the backup that you took in the
    "Back up data from AWS to Rackspace Cloud Files" section and restore
    it locally by using the following commands:

        swift download AppData backbonedb-2013-05-03.tar.gz
        gunzip < backbonedb-2013-05-03.tar.gz | mongorestore --host mongodb1.yourdomain.com --port 3017 --username user --password pass

5.  Download the data (Backbone.js and Node.js) and restore it by using the
    following commands:

        sudo service tomcat7 stop #stop tomcat server
        swift download AppData backbone.tar.gz
        # restore / deflate backbone
        cd /usr/share/tomcat/webapps
        sudo tar xvf backbone.tar.gz
        # restore node.js
        swift download AppData nodejs.tar.gz
        sudo mkdir -p /usr/local/nodejs/YOURAPP
        cd /usr/local/nodejs
        sudo tar xvf nodejs.tar.gz

6.  Start the application services by using the following commands:

        sudo service tomcat7 start
        cd /usr/local/nodejs/YOURAPP/
        sudo node server.js

### Test your application

Navigate to **http://\<cloudServeIpAddress>/\<yourApp>** in a browser window to
access and test your application.

### Next step

[Post-migration considerations when migrating from Amazon Web Services](/how-to/post-migration-considerations-when-migrating-from-amazon-web-services)

For other migration scenarios, see the following articles:

-   [Migrate a .NET application from Amazon Web Services](/how-to/migrating-a-net-application-from-amazon-web-services)
-   [Migrate a Java web application from Amazon Web Services](/how-to/migrating-a-java-web-application-from-amazon-web-services)
