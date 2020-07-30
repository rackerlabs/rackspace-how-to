---
permalink: installing-iis-on-windows-2012/
audit_date: '2020-07-20'
title: 'Install IIS on Windows 2012'
type: article
created_date: '2020-07-04'
created_by: Travis Gentry
last_modified_date: '2020-07-20'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to install Internet Information
Services (IIS) on Windows&reg; Server 2012.

#### Limitations

This task requires a user with administrative privileges on the server.

#### Install IIS by using Server Manager

1. [Log](https://support.rackspace.com/how-to/connect-to-a-cloud-server/) in to
   the server.

2. Press the **Start** button, type **Server Manager**, and press **Enter** to open
   the **Server Manager Dashboard** window.

3. In the upper right-hand corner, click **Manage**.

4. From the drop-down options, click **Add Roles and Features** to launch
   the **Add Roles and Features Wizard**.

5. Proceed through the **Add Roles and Features Wizard** until you reach the
   **Server Roles** section.

6. Click the box next to **Web Server (IIS)**, click **Add Features**, and click
   **Next**.

7. Proceed to the **Add Roles and Features Wizard** until you reach the
   **Role Services** section.

    You can keep the default selections or check role services to install
    for IIS, including FTP server, advanced logging options, and more.

10. Select all the desired role services and click **Next**.

11. In the **Confirmation** section, you can review your selections and,
    optionally, check the box to restart the server automatically after installation.

12. After reviewing the selections, click **Install**.

The **Add Roles and Features Wizard** displays a successful installation
message upon completion.

You can go back and install additional role services at any time. You can do further
configuration by using the **IIS Manager**, which you can find by pressing the **Start**
button and typing **IIS**.

#### Related articles

- [Install IIS and configure a
  website](https://support.rackspace.com/how-to/install-iis-and-configure-a-website/)
- [Configure an IIS FTP
  site](https://support.rackspace.com/how-to/configure-an-iis-ftp-site/)
- [Install an SSL
  certificate](https://support.rackspace.com/how-to/install-an-ssl-certificate/)
- [IIS SNI overview](https://support.rackspace.com/how-to/iis-sni-overview/)
