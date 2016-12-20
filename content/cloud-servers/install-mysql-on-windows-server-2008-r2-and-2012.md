---
permalink: install-mysql-on-windows-server-2008-r2-and-2012/
audit_date: '2016-11-22'
title: Install MySQL on Windows Server 2008 R2 and 2012
type: article
created_date: '2013-07-22'
created_by: Rackspace Support
last_modified_date: '2016-11-22'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions for installing MySQL on Windows Server
2008 R2 and Windows Server 2012 by using the Microsoft Web Platform
Installer (Web PI). Web PI makes it easy to install a variety of
applications to your server.

### Download Web PI

Download the most recent version of Web PI on your server from
[http://www.microsoft.com/web/downloads/platform.aspx](http://www.microsoft.com/web/downloads/platform.aspx).

### Install MySQL

1.  Launch the Web PI application by running the **wpilauncher.exe** file that
    you downloaded in the preceding section.
2.  In the Web Platform Installer window, search for **MySQL** in the
    search box.
3.  Select **MySQL Windows 5.1** (or current version), click **Add**, and then
    click **Install** to start the installation.

    <img src="{% asset_path cloud-servers/install-mysql-on-windows-server-2008-r2-and-2012/install.png %}" width="629" height="471" />

4.  Provide a password for the **root** account of the server.

5.  Review the licensing agreement, and then click **I Accept**.

    The MySQL Windows 5.1 application is downloaded and installed on
    your server.

6.  After the installation is completed, click **Finish**.

**Note:** You can launch MySQL by running the `mysqld.exe` command from
the installation directory. By default, this directory is set to **C:\\Program
Files\\MySQL\\MySQL Server 5.1\\bin**.
