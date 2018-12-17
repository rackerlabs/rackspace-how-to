---
permalink: rackspace-cloud-user-groups/
audit_date: '2018-11-20'
title: Rackspace Cloud user groups
type: article
created_date: '2018-11-20'
created_by: Cat Lookabaugh
last_modified_date: '2018-11-20'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

As of October 31, 2018, Cloud customers can leverage *user groups* to make the
process of managing users and permissions faster and easier. By grouping users
together and assigning permissions to the group, you can adjust access for all
the users in the group at one time, rather than adding or revoking access permission
for each user individually.

### Create a user group

Use the following steps to create a user group:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Account > User Management**.

3. Click the **User Group** tab.

4. Click **Create New User Group**.

5. Enter a simple identifier for the **Group Name** and a longer description
   for **Group Description**.

6. Click **Create Group**.

### Manage group members

Users that have a check mark are included in the group.  You can remove a user
from the group by removing the check mark. To add a new member or edit a
member, click **Add/Edit Members**.

**Note:** If a greater permission has been granted in a group, the
lesser permissions are disabled when you directly edit individual users. Thus,
if a user gets `billing:admin` from a user group, the option to select
`billing:observer` is disabled when you directly edit permissions for
that user.

### Example user group

Here is an example user group and how you might use it.

The following images show the **Billing Users** group members and their
permissions.  The purpose of this group is to give all members of this group
*Admin* permissions for Billing and Payments.  Any user who belongs to this
group automatically inherits all of the permissions of the group.  If users have
permissions from another group or by direct assignment, the users keep the most
elevated privilege that they have been given.

In this example, user CloudCharles was directly assigned as a *Ticketing Admin*
when the user was created.  CloudCharles keeps the *Ticketing Admin* permission
even though no permissions for Ticketing are assigned as part of this group.


<img src="{% asset_path general/rackspace-cloud-user-groups/Picture1.png %}" />

<img src="{% asset_path general/rackspace-cloud-user-groups/Picture2.png %}" />
