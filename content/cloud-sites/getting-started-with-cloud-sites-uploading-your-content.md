---
permalink: getting-started-with-cloud-sites-uploading-your-content/
audit_date:
title: 'Getting Started With Cloud Sites: Uploading Your Content'
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-20'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

Now that you have successfully created your domain in Cloud Sites,
you will most likely want to begin uploading content to your website.
This article will show you how to locate your FTP (File Transfer
Protocol) credentials and connect to the Rackspace Cloud FTP servers.

In order to add content to your web site you will need to log in with an
[FTP client](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients "What FTP software should I use?") using your FTP settings. Let's start by showing you where you can locate
your FTP settings.

To find your domain's FTP settings follow these easy steps:

1.  Log in to the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com).
2.  Navigate to **Hosting > Cloud Sites**.
3.  Click on the domain to which you will be adding content.
4.  Look under the **General Settings** tab. Your FTP settings are
    listed right under the **Viewing and Editing** section.

    **Note:** There are two FTP servers you can use to add content to
    your site:

    -   The FTP server specific to your domain. This server will be ftp.
        and then your domain name (for example, **ftp.yourdomain.com**),
        and can *only be used after your domain registration or
        transfer is completed*.
    -   The general or secondary FTP site is **ftp1.ftptoyoursite.com**.
        This server can be used to add content to your site *even if
        your domain registration or transfer has not yet completed*.

    There are various settings that must be set to allow your FTP
    program to connect to our servers:

    -   Passive mode must be turned on to log in to our FTP servers.
        Passive mode will allow for your computer to navigate through
        our firewalls.
    -   There are a variety of ports that could be utilized for FTP
        traffic, however, we have chosen to stay with the standard
        port 21. Most FTP clients will have this port selected
        as default.

5.  After you have logged into your FTP server a list of websites
    associated with your username and password will be displayed. Choose
    the domain you wish to upload your website files into, open it and
    you will find three additional directories.
6.  One of the three directories will be labeled "web". The other two
    folders are for server side stats and log reporting and should not
    be deleted or edited.
7.  Open the "web" directory and you should see another directory
    labeled "content." Your HTML, ASP, PHP, images and other web files
    should be uploaded here.

    Following is a roadmap of the FTP server that will be very similar to
    your domain's layout:

         /www.yourdomain.com <-----Your domain's root directory
           /web
               /content <----- Website files need to be uploaded into this directory
               /index.html
               /image.jpg
           /stats <----- Do not delete or edit
           /logs <----- Do not delete or edit

    **Note:** By default, your site will have an index.html. In order
    to display your new content, please delete the default **index.html** or
    rename this to something like **index.html.bak**

That covers the basics of building your first website with Rackspace
Cloud Sites. At this point, you should be fairly comfortable with
Hosting Plans, and what they are used for as well as how to create new
Hosting Plans and modify existing ones.  You've also successfully added
your first domain and connected to the FTP servers to begin uploading
your content.
