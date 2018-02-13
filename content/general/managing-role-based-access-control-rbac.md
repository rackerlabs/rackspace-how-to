---
permalink: managing-role-based-access-control-rbac/
audit_date:
title: Use Role-Based Access Control (RBAC)
type: article
created_date: '2013-06-28'
created_by: Renee Rendon
last_modified_date: '2018-02-13'
last_modified_by: Kate Dougherty
product: undefined
product_url: undefined
---

**Previous section:** [Learn about Role Based Access Control (RBAC)](/how-to/overview-role-based-access-control-rbac)

The account owner implements Role-Based Access Control (RBAC) by adding users to the account and assigning roles. This article is intended for account owners and guides you through this process using the [Cloud Control Panel](https://mycloud.rackspace.com/).

For information about setting up RBAC through the API, see the [Rackspace Cloud Identity API Guide](https://developer.rackspace.com/docs/cloud-identity/v2/developer-guide/).

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

**Your access to this account has changed. You have been added as a new user, and you must update your credentials (password and secret question) as soon as possible. See *name* for your temporary access information.**

### Create new users

To create new users, use the following steps:

1. In the upper-right corner of the [Cloud Control Panel](https://mycloud.rackspace.com/),
click your user name and then select **User Management.**

2. On the **User Management** page, click **Create User**.

3. Enter information in the **Login Details** section.

  **Note:** The username must be unique. You can't recover the username of a deleted user.

4. Select a role to assign to the user.

  - If you select the **Custom** role, go to step 5.
  - If you select the **Full Access** or **Read-Only Access** role, skip to step 6.

5. In the **Product Access** section, select a role for each user.

  For optimal product interaction, see the "Suggested role configurations" section of this article.

  **Note:** After a user has been assigned the custom role, this role cannot be changed to a multi-product role through the Cloud Control Panel. For more information about changing a custom role to a full access or read-only access role, see [Known issues and suggested workarounds for RBAC](/how-to/known-issues-and-suggested-workarounds-role-based-access-control-rbac).

6. In the **Contact Information** section, select the contact type and then specify the contact's name and email address.

7. If the primary contact's details will be used for the user, select
the **Use Primary Contact Details** check box. Otherwise, specify the
user's contact details.

8. Click **Create User**.

  **Note:** Depending on the roles assigned, the Control Panel view is different for each user.

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
<td align="left"><p> </p></td>
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
<td align="left"><p> </p></td>
<td align="left"><p>In Cloud Files, give the user the <strong>Admin</strong> role.</p></td>
</tr>
</tbody>
</table>

### Add a user login and custom role to an existing contact

To add a user login and custom role to an existing contact, use the following steps:

1. On the **User Management** page of the Control Panel, click the gear icon next to the contact's name.

2. Select **Add Login**.

3. Complete the **Username**, **Password**, **Security Question**, and
**Security Answer** fields.

4. After choosing the custom role, click **Save User Information**.

5. Click the gear icon next to that user's name and configure
the custom role.

### Rackspace customers with multiple accounts

Rackspace customers with more than one account might want to allow the
same user to access each account. In this situation, the account
owner must configure that user with a different username for
each account. The following graphic illustrates this scenario.

<img src="{% asset_path general/managing-role-based-access-control-rbac/MutiAccountsRBAC.png %}" width="534" height="250" />
