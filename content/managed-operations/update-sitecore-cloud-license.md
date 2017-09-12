---
permalink: update-sitecore-cloud-license/
audit_date: '2017-08-17'
title: Update a Sitecore Cloud license
type: article
created_date: '2017-08-17'
created_by: Juan Garza
last_modified_date: '2017-08-17'
last_modified_by: Juan Garza
product: Managed Operations
product_url: managed-operations
---

This article describes how to update your Sitecore license file. An up to date license file is needed to in order to use Sitecore.

### Prerequisites

- Familiarity with [deploying to Sitecore Cloud using FTP](/how-to/deploy-to-sitecore-cloud-using-ftp). If your content includes changes that depend on custom code, deploy your updated code before publishing new content.

- An FTP client (for example, [FileZilla](https://filezilla-project.org) or [Cyberduck](https://cyberduck.io/?l=en))

### Deploy license file to Sitecore

Use a FTP or FTPS protocol to deploy your license file. To access the file system of your Webapp, you need to set deployment credentials and copy your FTP hostname. These credentials and the FTP hostname deploy your application files. Both the credentials and FTP hostnames are needed for each webapp you want to update. 

For details on how to set or obtain your deployment credentials see the Set Deployment Credentials section of [deploying to Sitecore Cloud using FTP](/how-to/deploy-to-sitecore-cloud-using-ftp)

1. Open your FTP client. Create a new session for each of the hostnames that you copied and the credentials that you set.

2. Upload your Sitecore license.xml file to the `/site/wwwroot/App_Data` directory.

