---
permalink: installing-active-directory-on-windows-2012
audit_date:
title: Installing Active Directory on Windows 2012
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-11'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---

### Set up services

1. On the **Start Menu**, click **Server Manager**.
2. Click **Tools > Services**. The services screen appears.
3. Scroll down to and right-click **Remote Registry** and select **Start**.
4. If the **Startup Type** is set to **Disabled**, click **Properties** and change it to **Automatic**.
5. Start the service.
6. After the remote registy starts, close the **Services** window.

### Installing Active Directory

1. On the **Server Manager** screen, click **Manager** and choose **Add Roles and Features**.
2. On the **Before you begin** screen, click **Next**.
3. For the **Installation Type**, click **Next** to move to the next screen.
4. On the **Server Selection** screen, click **Next** as the local server is enabled by default.
5. On the **Server Roles** screen, select **Active Directory Domain Services**. A pre-requisites screen appears.
6. Select **Add Features**.
7. On the **Add Roles** screen, click **Next** to move to the next screen and then click **Next** again to go past features. The **Things to Note** screen appears.
8. Click **Next** to move to the **Confirmation** screen.
9. Select **Restart the destination server automatically**, if required, and then click **Install**.

After the installation completes, the server reboots automatically. 

### Setting up Active Directory

1. On the **Start Menu**, click **Server Manager**.
2. Select **AD DS** and the **More** field under **Configuration required for Active Directory Domain Services**.
3. Click **Promote this server to a domain-controller**.
4. Select **Add a new forest**, type your domain, click **Next**.
5. Choose your forest functional level. If this is a completely new domain, we recommend that you use the highest functional level possible.
6. Choose your restore mode password and click **Next**.
7. On the **DNS options** tab, select your DNS zone or choose **Create DNS delegation**. The **Additional Options** screen automatically populates with your domain name.
8. On the **Paths** screen, choose where you’d like to save the various files.
9. Click **Next**. The system runs a prerequisites check. Address any errors that may arise.
10. After the prerequisite check passes, click **Install**.

When the installation completes, the server logs you out, afterwhich you can sign in with your new domain.
