---
permalink: use-rackspace-orchestration-to-build-a-wordpress-stack/
audit_date: '2020-03-04'
title: Use Rackspace Orchestration to build a Wordpress stack
type: article
created_date: '2020-03-04'
created_by: Chris Silva
last_modified_date: '2020-03-06'
last_modified_by: Cat Lookabaugh
product: Cloud Orchestration
product_url: cloud-orchestration
---

This article shows you how to set up a functional Wordpress site by using Rackspace Orchestration.
The article also covers the steps necessary to scale out your Wordpress site by using saved images
and `lsycnd`. While you can customize your Orchestration Stacks, this guide uses the basic options
to get you up and running as quickly as possible.

By default, the Wordpress Orchestration template includes the following Cloud resources:

•	CentOS 7 General Purpose Server (1GB)
•	Cloud Database Instance running MySQL 5.6
•	Cloud Load Balancer (Port 80)

The Cloud server comes with the following configuration:

•	NGINX 
•	PHP 7.3
•	php-fpm
•	lsyncd (Installed but not configured by default on single server builds)
•	phpMyAdmin (Optional)
•	Latest version of Wordpress

**Note**
NGINX is not enabled to start on boot when the stack is built. If you need NGINX to start on boot, you
can run the following command on your server to enable NGINX on system startup:
	`systemctl enable nginx`

### Deploy a Wordpress stack

Use the following steps to deploy a Wordpress stack:

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click **Orchestration > Stack Templates**.
2. From the list of **Most Popular** stacks, hover over the Wordpress CMS box and click **Create Stack**. 
   Click on the **Create Stack** button in the pop-up box to accept the default **Production** option.
3. On the next page, specify the following information:
    - The Stack name (Display name in the portal)
    - The Stack region (Cloud Resources location)
    - The Wordpress Site domain (www.example.com)
    - The Wordpress Site title (The title diplayed in the browser tab for your site)
    - The Wordpress Admin email (For Wordpress Panel password resets)
    - The Wordpress Admin username (For logging into the Wordpress Panel)
    - The option to install phpMyAdmin (For remote MySQL access via phpMyAdmin)
4. Along with these default settings, you can specify the following:
    - Additional Security
	- Disable Password Authentication (Requires SSH keys to access remotely)
	- Install Fail2Ban (To automatically jail multiple failed remote connection attempts)
    - Advanced Options:
	- Cloud Database Flavor (RAM Size of the DB instance)
	- Secondary Template (For specifying a custom Stack Template for secondary servers)
	- Cloud Database Disk size (Data disk up to 1TB)
	- Cloud Server Flavor (Only allows for General Purpose servers up to 8GB)
	- Custom Ansible tarball for server deployment)
	- Number of secondary servers (Specify number of duplicate Cloud servers to be created in the stack)
	- Server Image (The Wordpress Stack only supports CentOS 7)
5. After you specify all of your customization options, click **Create Stack**.
6. The stack builds the resources necessary and configures the server and load balancer. You
   now have access to the credentials for your stack. Click **View Credentials** on the **Stack**
   page to see the following credentials:
    - Database User password
    - Wordpress Admin Username
    - Database Username
    - SSH Private Key
    - Wordpress Portal Password
7. After the status of the Stack shows as **Up**, you can access the individual resources of the Stack. 

### Make your Wordpress site accessible

At this point, you have a functional Wordpress website, however you need to do a few more steps
to get your site live and publicly accessible.

#### Log into your server

If you need to make any server-side changes, log into the master node, which is configured
with `lsyncd` for your web root. However, when you make changes on the master node, such as adding new
users or setting up special configurations, be sure to make the same changes on all other instances. 

Perform the following steps to access the master server:

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click **Orchestration > Stacks**.
2. Click on the server resource as listed in the **Infrastructure** section.
3. Connect to the server via Secure Shell (SSH) or the Emergency Console.
4. After you log in, you can make any custom changes to the server that you need.

#### Set up your DNS

To make your site publicly accessible, you need to create DNS records for your new domain. For this
section, you need the Load Balancer IP address. If you do not want to make the site pubiclly available
at this time, you can modify your host file to allow local access. For more information, see
[Modify your hosts file](https://support.rackspace.com/how-to/modify-your-hosts-file/).

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), select **Networking** >> **Cloud DNS**. 	
2. Click **Create Domain**.
3. Fill out the required information and click **Create Domain** in the popup box. 
4. Click **Add Record**.
5. For your first record, you can leave the **Hostname** blank. 
6. Add the IP address of your **Load Balancer** in the **Target (IP Address)** box. 
7. Leave the record type set to the default, **A/AAAA*. 
8. After you fill out the information, click **Add Record**.

Your website becomes publicly accessible as soon as the DNS record propagates globally.

**NOTE**
If you want to add a CNAME record for **www** or another subdomain, follow the preceding steps
but change the record type to **CNAME** and enter the desired subdomain.

#### Log in to your Wordpress panel

Now that your site is live, or you've modified your host file to access the page locally, you
can begin building your Wordpress website by using the Wordpress panel.

1. To log in to your Wordpress panel, navigate to http://yourdomain.com/wp-admin and log in
with the credentials the you chose when you deployed the stack.
2. After you log in, you can create your new Wordpress website. 


### Scale out your site

You now have a fully functional Wordpress stack based on NGINX at your disposal. The web
has thousands of resources and tutorials available to help you customize your site to fit
your business needs. As your business grows, you might find that your server is unable to
handle the traffic. At this point, consider scaling out your stack to handle the traffic. 

---

**Scaling Out vs Scaling Up**

One of the benefits of Cloud hosting is that you can quickly create new resources as you need
them. For best results, we never recommend that you scale your server *up* by adding more
resources to a single server. This creates a single point of failure and eventual cap to your
scalability. Instead, we recommend that you scale *out* by adding more servers to handle the 
traffic on your website. This enabless you to add more servers as you need them and lets you
reduce servers if your traffic flow subsides.

---

**Note**
This section assumes that the Stack was deployed with only one node.

#### Create an image

To scale out your Wordpress stack, first create an image of your master server and build
a new server from the image. To complete this task, see
[Create an image of a server and restore a server from a saved image](https://support.rackspace.com/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/). 

**IMPORTANT**: Make sure the server image that you create is the same size as the master
server to avoid bottlenecks and unbalanced server traffic.

#### Configure lsyncd

1. After you created your new server, log in to your master server via SSH.
2. Find the **Service Net IP address** for your newly created server on the **Server Details**
   page in the Control Panel. You need substitute this for **$ServiceNet IP*** in Step 5.
3. Edit **/etc/lsyncd/lsync.conf.lua**.
4. Locate the following lines:
	settings {
        logfile = "/var/log/lsyncd/lsyncd.log",
        statusFile = "/var/log/lsyncd/lsyncd-status.log",
        statusInterval = 20
        }
5. After the preceding lines, add the following lines to the config file:
	sync {
        default.rsync,
        source = "/var/www/vhosts",
        target = "$ServiceNet IP:/var/www/vhosts",
        excludeFrom="/etc/lsyncd/lsyncd.exclude.lua",
        rsync = {
                compress = true,
                acls = true,
                verbose = true,
                rsh = "/usr/bin/ssh -p 22 -o StrictHostKeyChecking=no",
                \_extra = {"-a"}
        	}
	}
6. Save and exit the file. 
7. Restart the `lsyncd` service. 

At this point, the master server syncs the changes that you made at the location
**/var/www/vhosts** directory to the new server. 

#### Add the new server to the load balancer

Now that you've configured the new server to sync with the master server, you need to add the new server as a node on your load balancer. 

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click **Orchestration > Stacks**.
2. Click the **Load Balancer** device listed under **Infrastructure**. 
3. On the **Load Balancer details** page, under the **Nodes** section, click **Add Cloud Servers**. 
4. Find and select the name of your newly created server in the list. 
5. Click **Add Selected Servers** to add the new server to your Load Balancer.

Your new server can now accept traffic for your domain. 

### Wrap up

If you followed this guide, you have now deployed a fully functional Wordpress website that is
ready to scale. You can deploy more websites if needed or customize your environment to fit your
business needs. 

Consider the following notes about your stack:

- As you add nodes to your stack, the **Infrastructure** section of the page does 
  not update to include the new nodes. 
- Your Cloud Database by default comes with 5 GB of storage. This automatically expands when
  storage reaches 98%. By default, the database takes daily backups, but you can also setup
  replication nodes from the **Cloud Database details** page if needed. 
- For security purposes, the Cloud Database does not enable the root user. You can enable it
  iby using the Cloud Database API, but you can also manage your Cloud Database users and databases
  from your Rackspace portal.
- If you opted to install phpMyAdmin, you can access your phpMyAdmin panel via the web at
  http://SERVERIP/phpMyAdmin.
- The Wordpress stack installs PHP-FPM, which you can customize as needed. Be sure to make any
  changes on all nodes. 
- This guide configured `lsync` to sync only the web directories, but you can customize the synced
  content in the master node `lsync` configuration file.

If you need any further information or assistance, you can reach out to us by raising a ticket or by calling support.
