---
permalink: using-wp-supercache-to-optimize-wordpress-on-cloud-sites/
audit_date:
title: Use WP-SuperCache to optimize Wordpress on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Thomas Hester
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

WP Super Cache is an available plugin for [Wordpress installations](http://www.rackspace.com/cloud/sites/web-hosting/wordpress/)
to store cached versions of your dynamic PHP pages. Installing WP Super
Cache can also reduce the number of compute cycles used by a site since
it reduces the load on the cluster as well.

WP Super Cache is available at
<http://wordpress.org/extend/plugins/wp-super-cache> and is included by
default with the Wordpress One Click Install in the control panel.

### Before You Begin

-   Have your Rackspace Cloud Control Panel login credentials ready.

### Install WP Super Cache

To install WP Super Cache, follow the instructions provided for the
plugin located here:
<http://wordpress.org/extend/plugins/wp-super-cache/installation/>. If
you have installed Wordpress via the Wordpress One Click Installer you
already have Super Cache installed.

### Recommended configuration

In addition to the instructions included with the manual, the following
additional changes are recommend and have been tested and shown to
increase the efficiency of WP Supercache in Cloud Sites.

#### Advanced settings

1. Go to settings for SuperCache and click on the **Advanced** tab.

2. Mark the following items:

   -   Cache hits to this website for quick access. (Recommended)
   -   Use mod_rewrite to serve cache files. (Recommended)
   -   Compress pages so they're served more quickly to visitors.
       (Recommended)
   -   Don't cache pages for known users. (Recommended)
   -   Cache rebuild. Serve a supercache file to anonymous users while a
       new file is being generated. (Recommended)
   -   Mobile device support. (External plugin or theme required. See the
       FAQ for further details.)
   -   Extra homepage checks. (Very occasionally stops homepage caching)
       (Recommended)

3. After making those changes, click **Update Status**.

4. After the screen refreshes scroll down to the Mod Rewrite Rules section
   and click **Update Mod_Rewrite Rules**.

5. Scroll down to **Expiry Time & Garbage Collection**.

6. Change cache timeout to 0 seconds then click **Change Expiration**.

#### Preload settings

1. Click on the **Preload** tab next.

2. Select **Preload mode** (garbage collection only on legacy
   cache files. Recommended.).

3. Set the refresh rate for preloaded supercache files by changing the
   number of minutes in the **Refresh preloaded cache files every
   \_\_\_ minutes** field (0 to disable, minimum 30 minutes) to a
   number appropriate for the traffic your site receives, like 1440
   (24 hours) or 10080 (1 week).

4. Click **Update Settings**, then after the page refreshes click
    **Preload Cache Now** and in around 10 or 15 seconds the cache will
    start building for the site. Depending on the size of the site and
    amount of content, the cache will take a few seconds to a minute
    to build. Once complete you will see a much improved response and
    load time.

Any time a layout change has been made (such as adding a widget or
changing the theme), it will be necessary to go to the admin panel and
click **Delete cache**, verify your page looks as you want, then go into
into the Supercache settings, go to the **Preload** tab and click
**Preload Cache Now** to regenerate the cache for the site.

### Updating the Supercache plugin

For security purposes and optimizations, it is important to keep the
plugin (and Wordpress itself) up-to-date. This can be done through the
Wordpress Dashboard.

1.  Log in to your WordPress Dashboard.
2.  Click the **Plugins** tab on the left-hand column.
3.  Check the box next to **Plugin** to select all available plugin updates.
4.  Click the **Bulk Actions** drop down and select **Update**.
5.  Click **Apply**.
6.  The page will change once all of the plugins are updated.
