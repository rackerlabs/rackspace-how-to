---
permalink: managing-role-based-access-control-rbac/
audit_date:
title: Use Role-Based Access Control (RBAC)
type: article
created_date: '2013-06-28'
created_by: Renee Rendon
last_modified_date: '2018-02-12'
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
click **Account > User Management.**

2. On the **User Management** page, click **Create User**.

3. Enter information in the **User Information** section.

  **Note:** The username must be unique. You can't recover the username of a deleted user.

4. In the **Rackspace Account Permissions** section, select the account
   Permissions to assign to the user.

5. In the **Product Permissions** section, select the product permissions to
   assign to the user for the products to which you subscribe.

  For optimal product interaction, see the "Suggested role configurations" section of this article.

8. Click **Create User**.

### Add a user login and custom role to an existing contact

To add a user login and custom role to an existing contact, use the following steps:

1. On the **User Management** page of the Control Panel, click on the
   contact's name.

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
