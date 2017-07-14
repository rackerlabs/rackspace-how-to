---
permalink: clear-your-sitecore-caches/
audit_date: '2017-06-06'
title: Clear your Sitecore caches
type: article
created_date: '2017-05-31'
created_by: Juan Garza
last_modified_date: '2017-06-06'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

After you [publish changes to your Sitecore site](/how-to/publish-content-to-sitecore/), you might want to manually clear your caches after publishing the changes. 

Sitecore administrators can view their Sitecore cache administration page using the URL **http://{sitecoreurl}/sitecore/admin/cache.aspx**. However, Sitecore cache administration pages are blocked for security purposes. 

To clear your caches, Sitecore recommends restarting your Sitecore site's web app in the Microsoft Azure portal. This action creates a fresh cache for your website's content.

**Note:** Restarting your web app can cause temporary downtime for your website.

### Prerequisite

- Your login credentials for the Azure portal. For information about how to log in to the Azure portal, see [Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/).

### Restart the web app for Azure

1. Log in to the [Azure portal](https://portal.azure.com/).

2. Browse to your Sitecore site's web app.

3. In the Overview section, click **Restart**. 

4. When you are prompted to restart the web app, Select **Yes**.


