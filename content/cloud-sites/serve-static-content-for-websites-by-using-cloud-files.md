---
permalink: serve-static-content-for-websites-by-using-cloud-files/
audit_date:
title: Serve static content for websites by using Cloud Files
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2014-10-16'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

Use the following steps to set up a website from a basic HTML page
stored in Cloud Files.

### Prerequisites

To complete this process, you need the following items:

-   A file transfer application such as
    [Cyberduck](/how-to/configuring-rackspace-cloud-files-with-cyberduck).
-   A text editor
-   Images to display on the website
-   A Cloud Files account

### Upload and connect to your content

1.  Log in to the Cloud Control Panel.
2.  In the Cloud Files section, create a new container and select **Public (Enabled CDN)** for the type.

    **Tip**: Creating separate containers for your image and HTML files
    can be helpful.

3.  Click **Upload Files** and select any images or additional content
    that you will be using in your site.
4.  Click the action gear next to each of the uploaded items, select
    **View All Links** and record  the URLs for each item.
5.  In a text editor, create a sample HTML page that lays out the basic
    form of your website. Following is an example:

    <img src="{% asset_path cloud-sites/serve-static-content-for-websites-by-using-cloud-files/sitelayoutpage_0.png %}" alt="" />

6.  Incorporate the public URLs of your images and additional content
    into your site layout document where those are referenced. For
    example, **http://c0344252.cdn.cloudfiles.rackspacecloud.com/phpsite2.img**
    in the preceding example is an incorporated reference for an image
    file uploaded to Cloud Files.
7.  In the container in Cloud Files, click **Upload Files** and select
    the site layout file that you just created.
8.  Click the action gear next to the HTML file, select **View All
    Links** and record the **HTTP** path. This is your site's
    public URL.
9.  Point the browser to the URL of the site layout page that you just
    created (for example,
    **http://www.example.com.websitetestlink.com/index.html**)  and verify
    that the image is served.
    
    The image is being served from Cloud Files through the Akamai CDN.
