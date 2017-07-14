---
permalink: overview-role-based-access-control-rbac/
audit_date:
title: Learn about Role-Based Access Control (RBAC)
type: article
created_date: '2013-04-14'
created_by: Renee Rendon
last_modified_date: '2017-06-06'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

**Previous section:** [Getting started with Role-Based Access Control (RBAC)](/how-to/getting-started-with-role-based-access-control-rbac)  

This article answers basic questions about the Role-Based Access Control (RBAC) service.

**Note:** The RBAC service is not currently available for RackConnect.

### What is RBAC?

RBAC is a secure method of restricting account access to authorized
users. This method enables the account owner to add users to the account
and assign each user to specific roles. Each role has specific
permissions defined by Rackspace. RBAC allows users to perform various
actions based on the scope of their assigned role.

The account owner has the ability to create up to 100 users, each with
their own password, secret question and answer, and API key.

### Why implement RBAC?

RBAC provides customers a greater degree of
control over cloud resource use with the added layer of system
security.

### What are roles?

*Role* describes the level of access that users have for their account. By
assigning roles to users, administrators can allow multiple users to
complete tasks safely. RBAC limits risk by ensuring that users do not
have access beyond their training or level of control.

Roles grant access across all resources of a single product or for
multiple products. RBAC does not restrict access to specific files,
directories, or servers.

### What roles are available through RBAC?

RBAC provides the following roles.

#### Multiple-product roles

-   **Full access** - The full access role has permissions to
    create, read, update, and delete resources within multiple
    designated products where access is granted. These permissions apply
    to products that are currently RBAC-enabled and
    to products as they become RBAC-enabled.

-   **Read-only access** - The read-only access role has permissions to
    view given resources within multiple designated products where
    access is granted. These permissions apply to products that are
    currently RBAC-enabled and to products as they
    become RBAC-enabled.

**Note**: Users with the full or read-only access roles will have
automatic access to all new products that become RBAC-enabled, with the
exception of account administration tasks such as billing. Product roles
do not include account roles.

#### Custom roles

The custom roles provide a useful mix of permission levels for assigning
permissions per product. After the user is assigned the custom roles,
roles can be changed only per product.

-   **Product:admin** - The *product* admin role has permissions to
    create, read, update, and delete resources within the designated
    product where access is granted.

-   **Product:creator** - The *product* creator role has permissions to
    create, read, and update resources within the designated product
    where access is granted. The creator role cannot delete a resource.
    (Any destructive actions are prohibited.)

-   **Product:observer** - The *product* observer role has permissions to
    read given resources within the designated product where access
    is granted. This role is read-only.

#### Account roles

Assign account roles to users who manage your Rackspace customer
account.

-   **Billing:admin** - The billing admin role has
    permissions to create, read, update, and delete given billing and
    payment resources within the designated product where access
    is granted.

-   **Billing:observer** - The billing observer role has
    permissions to read given billing and payment resources within the
    designated product where access is granted. This role is read-only.

To give a new user account permissions without product permissions,
choose the **Custom** setting and keep all product roles set to **No Access**.
Then assign the appropriate account (billing) role to the user.

**Note:** A user may be assigned both product roles and account roles.

### What types of users does RBAC have?

RBAC has the following types of users:

-   **Account owner** - The account owner is the primary contact for the
    account and has full permissions to execute all capabilities for
    every product available. Each account is allowed only one
    account owner.

-   **Account user** - The account user is a user that has been added by
    the account owner and has been assigned to specific product or
    account roles.

### What actions are restricted to the account owner role?

Only the account owner role can perform the following actions:

-   Create new users, modify existing users, and delete users.
-   Make contact changes, including the billing contact.

### What are the contact types in the Cloud Control Panel?

The following types of contacts are shown in the Cloud Control Panel. Contact
types are similar to tags that can assist with user management.

-   **Primary** - This contact type is automatically assigned to the
    owner of the account. Only one Primary contact is allowed
    per account.

-   **Billing** - This contact type is automatically assigned to
    the account. Only one Billing contact is allowed per account. It is
    not necessary to assign a username to the Billing contact. This
    contact holds the address that Rackspace uses as the
    billing address.

-   **Administrative** - This contact type can be assigned to users that
    primarily perform administrative duties such as billing
    and payments. Administrative contacts do not receive technical
    alerts from our automated systems. No specific account implications
    come with this role. For example, if administrative users change
    their address, the change does not affect the billing address.

-   **Technical** - This contact type can be assigned to users that
    primarily perform technical tasks. These users receive monitoring
    alerts by default unless the notification plan is changed.

### When do I need to implement RBAC?

Implement RBAC in the following situations:

-   To minimize downtime and accidental changes to the cloud resources, the account owner wants to restrict account access to only a few people.

-   To synchronize cloud product access to the functions of an employee's job, the account owner wants to grant access to employees based on the nature of their position.

-   To help prevent unauthorized access to cloud products through the sharing of admin credentials, the account owner wants each user of the cloud accounts to have their own credentials.

When only one credential set is needed for an account, RBAC does not need to be implemented.

### Who can use RBAC?

RBAC is available to all Rackspace customers.

### How can I get RBAC?

Adding users to an account activates RBAC. Account owners can add users
through the Cloud Control Panel or the API.

For more information about specific RBAC-related APIs, see the Rackspace
API documentation at <https://developer.rackspace.com/docs/>.

### Which products are currently RBAC-enabled?

-   [Cloud Servers](/how-to/cloud-servers)
-   [Cloud Files](/how-to/cloud-files)
-   [Cloud Databases](/how-to/cloud-databases)
-   [Cloud Load Balancers](/how-to/cloud-load-balancers)
-   [Cloud Queues](/how-to/cloud-queues)
-   [Rackspace Monitoring](/how-to/cloud-monitoring)
-   [Rackspace Metrics](/how-to/rackspace-metrics)
-   [Cloud Backup](/how-to/cloud-backup)
-   [Cloud Networks](/how-to/cloud-networks)
-   [Cloud Block Storage](/how-to/cloud-block-storage)
-   [Auto Scale](/how-to/rackspace-auto-scale)
-   [Cloud Images](/how-to/cloud-images)
-   [Cloud Big Data v1](/how-to/cloud-big-data)
-   [Cloud Big Data v2](/how-to/cloud-big-data)
-   [Cloud Orchestration](/how-to/cloud-orchestration)
-   [Cloud DNS](/how-to/cloud-dns)
-   [Cloud Feeds](/how-to/cloud-feeds-overview)
-   [Rackspace CDN](/how-to/rackspace-cdn)
-   [Billing and Payment Services](/how-to/rackspace-billing-faq)

### Which products will be RBAC-enabled in the future?

New products as they are launched will be RBAC-enabled.

### Which products will not have RBAC?

-   RackConnect

### Next section

[Use Role-Based Access Control (RBAC)](/how-to/managing-role-based-access-control-rbac)
