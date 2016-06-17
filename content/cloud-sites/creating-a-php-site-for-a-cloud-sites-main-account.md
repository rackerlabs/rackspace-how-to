---
permalink: creating-a-php-site-for-a-cloud-sites-main-account/
audit_date:
title: Create a PHP site for a Cloud Sites main account
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-16'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for the Cloud Sites Control Panel. You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking the **Rackspace Cloud** menu at the top of the panel and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Prerequisite

You must have administration access to the website.

### Create a PHP site

1. Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com/)
2. If you are new to the Rackspace Cloud, see [How To Add A New Website](/how-to/getting-started-with-cloud-sites-how-to-add-a-new-website) and add the website.
3. Navigate to **Hosting > Cloud Sites**. All of the domains and websites owned by the account are listed.
4. Click the link for the PHP website.
5. Verify that logging is turned on if needed. See [Enable logging for a website](/how-to/enabling-raw-logging-for-a-cloud-sites-website).
6. Using FTP, upload a sample **index.php** file (like the following one) to the main directory for the website. See [Upload content to a website using FTP](/how-to/getting-started-with-cloud-sites-uploading-your-content).

        <html>
         <head>
          <title>Sample Page</title>
         </head>
         <body>
          <?php echo '<p>Hello World</p>'; ?>
         </body>
        </html>

7. Navigate to **index.php** by using the Test URL if necessary. See [Using a Staging URL](/how-to/using-a-staging-url). Ensure that is served by Cloud Sites.
