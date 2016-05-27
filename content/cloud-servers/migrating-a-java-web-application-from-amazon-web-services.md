---
permalink: migrating-a-java-web-application-from-amazon-web-services/
audit_date:
title: Migrate a Java web application from Amazon Web Services
type: article
created_date: '2013-07-02'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Provision cloud resources when migrating from Amazon Web Services](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)

This article describes the migration of a Tomcat and Spring Java web
application from Amazon Web Services (AWS) to Rackspace Cloud. It takes
an estimated 30 minutes to complete, if you follow the instructions step
by step.

The web application used here is the Spring Framework Petclinic sample
available at
[github.com/SpringSource/spring-petclinic](https://github.com/SpringSource/spring-petclinic/).

The topology of the application in this scenario is represented in the
following figure:

<img src="{% asset_path cloud-servers/migrating-a-java-web-application-from-amazon-web-services/3588-1.png %}" width="607" height="171" />

### Prerequisites

-   EC2 instance on AWS with root access running the Spring web
    application on Apache Tomcat
-   Valid and enabled account on Rackspace Cloud

### Preparation

-   Identify the resources to migrate, including application and
    database resources.
-   Create a list of all the necessary software packages that are
    installed on your EC2 instance other than your Spring application
-   Create a list of all additional Amazon servers that are being used
    in the application - for example, Simple Email Server (SES) for email
    or Relational Database Service (RDS) for databases.
-   If you have not already, [create a Cloud Server instance](/how-to/provisioning-cloud-resources-when-migrating-from-amazon-web-services)
    and any supporting Rackspace Cloud services.

### Install software packages

Install OpenJDK, Tomcat, and optionally OpenStack swift.

#### Install OpenJDK on the cloud

1.  Using SSH, connect to the Cloud Servers instance by using the PublicNet URL and the root password.

2.  Enter the root password to log in.

3.  Install OpenJDK 7.

        sudo yum install java-1.7.0-openjdk-devel

4.  Determine `JAVA_HOME`.

        ll /etc/alternatives/java

    Following is example output in which `JAVA_HOME` is `/usr/lib/jvm/jre-1.7.0-openjdk.x86_64`.

        /etc/alternatives/java -> /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java

#### Install Tomcat on the cloud server

1.  Download Tomcat, selecting the version from the list at <http://tomcat.apache.org/download-70.cgi>.

2.  Copy the URL of the **tar.gz** file (for example, **http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz**).

3.  Change directory to `/usr/share` (or your directory of choice) and download the binary.

        cd /usr/share
        sudo wget http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz

4.  Change permissions.

        sudo chmod 775 apache-tomcat-7.0.39.tar.gz

5.  Extract file contents.

        sudo tar zxvf apache-tomcat-7.0.39.tar.gz

6.  After Tomcat is extracted, remove the **tar.gz** files to save space.

        sudo rm apache-tomcat-7.0.39.tar.gz

7.  Set environment variables in **catalina.sh**.

        cd /usr/share/apache-tomcat-7.0.39/bin
        sudo vi catalina.sh

8. Add the following line immediately after **\#!/bin/sh**:

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

15. Test Tomcat by looking up the cloud server IP in the Rackspace Cloud Control Panel and opening the URL in a browser (for example, `http://<ipAddress>:8080/`). The Apache Tomcat landing page should appear.

    **Note:** You can stop and start Tomcat with the following commands:

        sudo /sbin/service tomcat stop
        sudo /sbin/service tomcat start

#### Install OpenStack swift (optional)

1. If you will use Cloud Files to transfer your data, install the swift client to enable access from your server.

        sudo yum install python-novaclient python-glanceclient swift

2. Set the necessary environment variables by running the following commands, substituting your Rackspace Cloud account username and API key:

        export ST_USER=<yourLoginUsername>
        export ST_KEY=<yourApiKey>
        export ST_AUTH=https://identity.api.rackspacecloud.com/v1.0/

    You might want to define these variables in **.bashrc** or **.bash\_profile**, and then reload the file with the `source` command.

            source .bashrc

3. Type `swift list` and ensure that you can see the container you've created to hold your data.

### Back up data from AWS to Rackspace Cloud Files

Retrieve your data from EC2. You can transfer the data directly via
rsync or sftp, or you can use the OpenStack Swift client to transfer
your data to Cloud Files, and from there transfer to the Cloud Server.

To use Cloud Files, follow these preparatory steps (this example
uses an existing container named Tomcat):

1.  Using SSH, connect to your EC2 instance.

        ssh -i yourPrivateKey.pem user@ec2-xxx-xxx-xxx-xxx.compute-1.amazonaws.com

2.  Perform a database dump.

        mysqldump -h <rdsHostname> -u <rdsUsername> -p --triggers --routines --databases petclinic | gzip > ~/petclinic.sql.gz

3.  Back up your application and any other resources needed by the application, including logs and other directories of interest.

        # make sure you have the correct tomcat7 directory
        sudo tar cvzf ~/tomcat.tar.gz /usr/share/tomcat7/webapps/*

4.  If you are using Cloud Files to transfer your files, use one of the following methods to perform the transfer. If you will transfer directly via rsync or sftp, skip to the final section of this article after the transfer.

    -   Upload your archives to the Cloud Files container via the swift client.

            swift upload Tomcat petclinic.sql.gz
            swift upload Tomcat tomcat.tar.gz

    -   Upload your data into Cloud Files through the Cloud Control Panel.

        1.  Open your container (**Cloud Control Panel > Storage > Files > *containerName***).

        2.  Click **Upload Files**.

        3.  Click **Browse** and select the files to upload.

            **Note:** When you click the **Browse** button, you can select multiple files.

        4.  After you have selected the file or files, click **Open** or **Select** (depending on the browser and system).

        5.  Click **Upload File**.

### Restore data from Cloud Files to Cloud Servers

If you uploaded your data to Cloud Files, transfer it to your Cloud
Server with the following steps.

1.  Using SSH, connect to the Cloud Servers instance by using the PublicNet URL and the root password.
2.  Install and configure the swift CLI as described in the "Install software packages" section.
3.  Ensure that you can execute the `swift list` command and see the new container that you created in the results.
4.  Download the database dump from the backup that you took in the "Back up data from AWS to Rackspace Cloud Files" section and restore it locally.

        swift download Tomcat petclinic.sql.gz
        gunzip < petclinic.sql.gz | mysql -u <cloudDatabaseUsername> -p -h <cloudDatabaseHostname>

5.  Stop Tomcat, download the application files, and extract them.

        sudo /sbin/service tomcat stop
        swift download Tomcat tomcat.tar.gz
        tar -zxvf tomcat.tar.gz

6.  Copy the extracted web application contents to the local Tomcat **webapps** directory and modify the application properties (jdbc.url, database user name, database password, and so on).

    Additionally, in the Spring Framework Petclinic sample, the
    following files must be commented out:

        petclinic/WEB-INF/classes/db/mysql/initDB.sql
        petclinic/WEB-INF/classes/db/mysql/populateDB.sql

7.  Restart Tomcat.

        sudo /sbin/service tomcat start

### Test your application

Access the web application at `http://<cloudServerIPAddress>:8080/petclinic`.

### Next step

[Post-migration considerations when migrating from Amazon Web Services](/how-to/post-migration-considerations-when-migrating-from-amazon-web-services)

For other migration scenarios, see the following articles:

-   [Migrate an application built on a LAMP stack from Amazon Web Services](/how-to/migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services)
-   [Migrate a .NET application from Amazon Web Services](/how-to/migrating-a-net-application-from-amazon-web-services)
-   [Migrate an application based on Backbone.js, Node.js, and MongoDB from Amazon Web Services](/how-to/migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services)
