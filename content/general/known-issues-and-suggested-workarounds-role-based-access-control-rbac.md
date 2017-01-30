---
permalink: known-issues-and-suggested-workarounds-role-based-access-control-rbac/
audit_date:
title: Known issues and suggested workarounds for RBAC
type: article
created_date: '2013-08-16'
created_by: Renee Rendon
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

**Previous section:** [Role-Based Access Control (RBAC) FAQ](/how-to/faq-role-based-access-control-rbac)

This article describes known issues with Role-based Access Control
(RBAC). We are diligently working to resolve these issues. If you are
experiencing an issue that is not listed, contact customer
support at 1 800 961 4454.

### Custom role

**Known issue:** After a user has been assigned the custom
role, the account owner cannot change this role to a multiproduct role
by using the Cloud Control Panel.

**Workaround:** The account owner can simulate the full
access role by assigning to the user the admin role for all available
products. To simulate the read-only access role, the account owner can
assign to the user the observer role for all available
products.

**Note:** If you use this workaround, the custom role will not be updated
automatically when new Rackspace products become RBAC enabled. The
account owner must update custom roles to include the new
products.

You can also change the custom role to a multiproduct role
by contacting Support at 1 800 961 4454.

### Multiple roles for one user

**Known issue:** Multiple roles for one user can be assigned only
through the [API](https://developer.rackspace.com/docs/). The Cloud Control Panel
displays only the first role assigned to users that have multiple
roles.

**Workaround:** View a user's multiple roles through the [API](https://developer.rackspace.com/docs/).

### Suspended account

**Known issue:** When an account is suspended, all users of the
account are disabled. Users are not automatically re-enabled when the
account is reactivated.

**Workaround:** When the account is reactivated, the account owner
must re-enable users through the API or by contacting support at
1 800 961 4454.

### Next section
[Getting started with RBAC](/how-to/getting-started-with-role-based-access-control-rbac)
