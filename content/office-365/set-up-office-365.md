---
permalink: set-up-office-365/
audit_date: '2017-07-09'
title: Set up Office 365
type: article
created_date: '2017-07-05'
created_by: Nate Archer
last_modified_date: '2017-07-05'
last_modified_by: Nate Archer
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

The tenant ID that you create is permanent. If you have an existing tenant ID for your Office 365 account, contact Microsoft Support to remove it. Removing the existing ID enables you to create a new ID for your account.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) using your Rackspace Cloud Office admin ID and password.
2. In the Microsoft Office 365 section, select **Manage Office 365**.
3. Enter a tenant name using only letters and numbers.

   A tenant is a unique name for your organization within the Office 365 portal. Your tenant name forms your Office 365 user ID. A tenant is not a domain.

   If the tenant ID that you enter is valid and available, a green check box appears next to the name.

4. Enter values in the following fields. All fields are required.

   - **User name**: Enter a unique user name.
   - **Password**: Enter a unique password. This password is temporary. The Office 365 portal prompts you to create a new password when you first visit the site.
   - **Company information**: Enter the information for your company.

5. Click **Create Tenant**.

The tenant name, user name, and password that you enter in Cloud Office form your Office 365 user ID. Your SharePoint (**{tenantName}.sharepoint.com**) and OneDrive (**{tenantName}-my.sharepoint.com**) URLs use the tenant ID for the life of your account.

### Add a subscription

After you create an Office 365 tenant ID, choose an Office 365 subscription. To compare Office 365 subscriptions offered by Rackspace, see [Office 365 - Pick your plan](https://www.rackspace.com/office-365/pick-your-plan).

1. In the [Office 365 manager page of the Cloud Office control panel](https://cp.rackspace.com/Office365#/Manage), click **Add Subscription**.
2. Select a plan. To compare Office 365 subscriptions offered by Rackspace, see [Office 365 - Pick your plan](https://www.rackspace.com/office-365/pick-your-plan).
3. Enter the number of licenses that you need.
4. Click **Add Subscription**.

Pending subscriptions appear as yellow in the subscription list. Active subscriptions appear as green.

#### Add-on plans

Add-ons become available after you add a subscription. They appear below your subscription list.

Click an add-on to see a description and confirm its addition to your service. Note that add-on pricing is per license.

### Manage your subscription

To manage your subscription’s feature, click the gear icon next to your subscription.

To change the number of licenses for your subscription, click **Edit License Quantity** to select a different number, and then click **Save**.

To delete your subscription, click **Suspend/Delete** and then click **Suspend Subscription** to confirm.

**Note**: Suspended subscriptions retain your data for 60 days before being permanently deleted. You are not billed while a subscription is suspended.

### Log in to the Office 365 portal

1. In the [Cloud Portal Office 365 manager](https://cp.rackspace.com/Office365#/Manage), click **Log in to Office 365 portal**.

2. Enter the tenant ID and password that you created in Cloud Office.

When you first log in, the Office 365 portal requires you to enter and confirm a new password. After you confirm the password, the only user who can log in to your Office 365 account is **admin@{tenantName}.onmicrosoft.com**, until new users are created.
