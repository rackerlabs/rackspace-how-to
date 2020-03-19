---
permalink: set-up-office-365/
audit_date: '2020-03-19'
title: Set up Office 365
type: article
created_date: '2017-07-05'
created_by: Nate Archer
last_modified_date: '2020-03-19'
last_modified_by: Chris Moyer
product: Office 365
product_url: office-365
---

This article helps Rackspace Cloud Office customers set up Office 365 for the first time.

### Prerequisites

- **Applies to:** Office 365 Administrator
- **Difficulty:** Easy
- **Time needed:** 10 minutes
- **Tools required:**  Office 365 tenant Administrator access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).


### Create a tenant ID

The tenant ID that you create is permanent. If you have an existing tenant ID for your Office 365 account, open a support ticket so we can transfer it for you.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) using your Rackspace Cloud Office admin ID and password.
2. In the Microsoft Office 365 section, select **Manage Office 365**.
3. Enter a tenant name using only letters and numbers.

   A tenant is a unique name for your organization within the Office 365 portal. Your tenant name is your **account ID** on Microsoft's systems.

   If the tenant ID that you enter is valid and available, a green check box appears next to the name.

4. Fill in the requested information. All fields are required.
5. Click **Create Tenant**.

Your SharePoint (**{tenantName}.sharepoint.com**) and OneDrive (**{tenantName}-my.sharepoint.com**) URLs use the tenant ID for the life of your account.

### Log in to the Office 365 portal

1. Log in to the [Manage Office 365 at Rackspace Control Panel](https://office365.cp.rackspace.com) with the Global Administrator of your tenant.

2. In this portal, you can manage users (add or edit users, reset passwords, and edit assigned licenses) and licenses (add, edit, and remove licenses). If you need to manage any other settings, such as the Exchange Admin Center or the Security and Compliance center, click on **Office 365 Admin Center** on the left sidebar to be logged in to the Office 365 Admin Center automatically.

When you first log in, the Office 365 portal requires you to enter and confirm a new password. After you confirm the password, the only user who can log in to your Office 365 account is **admin@{tenantName}.onmicrosoft.com**, until new users are created.

### Add a subscription

After you create an Office 365 tenant, choose an Office 365 subscription. To compare Office 365 subscriptions offered by Rackspace, see [Office 365 - Pick your plan](https://www.rackspace.com/office-365/pick-your-plan).

1. In the [Manage Office 365 at Rackspace Control Panel](https://office365.cp.rackspace.com), click on **Products** -> **Product Catalog** on the left sidebar.
2. Select a plan and click **Add Product**. You can learn more about each license by clicking on the arrow next to the details. To compare Office 365 subscriptions offered by Rackspace, see [Office 365 - Pick your plan](https://www.rackspace.com/office-365/pick-your-plan).
3. Enter the number of licenses that you need and review the charges.
4. Click **Add Product**.

**Note:** It may take up to 15 minutes for the new license to be fully active and usable.

### Manage your subscription

To change the number of licenses for your subscription, click **Change Quantity** to be taken to the **Product Catalog** where you can change the quantity of licenses.

To delete your subscription, click **Change Quantity** to be taken to the **Product Catalog**, set the license count to **0** and confirm the deletion.

**Note**: Deleted subscriptions retain your data for 60 days and enter a "Suspended" status before being permanently deleted. You are not billed while a subscription is in this state.
