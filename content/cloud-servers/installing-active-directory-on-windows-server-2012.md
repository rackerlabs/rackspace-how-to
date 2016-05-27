---
permalink: installing-active-directory-on-windows-server-2012/
audit_date:
title: Install Active Directory on Windows Server 2012
type: article
created_date: '2013-04-03'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article will walk you through setting up the Active Directory Role
on a Windows Server 2012. This article is intended to be used for those
without an existing Active Directory Forest, it will not cover
configuring a server to act as a Domain Controller for an existing
Active Directory Forest.

### Installing Active Directory

1. Open the **Server Manager** from the task bar.

2. From the **Server Manager** Dashboard, select **Add roles and features**.

This will launch the Roles and Features Wizard allowing for
modifications to be performed on the Windows Server 2012 instance.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/server_manage.png %}" width="695" height="494" />

3. Select **Role-based or features-based** installation from the
Installation Type screen and click **Next**.

  **Note**: Roles are the major feature sets of the server, such as IIS, and
features provide additional functionality for a given role.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/roles_based.png %}" width="699" height="499" />

4. The current server is selected by default. Click **Next** to
proceed to the Server Roles tab.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/server_selection_1.png %}" width="696" height="495" />

5. From the Server Roles page place a check mark in
the box next to **Active Directory Domain Services.** A notice will
appear explaining additional roles services or features are also
required to install domain services, click **Add Features**.

  **Note**: There are other options including, Certificate services,
federation services, lightweight directory services and rights
management. Domain Services is the glue that holds this all together and
needs to be installed prior to these other services.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/add_features.png %}" width="428" height="446" />

6. Review and **select optional features** to install during the AD DS
installation by placing a check in the box next to any desired features;
Once done click **Next**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/features_0.png %}" width="700" height="496" />

7. Review the information on the **AD DS tab** and click **Next**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/ad_ds.png %}" width="699" height="496" />

8. Review the installation and click **Install**.

  **Note**: The installation progress will be displayed on the screen.
Once installed the AD DS role will be displayed on
the 'Server Manager' landing page.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/ad_install.png %}" width="701" height="495" />

### Configuring Active Directory

Once the AD DS role is installed the server will need to be configured
for your domain.

1. If you have not done so already, **Open the Server Manager**
from the task bar.

2. Open the Notifications Pane by selecting the **Notifications
icon** from the top of the Server Manager. From the notification
regarding configuring AD DS click **Promote this server to a domain
controller**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/promote.png %}" width="705" height="502" />

3. From the Deployment Configuration tab select **Add a new forest**
from the radial options menu. Insert your root domain name into the
**Root domain name** field.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/new_forrest.png %}" width="706" height="517" />

4. Review and **select a Domain and Forest functional level**. Once
selected **fill in a DSRM password** in the provided password fields.
The DSRM password is used when booting the Domain Controller into
recovery mode.

  **Note**: The selection made here will have lasting effects to features and
server domain controller eligibility. For further information on
Domain/Forest functional levels see official Microsoft documentation.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/domain_forest.png %}" width="705" height="516" />

5. Review the warning on the DNS Options tab and select **Next**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/dns_options.png %}" width="706" height="516" />

6. Confirm or enter a NetBIOS name and click **Next**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/netbios.png %}" width="707" height="517" />

7. Configure the location of the SYSVOL, Log files, and Database folders
and click **Next**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/paths.png %}" width="738" height="539" />

8. Review the configuration options and click **Next**.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/review.png %}" width="740" height="541" />

9. The system will check to ensure all necessary prerequisites are
installed on the system prior to moving forward. If the system passes
these checks you will proceed by clicking **Install**.

  **Note**: The server will automatically be rebooted once the installation
completes.

  <img src="{% asset_path cloud-servers/installing-active-directory-on-windows-server-2012/promote_ad.png %}" width="740" height="541" />

After the server is done rebooting, reconnect via RDP. Congratulations
on successfully installing and configuring a Active Directory Domain
Services on Windows Server 2012.
