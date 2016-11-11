---
permalink: deploy-wordpress-packages-by-using-rackspace-cloud-orchestration/
audit_date: '2016-11-11'
title: Deploy WordPress packages by using Rackspace Cloud Orchestration
type: article
created_date: '2013-11-12'
created_by: Rackspace Support
last_modified_date: '2016-05-02'
last_modified_by: Stephanie Fillmon
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace Cloud Orchestration for Cloud Servers simplifies the process
of creating a WordPress environment, either as a stand-alone server or
in a multiple-server cluster. This article shows how to deploy WordPress
packages by using Cloud Orchestration.

### Deploy the servers

1. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).

2. In the top navigation bar, click **Orchestration**, and under Create Resources, click **Stack**.

3. Click on the type of stack you want to create. Popular stack types are listed first, followed by all available stack templates.

4. If required, Create a custom stack by selecting **Create Custom Template** under the **All Stacks** heading.

5. Click **Create Stack**, and then select the flavor. You can choose either _Production_ or _Deployment_.

6. Specify a name and region for your stack.

7. In the following section, specify server and WordPress settings.

8. Under Advanced Options, if required, enter the Cloud Database Flavor, the Database Disk Size (in GB), Server Flavor, the secondary servers number, and the Server Image.

9. Click **Create Stack**.

On the stack details page you will see a green **Up** status in the status field when the stack is complete.
It may take several minutes for the stack build process to finish.

### Access the servers

After your stack is active, go to the Stack Details page and click **View Credentials** to access the login information for your new servers.

In the Stack Credentials window, you will see an SSH private key that you can use to access the servers in your stack as the root user, the root password for the database, and the WordPress password.

For more information about using the provided SSH key to access your servers, see [Logging in with a SSH private key on Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows) or [Logging in with a SSH private key on Linux and Mac](/how-to/logging-in-with-an-ssh-private-key-on-linuxmac).

###  Set up DNS

If you host your DNS with Rackspace DNS, you can now add a DNS record for your new WordPress stack. For information about adding a DNS record, see [Creating DNS Records for Cloud Servers](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel). Point your domain to the public IP address of the load balancer that was created for you.

If you are not ready to use public DNS with WordPress, modify your desktop's Hosts file to point your domain to your new stack. For information about modifying your Hosts file, see [Modify your hosts file](/how-to/modify-your-hosts-file). Be sure to use the load balancer public IP address.

After you are finished, you can start using WordPress by navigating to the URL that you entered during the stack configuration.
