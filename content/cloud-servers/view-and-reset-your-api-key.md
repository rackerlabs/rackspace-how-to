---
permalink: view-and-reset-your-api-key/
audit_date:
title: View and reset your API key
type: article
created_date: '2013-02-05'
created_by: Kyle Laffoon
last_modified_date: '2016-01-11'
last_modified_by: Renee Rendon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Getting Started with Cloud Servers](/how-to/create-a-cloud-server)

The [Cloud Control Panel](http://mycloud.rackspace.com/) is a GUI tool for accessing all of your Rackspace services, but there might be times when you want to manage your assets through a scripting interface like the application programming interface (API). See our [catalog of APIs](https://developer.rackspace.com/docs/) for reference.

Before you can start using Rackspace APIs, you need to have your API key. Your API key is a unique alphanumeric identifier associated with your account that is used for universal authentication commands for all of your services.

### To view or regenerate your API key

1.	In the upper-right corner of the Cloud Control Panel, click the **Account:** ***userName***  menu and select **Account Settings**.

  <img src="{% asset_path cloud-servers/view-and-reset-your-api-key/Account_Settings.png %}" alt="" />

2.	To view your API key, click on the link labeled **Show** next to **API Key**. You can copy and paste the API key from this screen.

	<img src="{% asset_path cloud-servers/view-and-reset-your-api-key/API_Key.png %}" alt="" />

3.	To create a new API key, click the **Reset** link. A confirmation window is displayed.

	<img src="{% asset_path cloud-servers/view-and-reset-your-api-key/RegenAPIimage_0.jpeg %}" alt="" />

4.	Click **Generate New Key** to confirm.

    Your new key is displayed.

**Note:** When you regenerate your API key, any third-party applications are disconnected until you set the new API key in your application. If you are using your API key as a part of a server code with a site or application, the site or application will also break and could potentially affect your day-to-day operations. We recommend updating your API key for any application you had connected with the previous API key.

### Next section

[Creating a new Cloud Server](/how-to/create-a-cloud-server)
