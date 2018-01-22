---
permalink: combine-invoices-for-rackspace-managed-and-cloud-accounts/
audit_date: '2017-08-31'
title: Combine invoices for Rackspace Managed and Cloud accounts
type: article
created_date: '2017-08-07'
created_by: Stephanie Fillmon
last_modified_date: '2017-08-31'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Instead of paying separate bills for multiple Rackspace accounts, you can combine your bills into a single invoice and pay only once. This article describes how to combine invoices, how your billing due date is affected, and how to separate a combined invoice.

**Note:** Currently, you can combine bills only from Rackspace Managed and Rackspace Cloud accounts. You cannot combine accounts that are billed in different currencies, that are already combined with another invoice, that are contracted with different contracting entities, or if there is an outstanding balance on the child account.

### Combine invoices

1. For Cloud accounts, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/). For Managed accounts, log in to the [MyRackspace portal](https://my.rackspace.com/).
2. In the upper-right corner of the page, click your account name, and then click **Billing Overview** for Cloud accounts and **Transactions** for Managed accounts.

   You are redirected to the Rackspace Billing portal.

3. In the top navigation bar, click **Billing Settings**.

   A list of all accounts currently included in your invoice are displayed in the Invoiced Accounts section.

4. Click **Add Account to Invoice**.

5. On the Add Account screen, enter the account number that you want to add to the invoice.

   <img src="{% asset_path general/combine-invoices-for-rackspace-managed-and-cloud-accounts/add-account.png %}" />

   Then enter the username and password for that account.

   <img src="{% asset_path general/combine-invoices-for-rackspace-managed-and-cloud-accounts/add-account-details.png %}" />

6. Select the check box to agree to the terms of service, and then click **Add Account**.

   A pop-up dialog box displays and confirms the account information that you want to add to the invoice. Click **Add Account** to confirm.

   <img src="{% asset_path general/combine-invoices-for-rackspace-managed-and-cloud-accounts/confirm-add-account.png %}" />

After the accounts are consolidated, the Invoiced Accounts section of the Billing Settings page displays the new account.

### Billing cycle

If your combined invoice includes only Rackspace Cloud accounts, then you will receive your next invoice on your normal bill date for your master account.

If your combined invoice includes a Rackspace Managed account, then your next invoice will be billed on the first day of the month.

The following example describes how your billing is affected when you combine Cloud and Managed account invoices:

- The Managed account is the master account with a billing date of February 1, and the Cloud account's billing date is February 15.
- Combined invoicing is set up on February 20.
- On March 1, an invoice is generated for only the master account.
- On March 15, no invoice is generated for the Cloud account.
- On April 1, the combined invoice is generated with all Managed and Cloud charges, including the owed Cloud account amount from February 15 to March 31.
- From this point on, the combined invoice is billed on the first of the month.

**Note**: If your Cloud account has discounts applied to it, they are prorated for the period during which no bill is generated.

### Separate a combined invoice

To separate a combined invoice, you must contact the account manager to update your billing preferences.
