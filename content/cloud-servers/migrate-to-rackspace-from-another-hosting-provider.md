---
permalink: migrate-to-rackspace-from-another-hosting-provider/
audit_date:
title: Migrating to Rackspace from another hosting provider
type: article
created_date: '2016-01-21'
created_by: Nate Archer
last_modified_date: '2018-02-27'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions for developers who are migrating their infrastructure from another hosting provider, such as Azure or Linode, to the Rackspace Cloud. These instructions provide a high-level overview and are not specific to any particular hosting provider. If you need more assistance for complex infrastructures, you can use [Rackspace Migration Services](https://www.rackspace.com/migration).

### Prerequisites

-   A Rackspace Cloud services account
-   Access to your account with your current hosting provider

### Preparation

Based on the size and configuration of your existing cloud instance, select an equivalent size and configuration for the Rackspace Cloud Servers instance that you will provision. Consider any resources that you want to migrate from your current hosting provider, including application and database resources.

For an overview of the Rackspace Cloud products, see the [Rackspace Core Infrastructure Guide](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-intro/cloud-tour/).

### Provision and configure the Cloud Servers instance

Depending on the size of your current server and operating system, select an equivalent instance type and [provision a new instance](/how-to/create-a-cloud-server) on Rackspace Cloud Servers.

### Migrate data

Use one of the following methods to transfer your data from your existing hosting provider to your new cloud server. The migration method that you use depends on the nature of your data.

**Note:** Back up the data on your existing server *before* you migrate it.

#### rsync

You can use rsync to connect the servers and transfer the data. The following steps describe how to establish communication between your existing server instance and new Rackspace server instance.

1.  Log in as root to your existing server.
2.  Verify whether rsync is installed on your existing server.

        rsync -version

3.  If rsync is not installed, install it based on your distribution.

   - **Debian or Ubuntu:**

        apt-get install rsync

   - **Red Hat or CentOS:**

        yum install rsync

4.  Use SSH to log in to your Rackspace server from your existing server. Generate an SSH key from your existing server if you have not done so already:

        ssh-keygen -t rsa -b 4096 -v

5.  Transfer your SSH key to your Rackspace server. Substitute your new Rackspace server's IP address in the following command.

        ssh-copy-id 111.344.65.781

6.  Copy your existing server files by using rsync. Replace the IP address after `root@` with the IP address of your Rackspace cloud server.

   **Note:** Adjust the following command to fit your specific situation. For example, you might need additional excludes or to change the source and destination paths.

        rsync --exclude="/sys/*" --exclude="/proc/*" -aHSKDvz -e ssh / root@111.344.65.781:/media/xvda/


#### Other methods

Besides rsync, you can transfer data from an existing server to a Rackspace server in a number of different ways. The following methods upload your existing data to Rackspace Cloud Files. After the data is uploaded, you can then download and restore it on your new server.

-   **Use OpenStack Object Storage (swift)**

    Install OpenStack Object Storage (swift) on your existing server and directly copy your data from your existing server to Cloud Files, without
    downloading the files locally.

-   **Install a GUI tool on your local computer**

    In certain cases, such as if your existing server is Windows based, you might
    install a GUI FTP client application to upload data to Cloud Files.

-   **Use the Cloud Control Panel to upload files**

    The Cloud Control Panel enables you to upload data from your local
    computer to your new server. This method is useful when you do not
    want to install additional software to transfer your data. However,
    we do not recommend downloading your data locally because it is not
    as secure as using the other methods.

After your data is uploaded to Cloud Files, download and restore the
data on your server.

### Configure

After the data from your existing server is stored on your new Rackspace server,
make any necessary configuration changes for your application and
database.

### Test after migration

Hosting providers have their own configurations, syntax, and services, so it is important to test your new Rackspace configuration. Use the following techniques:

-   Thoroughly [test the applications](/how-to/application-and-load-testing-guidelines) deployed on your Rackspace server.
-   Make any changes to your configuration files as necessary. These changes could include any reference to hostnames, IP addresses, and file paths.

### Next steps

Implement monitoring and backup solutions on your cloud server and focus on [enhancing security](/how-to/configuring-basic-security).
