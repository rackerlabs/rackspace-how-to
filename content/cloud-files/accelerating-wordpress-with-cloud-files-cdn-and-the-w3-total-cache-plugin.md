---
permalink: accelerating-wordpress-with-cloud-files-cdn-and-the-w3-total-cache-plugin/
audit_date: '2016-12-16'
title: 'Accelerate WordPress with Rackspace CDN and W3 Total cache plugin'
type: article
created_date: '2012-07-16'
created_by: Rackspace Support
last_modified_date: '2015-11-12'
last_modified_by: Nate Archer
product: Cloud Files
product_url: cloud-files
---

You can enhance your WordPress blog with Rackspace content delivery network (CDN)
technology to display content to users faster and more efficiently. You can distribute
common files or content such as CSS, JavaScript, images, videos and much more through a CDN,
which serves the content from the closest edge server to the end user.

The following steps are best practices and have been tested and verified to optimize
performance on a default installation of WordPress with the default theme.

**Note:** This process was last tested using WordPress version 3.8 and W3 Total
Cache plugin version 0.9.3.

**Note:** This article assumes that you have already completed the installation of your
WordPress website and database. If you have not completed this, go
[to Installing WordPress on Cloud Sites](/how-to/installing-wordpress-on-cloud-sites/).

### Step 1

Download the W3 Total Cache WordPress plugin from the
[W3 Total Cache website](http://wordpress.org/extend/plugins/w3-total-cache/). If you are
using any other caching plugins, deactivate and uninstall them. Ensure that WordPress has
write permissions to the **wp-content** directory. You can do this from the server's
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

> Retaining write permissions after installation can cause cross-site
> contamination. Ensure write permissions are removed after installation.

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

If you already have a CDN provider, go to the **Content Delivery Network** tab and
populate the fields and set your preferences. If you are using the Rackspace
CDN, log into your Rackspace account, and set up a CDN using the following procedure.

If you do not have a CDN provider, you can still improve your website's performance using
the self-hosted method. On your own server, create a subdomain and matching DNS zone
record (for example, static.domain.com) and configure FTP options on the **Content Delivery
Network** tab accordingly. Use FTP to upload the appropriate files, using the available
upload buttons.

If you are using Rackspace CDN, log in to the
[Cloud Sites Control Panel](https://manage.rackspacecloud.com/).

1.	On the tab menu along the top of the [Rackspace Cloud](https://manage.rackspacecloud.com/),
   click **Storage** and then click **CDN**.

2.	Click **Create Service** and enter a service name, and select the traffic type.

> Available Traffic Types include HTTP and HTTPS.

3.	Click **Create Service**.

4. 	Select the certificate type, domain name, and origin name, and the click
        **Create Service** to launch the CDN.

5.	Add subdomains as needed to the CDN by selecting the **Actions** drop down menu,
        and selecting **Add Domain**.

6.	Under **Caching Rules**, click on **Add Rule**, and specify the TTL length, and pathway
        to your Wordpress content.

Back in the WordPress control panel, perform the following steps:

1.	Click on the **Content Delivery Network** (CDN) link to modify the settings.

2.	Under **SSL Support**, select (**auto detect**).

3.	Enter your Cloud Files host name in the **Replace Site's Hostname With** section. It
   will look like `http://c000XXX60X1.cdn2` (cloudfiles.rackspacecloud.com or CNAME).

4.	Save changes for the **CDN** section.

5.	Under the **General** section, click **Upload XXXX Files** for each section that is checked.

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
