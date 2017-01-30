---
permalink: quick-start-guide-create-your-first-website-on-cloud-servers/
audit_date:
title: Create your first website on Cloud Servers quickly
type: article
created_date: '2013-11-11'
created_by: David Hendler
last_modified_date: '2016-07-07'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The Rackspace Cloud can save you both time and money. This guide shows
you how to do both by explaining the basic process of turning your idea
into a working site in three basic steps:

1.  Build the infrastructure
2.  Upload your code
3.  Test

The project that you're bringing to the cloud is probably much more
complicated than what this guide covers. However, the process that this
guide uses applies to the successful deployment of any web site or
application.

This guide is not a comprehensive tour of Cloud Servers. However, by
following these instructions, you are establishing the fundamentals that
you can build on by reading future articles and guides.

### Prerequisites

The information in this guide is practical. You should follow along step
by step. To do so, you might need to install the following software:

**Mac OS X**

-   Mac OS X already has Terminal.app, but you can download
    [iTerm](http://iterm.sourceforge.net/) if you prefer
-   [Cyberduck](http://cyberduck.ch/) SFTP has built-in support for
    Rackspace [Cloud Files](http://www.rackspace.com/cloud/files/)

**Windows**

-   If you don't already have an SSH client, download
    [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html/)
-   If you don't already have an SFTP client that supports SFTP,
    download [FileZilla](https://filezilla-project.org/)

You also will need a website to upload to your cloud server. To save
time you can use an HTML file created for this exercise. Download it
[here](http://90df0b8db988dcfbf5da-c1875553a16f2a6d80002cac1a22fc37.r75.cf1.rackcdn.com/index.html)
(right-click to save the file).

### Build the infrastructure

In this section, you create your server, connect to it, and install the
Apache web server package to turn the server into a web server.

#### Create a cloud server

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com), using the user name and password that you entered when you created your account.

   The control panel supports many Rackspace products and services. Each component of this interface, and all of our products and services, are explained in other articles and videos (for example, [Introducing the Cloud Control Panel](/how-to/introducing-the-rackspace-cloud-control-panel)). This guide focuses on deploying your first cloud server.

2.  On the Cloud Servers page, which is displayed whenever you log in,
    click **Create Server**.

    In most cases, you can deploy the right infrastructure with just a
    few clicks.

    You have a large amount of control when creating a new cloud server,
    but to keep things simple this guide focuses on the three required
    parts: name, image, and size.

3.  Name your Cloud Server.

    The name of your cloud server should communicate its role (for
    example, web server or database) and what it's hosting.

4.  Select an image.

    The image that you select contains both the OS and
    preselected software.

5.  Select a flavor.

    Flavor refers to the server's capacity for CPU, RAM, and hard drive.
    You can think of flavor as the "size" of the server. When you need
    more power, you want to select a "bigger" Cloud Server, so you
    select a higher capacity flavor. Because this is a test server, save
    some money and select the 1 GB General Purpose flavor.

6.  Click **Create Server**.

    A pop-up window is displayed with your server's Root Admin Password.
    You need this password to connect to the server later in this guide,
    so copy it before you click **Dismiss Password**.

7.  Verify that the build is complete.

    The time it takes for your cloud server to build depends on the
    image and flavor that you selected. The server is finished building
    and is ready for a connection when the Server Status is **Active**.

8.  Copy the public IP address.

    Now that you have an active cloud server, you need to make it a
    web server. You do this by connecting to it and installing the
    Apache web server package. You use the server's IPv4 address
    (PublicNet), which you can find in the **Networks** section of the
    server's detail view. Copy the address for later use.

#### Connect to your server

You can connect to a server in several ways, but the standard and most
secure method is called Secure Shell, or SSH. It allows you to send
information to and from your server in a secure fashion.

1.  Connect from either a Mac OS X or Windows Computer.
    -   **Connect from Mac OS X**

        You can connect to your cloud server from a Mac OS X computer by
        running the SSH command in Terminal.app or iTerm (if you
        downloaded that at the beginning of the guide). You can find the
        command to use SSH in the right-side bar of the server detail
        page of the Cloud Control Panel.

        Copy this command and paste it into your terminal, or click it
        and Terminal.app opens for you.

    -   **Connect from Windows**

        You can use the PuTTY SSH client to connect to your server from
        a Windows computer. For instructions, see [Connecting to Linux from Windows by using PuTTY](/how-to/connecting-to-linux-from-windows-by-using-putty).

        The first time that you connect to a cloud server, your computer
        verifies that this is something you want to do.

2.  Type **yes** and then press **Enter**.

3.  Type or paste the password that you copied in step 6 when you
    created the server.

    If the password is correct, you connect to your server. You will see
    a screen similar to the following one:

    <img src="{% asset_path cloud-servers/quick-start-guide-create-your-first-website-on-cloud-servers/3768.16.png %}" width="716" height="456" />

#### Install Apache

To install Apache, enter the following command in the terminal window:

    apt-get install apache2 -y

Some information scrolls by in your terminal window. This is your server
downloading and installing Apache and any software Apache might need to
operate correctly.

#### Test Apache with your web browser

After the command is finished running, ensure that Apache is installed
and turned on. Put the (PublicNet) IPv4 address of your cloud server
into a web browser. If you see the message "It works!", you now have a web
server installed on your cloud server.

### Upload your code

The next step is to upload your site. You might be familiar with File
Transfer Protocol (FTP) as a way to upload files to and download files
from another computer. Rackspace Cloud Servers uses SSH File Transfer
Protocol (SFTP) for added security, so you need an FTP client that will
support an SFTP connection. Fortunately, many of the popular and free
FTP clients do this.

#### Establish an SFTP connection with your server by using Cyberduck

1.  In the Cyberduck interface, click **Open Connection**.
2.  Select **SFTP (SSH File Transfer Protocol)**.
3.  For **Server**, type the IP address of the cloud server.
4.  For Username, enter **root**.
5.  For **Password**, enter the root user's password.
6.  Click **Connect**.

### Upload your site

If you haven't already downloaded the sample HTML file, download it
from [here](http://90df0b8db988dcfbf5da-c1875553a16f2a6d80002cac1a22fc37.r75.cf1.rackcdn.com/index.html).

You cannot upload your HTML file just anywhere on the Cloud Server.
Apache is configured to look in a specific directory for content to
serve on the web. This special directory is referred to as the
**DocumentRoot**.

On an Ubuntu server, the DocumentRoot is located at **/var/www**, so that's
where you need to upload your file. Navigate to that directory in
Cyberduck by using the following steps:

You're now in the DocumentRoot directory.

You should see an **index.html** file already in the directory. This is
the "It works!" file that you saw when you tested Apache in your browser
earlier.

1.  Select the **I** directory by using the drop-down menu at the top of
    the window.

2.  Double-click the **var** directory.

3.  Double-click the **www** directory.

4.  Replace the **index.html** file with your own file by dragging the
    new **index.html** file into Cyberduck.
5.  When Cyberduck asks if you want to overwrite the existing file,
    click **Continue**.

### Test your site

Now that the correct HTML file is uploaded to the correct directory, you
should see your site when you refresh your browser.

<img src="{% asset_path cloud-servers/quick-start-guide-create-your-first-website-on-cloud-servers/3768.26.png %}" width="764" height="719" />

Congratulations! In a short period of time, you deployed a cloud server,
connected to it via SSH, installed the Apache web server, uploaded a new
HTML file to the server's DocumentRoot directory, and tested the site in
a web browser.

### Next steps

Several resources are available to help you progress:

-   [Rackspace How-To](/how-to/) - Information about all Rackspace products
-   [Cloud Launch Guides](https://launch.rackspace.com/) - Step-by-step
    guides on how to build and deploy cloud services
-   [The Rackspace Community](https://community.rackspace.com/) -
    Discuss ideas with Rackers and other customers
-   [Fanatical Support](http://www.rackspace.com/support)
