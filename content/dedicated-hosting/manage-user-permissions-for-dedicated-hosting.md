---
permalink: manage-user-permissions-for-dedicated-hosting/
audit_date: '2018-11-27'
title: 'Manage user permissions for Dedicated Hosting'
type: article
created_date: '2018-11-27'
created_by: Kate Dougherty
last_modified_date: '2018-11-27'
last_modified_by: Kate Dougherty
product: Dedicated Hosting
product_url: dedicated-hosting
---

This article explains user permissions for Dedicated Hosting and shows you how
to manage these permissions.

You manage permissions in the [MyRackspace
portal](https://login.rackspace.com) under **Account > Permissions**.

**Note**: To access the **Permissions** area in the MyRackspace portal and
modify another user’s permission, you must have one of the following
permissions:

  - **Account Administrator**: This permission grants a user unlimited access
    to every section of the MyRackspace portal.

  - **Admin**: This permission (on a device or service) grants a user the
    ability to manage the device or service, as well as which users can access the device or service.

### Types of permissions

The following types of permissions are available for Dedicated Hosting
accounts:

- **Direct Permissions**: These permissions grant the user direct access to
  account permissions, cloud accounts, devices, or services.

- **Effective Permissions**: The permissions that a user inherits as a result
  of their memberships in User and Product Groups.

**Note**: You can grant a user a combination of direct and effective
permissions. MyRackspace adheres to the highest level of permission granted.

### How permissions impact the user experience for tickets

The following table shows the permissions that a user needs to perform common
tasks with tickets:

| **Task** 	| **Permission required** 	|
|---------------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------	|
| View or include another user on an account ticket (a ticket that doesn't have a device or service associated with it) 	| **View Tickets** or **Edit Tickets** permission 	|
| View or include another user on a ticket that has a device associated with it | **View**, **Edit**, or **Admin** permission to that device 	|
| View or include another user on a ticket that has a service associated with it (such as tickets for Managed Antivirus)	| **View**, **Edit**, or **Admin** permission to that service 	|

### Assign permissions

This section describes how to assign permissions by user, User Group, product,
and Product Group.

#### Assign permissions by user

The _Assign by User_ option enables you to select an individual and grant them access to account level permissions, cloud accounts, devices, services or Product Groups.

#### Assign permissions by User Group

The _Assign by User Group_ option enables you to select a group of users and grant them access to account level permissions, cloud accounts, devices, services or Product Groups.

#### Assign permissions by product

The _Assign by Product_ option enables you to select a cloud account, device or service and assign them Users and User Groups.

#### Assign permissions by Product Group

The _Assign by Product Group_ option enables you to select a group of cloud accounts, devices or services and assign them Users and User Groups.

### Manage groups

This section shows you how to manage groups.

#### Create a User Group

Navigate to Users Groups under Manage Groups, submit a name for the group & click the green plus sign icon to create the group.

#### Create a Product Group

Navigate to Product Groups under Manage Groups, submit a name for the group & click the green plus sign icon to create the group.

#### Add members to a User Group

Select the User Group under Managed Groups and select from the list of users.

#### Add members to a Product Group

Select the Product Group under Managed Groups and select from the list of cloud accounts, devices or services.

#### Grant a User Group access to a Product Group

Navigate to an existing User Group under Assign by User, click on the Product Groups tab to set the permission level for the specific Product Group(s)

#### Grant a Product Group access to a User Group

Navigate to an existing Product Group under Assign by Products, click on the User Groups tab to set the permission level for the specific User Group(s)

#### Delete a User or Product Group

Select the User or Product Group and click Delete Group under the cog icon.

### Manage Global permissions

The Global Permissions section enables you to make changes across your entire
account.

Ticketing settings enable you to control the tickets that your users have
permission to see when those tickets concern one or more devices.

The following table shows the ticketing settings that are required for commmon
actions or views:

| **Functionality** 	| **Ticketing setting** 	|
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|-------------------------------------------	|
| To enable users to be able to see tickets that include a device that they have permission to view. <br />For example, if a user has access to device A, they will see all of the tickets that include device A even if another device is on the ticket.<br /> If device C is later added to the ticket and the user does not have access to device C, the user will still be able to see the ticket. 	| Flexible Ticket Viewing (Default Setting) 	|
| To require Users to have access to all of the devices on a ticket in order to see that ticket. <br /> For example, if a ticket includes device A and device B, then the User must have permissions to both devices to see the ticket.<br /> If device C is later added to the ticket and the user does not have access to device C, the user is no longer be able to see the ticket. 	| Strict Ticket Viewing 	|
