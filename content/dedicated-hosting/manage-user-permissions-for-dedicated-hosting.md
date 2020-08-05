---
permalink: manage-user-permissions-for-dedicated-hosting/
audit_date: '2020-07-17'
title: 'Manage user permissions for Dedicated Hosting'
type: article
created_date: '2018-11-28'
created_by: Kate Dougherty
last_modified_date: '2020-07-17'
last_modified_by: Rose Morales
product: Dedicated Hosting
product_url: dedicated-hosting
---

This article describes user permissions for Dedicated Hosting and shows you
how to manage these permissions.

You manage permissions in the [MyRackspace
portal](https://login.rackspace.com) under **Account > Permissions**.

**Note**: To access the **Permissions** area in the MyRackspace Portal and
modify another user’s permissions, you must have either the **Account
Administrator** permission or the **Admin** permission. The **Account
Administrator** permission grants the user unlimited access to all sections of
the MyRackspace Portal. The **Admin** permission (on a device or service)
grants the user the ability to access and manage the device or service.

### Categories of permissions

The following categories of permissions are available for Dedicated Hosting
accounts:

- **Direct permissions**: Grant the user direct access to
  account permissions, linked cloud accounts, devices, or services.

- **Effective permissions**: Are inherited as a result of their memberships in user and product groups.

**Note**: You can grant a user a combination of direct and effective
permissions. MyRackspace uses the highest level of permission granted.

### Methods for assigning permissions

You can assign permissions in the MyRackspace Portal in the following ways:

#### Assign by user

Allows you to select an individual and grant them:

- Permissions at the account level.
- Access to linked cloud accounts, devices, services or **Product Groups**.

To assign permissions by user, perform the following steps:

1. Click on **Assign by User**.

2. Click on the specific user and select the tab accordingly.

#### Assign by user group

Allows you to select a group of users and grant them:

- Permissions at the account level.
- Access to linked cloud accounts, devices, services or **Product Groups**.

To assign permissions by user group, perform the following steps:
  
1. Click on **Assign by Group**.

2. Click on the specific group and select the tab accordingly.

#### Assign by product

Allows you to select a linked cloud account, device, or service and do the following tasks:

- Associate it with users or **User Groups**.
- Assign users or **User Groups** portal access permissions.
  
To assign permissions by product, perform the following steps:

1. Click on **Assign by Product**.

2. Click on the specific linked cloud account, device, or service and select the tab accordingly.

#### Assign by product group

Allows you to select a **Product Group** containing linked cloud accounts, devices, or services and do the following tasks:

- Associate it with users or **User Groups**
- Assign users or **User Groups** portal access permissions.
 
To assign permissions by product group, perform the following steps:

1. Click on **Assign by Product Group**.

2. Click on the specific **Product Group** and select the tab accordingly.
  
### Manage groups

This section shows you how to manage groups.

#### Create a user group

Use the following steps to create a user group:

1. Log in to the [MyRackspace Portal](https://login.rackspace.com).
2. In the subnavigation bar, select **Account > Permissions**.
3. At the top of the page, click **Manage Groups**.
4. In the **User Groups** section, enter a name for the group, then click the
   green plus sign to create the group.
5. On the new page that appears, select the **Group Members** that you want to
   add to the group and click **Save Changes**.

#### Create a product group

Use the following steps to create a product group:

1. Log in to the [MyRackspace Portal](https://login.rackspace.com).
2. In the subnavigation bar, select **Account > Permissions**.
3. At the top of the page, click **Manage Groups**.
4. In the **Product Groups** section, enter a name for the group, then click
   the green plus sign to create the group.
5. On the new page that appears, select the accounts, devices, and services
   that you want to add to the group and click **Save Changes**.

#### Grant a user group access to a product group

Use the following steps to grant a user group access to a product group:

1. Log in to the [MyRackspace Portal](https://login.rackspace.com).
2. In the subnavigation bar, select **Account > Permissions**.
3. In the **User Groups** section, select an existing user group.
4. Click **Assign by User** at the top of the page (if it isn't already the
   active tab).
5. Click the **Product Groups** tab to display a list of products.
6. In the row for each product for which you want to assign permissions,
   select the radio button that corresponds to the permission level that you
   want to set for the product.

#### Grant a product group access to a user group

Use the following steps to grant a product group access to a user group:

1. Log in to the [MyRackspace Portal](https://login.rackspace.com).
2. In the subnavigation bar, select **Account > Permissions**.
3. At the top of the page, click **Assign by Product**.
4. In the **Product Groups** section, select an existing product group.
5. Click the **User Groups** tab to display a list of user groups.
6. In the row for each user group for which you want to assign permissions,
   select the radio button that corresponds to the permission level that you
   want to set for the user group.

#### Delete a user or product group

Use the following steps to delete a user or product group:

1. Click the arrow icon to the left of the user or product group to expand the row for that group.
2. Click **Edit Group**.
3. Select **Actions > Delete Group**.

### Manage global permissions

The **Global Permissions** section enables you to make changes across your
entire account.

**Ticketing Settings** enables you to control the tickets that your users have
permission to see when those tickets concern one or more devices.

The following table shows the ticketing settings that are required for common
actions or views:

<table>
  <tr>
    <th>Ticketing setting</th>
    <th>Functionality</th>
  </tr>
  <tr>
    <td>Flexible Ticket Viewing (default setting)</td>
    <td>Enables users to see tickets that include a device that they have permission to view. For example, if a user has access to device A, they see all of the tickets that include device A, even if another device is on the ticket. If device C is later added to the ticket and the user does not have access to device C, the user can still see the ticket.</td>
  </tr>
  <tr>
    <td>Strict Ticket Viewing</td>
    <td>Requires users to have access to all of the devices on a ticket in order to see that ticket. For example, if a ticket includes device A and device B, then the user must have permissions to both devices to see the ticket. If device C is later added to the ticket and the user does not have access to device C, the user is no longer be able to see the ticket.</td>
  </tr>
</table>

### How permissions impact the user experience for tickets

The following table shows the permissions that a user needs to perform common
tasks with tickets:

<table>
  <tr>
    <th>Permission required</th>
    <th>Task</th>
  </tr>
  <tr>
    <td><b>View Tickets</b> or <b>Edit Tickets</b> permission</td>
    <td>View or include another user on an account ticket (a ticket that doesn't have a device or service associated with it)</td>
  </tr>
  <tr>
    <td><b>View</b>, <b>Edit</b>, or <b>Admin</b> permission to that device</td>
    <td>View or include another user on a ticket that has a device associated with it</td>
  </tr>
  <tr>
    <td><b>View</b>, <b>Edit</b>, or <b>Admin</b> permission to that service</td>
    <td>View or include another user on a ticket that has a service associated with it (such as tickets for Managed Antivirus)</td>
  </tr>
</table>
