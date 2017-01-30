---
permalink: migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services/
audit_date:
title: 'Migrate an application based on Backbone.js, Node.js, and MongoDB from Amazon Web Services'
type: article
created_date: '2013-07-02'
created_by: Rackspace Support
last_modified_date: '2016-01-18'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Provisioning cloud resources when migrating from Amazon Web Services](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)

This scenario describes the migration of a Backbone.js, Node.js, and
MongoDB application from Amazon Web Services (AWS) to the Rackspace
Cloud. It takes an estimated 30 minutes to complete, if you follow the
instructions step by step.

The topology of the application in this scenario is presented in the
following figure:

<img src="{% asset_path cloud-servers/migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services/4.4-diagram.png %}" width="650" />

### Prerequisites

-   Application stack on AWS with root access or appropriate privileges
    for individual instances and services
-   Valid and enabled account on Rackspace Cloud

### Preparation

-   Identify the resources to migrate, including application and
    database resources.
-   Create a list of all the necessary software packages that are
    installed on your EC2 instances other than Backbone.js, Node.js,
    and MongoDB.
-   Create a list of all additional Amazon services that are being used
    in your application - for example, Simple Email Service (SES) for email
    or Relational Database Service (RDS) for databases.
-   If you have not already, [create a Cloud Server instance](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)
    and any supporting Rackspace Cloud services.

### Install software packages

This section provides instructions for installing the required and optional software packages.

#### Install Git and cURL

Git and cURL are needed to get dependent components such as Node.js.

Run the following command:

    sudo apt-get -y install git curl

#### Install Python (optional)

Ubuntu 12.0.4 LTS includes Python 2.7.2. If you need a different version or an alternative version, you can install it. Instructions for installing a different version are located at <http://www.python.org/download/>.

#### Install OpenJDK

1. Using SSH, connect to the Cloud Servers instance by using the PublicNet URL and the root password.

2. Install OpenJDK 7.

        sudo apt-get -y install openjdk-7-jre

3. Determine `JAVA_HOME`.

        ll /etc/alternatives/java

    Following is example output in which `JAVA_HOME` is `/usr/lib/jvm/jre-1.7.0-openjdk-amd64`.

        /etc/alternatives/java -> /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java*

#### Install Tomcat 7 on the cloud server

1. To install Tomcat 7, use `apt-get`.

        sudo apt-get -y install tomcat7

    Alternatively, to install a different version of Tomcat, or install it manually, select the version from <http://tomcat.apache.org/download-70.cgi>.

2. Copy the URL of the **tar.gz** file (for example, **http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz**).

3. Change directory to `/usr/share` (or your directory of choice) and download the binary.

        cd /usr/share
        sudo wget http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz

4. Change permissions.

        sudo chmod 775 apache-tomcat-7.0.39.tar.gz

5. Extract file contents.

        sudo tar zxvf apache-tomcat-7.0.39.tar.gz

6. After Tomcat is extracted, remove the **tar.gz** files to save space.

        sudo rm apache-tomcat-7.0.39.tar.gz

7. Set environment variables in **catalina.sh.**

        cd /usr/share/apache-tomcat-7.0.39/bin
        sudo vi catalina.sh

8. Add the following line immediately after **\#!/bin/sh:**

        JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64

9. Save and exit.

10. Automate the startup of Tomcat.

        cd /etc/init.d
        sudo vi tomcat

11. Add the following information to the file. Ensure that `JAVA_HOME`, `TOMCAT_HOME`, `START_TOMCAT`, and `STOP_TOMCAT` refer to the correct directories.

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

12. Save and exit.

13. Set file permissions, set up Tomcat as a system service, and test the setup.

        sudo chmod 755 tomcat
        sudo /sbin/chkconfig --add tomcat
        sudo /sbin/chkconfig --level 234 tomcat on
        sudo /sbin/chkconfig --list tomcat

    The expected output looks as follows:

        tomcat 0:off 1:off 2:on 3:on 4:on 5:off 6:off

14. Because Tomcat is running on port 8080, ensure iptables will not interfere with connectivity.

    To learn about iptables, see [Introduction to iptables](/how-to/introduction-to-iptables).

15. Test Tomcat by looking up the cloud server IP from the Rackspace Cloud Control Panel and opening the URL in a browser (for example, `http://<ip_address>:8080/`).

    The Apache Tomcat landing page should appear.

    **Note:** You can start and stop Tomcat with the following commands:

        sudo /sbin/service tomcat stop
        sudo /sbin/service tomcat start

#### Install MongoDB on your cloud server

Instructions for installing MongoDB on the Rackspace Cloud are located at <http://docs.mongodb.org/ecosystem/platforms/rackspace-cloud/>.

For a production deployment, you should use at least a 3-node replica set.

For a simple single-node installation, perform the following steps:

1. Add the GPG key to apt-get to create a "trusted" source.

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

2. Create a custom 10gen repository file containing the location of the MongoDB binaries.

        sudo sh -c 'echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list'

3. Update `apt-get` to pick up new packages.

        sudo apt-get -y update

4. Install MongoDB.

        sudo apt-get -y install mongodb-10gen

5. Verify that MongoDB is running.

        ps aux | grep mongo

**Note:** MongoDB uses `/var/lib/mongodb` as the default data path. If you want to change this path, you can shut down the MongoDB instance and update `/etc/mongodb.conf`.

#### Set up a Node.js server

If your services are backed by Node.js instead of Python, use the following steps to set up a Node.js server on your cloud instance:

1. Install Node.js.

        sudo apt-get -y install nodejs npm

2. Test the installation by getting the version of Node.js that you are running.

        node --version

#### Install OpenStack swift (optional)

1. If you will use Cloud Files to transfer your data, install the swift client to enable access from your server.

        sudo apt-get install python-novaclient glance-client swift

2. Set the necessary environment variables by running the following commands, substituting your username and API key:

        export ST_USER=<yourLoginUsername>
        export ST_KEY=<yourApiKey>
        export ST_AUTH=https://identity.api.rackspacecloud.com/v1.0/

    You might want to define these variables in **.bashrc** or
    **.bash\_profile**, then reload the file with the
    `source` command.

        source .bashrc

3. Type `swift list` and ensure that you can see the container you've created to hold your data.

### Back up data from AWS to Rackspace Cloud Files

Retrieve your data from EC2. You can transfer the data directly via
[rsync](/how-to/migrating-a-linux-server-from-the-command-line-1)
or sftp, or you can use the OpenStack Swift client to transfer your data
to Cloud Files, and from there transfer to the Cloud Server.

To use Cloud Files, follow these preparatory steps (this example
uses an existing container named AppData):

1.  Using SSH, connect to your EC2 instance.

        ssh -i your_private_key.pem user@ec2-xxx-xxx-xxx-xxx.compute-1.amazonaws.com

2.  Perform a dump of MongoDB.

    Use the `-host` and `-port` options if MongoDB is running on a
    different instance.

        mongodump --host mongodb1.yourdomain.com --port 3017 --username $USERNAME --password $PASSWORD --out ~/backup/mongodump-2013-05-03
        tar czvf backbonedb-2013-05-03.tar.gz ~/backup/db/mongodump-2013-05-03/*

3.  Back up your application and any other resources needed by the
    application, including logs and other directories of interest.

        # Backup backbone resources
        sudo tar cvzf ~/backup/app/backhone.tar.gz /usr/share/tomcat/webapps/YOURAPP/*
        # Backup node.js resources
        sudo tar cvzf ~/backup/app/nodejs.tar.gz /usr/local/nodejs/YOURAPP/*

4.  If you are using Cloud Files to transfer your files, use one of the
    following methods to perform the transfer. If you will transfer
    directly via rsync or sftp, skip to the final section of this
    article after the transfer.

    -   Upload your archives to the Cloud Files container via the
        swift client.

            swift upload AppData backbonedb-2013-05-03.tar.gz
            swift upload AppData backhone.tar.gz
            swift upload AppData nodejs.tar.gz

    -   Upload your data into Cloud Files through the Cloud Control Panel.

        1.  Open your container (**Cloud Control Panel > Storage > Files > *containerName***).

        2.  Click **Upload Files**.

        3.  Click **Browse**and select the files to upload.

            **Note:** When you click the **Browse** button, you can select multiple files.

        4.  After you have selected the file or files, click **Open** or **Select** (depending on the browser and system).

        5.  Click **Upload File**.

### Restore data from Cloud Files to Cloud Servers

If you uploaded your data to Cloud Files, transfer it to your Cloud
Server with the following steps.

1.  Using SSH, connect to the Cloud Servers instance by using the
    PublicNet URL and the root password.
2.  Install and configure the swift CLI as described in the "Install
    software packages" section.
3.  Ensure that you can execute the `swift list` command and see the new container that you created in the results.
4.  Download the database dump from the backup that you took in the
    "Back up data from AWS to Rackspace Cloud Files" section and restore
    it locally.

        swift download AppData backbonedb-2013-05-03.tar.gz
        gunzip < backbonedb-2013-05-03.tar.gz | mongorestore --host mongodb1.yourdomain.com --port 3017 --username user --password pass

5.  Download the data (Backbone.js and Node.js) and restore it.

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

6.  Start the application services.

        sudo service tomcat7 start
        cd /usr/local/nodejs/YOURAPP/
        sudo node server.js

### Test your application

Browse to `http://<cloudServeIpAddress>/<yourApp>` to access and test your application.

### Next step

[Post-migration considerations when migrating from Amazon Web Services](/how-to/post-migration-considerations-when-migrating-from-amazon-web-services)

For other migration scenarios, see the following articles:

-   [Migrate an application built on a LAMP stack from Amazon Web Services](/how-to/migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services)
-   [Migrate a .NET application from Amazon Web Services](/how-to/migrating-a-net-application-from-amazon-web-services)
-   [Migrate a Java web application from Amazon Web Services](/how-to/migrating-a-java-web-application-from-amazon-web-services)
