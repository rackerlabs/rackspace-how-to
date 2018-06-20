---
permalink: overview-role-based-access-control-rbac/
audit_date: '2018-02-16'
title: Learn about Role-Based Access Control (RBAC)
type: article
created_date: '2013-04-14'
created_by: Renee Rendon
last_modified_date: '2018-06-20'
last_modified_by: Kate Dougherty
product: undefined
product_url: undefined
---

**Previous section:** [Getting started with Role Based Access Control
(RBAC)](/how-to/getting-started-with-role-based-access-control-rbac)  

This article answers basic questions about the Role Based Access Control
(RBAC) service.

**Note:** The RBAC service is currently unavailable for RackConnect.

### What is RBAC?

RBAC is a secure method of restricting account access to authorized
users. This method enables account owners to add users and assign roles.
Each role has specific permissions that Rackspace has defined.
RBAC enables users to perform actions based on the scope of their
assigned roles.

Account owners can create up to 100 users, each with
their own password, secret question and answer, and API key.

### Why implement RBAC?

RBAC gives customers a greater degree of control over cloud resource use, with
an additional layer of system security.

### What types of users does RBAC have?

RBAC has the following types of users:

-  **Account owner** - The account owner is the primary contact for the
   account and has full permissions to execute all capabilities for
   every product available. Each account has a single account owner.

-  **Account administrator** - The account administrator has a substantial
   subset of account owner permissions. This role is used when the account
   owner wants to share or delegate responsibilities.

-  **Account user** - The account user is a user who has been added by
   the account owner and has been assigned to specific product or
   account roles.

### What actions are restricted to the account owner?

The account owner is the only user who can perform the following actions:

 - View or modify the Account Owner or other users with the Account
   Administrator permission
 - Make other users Account Administrators
 - Configure Rackspace account-wide settings including enabling multi-factor
   authentication, configuring session duration, etc.
 - Cancel the Rackspace account

### What privileges does the account administrator have?

The Account Administrator has the following privileges:

 - Admin rights to the Rackspace Billing and Payments portal
 - Ability to create and delete users on the Rackspace account and manage
   their permissions on a per AWS account basis
 - All of the privileges that users have

### What is a role?

The term *role* describes the level of access associated with a user's
account. RBAC limits risk by ensuring that users do not have access to
features that extend beyond their areas of expertise or responsibility.

A role can grant access to all of the resources relating to a single product
or to multiple products. RBAC does not restrict access to specific files,
directories, or servers.

### What roles are available through RBAC?

RBAC has the following account roles and product roles.

**Note:** A user may be assigned both an account role and a product role.

#### Account roles

Account roles are account-wide. RBAC has the following account roles.

##### Billing and payments

Assign the following account roles to the users who manage the billing for
your Rackspace customer account.

-  **Billing:admin** - The billing admin role has
   permissions to create, read, update, and delete billing and
   payment resources.

-  **Billing:observer** - The billing observer role has
   permissions to read billing and payment resources. This role is read-only.

To assign these permissions when creating or editing a user in the Cloud
Control Panel, scroll to the **Rackspace Account Permissions** section of the
user details and select the role that you want to assign from the drop-down
list to the right of **Billing and Payments**.

##### Support tickets

Assign the following account roles to the users who manage the support tickets
for your Rackspace customer account.

-  **Support:admin** - The support admin role has permissions to create,
   read, update, and delete support ticket resources.

-  **Support:observer** - The support observer role has
   permissions to read support ticket resources. This role is read-only.

To assign these permissions when creating or editing a user in the Cloud
Control Panel, scroll to the **Rackspace Account Permissions** section of the
user details and select the role that you want to assign from the drop-down
list to the right of **Support Tickets**.

#### Product roles

A product role may apply to multiple products, or to a single product. RBAC
has the following product roles.

##### Multiple-product roles

Multiple-product roles grant access to resources associated with multiple
products.

RBAC has the following multiple-product roles:

-  **Admin** - The admin role has permissions to
   create, read, update, and delete resources within multiple
   designated products.

-  **Read-only access** - The read-only access role has permissions to
   view resources within multiple designated products.

These permissions apply to products that are RBAC-enabled.

**Note**: Users with full access and read-only access roles have
automatic access to all new products that become RBAC-enabled, with the
exception of account administration tasks such as billing. Product roles
do not include account roles.

##### Custom roles

Custom roles enable account owners to assign users different permissions for
different products. After a user is assigned custom roles, those roles can
only be changed on a per-product basis.

RBAC has the following custom roles:

-  **Product:admin** - The product admin role has permissions to
   create, read, update, and delete resources for the designated
   product.

-  **Product:creator** - The product creator role has permissions to
   create, read, and update resources for the designated product. The creator
   role cannot delete a resource. (Any destructive actions are prohibited.)

-  **Product:observer** - The product observer role has permissions to
   read given resources for the designated product. This role is read-only.

**Note** You can create a new user and give the user account permissions
without giving them product permissions. To do this, simply skip the **Product
Permissions** section of the **Create User** page.  

### What are the contact types in the Cloud Control Panel?

Contact types are similar to tags. Using contact types can help account owners
manage users. The Cloud Control Panel offers the following contact types:

-  **Primary** - This contact type is automatically assigned to the
   owner of the account. Each account has a single Primary contact.

-  **Billing** - This contact type is automatically assigned to
   the account and populated with the billing address for the account.
   There is one Billing contact per account. It is not necessary to assign
   a username to the Billing contact.

-  **Administrative** - This contact type can be assigned to users who
   primarily handle administrative duties such as billing
   and payments. Administrative contacts do not receive technical
   alerts from our automated systems. No specific account implications
   come with this role. For example, when an administrative user changes
   their address, the change does not affect the billing address for the
   account.

-  **Technical** - This contact type can be assigned to users who
   primarily perform technical tasks. These users receive monitoring
   alerts by default.

### When do I need to implement RBAC?

Implement RBAC when you would like to achieve the following results:

-  Minimize downtime and accidental changes to cloud resources by restricting
   account access to only a few people.

-  Help prevent unauthorized access to cloud products by assigning each user
   their own credentials.

-  Synchronize cloud product access with the functions of an employee's job.

### Who can use RBAC?

RBAC is available to all Rackspace customers.

### How can I get RBAC?

RBAC is automatically activated when the account owner adds users to an
account. Account owners can add users through the [Cloud Control
Panel](https://mycloud.rackspace.com/) or the API.

For more information about specific RBAC-related APIs, see the [Rackspace
API documentation](https://developer.rackspace.com/docs/).

### Which products are currently RBAC-enabled?

The following Rackspace products are RBAC-enabled:

-  [Cloud Servers](/how-to/cloud-servers)
-  [Cloud Files](/how-to/cloud-files)
-  [Cloud Databases](/how-to/cloud-databases)
-  [Cloud Load Balancers](/how-to/cloud-load-balancers)
-  [Cloud Queues](/how-to/cloud-queues)
-  [Rackspace Monitoring](/how-to/rackspace-monitoring)
-  [Rackspace Metrics](/how-to/rackspace-metrics)
-  [Cloud Backup](/how-to/cloud-backup)
-  [Cloud Networks](/how-to/cloud-networks)
-  [Cloud Block Storage](/how-to/cloud-block-storage)
-  [Auto Scale](/how-to/rackspace-auto-scale)
-  [Cloud Images](/how-to/cloud-images)
-  [Cloud Orchestration](/how-to/cloud-orchestration)
-  [Cloud DNS](/how-to/cloud-dns)
-  [Cloud Feeds](/how-to/cloud-feeds-overview)
-  [Rackspace CDN](/how-to/rackspace-cdn)
-  [Rackspace billing FAQ](/how-to/rackspace-billing-faq)

### Which products will be RBAC-enabled in the future?

New products are RBAC-enabled as they are launched.

### Which products will not have RBAC?

The following Rackspace products will not have RBAC:

-  RackConnect

### Next section

[Use Role-Based Access Control
(RBAC)](/how-to/managing-role-based-access-control-rbac)
