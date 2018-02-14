---
permalink: deploy-wordpress-packages-by-using-rackspace-cloud-orchestration/
audit_date: '2017-11-20'
title: Deploy WordPress by using Rackspace Cloud Orchestration
type: article
created_date: '2013-11-12'
created_by: Rackspace Support
last_modified_date: '2017-11-20'
last_modified_by: Stephanie Fillmon
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace Cloud Orchestration simplifies the process of creating a
WordPress environment, either as a stand-alone server or
in a multiple-server cluster. This article shows how to deploy WordPress
by using Cloud Orchestration.

### Deploy the servers

1. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).

2. In the top navigation bar, click **Orchestration**, and under Create Resources, click **Stack**.

3. At the bottom of the **All Stacks** list, hover over the description for the WordPress template and click **Create Stack**.

4. Select the flavor (Production or Deployment), and then click **Create Stack** again.

6. On the Create Stack page, specify a name and region for your stack.

7. Specify server and WordPress settings.

8. Under Advanced Options, if required, enter database and server details.

9. Click **Create Stack**.

On the stack details page, a green **Up** status in the Status field indicates when the stack is active.
The stack build process might take several minutes to finish.

### Access the servers

After your stack is active, on the Stack Details page, click **View Credentials** to access the login information for your new servers.

The Stack Credentials pop-up dialog box displays the root passwords for the database, an SSH private key that you can use to access the servers in your stack as the root user, and the WordPress password.

For more information about using the provided SSH key to access your servers, see [Logging in with an SSH Private Key on Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows) or [Log in with a SSH private key on Linux and Mac](/how-to/logging-in-with-an-ssh-private-key-on-linuxmac).

###  Set up DNS

If you host your DNS with Rackspace Cloud DNS, you can add a DNS record for your new WordPress stack. For information about adding a DNS record, see [Create DNS Records for cloud servers](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel). Point your domain to the public IP address of the load balancer that was created for you.

If you don't want to use public DNS with WordPress, modify your desktop's hosts file to point your domain to your new stack. For more information see [Modify your hosts file](/how-to/modify-your-hosts-file). Be sure to use the load balancer public IP address.

After you are finished, you can start using WordPress by navigating to the URL that you entered during the stack configuration.

### Related Articles

For more information about creating and working with stacks in Cloud Orchestration, see [Get started quickly with Rackspace Cloud Orchestration](/how-to/quick-set-up-with-rackspace-cloud-orchestration).
