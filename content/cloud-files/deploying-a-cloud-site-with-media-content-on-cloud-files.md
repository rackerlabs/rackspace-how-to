---
permalink: deploying-a-cloud-site-with-media-content-on-cloud-files/
audit_date:
title: Deploy a Cloud Site with media content on Cloud Files
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2016-04-18'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

**Note:** This article is written for the [Cloud Sites Control Panel](https://manage.rackspacecloud.com/pages/Login.jsp). You can
access this interface from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking on **Rackspace Cloud** in the
upper-left corner of the Cloud Control Panel and selecting
**Cloud Sites**.

This article shows how to deploy a simple web page that retrieves an image
from the Cloud Files platform. The tutorial uses some rewrite rules to
obfuscate the origin URL to optimized searching.

### Prerequisites

-   *(If using the browser to upload)* FTP application.
    FileZilla is a good choice.
-   *(If using program code to upload)* Python installed on
    the local machine.
-   A plain text editor (*not* a word processing program like Microsoft
    Word or OpenOffice). For Mac OS X or Linux, vim is a
    good choice. For Windows, consider using NotePad++.
-   A picture file. You can use any format, such as JPEG, GIF, or PNG.
-   Mozilla Firefox or Python, depending on what method you use to
    upload to Cloud Files.

### Upload the image to Cloud Files

The first step in this process is to upload your image to a CDN-enabled
container in Cloud Files. This section describes uploading files using
the Python SDK, however you can also use third party tools, such as
CyberDuck to upload content.

#### Use the Python SDK

This example assumes that you have pyrax, the Python SDK installed. For
more information about setting up the SDK for Python, see [Getting started with the Python SDK](https://developer.rackspace.com/sdks/python/).

The following script performs a series of simple tasks: it creates a
container named `media`, enables CDN for the container, and then uploads
a file to that container.

    import pyrax
    #set the Rackspace identity system for authentication
    pyrax.set_setting("identity_type", "rackspace")
    pyrax.set_credentials("UserName", "APIKey", region="ORD")
    cf = pyrax.cloudfiles
    #create a container called "media"
    cont = cf.create_container("media")
    #publish the container
    cont.make_public()
    print "Beginning upload..."
    obj = cont.upload_file("PathToImage")
    print "File Uploaded!"
    print "Name:", obj.name
    print "Size:", obj.total_bytes
    print "Content-Type:", obj.content_type

#### Run the script

1.  Save the script to your desktop and name it **cfupload.py**.
2.  Make the following changes in the script:
    -   On line 3, replace UserName with your Rackspace Cloud username, and replace APIKey with your API key.
    -   (Optional) On line 3, change the region to any available
        Rackspace region, such as DFW, IAD, ORD, LON, SYD, or HKG.
    -   On line 8 replace PathToImage with a valid system path like
        "/Users/linda/Pictures/image1.jpg" (for Mac) or
        "C:\\\\images\\\\image1.jpg" (for Windows). Note that the
        backslashes in Windows paths have to be escaped with an extra
        backslash (\\).

3.  Open your terminal.
4.  Change directories to your desktop.
5.  Run the following command from your terminal: `python cfupload.py`
6.  Wait for the image to upload, which should only take a few seconds,
    depending on the size of the image file.

When the upload is complete, the script prints out details about your
newly-uploaded object.

### Set up a Cloud Site

This section of the tutorial covers creating a simple page that calls
the image by using the local server side path and creating a Cloud Site.

#### Create a sample XHTML page

You create a simple XHTML page that calls an image on Cloud Files by
using the local server side path. This part of the tutorial uses
`mod_rewrite`.

#### Redirect the image

In a **.htaccess** file, create the rewrite rules that redirect the image
to the Cloud Files platform. To do so, you need the CDN URL for the
container media that you created. If you did not copy the URL earlier,
retrieve it as follows:

1.  Log in to [Cloud Sites Control Panel](https://manage.rackspacecloud.com/pages/Login.jsp).
2.  In the left navigation pane, click **Hosting**, then **Cloud
    Files**.
3.  Click the gear icon next to **media** and select **View All Links**.
4.  Copy the CDN URL.

After you have the CDN URL, create the following rewrite rule in a
**.htaccess** file. Replace the container URL with your own URL and ensure
that `%{REQUEST_URI}` directly follows it with no spaces.

    RewriteEngine on
    RewriteBase /
    RewriteRule image1.jpg  http://c0203623401.cdn.cloudfiles.rackspacecloud.com%{REQUEST_URI}

This rule rewrites anything called **image1.jpg**.

The `{REQUEST_URI}` is a variable that holds the relative path to the
file that is being requested, so it will always redirect to the correct
place. If you have any questions about `mod_rewrite`, see the
<span>Apache documentation</span>.

If your application resides in a subdirectory of the main site, you
might have trouble getting mod_rewrite to work. Try replacing the slash
(/) with the subdirectory of your application in the `RewriteBase`
directive.

#### Create the demo Cloud Site

Create a sample Cloud Site by performing the
following steps:

1.  Log in to [Cloud Sites Control Panel](https://manage.rackspacecloud.com/pages/Login.jsp).
2.  In the left navigation pane, click **Hosting > Cloud Sites**.
3.  Click **Add A Site**.
4.  In the Add a New Website dialog box, name the domain whatever
    you like. We recommend that you do not register a domain.
5.  Follow the steps in the site creation process.
6.  After the domain has been added, select the **General
    settings** tab.
7.  Copy the FTP URL.
8.  Open your FTP application and log in using the user name and
    password for this domain.
9.  Upload the **.htaccess** file and the simple HTML page that you
    created to the **/www.domain.com/web/content/** directory.

Now navigate to the sample page that you created. The image is being
called from Cloud Files, but if a user looks at your source code, it
looks as if the image is being called locally. This redirect doesn't
change the actual HTTP request, but it does obfuscate the URL in the
source code.

If you have any questions or comments or if this tutorial is not working
for you, send an email to <cloudfiles@rackspacecloud.com> and we will
answer any questions that you have.
