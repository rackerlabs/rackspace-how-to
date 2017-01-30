---
permalink: create-a-domain-or-subdomain-that-points-to-a-website-not-hosted-on-cloud-sites/
audit_date:
title: Create a domain or subdomain that points to a website not hosted on Cloud Sites
type: article
created_date: '2011-03-23'
created_by: Rackspace Support
last_modified_date: '2015-06-23'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

Follow these directions to point a domain or subdomain to a website that
is *not* hosted on Cloud Sites.

1.  Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com "https://manage.rackspacecloud.com").
2.  Create the new domain or subdomain under the correct account. If you
    have any questions about how to do this, see [Getting Started With Cloud Sites: How To Add A New Website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website).
3.  After the domain or subdomain is set up in your account, add a PHP
    redirect to the **web/content** folder by using FTP. For information
    about how to do this, including using FTP, see [Getting Started With Cloud Sites, FTP/SSHFS/FTP Clients](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients).
4.  Using a text editing program (like Notepad or Wordpad), create a
    file with the following PHP redirect on your computer. After
    `Location:`, enter the URL that you want to redirect the website to
    (for example, `http://www.yourdomain.com/`).

        <?
        header("Location: URL");
        exit;
        ?>

    Using the example link, the full script would look as follows:

        <?php
        header("Location: http://www.yourdomain.com/");
        ?>

5.  Save this file as **index.php**.
6.  Log in to your new subdomain's FTP server.
7.  Navigate to the **/www.yourdomain.com/web/content** directory.
8.  Upload the **index.php** into this folder.
    The redirect should be fully functional.
