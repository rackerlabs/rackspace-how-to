---
permalink: installing-active-directory-on-windows-server-2012/
audit_date: '2018-09-27'
title: Install Active Directory on Windows Server 2012
type: article
created_date: '2013-04-03'
created_by: Rackspace Support
last_modified_date: '2018-09-27'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article walks you through the process of setting up the Active
Directory&trade; role on a Microsoft&reg; Windows Server&trade; 2012 server.
This article is intended for users who don't have an existing Active Directory
forest. It does not cover how to configure a server to act as a domain
controller for an existing Active Directory forest.

**Note**: For information about setting up the Active Directory Domain
Services (AD DS) role on Microsoft Windows Server 2008 R2 Enterprise 64-bit (W2K8), see [Install Active Directory Domain Services on Windows Server 2008
R2 Enterprise
64-bit](/how-to/installing-active-directory-domain-services-on-windows-server-2008-r2-enterprise-64-bit).

### Install Active Directory

Use the following steps to install Active Directory on the server:

1. Open the **Server Manager** from the task bar.

2. From the **Server Manager** Dashboard, select **Add roles and features**.

    The Roles and Features Wizard launches. This wizard enables you to
    make modifications to the Windows Server 2012 instance.

3. On the **Installation Type** screen, select **Role-based or
   features-based** and click **Next**.

    **Note**: Roles represent the major feature sets of the server, such as
    IIS. Features provide additional functionality for a given role.

4. By default, the current server is selected. Click **Next**.

5. On the **Server Roles** page, select the check box next to **Active
   Directory Domain Services.**

    A notice displays that explains that you must also install additional
    roles, services, or features in order to install Domain Services. These
    additional capabilities include certificate services, federation services,
    lightweight directory services, and rights management.

    To select additional capabilities, click **Add Features**.

6. Under **Select optional features**, select the check boxes next to the
   features that you want to install during the AD DS installation process and
   click **Next**.

    <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/features_0.png %}" width="700" height="496" />

7. Review the information on the **AD DS** tab, then click **Next**.

8. Review the information on the **Confirm installation selections** screen,
   then click **Install**.

    **Note**: Information on the the progress of the installation displays.
    After the installation is complete, the AD DS role displays on the Server
    Manager landing page.

### Start the remote registry service

Before you can promote the server to domain controller, you must start the
remote registry service by using the following steps:

1. Click **Start > Control Panel**.

2. Under **Services**, right-click **Remote Registry** and open the
   **Properties** menu.

3. From the *Startup type:** drop-down menu, select **Automatic**.

4. Under **Service Status**, select **Start**.

    The remote registry service starts.

### Configure Active Directory

After you have installed the AD DS role you must configure the server
for your domain by using the following steps:

1. From the task bar, click **Open the Server Manager**.

2. Select the Notifications icon at the top of the Server Manager window.

    The Notifications Pane opens. From the notification about configuring AD DS, click **Promote this server to a domain controller**.

    <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/promote.png %}" width="705" height="502" />

3. From the **Deployment Configuration** tab, select **Radial options > Add a
   new forest**. Enter your root domain name in the **Root domain name** field
   and click **Next**.

4. Select a **Domain** and a **Forest functional level**.

    **Note**: These selections affect features and server domain controller
    eligibility. For further information on domains and forest functional
    levels, see the official Microsoft documentation.

    Enter a password for Directory Services Restore Mode (DSRM) in the **Password** field.

    **Note**: The DSRM password is used when booting the Domain Controller
    into recovery mode.

5. Review the warning on the DNS Options tab and select **Next**.

6. Confirm or enter a NetBIOS name and click **Next**.

7. Specify the locations of the **Database**, **Log files**, and **SYSVOL
   folders** and then click **Next**.

8. Review the configuration options and click **Next**.

9. The system checks if all of the necessary prerequisites are installed on
   the system before you can proceed. If the system passes these checks, click
   **Install**.

    **Note**: The server automatically reboots after the installation is
    complete.

10. After the server reboots, reconnect to it by using Microsoft Remote Desktop
    Protocol (RDP).
