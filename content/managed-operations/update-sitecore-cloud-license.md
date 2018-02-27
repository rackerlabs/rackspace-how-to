---
permalink: update-sitecore-cloud-license/
audit_date: '2017-08-17'
title: Update a Sitecore Cloud license
type: article
created_date: '2017-08-17'
created_by: Juan Garza
last_modified_date: '2018-02-27'
last_modified_by: Cat Lookabaugh
product: Managed Operations
product_url: managed-operations
---

This article describes how to update your Sitecore license file. You need an
up-to-date license file to use Sitecore.

### Prerequisites

- Familiarity with
[deploying to Sitecore Cloud using FTP](/how-to/deploy-to-sitecore-cloud-using-ftp).
If your content includes changes that depend on custom code, deploy your
updated code before publishing new content.

- An FTP client application

### Deploy a license file to Sitecore

Use the FTP or FTPS protocol to deploy your license file. To access the file
system of your webapp, set deployment credentials and copy your
FTP hostname. These credentials and the FTP hostname deploy your application
files. Both the credentials and FTP hostnames are needed for each webapp you
want to update.

For details on how to set or obtain your deployment credentials, see the **Set
deployment credentials** section of
[Deploy to Sitecore Cloud using FTP](/how-to/deploy-to-sitecore-cloud-using-ftp)

Use the following steps to deploy your license file:

1. Open your FTP client. Create a new session for each of the hostnames that
you copied and the credentials that you set.

2. Upload your Sitecore license.xml file to the `/site/wwwroot/App_Data` directory.

