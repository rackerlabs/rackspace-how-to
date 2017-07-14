---
permalink: sitecore-cloud-portals-and-account-management/
audit_date: '2017-04-45'
title: Sitecore Cloud portals and account management
type: article
created_date: '2017-04-04'
created_by: Juan Garza
last_modified_date: '2017-04-25'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

When you use Sitecore Managed Cloud, you are given a fully customizable dedicated environment designed by experts at Sitecore and Rackspace that enables you to focus on producing the best web content for your application or website.

While Rackspace manages your Sitecore environment, access to three portals gives you more control and direction over your Sitecore environment and website.

- **MyRackspace portal**: Contains your credentials for logging in to the Azure and Sitecore portals.

- **Azure portal**: Manages your Sitecore environment.

- **Sitecore Cloud content management site**: Manages the content of your Webapp.

### Get your login credentials

The MyRackspace portal provides the login credentials for both the Azure and Sitecore portals. While these credentials are sent through a link to the MyRackspace portal in the Welcome email received after you signed up, you can also find the credentials inside a support ticket in the MyRackspace portal. To find this ticket:

1. Log in to the [MyRackspace portal](https://my.rackspace.com/portal/).

2. In the top navigation bar, click **Tickets**.

    A list displaying your currently open tickets and a tab with the option to view your closed tickets appear. Each ticket entry displays the name, the date it was last updated, the ticket status, and the ticket ID number. Azure and Sitecore portal credentials are located in the first ticket opened on the account.

### Azure portal

Sitecore runs on Windows .NET services, hosted on Azure Web Apps. Therefore, all Sitecore Managed Cloud environments use Azure credentials to make changes to a Sitecore environment. Through the Azure portal, you can perform the following tasks:

- Get the URL to your Sitecore content management website (for example,  **http://gsdk-cm.azurewebsites.net/**). You need this URL to log in to Sitecore.
- Reset deployment credentials
- Restart your website or application
- Access logs

Log in to the [Azure portal](https://portal.azure.com/) using the credentials sent to you by Rackspace in a support ticket. This ticket is accessible through the [MyRackspace portal](https://my.rackspace.com/portal/).

**Note:** You cannot delete your application or website through the Azure portal. To delete your application, contact [Rackspace Support](https://www.rackspace.com/en-us/information/contactus).

#### Find the URL for the Sitecore content management site

The Azure portal contains the URL for the content management site. You use URL  to log in to the Sitecore portal.

1. Log in to the [Azure portal](https://portal.azure.com/) by using the credentials sent to you by Rackspace. If you need to get these credentials, see "Get your login credentials."

   <img src="{% asset_path managed-operations/sitecore-cloud-portals-and-account-management/azure-login.png %}" alt=""  />   

2. Select **Resource Groups**.

3. In the list of resource groups that appears, select the group that contains the Sitecore application that you want to access.

4. In the device list, select the device named similarly to `{appname}-cm`. The device type should be **App Service**.

5. On the app service overview screen, locate the content management website URL in the URL column.

   <img src="{% asset_path managed-operations/sitecore-cloud-portals-and-account-management/cm-azure-url.png %}" alt=""  />   


### Sitecore Cloud content management site

The Sitecore Cloud content management site manages the content of your Sitecore application or website. It does not manage your environment, which is managed through the Azure portal.

1. Enter the URL of your content management website to verify the site loads. The URL should look similar to **http://gsdk-cm.azurewebsites.net/**. You can find the URL by logging in to the Azure portal.

   <img src="{% asset_path managed-operations/sitecore-cloud-portals-and-account-management/sitecore-login.png %}" alt=""  />   

2. Add **/sitecore/login** to the URL to open the Sitecore login page. The URL should look similar to **https://gsdk-cm.azurewebsites.net/sitecore/login**.

3. Enter your Sitecore credentials, and click **Log in**. If you need to get these credentials, see “Get your login credentials.”
