---
permalink: install-a-sitecore-package/
audit_date: '2017-06-06'
title: Install a Sitecore package
type: article
created_date: '2017-06-06'
created_by: Juan Garza
last_modified_date: '2017-06-06'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

This article describes how to install a Sitecore package from a zip file. 

### Prerequisites

To set up your deployment, you need the following:

- Familiarity with [Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/).

- Familiarity with how to [publish content to Sitecore](/how-to/publish-content-to-sitecore/).

- A zip file that contains Sitecore package files. The zip file contains 3 folders; **/items**, **/files**, and **/metadata**. These folders hold both content items and package configuration files.

### Manually extract the package files

Use the following steps to manually extract the package files to perfrom a manual installation. The advantage of manual installation is that the files are copied using the current FTP User, and you do not need to change any security settings.

1. Open the zip package and extract the **/files** folder. Preserve the original directory structure when extracting the folder.

2. Delete the **/files** folder from the original zip. 

   You should now have a package file with the original three folders, and a package file with only the **/items** and **/metadata** folders.

3. Back up databases and files from the website. Remember files that are not located under the website root, for example, files in the **/data** folder that might have been moved to a nonpublic folder.

The website is now considered down for maintenance. You might want to publish an "Under Maintenance" page on your website.

### Install the package that contains only the /items and /metadata folders

1. Log in to your Sitecore content management site.

2. Select **Control Panel**.

3. From the administration menu, select **Install a package**.

4. Click **Upload a package**, and then select **Choose files**.

5. Browse for the zip file that contains only the **/items** and **/metadata** folders, and then click **Next** > **Upload**.

6. After the files are uploaded, click **Close**.

7. Click **Next** to continue with the package installation. When prompted, read and accept the license agreement, and then click **Next**.

8. Review the package information and click **Install**.

### Publish the contents and deploy the extracted files

1. If necessary, [publish the contents of your package](/how-to/publish-content-to-sitecore/).

2. Deploy the extracted **/files** folder to the website, preserving the same folder structure so that existing files are overwritten.

3. Verify that your website is running.

The website should no longer be considered down for maintenance. If you published an “Under Maintenance” page, remove it.
