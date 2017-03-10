---
permalink: ras-sitecore-cache/
audit_date:
title: Clear the Sitecore Cache
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/sitecore-faq)
### Getting Started

If you're familiar with Sitecore and some of the features of the various administration pages you might know about Sitecore's Cache adminstration page 

**http://*sitecoreurl*/sitecore/admin/cache.aspx**

Unfortunately, in the Sitecore templates the admin pages are blocked for security purposes, so if you are used to clearing your sitecore caches this way it will require some customization and is not recommended. 

Sitecore recommends that cache clearing be accomplished by restarting the respective Application Service in azure, resulting in a fresh creation of cache content. 

### Restarting the App Service

-Open your browser of choice and connect to the Azure portal.
-[Sign in to the Azure portal](https://portal.azure.com/)
-On the Sign in page, provide the credentials for your azure subscription.

- browse to the App Service you wish to restart in the azure portal 
- In the Overview section click the **Restart** button. 
- You will be prompted and warned "are you sure you want to restart **service**", gather your strength and click yes. 



------------------------------------------------------------------------
