---
permalink: migrate-to-rackspace-from-another-hosting-provider/
audit_date:
title: Migrate to Rackspace from another hosting provider
type: article
created_date: '2016-01-21'
created_by: Nate Archer
last_modified_date: '2016-01-21'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions for developers who are migrating their infrastructure from
another hosting provider, such as Azure or Linode, to the Rackspace
Cloud. These instructions are meant as a high-level overview and are not
specific to any particular hosting provider. If you need further
assistance for complex infrastructures, you can use [Rackspace Migration Services](https://www.rackspace.com/migration/cloud).

### Prerequisites

-   A Rackspace Cloud services account
-   Access to your account with your current hosting provider

### Preparation

Based on the size and configuration of your existing cloud instance, select an
equivalent size and configuration for the Rackspace Cloud Servers
instance that you will provision. Remember to consider any resources you want to
migrate from your current hosting provider, including application and
database resources.

For a tour of Rackspace Cloud products, see the [Rackspace Core Infrastructure Guide](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-intro/cloud-tour/).

### Provision and configure the Cloud Servers instance

Depending on the size of your current server and operating system,
select an equivalent instance type and [provision a new instance](/how-to/create-a-cloud-server)
on Rackspace Cloud Servers.

Also remember to back up the data on your existing server before migrating.

### Migrate data

Use one of the following
methods to transfer your data from your existing hosting provider to your
Rackspace Cloud Server. The migration method you use depends on the nature of
your data.

#### rsync

You can use rsync to tunnel between your two servers and transfer your
data. The following steps show you how to establish communication between your
existing server instance and Rackspace server instance.

1.  Log in as root to your existing server.
2.  Verify whether rsync is installed on your existing server.

        rsync -version

    If necessary, install rsync:

        apt-get install rsync

3.  Use SSH to log in to your Rackspace server from your existing server.
    Generate an SSH key from your existing server if you have not done so
    already:

        ssh-keygen -t rsa -b 4096 -v

4.  Transfer your SSH key to your Rackspace server. Substitute your new
    Rackspace server's IP address in the following command.

        ssh-copy-id 111.344.65.781

5.  Copy your existing server files by using rsync. Replace the IP address after
    `root@` with the IP address of your Rackspace cloud server.

        rsync --exclude="/sys/*" --exclude="/proc/*" -aHSKDvz -e ssh / root@111.344.65.781:/media/xvda/

#### Other methods

Besides rsync, you can transfer data from an existing server to Rackspace in
a number of different ways. The following methods use Rackspace Cloud Files
to copy data from your existing servers then use that data to provision
new servers with Rackspace.

-   **Use OpenStack Swift, a command-line interface, to transfer data
    from your existing sever to Rackspace Cloud Files.**

    Using this method, you install Swift on your existing server and directly
    copy your data from your existing server to Cloud Files, without
    downloading the files locally.

-   **Install a GUI tool on your local computer**

    In certain cases, such as if your existing server is Windows based, you need
    to install a GUI tool (such as
    [Cyberduck](https://cyberduck.io/?l=en)) to upload data to Cloud
    Files.

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

Hosting providers have their own configurations, syntax,
and services, so it is important to test your new Rackspace
configuration. You can get the most out of testing your configuration
through these techniques:

-   Implement monitoring and backup solutions. Focus on [enhancing security](/how-to/configuring-basic-security).
-   Thoroughly [test the applications](/how-to/application-and-load-testing-guidelines)
    deployed on your Rackspace Cloud Server.
-   Make any changes to your configuration files as necessary. These changes
    could include any reference to hostnames, IP addresses, and file paths.
