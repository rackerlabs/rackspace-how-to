---
permalink: creating-wordpress-stack-with-orchestration/
audit_date:
title: Rackspace Orchestration - Building a Wordpress Stack
Type: article
created_date: '2020-03-04'
created_by: Chris Silva
last_modified_date: 
last_modified_by: 
product: Cloud Orchestration
product_url: cloud-orchestration

---
This article is meant to assist with the process of setting up a functional Wordpress site by use of Rackspace Orchestration. This article will also cover the steps necessary to scale out your Wordpress site using Saved Images and Lsycnd. While there are several customizable aspects of setting up Orchestration Stacks, this guide intends on getting you up and running as quickly as possible.

By default, this Orchestration template includes the following Cloud resources:
•	CentOS 7 General Purpose Server (1GB)
•	Cloud Database Instance running MySQL 5.6
•	Cloud Load Balancer (Port 80)

The Cloud server comes with the following configuration:
•	NGINX 
•	PHP 7.4
•	php-fpm
•	lsyncd (Installed but not configured by default on single server builds)
•	phpMyAdmin (Optional)
•	Latest version of Wordpress

---
**Note**
It's important to note that NGINX is not enabled to start on boot when the stack is built. If you need NGINX to start on boot, you can run the following command on  your server to enable NGINX on system startup:
	`systemctl enable nginx`
---

## How to deploy a Wordpress Stack
1.	In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click on **Orchestration > Stack Templates**.
2.	From the list of Most Popular stacks, hover over the Wordpress CMS box and click **Create Stack. 
This action displays a pop-up box, however as Production is the only available build option, simply click on the **Create Stack** button in the pop-up box.
3.	On the page that opens, you are able to specify the following information:
- The Stack name (Display name in the portal)
- The Stack region (Cloud Resources location)
- The Wordpress Site domain (www.example.com)
- The Wordpress Site title (The title diplayed in the browser tab for your site)
- The Wordpress Admin email (For Wordpress Panel password resets)
- The Wordpress Admin username (For logging into the Wordpress Panel)
- The option to install phpMyAdmin (For remote MySQL access via phpMyAdmin)
4.	Along with these default settings, you can specify the following:
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
5.	Once you've specified all of your customization options, you can click on the **Create Stack** button.
6.	The Stack will now build the resources necessary and configure the server/load balancer. You now have access to the Credentials for your Stack. Click on the **View Credentials** button on the Stack page to see the following credentials:
	- Database User password
	- Wordpress Admin Username
	- Database Username
	- SSH Private Key
	- Wordpress Portal Password
7.	Once the status of the Stack shows as **Up**, you now have access the individual resources of the Stack. 

## Making your Wordpress site live
At this point, you now have a functional Wordpress website, however there are a few steps required to get your site live and publicly accessible.
# Logging into your server
If you have any server side changes that need to be made, you can log into the master node. This node is configured with lsyncd for your web root, but any new users or special configurations you make to the master server will need to be done on all instances. To access the master server:
1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click on **Orchestration > Stacks**.
2. Click on the server resource as listed in the **Infrastructure** section.
3. Connect to the server via SSH or Emergency Console.
4. Once logged in, you can make any custom changes needed on the server.
# Setting up your DNS
In order to make your site publicly accessible, you will need to create DNS records for your new domain. For this section, you will need the Load Balancer IP address. If you do not want to make the site pubiclly available at this time, you can modify your host file to allow local access. More information [here](https://support.rackspace.com/how-to/modify-your-hosts-file/)
1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), **Networking** >> **Cloud DNS**. 	
2.	Click the **Create Domain** button.
3.	In the box that opens, fill out the required information and click the **Create Domain** in the same box. 
4.	Click on the **Add Record** button.
5.	In the box that opens, ,as this is your first record, you can leave the **Hostname** blank. Add the IP of your **Load Balancer** in the **Target (IP Address) box. The record type should be **A/AAAA*. Once the information is filled out, click **Add Record**.
6.	Once the DNS record has propagated globally, your website will be publicly accessible.
---

**NOTE**
If you want to add a CNAME record for www or another subdomain, follow the above steps but change the record type to **CNAME** and enter the desired subdomain.

---
# Logging into your Wordpress Panel
Now that your site is live (or you've modified your host file to access the page locally), you can begin building your Wordpress website through the Wordpress panel. 
1. To login to your Wordpress panel, login with the credentials (as noted above) at http://yourdomain.com/wp-admin
2. Once you've logged in, you're able to create your new Wordpress website. 


## Scaling Out
You now have a fully functional Wordpress stack based on NGINX at your disposal. There are thousands of resources and tutorials available online to help you customize your site to fit your business needs. As your business grows, you may find that your server is unable to handle the traffic. At this point, you may consider scaling out your stack to handle the traffic. 

---

**Scaling Out vs Scaling Up**
One of the benefits of Cloud hosting is the ability to quickly create new resources as you need them. For best results, we never recommend scaling your server **UP** by adding more resources to a single server. This creates a single point of failure and eventual cap to your scalability. Instead, we recommend scaling out by adding more servers to handle the traffic on your website. This allows you to add more servers as you need them and have the ability to reduce servers if your traffic flow subsides.

---

**For the following section, the steps will assume that the Stack was deployed with only one node.**

The first step in scaling out your Wordpress stack is to create an image of your master server and build a new server from the image. This article goes over the steps necessary to complete this task. [Create an image of a server and restore a server from a saved image](https://support.rackspace.com/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/). 

**IMPORTANT**: Make sure the server image you create is the same size as the master server to avoid bottlenecking and unbalanced server traffic.

1. Once you've created your new server, you will need to access your master server via SSH.
2. After you've logged in, you will be editing the file at **/etc/lsyncd/lsync.conf.lua**.
3. Once you begin editing this file, you will see the following:
	```settings {
        logfile = "/var/log/lsyncd/lsyncd.log",
        statusFile = "/var/log/lsyncd/lsyncd-status.log",
        statusInterval = 20
        }
4. You will need to add the following lines to this config file:
	```sync {
        default.rsync,
        source = "/var/www/vhosts",
        target = "$ServiceNet IP:/var/www/vhosts",
        excludeFrom="/etc/lsyncd/lsyncd.exclude.lua",
        rsync = {
                compress = true,
                acls = true,
                verbose = true,
                rsh = "/usr/bin/ssh -p 22 -o StrictHostKeyChecking=no",
                _extra = {"-a"}
        		}
			}
5. In the above section, you will need to add the **Service Net IP address** for your newly created server. This can be found on the Server Details page. 
6. Save and exit the file. 
7. Restart the lsyncd service. 
At this point, the master server will sync the changes made at the location `/var/www/vhosts` directory to the new server. 

# Adding new server to the Load Balancer
Now that you've configured the new server to sync with the master server, you need to add the new server as a node on your Load Balancer. 

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click on **Orchestration > Stacks**.
2. Click on the **Load Balancer** device listed under **Infrastructure**. 
3. On the Load Balancer details page, under the **Nodes** section, click the **Add Cloud Servers** button. 
4. In the box that opens, find and select the name of your newly created server in the list. 
5. Click the **Add Selected Servers** button to add the new server to your Load Balancer.


Your new server is now configured to accept traffic for your domain. 


## Wrapping Up
If you've followed this guide, you have now deployed a fully functional Wordpress website that is ready to scale. You can now deploy more websites if needed or customize your environment to fit your business needs. A few things to note about your Stack
	- As you add nodes to your Stack, the **Infrastructure** section of the page will not update to include the new nodes. 
	- Your Cloud Database by default comes with 5 GB of storage. This will automatically expand once storage reaches 98%. The Database is automatically configured with daily backups but you can also setup replication nodes from the Cloud Database details page if needed. 
	- For security purposes, the Cloud Database does not have the root user enabled. This can be enabled if needed via Cloud API, but your Cloud database users and databases can be managed directly from your Rackspace portal.
	- If you opted for installing phpMyAdmin, you can access your phpMyAdmin panel via the web at http://SERVERIP/phpMyAdmin 
	- PHP-FPM is installed as part of your Wordpress stack and is available for customization if needed. These changes will need to be made on all nodes. 
	- In this guide, lsync was only configured to sync the web directories, however you can customize the synced content via the master node lsync configuration file.

If you require any further information or assistance, you can reach out to us by riasing a ticket or by calling in for support.
