---
permalink: known-issues-and-suggested-workarounds-role-based-access-control-rbac/
audit_date: '2018-12-10'
title: Known issues and suggested workarounds for RBAC
type: article
created_date: '2013-08-16'
created_by: Renee Rendon
last_modified_date: '2018-12-17'
last_modified_by: Kate Dougherty
product: undefined
product_url: undefined
---

**Previous section**: [Role-Based Access Control (RBAC)
FAQ](/how-to/faq-role-based-access-control-rbac)

This article describes known issues with Role-Based Access Control
(RBAC). We are diligently working to resolve these issues. If you're
experiencing an issue that doesn't appear in this article, contact Rackspace
Support at 1 800 961 4454.

### Custom role

The Custom role enables you to assign per-product access. After a user is
assigned the Custom role, the account owner cannot change this role to a
multiproduct role (All Products or No Product Access) by using the Cloud
Control Panel.

#### Workaround

The account owner can simulate the Full Access role by
assigning the user the Admin role for all available products. To simulate
the Read-Only Access role, the account owner can assign the
Observer role to the user for all available products.

**Note**: If you use this workaround, the Custom role doesn't automatically
update when new Rackspace products become RBAC-enabled. The account owner must
update Custom roles to include the new products.

You can also change the Custom role to a multiproduct role by contacting
Support at 1 800 961 4454.

### Multiple roles for one user

You can only assign multiple roles for one user by using the
[API](https://developer.rackspace.com/docs/). The Cloud Control
Panel displays only the first role that is assigned to users that have multiple
roles.

#### Workaround

You can view multiple roles that are associated with a user by
using the [API](https://developer.rackspace.com/docs/).

### Suspended accounts

When an account is suspended, all users of the account are disabled. Users
aren't automatically re-enabled when the account is reactivated.

#### Workaround

When the account is reactivated, the account owner must re-enable users by
using the API or by contacting support at 1 800 961 4454.

### Next section
[Getting started with
RBAC](/how-to/getting-started-with-role-based-access-control-rbac)
