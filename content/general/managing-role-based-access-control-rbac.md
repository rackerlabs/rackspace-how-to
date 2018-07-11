---
permalink: managing-role-based-access-control-rbac/
audit_date: '2018-06-19'
title: Use Role Based Access Control (RBAC)
type: article
created_date: '2013-06-28'
created_by: Renee Rendon
last_modified_date: '2018-06-20'
last_modified_by: Kate Dougherty
product: undefined
product_url: undefined
---

**Previous section:** [Learn about Role Based Access Control
(RBAC)](/how-to/overview-role-based-access-control-rbac)

The account owner and account administrator implement Role Based Access
Control (RBAC) by adding users to the account and assigning roles. This
article is intended for account owners and account administrators, and guides
you through this process by using the [Cloud Control 
Panel](https://mycloud.rackspace.com/).

For information about setting up RBAC through the API, see the [Rackspace
Cloud Identity API
Guide](https://developer.rackspace.com/docs/cloud-identity/v2/developer-guide/).

**Note:** It is possible to assign a mix of multiple-product roles and
per-product roles to one user through the API. The most permissive role
determines the user's level of access.

### Account credentials

Rackspace recommends that you change the account password
and secret question before adding new users to the account.

When new users are created, a temporary password is assigned to
them. They should change the temporary password at their first login.

Also, new users must be informed that they have been added to the
account. Rackspace does not notify them automatically. You
can use the following text to notify your users:

   **Your access to this account has changed. You have been added as a new
   user, and you must update your credentials (password and secret question)
   as soon as possible. See *name* for your temporary access information.**

### Create a new user

To create a new user, use the following steps:

1. In the upper-right corner of the [Cloud Control
   Panel](https://mycloud.rackspace.com/), click **Account > User Management.**

2. On the **User Management** page, click **Create User**.

3. Enter information in the **User Information** section.

   **Note:** The username must be unique. You can't recover the username of a
   deleted user.

4. Select a **Contact Type** to assign to the user. RBAC has the following
   contact types:

   -  **Technical**
   -  **Administrative**

   These contact types are for reference only. They do not affect the user's
   permissions.

5. In the **Secret Question and Answer** section, enter a **Question** and an
   **Answer**.

6. In the **Rackspace Account Permissions** section, you can either assign the
   user an Account Administrator role, or assign roles for Billing and
   Payments and Support Tickets on an individual basis.

   To assign a user an Account Administrator role, click the toggle button next
   to **Account Administrator** to activate it.

   Alternatively, to assign different permissions for different areas, scroll
   to the **Area** section and select the permission you want to assign from
   the drop-down menu to the right of each area.

7. Optionally, in the **Product Permissions** section, assign product
   permissions to the user. Click the tab for the tab for a product, then
   select from the permission choices.

   The **Rackspace Cloud** tab enables you to assign either global permissions
   for all Rackspace Cloud products, or per-product custom roles.

   **Note**: For optimal product interaction, see the "Suggested role
   configurations" section of this article.

   To assign per-product custom roles, choose **Custom (Per Product Access)**
   under **Product Access**. A list of Rackspace Cloud products appears.
   The default role for each product is **No Access**. To change the default
   value, select either **Admin (View, Create, Edit, Delete)** or **Observer
   (View Only)** from the drop-down menu for the product.

   **Note:** Depending on the roles assigned, the Control Panel view is
   different for each user.

8. When you are finished, scroll to the bottom and click **Create User**.

   **Note:** After a user is assigned a custom role, that custom role
   cannot be modified. However, if the user is later assigned the
   account administrator role at the account level, that action overwrites all
   product-level custom roles. For more information, see [Known issues and
   suggested workarounds for
   RBAC](/how-to/known-issues-and-suggested-workarounds-role-based-access-control-rbac).


### Suggested role configurations

Rackspace recommends the following custom role configurations for
optimal product interaction.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Product</th>
<th align="left">If</th>
<th align="left">And</th>
<th align="left">Then</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>Cloud Load Balancers</strong></td>
<td align="left"><p>A user has been assigned any Cloud Load Balancers role.</p></td>
<td align="left"><p>n/a</p></td>
<td align="left"><p>In Cloud Servers, give the user the <strong>Observer</strong> role (minimum action).</p></td>
</tr>
<tr class="even">
<td align="left"><strong>Cloud Load Balancers </strong></td>
<td align="left">A user wants to add a node by using the <strong>Nodes > Add Cloud Servers</strong> option in the Cloud Control Panel.</td>
<td align="left">The user has been assigned any Cloud Load Balancers role.</td>
<td align="left">In Cloud Servers, give the user any role. </td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Cloud Databases</strong></p></td>
<td align="left"><p>A user wants to create a backup in Cloud Databases.</p></td>
<td align="left"><p>n/a</p></td>
<td align="left"><p>In Cloud Files, give the user the <strong>Admin</strong> role.</p></td>
</tr>
</tbody>
</table>

### Rackspace customers with multiple accounts

Rackspace customers with more than one account might want to allow the
same user to access each account. In this situation, the account
owner must configure that user with a different username for
each account. The following graphic illustrates this scenario.

<img src="{% asset_path general/managing-role-based-access-control-rbac/MutiAccountsRBAC.png %}" width="534" height="250" />
