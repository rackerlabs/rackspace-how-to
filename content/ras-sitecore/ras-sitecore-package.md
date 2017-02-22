---
permalink: ras-sitecore-package/
audit_date:
title: Installing a Sitecore Package
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/ras-sitecore-faq)

#### Installing a Sitecore Package

The package file is in fact a zip file which can be unpacked. The zip file contains both content Items and files. The zip file contains 3 folders: Items, files and metadata.

To manually install a package:

Open the compressed package file and extract the files from the /files folder preserving the folder structure.

Delete the /files directory from the zip file.

You should now have a set of files and a compressed package file, which contains only /items and /metadata.

Backup databases and files from the website, remember files that are not located under the website root, for example, files in the data folder which may have been moved to a non-public folder.

The website should now be considered down for maintenance. You may want to publish an "Under Maintenance" page on your website.

### Install the package with only Items and metadata using the client. 

- Login to Sitecore Content Management
- Click on the control panel icon from the Sitecore Dashboard
- From the administration menu select **Install a package**
- Click **upload a package**
- Click **Choose file**
- Browse for your compressed package file and then click **next**. 
- Click Upload
- Once the files have been uploaded click **close**, then click **Next** to continue with Package installation
- If prompted, read and accept the License agreement, and then click **Next**. 
- Review the package information and click **Install**

Copy the extracted files to the website preserving the folder structure, so that existing files are overwritten.
[Deploy to Azure](/how-to/ras-sitecore-deploy)

Verify that the website is running.

The website should no longer be considered down for maintenance, so if you used an “Under Maintanance” page it should now be removed.

The advantage of this approach is that the files are copied using the current Windows User, and you do not need to change any security settings.  

------------------------------------------------------------------------
