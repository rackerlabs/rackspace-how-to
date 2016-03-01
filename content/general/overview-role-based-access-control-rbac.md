---
node_id: 3403
title: 'Overview: Role Based Access Control (RBAC)'
type: article
created_date: '2013-04-14'
created_by: Renee Rendon
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

### Previous section

[Getting Started with RBAC](/how-to/getting-started-with-role-based-access-control-rbac)  

This guide is designed to get administrators started with Role-Based
Access Control (RBAC) and to answer questions about the service.

### What is RBAC?

RBAC is a secure method of restricting account access to authorized
users. This method enables the account owner to add users to the account
and assign each user to specific roles. Each role has specific
permissions defined by Rackspace. RBAC allows users to perform various
actions based on the scope of their assigned role.

The account owner has the ability to create up to 100 users, each with
their own password, secret question and answer, and API key.

### Why implement RBAC?

RBAC is important because it provides customers a greater degree of
control over cloud resource utilization with the added layer of system
security.

### What are roles?

*Role* describes the level of access users have for their account. By
assigning roles to users, administrators can allow multiple users to
complete tasks safely. RBAC limits risk by ensuring that users do not
have access beyond their training or level of control.

Roles grant access across all resources of a single product or for
multiple products. RBAC does not restrict access to specific files,
directories, or servers.

### What roles are available through RBAC?

RBAC provides the following roles.

#### Multiple-product roles

-   **Full access** - The full access role has the permissions to
    create, read, update, and delete resources within multiple
    designated products where access is granted. These permissions apply
    to products that are currently RBAC enabled products and
    to products as they become RBAC-enabled in the future.

-   **Read-only access** - The read-only access role has permissions to
    view given resources within multiple designated products where
    access is granted. These permissions apply to products that are
    currently RBAC enabled products and to products as they
    become RBAC-enabled in the future.

**Note**: Users with the full access or the read-only roles will have
automatic access to all new products that become RBAC-enabled, with the
exception of account administration tasks such as billing. Product roles
do not include Account roles.

#### Custom roles

The Custom roles provide a useful mix of permission levels for assigning
permissions per product. After the user is assigned the Custom roles,
roles can be changed only per product.

-   **Product:admin** - The *product* admin role has permissions to
    create, read, update, and delete resources within the designated
    product where access is granted.

-   **Product:creator** - The *product* creator role has permissions to
    create, read, and update resources within the designated product
    where access is granted. The creator role cannot delete a resource.
    (Any destructive actions are prohibited.)

-   **Product:observer** - The *product* observer role has permission to
    read given resources within the designated product where access
    is granted. This role is read-only.

#### Account roles

Assign Account roles to users who manage your Rackspace customer
account.

-   **Billing:admin &ndash;** The *account* role of billing admin has
    permissions to create, read, update, and delete given billing and
    payment resources within the designated product where access
    is granted.

-   **Billing:observer &ndash;** The *account* role billing observer has
    permission to read given billing and payment resources within the
    designated product where access is granted. This role is read-only.

To give a new user account permissions without product permissions,
choose the Custom setting and keep all Product roles set to No Access.
Then assign the appropriate Account role to the user.

**Note:** A user may be assigned Product roles and Account roles.

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

### What are the contact types in the Control Panel?

The following types of contacts are shown in the Control Panel. Contact
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

-   In an effort to minimize downtime and accidental changes to the
    cloud resources, the account owner would like to restrict access to
    the accounts to only a few people.

-   In an effort to synchronize cloud product access to the functions of
    an employee's job, the account owner would like to grant access to
    employees based on the nature of their position.

-   In an effort to help prevent unauthorized access to cloud products
    through the sharing of admin credentials, the account owner would
    like each user of the cloud accounts to have their own credentials.

RBAC does not need to be implemented when only one credential set is
needed for an account.

### Who can use RBAC?

RBAC is available to all Rackspace customers.

### How can I get RBAC?

Adding users to the account activates RBAC. Account owners can add users
through the Cloud Control Panel or through API.

For more information about specific RBAC-related APIs, see the Rackspace
API documentation at <https://developer.rackspace.com/docs/>.

### Which products are currently RBAC enabled?

-   [Next Generation Servers](/how-to/next-generation-cloud-servers-migration-considerations-and-options)
-   [First Generation Servers](/how-to/cloud-servers)
-   [Cloud Files](/how-to/cloud-files)
-   [Cloud Databases](/how-to/cloud-databases)
-   [Cloud Load Balancers](/how-to/cloud-load-balancers)
-   [Cloud Queues](/how-to/creating-cloud-queues)
-   [Rackspace Monitoring](/how-to/cloud-monitoring)
-   [Rackspace Metrics](/how-to/rackspace-metrics-overview)
-   [Cloud Backup](/how-to/rackspace-cloud-backup-overview)
-   [Cloud Networks](/how-to/cloud-networks)
-   [Cloud Block Storage](/how-to/cloud-block-storage-overview)
-   [Auto Scale](/how-to/rackspace-auto-scale)
-   [Cloud Images](/how-to/cloud-images)
-   [Cloud Big Data v1](/how-to/detailed-permissions-matrix-for-cloud-big-data)
-   [Cloud Big Data v2](/how-to/detailed-permissions-matrix-for-cloud-big-data-v2)
-   [Cloud Orchestration](/how-to/cloud-orchestration)
-   [Cloud DNS](/how-to/cloud-dns)
-   [Cloud Feeds](/how-to/cloud-feeds-overview)
-   [Rackspace CDN](/how-to/rackspace-cdn)
-   [Billing and Payment Services](/how-to/rackspace-billing-faq)

### Which products will be RBAC enabled in the future?

-   Rackspace Orchestration Service
-   New products as they are launched

### Which products will not have RBAC?

-   Cloud Sites
-   RackConnect
-   Mailgun

### Next section

[Managing RBAC](/how-to/managing-role-based-access-control-rbac)
