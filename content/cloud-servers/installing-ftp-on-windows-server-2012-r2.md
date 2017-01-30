---
permalink: installing-ftp-on-windows-server-2012-r2/
audit_date:
title: Install FTP on Windows Server 2012 (R2)
type: article
created_date: '2013-04-09'
created_by: Rackspace Support
last_modified_date: '2016-06-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Installation Requirements

Prior to installing FTP the IIS 8.x role must be added to the Windows
Server 2012 (R2) instance. If you have previously installed the IIS role
without FTP support this article will walk you through setting it up.

### Installing FTP on Windows Server 2012 (R2)

1. Open the **Server Manager** from the task bar.

2. From the Server Manager Dashboard click **Add Roles and Features**.

3. From the Installation Type section select **Role-based or
feature-based installation** and click **Next**.

   **Note**: Roles are the major feature sets of the server, such as IIS, and features provide additional functionality for a given role.

4. The current server will be selected by default. Click **Next**
to move to the Server Roles selection tab.

5. From the Server Roles tab expand the **Web Server
(IIS)** dropdown and place a check in the box for **FTP Server**. Click
**Next** to move to the Features selection tab.

   <img src="{% asset_path cloud-servers/installing-ftp-on-windows-server-2012-r2/server_roles_ftp.png %}" width="751" height="563" />

6. Select any additional features desired for your IIS deployment and
click **Next.**

   **Note**: These Features can also be added at any point in the future through the setup wizard. A brief description of each feature is shown on the right hand pane of the Wizard. Select a feature to read its description. See official Microsoft documentation to learn more about each feature.

7. Review your installation and click **Install**.

8. A progress bar shows you the status of the installation. When the installation is complete, the wizard displays a success notification.
