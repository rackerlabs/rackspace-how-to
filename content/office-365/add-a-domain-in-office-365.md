---
permalink: add-a-domain-in-office-365/
audit_date: '2017-07-09'
title: Add a domain in Office 365
type: article
created_date: '2017-06-29'
created_by: William Loy
last_modified_date: '2017-07-11'
last_modified_by: Paige Warmker
product: Office 365
product_url: office-365
---

The default domain in Office 365 is **{tenantName}.onmicrosoft.com**.  Until you add your own domain to Office 365, any new users that you create contain the default domain name.

This article describes how to add a domain in Office 365. By adding your own domain, you can create users specific to that domain.

### Prerequisites

- **Applies to:** Office 365 Administrator
- **Difficulty:** Easy
- **Time needed:** 24-48 hours for the domain to be verified
- **Tools required:**  Office 365 tenant Administrator access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

Before you can set up a domain in the Office 365 portal, you must [create your Office 365 tenant with Rackspace](/how-to/office-365/set-up-office-365/) and [add the product licenses](/how-to/add-an-office-365-license/) that you need.

### Add a domain in Office 365

1. Log in with your Office 365 Administrator credentials at [portal.office.com](portal.office.com).

2. Click the **Admin** tile.

   <img src="{% asset_path office-365/add-a-domain-in-office-365/add-domain-in-o365-sc1.png %}" />

3. On the left side of the screen, expand **Settings** and select **Domains**.
4. In the **Domains** section, click **Add Domain**.
5. On the next page enter the domain name that you want to add.

   <img src="{% asset_path office-365/add-a-domain-in-office-365/add-domain-in-o365-sc2.png %}" />

6. Verify that you own the domain.

   This step requires you to log in to your domain's DNS host portal. If you do not know who your DNS host is, see [Find your DNS host](/how-to/find-your-dns-host/).

    1. Copy the TXT record information provided in the Office 365 portal.

        <img src="{% asset_path office-365/add-a-domain-in-office-365/add-domain-in-o365-sc3.png %}" />

    2. Log in to your domain's DNS host portal.

    3. Add the TXT record provided in the Office 365 portal.

    4. Save this change at your DNS host.

    **Note:** The TXT record could take 24-48 hours to be verified by Office 365.

    After your domain has been successfully verified by Office 365, Office 365 prompts you to set up your online services.

7. To set up your online services, select one of the following options:

    - **Set up my online services for me**: Inputs all DNS records from your DNS host automatically. All mail associated with your DNS host is immediately rerouted to Office 365.

      **Note:** **Set up my online services for me** is only available with certain DNS hosts. Before selecting this option, please verify that your DNS host allows use of this feature.

    - **I'll manage my own DNS records**: Provides a list of DNS records that need to be changed on your DNS host to use Office 365 services.

      **Warning:** Do not change your DNS records until you are ready to start using your Office 365 services.

8. Verify that you can create a new user with the domain that you added by selecting **Users** > **Active Users** and then finding your domain in the drop-down menu.
