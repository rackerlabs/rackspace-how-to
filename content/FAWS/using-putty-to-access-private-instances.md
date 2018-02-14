---
permalink: access-a-private-rds-instance-with-putty
audit_date: '2017-09-26'
title: Access a private RDS instance with Putty
type: article
created_date: '2017-03-07'
created_by: Gustavo Panizzo
last_modified_date: '2017-09-26'
last_modified_by: Nate Archer
product: Fanatical Support for AWS
product_url: fanatical-support-for-aws
---

Rackspace builds your Fanatical Support for AWS (FAWS) environment on private networks. Therefore, if a customer uses an RDS database in their environment, that database must be accessed through a site-to-site VPN.

Customers without a site-to-site VPN can access their RDS private instance with Putty by using the following steps:

### Prerequisites

Accessing your private instance requires the following:

   - SSH access to a Linux EC2 instance with a public IP address. This instance can be an EC2 instance within your Rackspace environment or your own AC2 instance.
   - Network access to the RDS instance you want to access. For more information on FAWS user management, see [User management and permissions](https://manage.rackspace.com/docs/product-guide/access_and_permissions/user_management_and_permissions.html)
   - A local machine with windows and Putty installed.
   - A MySQL application such as MySQL Workbench.

### Connect to to private RDS instance

1. Configure an SSH tunnel by finding the host name for the RDS instance you want to access. This host name should have been provided through email when you signed up for FAWS.
2. Open Putty, right click the main screen, and select **Change settings**.
3. Select **Tunnels** under SSH.
4. In the destination box, paste the RDS instance hostname followed by port number for the application for which you are using the connect. For example, if you are using MYSQL, enter source port `:3306`. This source port is used to access your RDS instance.
5. Click **Add** > **Apply**.
6. Connect to your EC2 instance using SSH. If you are using an EC2 instance inside your Rackspace FAWS environment, you can find your public IP address for the EC2 instance by logging into the [FAWS control panel](https://login.rackspace.com/). This instance acts as your bastion server.
7. Open your MySQL application, and click **Connect to database**.
8. Enter hostname `127.0.0.1` followed by the username and password provided to you by Rackspace. Click **Save password**.

   You can now access files inside your RDS database using the MySQL application.
