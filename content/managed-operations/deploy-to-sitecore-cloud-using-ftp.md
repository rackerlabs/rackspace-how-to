---
permalink: deploy-to-sitecore-cloud-using-ftp/
audit_date: '2017-05-02'
title: Deploy to Sitecore Cloud using FTP
type: article
created_date: '2017-05-02'
created_by: Juan Garza
last_modified_date: '2018-02-27'
last_modified_by: Cat Lookabaugh
product: Managed Operations
product_url: managed-operations
---

This article describes how to deploy application files to your Sitecore Cloud
environment using an FTP client.

### Prerequisites

To set up your deployment, you need the following:

- Familiarity with
[Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/)

- An FTP client application

### Set deployment credentials and deploy application files

You can use the FTP or FTPS protocol to deploy. To access the file system of
your webapp, set the deployment credentials and copy your FTP hostname. These
credentials and the FTP hostname enable you to deploy your application files.

1. Sign in to the [Azure portal](https://portal.azure.com/). For information
about where to find your credentials to log in to the Azure portal, see
[Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/).

2. Click **All resources** and then select the webapp for which you need to set
credentials.

3. In the app screen under Deployment, select **Deployment credentials**.

4. Change your user name and password and then click **Save**.

5. After your credentials are set, click **Overview**.

6. Copy the FTP hostname or FTPS hostname value exactly as it is displayed in
the portal, including the application name.  The value should look similar to
`app-cm\Deployuser`.

7. Open your FTP client, and create a new session using the hostname that you
copied and the credentials that you set.

8. Upload your application's files and its directory structure to the
`/site/wwwroot` directory.

9. Browse to your webapp URL to verify that deployment was successful.

  **Note:** If you need the URL for the website, go back to the Azure portal
  and navigate to the overview of your application. The URL is listed there.
