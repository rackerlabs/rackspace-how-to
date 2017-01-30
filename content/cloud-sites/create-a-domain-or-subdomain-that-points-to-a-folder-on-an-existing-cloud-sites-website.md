---
permalink: create-a-domain-or-subdomain-that-points-to-a-folder-on-an-existing-cloud-sites-website/
audit_date:
title: Create a domain or subdomain that points to a folder on an existing Cloud Sites website
type: article
created_date: '2011-03-23'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

The Cloud Sites Control Panel does not provide the ability to create an
alias that points to a folder other than [the website's web root](/how-to/locate-the-linux-path-for-your-cloud-sites-website).
To point to a folder other than the website's web root, you must use a
redirect script. Perform the following steps.

1.  Log in to the [Cloud Sites Control Panel](http://manage.rackspacecloud.com "http://manage.rackspacecloud.com").
2.  Create the new domain or subdomain under the correct account. If you
    have any questions about how to do this, see [Getting Started With Cloud Sites: How To Add A New Website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website).
3.  After the domain or subdomain is set up in your account, add a PHP
    redirect to the **web/content** folder by using FTP. For information
    about how to do this, including using FTP, see [Getting Started With Cloud Sites, FTP/SSHFS/FTP Clients](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients).
4.  Using a text editing program (like Notepad or Wordpad), create a
    file with the following PHP redirect on your computer. After
    `Location:`, enter the URL that you want to redirect the website to
    (for example, `http://www.example.com/subdirectory`).

        <?php
        header("Location: URL");
        ?>

    Using the example link, the full script would look as follows:

        <?php
        header("Location: http://www.example.com/subdirectory");
        ?>
5.  Save this file as **index.php**.
6.  [Log in to your FTP client](/how-to/getting-started-with-cloud-sites-uploading-your-content).
7.  Select the website from the list of websites associated with your
    ftp user name and password.
8.  Select the **web** folder.
9.  Select the **content** folder.
10. Upload the **index.php** file from your computer to the
    **content** folder.
