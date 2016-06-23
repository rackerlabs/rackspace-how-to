---
permalink: use-w3-total-cache-with-cloud-sites-to-speed-up-wordpress/
audit_date:
title: Use W3 Total Cache with Cloud Sites to speed up WordPress
type: article
created_date: '2015-01-19'
created_by: Thomas Hester
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

W3 Total Cache is a plugin that enables you to store cached versions of your dynamic PHP pages during the  [Wordpress installation](http://www.rackspace.com/cloud/sites/web-hosting/wordpress/) process. Because W3 Total Cache reduces the load on the cluster, it also reduces the number of compute cycles used by a site.

### Install W3 Total Cache

Download the W3 Total Cache plugin at [https://wordpress.org/plugins/w3-total-cache/](https://wordpress.org/plugins/w3-total-cache/).

Before you begin the W3 Total Cache installation, ensure that you have your Rackspace Cloud Control Panel login credentials available.

Follow the installation instructions provided at the [W3 Total Cache plugin installation page](https://wordpress.org/plugins/w3-total-cache/installation/).

### Configure recommended W3 Total Cache settings

The settings for W3 Total Cache can usually be used across different hosts. However, Cloud Sites has a unique infrastructure setup that requires specific settings for the page cache to provide the best experience for a given site.

1. In the WordPress menu, click **Performance**.
    The W3 Total Cache settings commands are expanded.

2. Click **General Settings**.

3. Set the following options and then click **Save all settings**:

	- **Page cache**: Select **Enable**.
	- **Page cache method**: Select **Disk: Basic**.
	- **Minify**: Select **Enable**.
	- **Minify mode**: Select **Manual**.
	- **Minify cache method**: Select **Disk**.
	- Do *not* enable **Database Cache** or **Object Cache**.
	- **Browser cache**: Select **Enable**.
	- Select **Verify rewrite rules**.
	- Do *not* select **Enable file locking**.
	- Leave all other settings at their default values.

4. In the menu, click **Page Cache**.

5. Set the following options and then click **Save all settings**:

    - Select **Cache front page**.
    - Select **Cache feeds**.
    - Select **Cache SSL requests**.
    - Select **Cache URIs with query string variables**.
    - Do *not* select **Cache 404 (not found) pages**.
    - Select **Cache requests only for site address**.
    - Select **Don't cache pages for logged in users**.
    - Select **Automatically prime the page cache**. Values here affect the time before a page is recached. 86400 seconds equals 24 hours, 604800 seconds equals one week.
    - Leave all other settings at their default values.

6. In the menu, click **Minify**.

7. Set the following options and then click **Save all settings**:

	- Select **Rewrite URL structure**.

	- In the HTML and XML section, select the following check boxes:
		- **Inline CSS minification**
		- **Inline JS minification**
		- **Don't minify feeds**

	- **JS minify settings**: Select **Enable**.
	- **CSS minify settings**: Select **Enable**.

8. In the menu, click **Browser Cache**.

9. Set the following options and then click **Save all settings**:

	-	In the **General** section, select the following options:
		-	**Set Last-Modified header**
		-	**Set expires header**
		-	**Set cache control header**
		-	**Set entity tag (eTag)**
		-	**Set W3 Total Cache header**
		-	**Enable HTTP (gzip) compression**

	-	In the CSS, JS, HTML, XML, Media, and other files sections, select the following options:
		-	**Set Last-Modified header**
		-	**Set expires header**
		-	**Expires header lifetime:** Specify 31536000 seconds.
		-	**Set cache control header**
		-	**Set entity tag (ETag)**
		-	**Set W3 Total Cache header**
		-	**Enable HTTP (gzip) compression**

10.	In the menu, click **General Settings**.

11.	Export your settings to a file.

    Exporting the settings enables you to import them to a different site for more rapid deployment of the plugin.

### To Optionally Enable Cloud Files CDN

1. In the WordPress menu, click **Performance > General Settings**.

2. In the CDN section, select **Enable**.

3. From the **CDN Type** menu, select **Rackspace Cloud Files**.

4. Click **Save all settings**.

5. In the menu, click **CDN**.

6. In the **General** section, clear the following check boxes:

	-	**Host wp-includes/files**

	-	**Host minified CSS and JS files**

7. Click **Save all settings**.

8. In the **Configuration** section, perform the following actions:

	-	Enter your Rackspace Cloud account username.

	-	Enter your API key. For information about your API key, see [View and Reset Your Private Key](/how-to/view-and-reset-your-api-key).

	-	Enter a name for the container. Use a simple name in case you need to make multiple containers for other sites that have W3 Total Cache enabled.

9. Click **Create Container**.

10.	Click **Test Cloud Files Upload** to verify that the settings are correct for your account. Then, click Save all settings.

11.	In the **Advanced** section, select the following options:

	-	**Automatically upload minify files**

	-	**Export changed files automatically**

12.	Click **Save all settings**.

13.   In the **General** section, click each of the following buttons to upload the contents:

	-	**Upload attachments**

	-	**Upload theme files**

### Final steps

After you've successfully set up W3 Total Cache, in the WordPress menu, click **Performance > Dashboard** and choose to empty all caches.

Visit the page once or twice to trigger the building of the cache by the WordPress cron.

After the cache is built, you should see a significant change in the speed of your site on both the front end and the back end.
