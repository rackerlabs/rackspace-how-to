---
permalink: installing-serendipity-on-cloud-sites/
audit_date:
title: Install Serendipity on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-04'
last_modified_by: Nate Archer
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

1.  If you have not already done so, go to <http://www.s9y.org/12.html>
    and download the latest full release of Serendipity.
2.  Create your new domain from the Cloud Sites Control Panel. If you
    need assistance, please see [How do I add a website?](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website)
3.  Once the domain has finished creating, create your database. To do
    this, click **Hosting > Cloud Sites** from the left sidebar, then
    select your website from the menu. Scroll down to the Website
    Features section and choose **Add New** next to Databases. Type in
    whatever name you would like to call the DB and select **MySQL 5**. Type
    in a username and password of your choice, then click **Finish**. (You
    may want to write down the information provided -- the hostname,
    database name, database username and database password.)
4.  Extract the content of the Serendipity file you downloaded earlier
    to your local computer.
5.  Open up your FTP client software and login to your new domain. If
    you are not familiar with uploading content, check out [What FTP software should I use?](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients)
    and use the information to connect provided in [Getting Started With Cloud Sites, FTP/SSHFS/FTP Clients](/how-to/getting-started-with-cloud-sites-ftpsshfsftp-clients).
    Your best bet will be to upload (to your web/content folder)
    everything inside the "serendipity" folder contained within the **.zip**
    or **tar.gz** file you downloaded.
6.  Once the files have finished uploading, you are ready to get started
    with the installation of Serendipity and its settings.
7.  Now visit your URL, **www.yourdomain.com**. You will see the
    installation page.
8.  Click **Simple Installation** on the install screen.
9.  Fill in the required information for your database that you wrote
    down when you set it up earlier.
10. Customize your **General Settings** information.
11. Review to make sure all information is correct.
12. Click the **Complete Installation** button.


Congratulations, you have successfully installed your Serendipity site.
