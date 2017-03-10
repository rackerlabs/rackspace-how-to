---
permalink: ras-sitecore-cdn/
audit_date:
title: Add a CDN to Sitecore Cloud
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/ras-sitecore-faq)


### Add CDN service to your azure account
- [Login to the Azure Portal](/how-to/)
- Select the All Resources icon from the leftside menu
- Click the **+Add** button to create a new Resources
- Select ** New > Web + Mobile > CDN
- Specify the CDN Name, Subscription, Resource group and location, and the Pricing tier for the level of CDN service you would like to utilize. 

<img src="{% asset_path ras-sitecore/azurecreatecdn.png %}" alt="Azure create CDN" />

- Click **create**

### Create a CDN Endpoint
- [Login to the Azure Portal](/how-to/)
- browse the Azure portal to **CDN profile**
- Click the **+Endpoint** button to Add an Endpoint
- Name the CDN Endpoint
- Select Origin Type > **Web App**
- Select the **Origin hostname** for the App Service to enable from the drop down menu.
**note** if you are using a custom domain you can select Custom Origin for the Origin Type and specify a url for your static content. This is useful for rewriting medialinks and exporting static content to another url. 
- Click **Add**


### Configure Sitecore to load static content from the CDN

 
------------------------------------------------------------------------
