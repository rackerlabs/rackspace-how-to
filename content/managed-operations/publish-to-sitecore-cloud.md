---
permalink: publish-content-to-sitecore/
audit_date: '2015-05-16'
title: Publish content to Sitecore
type: article
created_date: '2017-05-08'
created_by: Juan Garza
last_modified_date: '2017-05-16'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

This article describes how to publish new content to your Sitecore content management site.

### Prerequisites

- Ability to log in to your Sitecore content management website. For instructions, see the "Sitecore Cloud content management site" section in [Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/)

- Familiarity with [deploying to Sitecore Cloud using FTP](/how-to/deploy-to-sitecore-cloud-using-ftp/). If your content includes changes that depend on custom code, deploy your updated code before publishing new content.

### Publish content to Sitecore

1. Log in to your Sitecore content management site.

2. In the Sitecore dashboard, click **Content Editor**.

    <img src="{% asset_path managed-operations/publish-content-to-sitecore/sitecore-dashboard.png %}" alt=""  />   

3. In the navigation bar, click the **Publish** tab.

4. On the tab, click the small arrow on the **Publish** button, and then select **Publish site**.

    <img src="{% asset_path managed-operations/publish-content-to-sitecore/publish-dashboard.png %}" alt=""  />

5. Select the publishing type, and then click **Publish**. You can choose from the following publishing types:

   - Incremental publish - publish only changed items.
   
   - Smart publish - publish differences between source and target database.
   
   - Republish - publish everything.

6. After publishing is complete, select both **Restart the Sitecore Client** and **Restart the Sitecore Server**, and then click **Close**.
