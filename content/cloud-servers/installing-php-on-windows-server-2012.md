---
permalink: installing-php-on-windows-server-2012/
audit_date:
title: Install PHP on Windows Server 2012
type: article
created_date: '2013-04-22'
created_by: Rackspace Support
last_modified_date: '2016-07-01'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article details installing, testing, and configuring PHP on the
Windows Server 2012. The article uses the Microsoft Web Platform
Installer (Web PI) method of installation. It does not cover the use
case of installing PHP from source.

### Prerequisites

Successfully installing PHP on a Windows Server 2012 requires a prior
installation of the IIS framework.

### Install PHP with Web PI

1. Open the Web PI application from the following location on your
filesystem.

       C:\Program Files\Microsoft\Web Platform Installer\WebPlatformInstaller.exe

   **Note**: If the Web PI application is not currently installed, you can download it via the following link: [Web PI](http://www.microsoft.com/web/downloads/platform.aspx)

2. Search for PHP.

3. Select **Add** next to the version of PHP you wish to install and
click **Install**.

   **Note**: At the time of writing, the available PHP versions are 5.3.19 and 5.4.9.

   <img src="{% asset_path cloud-servers/installing-php-on-windows-server-2012/php_webpi.png %}" width="854" height="584" />

4. When prompted to Accept the License terms, review and click **I
Accept**.

5. Click **Finish** once the installation is finalized. The PHP runtime
environment will be stored on your local file system at the following
location:

       C:\Program Files (x86)\PHP\%version

### Test PHP

Once you have successfully installed PHP you can test its functionality
with a few simple steps.

1. Create a file using a texteditor and insert the following code
snippit.

       <?php phpinfo(); ?>

2. This code, when run, presents detailed information about the
current PHP configuration of the local system. Save the
file as 'info.php' in the IIS root directory.

   **Note**: The default directory is **C:\\inetpub\\wwwroot**.

3. Open a Web browser and go to the following URL:

    http://localhost/info.php

   With PHP successfully installed a screen will be presented detailing the PHP configuration.

   **Note**: This information can be sensitive so be sure to delete or move the **info.php** file after the installation is successfully tested.

   <img src="{% asset_path cloud-servers/installing-php-on-windows-server-2012/php_info.png %}" width="861" height="611" />

### Customize PHP

Configuration parameters for PHP are stored in the php.ini file, which
resides in the root of the local installation.

1. Open File Explorer and path to the PHP configuration (php.ini) file.

   **Note**: The currently loaded configuration file can be found by leveraging the `phpinfo();` script in the preceding section.

2. Open the file with text editor and perform any necessary modifications.

   **Note**: Explaining the php directives that can be modified is beyond the scope of this article. Those seeking additional assistance should consult the official [PHP Manual](http://php.net/manual/en).

3. Save the file once you have completed modifications.

4. Next, **restart the IIS service** to load any configuration changes.

   To do so, open the **Server Manager** from the task bar.

5. From the **Tools** menu select **Internet Information Services
(IIS)** Manager. Select the server on the right hand screen and click
**Restart** in the Manage Server section.

### Modify the Default Document settings

To ensure php content is served as the first option the default document
setting within the IIS Manager needs to be modified. This section will
detail how to modify the Default Document setting within the IIS Manager
to perform just this.

1. Open the **Server Manager** from the task
bar.

2. From the **Tools** menu click **Internet Information Services
(IIS) Manager**.

3. In the Internet Information Services (IIS) Manager select the
server homepage.

4. Double-click the **Default Document** option.

5. Select the **index.php** option and move it to the top of the
list.

   <img src="{% asset_path cloud-servers/installing-php-on-windows-server-2012/php_top.png %}" width="876" height="624" />

6. IIS will now serve **index.php** files from the **wwwroot** folder
before all other document types.
