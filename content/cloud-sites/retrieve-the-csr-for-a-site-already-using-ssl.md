---
permalink: retrieve-the-csr-for-a-site-already-using-ssl/
audit_date:
title: Retrieve the CSR for a site already using SSL
type: article
created_date: '2014-11-10'
created_by: Thomas Hester
last_modified_date: '2016-06-22'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

Follow the steps in this article to retrieve a previously generated certificate signing request (CSR).

**Note:** If you have not yet generated a CSR, the following articles will guide you in generating a new CSR through the Cloud Control Panel:

- [Create a CSR in the Cloud Control Panel](/how-to/create-a-csr-in-the-cloud-control-panel)

- [Getting started with Cloud Sites: Configuring SSL on your website](/how-to/getting-started-with-cloud-sites-configuring-ssl-on-your-websites)

### Requirements

Before you can retrieve your previously generated CSR, verify that you have accomplished the following tasks:

- You have installed SSL on your site.

- You have generated your CSR through the [Cloud Control Panel](https://csrgenerator.rackspace.com/). Doing so ensures that your CSR is stored. If you did not generate your current CSR through the Cloud Control Panel and instead had one made directly through support, then you must create a new one by contacting Cloud Sites support at 1 855 348 9060 in the US and 1 210 581 0401 internationally.

### Instructions

When you have completed the required tasks, follow these steps to retrieve your previously generated CSR.

1.	Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com).

2.	On the left panel, click **Hosting > Cloud Sites**.

3.	In the sites list, click the site for which you want to retrieve the CSR.

4.	Click the **Security** tab.
   You will see the **View CSR** link in the control panel.


### Tips

- The CSR link will not be visible if a previous CSR does not exist in our system.

- If the CSR was generated a long time ago and the certificate provider prohibits using a CSR older than a certain date, contact the Cloud Sites support team (U.S. 855-348-9060, International 210-581-0401) to get a new CSR and key.
