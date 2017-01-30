---
permalink: accelerating-wordpress-with-cloud-files-cdn-and-the-w3-total-cache-plugin/
audit_date:
title: 'Accelerate WordPress with Cloud Files, CDN, and the W3 Total Cache Plugin'
type: article
created_date: '2012-07-16'
created_by: Rackspace Support
last_modified_date: '2015-11-12'
last_modified_by: Nate Archer
product: Cloud Files
product_url: cloud-files
---

You can enhance your WordPress blog by using Cloud Files with content delivery network (CDN) 
technology to display content to users faster and more efficiently. You can distribute 
common files or content such as CSS, JavaScript, images, videos and much more through a CDN, 
which serves the content from the closest edge server to the end user.

The following steps are best practices and have been tested and verified to optimize 
performance on a default installation of WordPress with the default theme. This process was 
last tested using WordPress version 3.8 and W3 Total Cache plugin version 0.9.3.

**Note:** This article assumes that you have already completed the installation of your 
WordPress website and database. If you have not completed this, go 
[to Installing WordPress on Cloud Sites](/how-to/installing-wordpress-on-cloud-sites/).

### Step 1

Download the W3 Total Cache WordPress plugin from the 
[W3 Total Cache website](http://wordpress.org/extend/plugins/w3-total-cache/). If you are 
using any other caching plugins, deactivate and uninstall them. Ensure that WordPress has 
write permissions to the **wp-content** directory.  You can do this from the server's 
command line by changing to the WordPress directory and running the following command:

    sudo chmod go+w wp-content

### Step 2

Log in as an administrator to your WordPress account. In the left navigation pane of the 
WordPress control panel, click **Plugins** and then click **Add New**.

### Step 3

Click the **Activate Plugin** link, find the W3 Total Cache plugin zip file that you 
downloaded, and click **Install Now**. You can also unzip and use an FTP client to upload 
the plugin to your plugins directory (**wp-content/plugins/**).

In all cases, the **wp-content/plugins/w3-total-cache/** directory should exist when completed.

If the plugin is successfully installed, you should see the following message: 
`Successfully installed the plugin` ***W3 Total Cache***.

### Step 4

Remove the write permissions that you set on the **wp-content directory**.

    sudo chmod go-w wp-content

### Step 5

Click the **Settings** link and go to the **General** tab. Select your caching methods for 
page, database, and minify. In most cases, the following settings are recommended:

- Page Cache Method: Disk: **Enhanced**
- Minify Cache Method: **Disk**
- Database Cache Method: **Disk**

On the **Minify Settings** tab, all of the recommended settings are preset. Use the help 
button to simplify discovery of your CSS and JavaScript files and groups. Pay close 
attention to the method and location of your JavaScript group embeddings. See the plugin's 
FAQ for more information about usage. Save your changes.

### Step 6

If you already have a content delivery network (CDN) provider, go to the **Content Delivery 
Network** tab and populate the fields and set your preferences. If you are using Rackspace 
Cloud Files as your CDN, select Rackspace Cloud Files from the **Content Delivery Network** 
tab.

If you do not use the Media Library, you must import your images into the default locations. 
Use the Media Library Import Tool on the **Content Delivery Network** tab to perform this 
task.

If you do not have a CDN provider, you can still improve your website's performance using 
the "self-hosted" method. On your own server, create a subdomain and matching DNS zone 
record (for example, static.domain.com) and configure FTP options on the **Content Delivery 
Network** tab accordingly. Use FTP to upload the appropriate files, using the available 
upload buttons.

If you are using Rackspace Cloud Files as your CDN, log in to the 
[Cloud Sites Control Panel](https://manage.rackspacecloud.com/).

1.	In the left-hand menu in the [Cloud Sites Control Panel](https://manage.rackspacecloud.com/), 
   click Your Account and then click API access.

2.	Note your username and API key.

    To see your API key, click **Show Key**.

    If you do not have Cloud Files configured, you must add it under your **Hosting** tab. 
    If Cloud Files is not available, contact Rackspace Cloud Sales or Support.

Find your Cloud Files host name by going to the main 
[Cloud Control Panel](https://mycloud.rackspace.com). You can access it by clicking the 
link at the bottom of the left-hand menu pane in the Cloud Sites Control Panel.

1.	In the top navigation pane, click **Storage > Files**.

2.	If you do not already have a container, create one.

3.	Click the gear icon next to your container and select the **Make Public (Enable CDN)**.

4. Click the **Publish to CDN**.

    After the container is published, you can click the gear icon next to the container 
    again and select **View All Links** to view the container's host name.

5.	From the **Account: *yourUserName*** menu, select **Account Settings**.

6.	Click **Show** next to **API Key**. Note your username and API key from the Cloud Sites 
   Control Panel. You will need these, as well as your Cloud Files credentials, when 
   configuring W3 Total Cache.

Back in the WordPress control panel, perform the following steps:

1.	Click on the **Content Delivery Network** (CDN) link to modify the settings.

2.	In the **Configuration** section, type your username and API key. You can also create 
   the container for your website by typing the name in the container field and clicking 
   **Create Container**. The hostname is automatically populated.

3.	Under **SSL Support**, select (**auto detect**).

4.	Enter your Cloud Files host name in the **Replace Site's Hostname With** section. It 
   will look like `http://c000XXX60X1.cdn2` (cloudfiles.rackspacecloud.com or CNAME).

5.	Save changes for the **CDN** section.

6.	Under the **General** section, click **Upload XXXX Files** for each section that is checked.

### Step 7
In the WordPress control panel, in the left navigation pane, click **Performance > General Settings**.

### Step 8

On the **Browser Cache** tab, HTTP compression is enabled by default. Enable other options 
to suit your goals. Save changes for the browser cache settings.

### Step 9

On the **General** tab, click **Upload Includes**, then click **Start when the new page 
opens**. Select these options for all options that are selected under the **General Settings** 
section if they were not previously completed.

### Step 10

After you upload the content to the CDN, ensure that you select the **Empty all cache** 
option under the **General Settings** section. You can then preview the CDN functionality 
under the **General** tab by selecting **Preview** or you can deploy the site.

If you need more assistance, click on the down arrow next to the **Viewing** section on 
the **General Settings** page.
