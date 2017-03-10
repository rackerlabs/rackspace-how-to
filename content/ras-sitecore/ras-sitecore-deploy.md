---
permalink: ras-sitecore-deploy/
audit_date:
title: Deploy to Sitecore Cloud
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/sitecore-faq)

### Deploy using FTP

### Set Deployment credentials

To access the FTP server for your app, you first need deployment credentials.

- [Sign in to the Azure portal](https://portal.azure.com/)
- In the Azure portal, click **App Service > App > Deployment credentials**
- Configure the user name and password, and then click Save.

<img src="{% asset_path ras-sitecore/deployment_credentials_configure.png %}" alt="Set Deployment credentials" />

- Obtain the FTP connection information by browsing the Azure portal to 
**App Service > App > Settings > Properties**, 
- copy the values for **FTP/Deployment User** and **FTP Host Name** or **FTPS Host Name**. 

**note** Please copy the FTP/Deployment username value as displayed by the Azure Portal including the app name in order to provide proper context for the FTP server. 
example: app-cm\Deployuser

- From your FTP client, use the connection information you gathered to connect to your app.
- Copy your files and their respective directory structure to the /site/wwwroot directory 
- Browse to your app's URL to verify the app is running as expected.

------------------------------------------------------------------------
