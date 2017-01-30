---
permalink: configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/
audit_date:
title: Configure W3 Total Cache for WordPress with Rackspace Cloud Files and CDN
type: article
created_date: '2013-10-10'
created_by: Eric Cavalcanti
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

This tutorial shows the basic steps for setting up the W3 Total Cache plug-in to work with Rackspace Cloud Files and a content delivery network (CDN). You can speed up your WordPress blog by using Cloud Files with CDN to display content to users faster and more efficiently. You can distribute common files or content such as CSS, JavaScript, images, videos, and much more through a CDN, which serves the content from the closest edge server to the end user.

This article assumes that you have already installed your WordPress website and database. If you have not completed this task, see [Installing WordPress on Cloud Sites](/how-to/installing-wordpress-on-cloud-sites "/how-to/installing-wordpress-on-cloud-sites").


1.  Log in as admin to your Wordpress blog.

2.  In the navigation pane, click **Plugins > Add New**.

    <img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-1.png %}" alt="" />

3.  In the **Search** box, enter **w3 total cache**.

4.  In the search results, under W3 Total Cache, click **Install Now**.

5.  On the Installing Plugin page, after the plug-in is installed, click **Activate Plugin**.

    <img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-4.png %}" alt="" />

6.  In the navigation menu, click **Performance > General Settings**.

7.  Scroll down to the CDN section.

8.  In the CDN section, select the **Enable** check box, and select **Rackspace Cloud Files** as the CDN type. Then, click **Save all settings**.

    <img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-6.png %}" alt="" />

    The following error message appears because the plug-in has not been set up yet:

          A configuration issue prevents CDN from working. The "Username", "API key", "Container" and "Replace default hostname with" fields cannot be empty.

9.  Get your API key:

    - Log into the [Cloud Control Panel](https://mycloud.rackspace.com).
    - Click your username in the upper-right corner and select **Acount Settings**.
    - Next to the **API Key** field, click **Show** and copy the key.

      For more information about viewing your API key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).

10.  Return to the admin page of your WordPress blog and click **CDN**.

11.  In the Configuration section, enter your Rackspace Cloud user name and API key.

12.  For **Location**, select the location where you created your account, either US or UK.

13.  Create a Cloud Files container by providing a name and clicking **Create container**.

     **Note:** If you create the container first in the Cloud Control Panel and then add it here, you might get an error. This error occurs if your cloud server and container are not in the same region (for example, ORD and DFW). If you let the plug-in create the container, you can verify the region that it was created in by looking at the Cloud Control Panel. If your server and container are not on the same region, you could get charged for the bandwidth between regions. If needed, you can check your default region by using nova:

       - [Install python-novaclient on Windows](/how-to/installing-python-novaclient-on-windows)
       - [Install python-novaclient on Linux and Mac OS](/how-to/installing-python-novaclient-on-linux-and-mac-os)

     Your configuration should look similar to the following one:

     <img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-9.png %}" alt="" />

14.  Save your settings.

15.  In the General section on the CDN page, click **Upload includes files**.

     <img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-10.png %}" alt="" />

16.  In the Media Library export window, click **Start**.

     The plug-in starts loading all images to the Cloud Files. This can take several minutes to complete, but you can see the progress in the window.

10.  (*Optional*) To give your links a human-readable name, use a CNAME record.

      - Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
      - Click **Networking > Cloud DNS**.
      - Select your domain, and click **Add Record**.
      - Select **CNAME Record** as the Record Type.

        <img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-13.png %}" alt="" />

Now when you create a new post on your WordPress site and upload an image, the image is automatically uploaded to your Cloud Files container. You can confirm this by checking the source of your page. It should look similar to the following screenshot:

<img src="{% asset_path cloud-files/configure-w3-total-cache-for-wordpress-with-rackspace-cloud-files-cdn/files-configure-w3-total-14.png %}" alt="" />

**Note:** If you resize images by using the built-in image editor in WordPress, the W3 Total Cache plug-in might fail to upload any image that was modified using this process. To solve this problem, you can upload your **uploads** file manually. Just upload it directly to your Cloud Files container so that it replaces your current **uploads** file.
