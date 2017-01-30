---
permalink: installing-active-directory-on-windows-server-2012/
audit_date: '2016-06-30'
title: Install Active Directory on Windows Server 2012
type: article
created_date: '2013-04-03'
created_by: Rackspace Support
last_modified_date: '2016-06-30'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This article will walk you through setting up the Active Directory Role
on a Windows Server 2012. This article is intended to be used for those
without an existing Active Directory Forest, it will not cover
configuring a server to act as a Domain Controller for an existing
Active Directory Forest.

**Note**: For information on setting up the Active Directory Domain
Services (AD DS) on Microsoft Windows Server 2008 R2 Enterprise 64-bit (W2K8),
see [Install Active Directory Domain Services on Windows Server 2008 R2 Enterprise 64-bit](/how-to/installing-active-directory-domain-services-on-windows-server-2008-r2-enterprise-64-bit).

### Install Active Directory

1. Open the **Server Manager** from the task bar.

2. From the **Server Manager** Dashboard, select **Add roles and features**.

   This will launch the Roles and Features Wizard allowing for modifications
   to be performed on the Windows Server 2012 instance.

3. Select **Role-based or features-based** installation from the
   Installation Type screen and click **Next**.

   **Note**: Roles are the major feature sets of the server, such as IIS, and
   features provide additional functionality for a given role.

4. The current server is selected by default. Click **Next** to proceed to
   the Server Roles tab.

5. From the Server Roles page place a check mark in the check box next
   to **Active Directory Domain Services.** A notice will appear explaining
   additional roles services or features are also required to install domain
   services, click **Add Features**.

   **Note**: There are other options including, Certificate services,
   federation services, lightweight directory services and rights management.
   Domain Services is the glue that holds this all together and needs to be
   installed prior to these other services.

6. Review and **select optional features** to install during the AD DS
   installation by placing a check in the box next to any desired features,
   and then click **Next**.

   <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/features_0.png %}" width="700" height="496" />

7. Review the information on the **AD DS tab** and click **Next**.

8. On the **Confirm installation selections** screen, review the installation
   and then click **Install**.

   **Note**: The installation progress will be displayed on the screen. Once
   installed, the AD DS role will be displayed on the 'Server Manager' landing
   page.

### Start remote registry service

Before promoting the server to domain controller, the remote registry service
must be started.

1. Click **Start > Control Panel**.

2. Under **Services**, right-click **Remote Registry** and open the
   **Properties** menu.

3. From the *Startup type:** drop-down menu, select **Automatic**.

4. Under **Service Status**, select **Start**.

The  remote registry service will start.

### Configure Active Directory

Once the AD DS role is installed the server will need to be configured
for your domain.

1. If you have not done so already, **Open the Server Manager**
from the task bar.

2. Open the Notifications Pane by selecting the **Notifications
icon** from the top of the Server Manager. From the notification
regarding configuring AD DS, click **Promote this server to a domain
controller**.

   <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/promote.png %}" width="705" height="502" />

3. From the Deployment Configuration tab select **Add a new forest**
from the radial options menu. Insert your root domain name into the
**Root domain name** field, and then click **Next**.

4. Select a Domain and Forest functional level, and then input a password for the Directory Services Restore Mode (DSRM) in the provided password fields.

   The DSRM password is used when booting the Domain Controller into recovery mode.

   **Note**: The selection made here will have lasting effects to features and server domain controller eligibility. For further information on Domain/Forest functional levels, see official Microsoft documentation.

5. Review the warning on the DNS Options tab and select **Next**.

6. Confirm or enter a NetBIOS name and click **Next**.

7. Specify the location of the Database, Log files, and SYSVOL folders
and then click **Next**.

8. Review the configuration options and click **Next**.

9. The system checks to ensure all necessary prerequisites are
installed on the system prior to moving forward. If the system passes
these checks, proceed by clicking **Install**.

   **Note**: The server automatically reboots after the installation is complete.

After the server reboots, reconnect to it via RDP. Congratulations
on successfully installing and configuring a Active Directory Domain
Services on Windows Server 2012.
