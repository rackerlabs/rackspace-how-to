---
permalink: overview-role-based-access-control-rbac/
audit_date: '2018-02-16'
title: Learn about Role-Based Access Control (RBAC)
type: article
created_date: '2013-04-14'
created_by: Renee Rendon
last_modified_date: '2018-02-20'
last_modified_by: Kate Dougherty
product: undefined
product_url: undefined
---

**Previous section:** [Getting started with Role-Based Access Control (RBAC)](/how-to/getting-started-with-role-based-access-control-rbac)  

This article answers basic questions about the Role-Based Access Control (RBAC) service.

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

RBAC gives customers a greater degree of control over cloud resource use, with an additional layer of system security.

### What types of users does RBAC have?

RBAC has the following types of users:

-   **Account owner** - The account owner is the primary contact for the
    account and has full permissions to execute all capabilities for
    every product available. Each account has a single account owner.

-   **Account user** - The account user is a user who has been added by
    the account owner and has been assigned to specific product or
    account roles.

### What actions are restricted to the account owner?

The account owner is the only user who can perform the following actions:

-   Create new users, modify existing users, and delete users.
-   Make changes to contacts, including the billing contact.   

### What is a role?

The term *role* describes the level of access associated with a user's account. RBAC limits risk by ensuring that users do not have access to features that extend beyond their areas of expertise or responsibility.

A role can grant access to all of the resources relating to a single product or to multiple products. RBAC does not restrict access to specific files,
directories, or servers.

### What roles are available through RBAC?

RBAC has the following roles.

#### Multiple-product roles

Multiple-product roles grant access to resources associated with multiple products.

RBAC has the following multiple-product roles:

-   **Full access** - The full access role has permissions to
    create, read, update, and delete resources within multiple
    designated products.

-   **Read-only access** - The read-only access role has permissions to
    view resources within multiple designated products.

These permissions apply to products that are RBAC-enabled.

**Note**: Users with full access and read-only access roles have
automatic access to all new products that become RBAC-enabled, with the
exception of account administration tasks such as billing. Product roles
do not include account roles.

#### Custom roles

Custom roles enable account owners to assign users different permissions for different products. After a user is assigned custom roles, those roles can only be changed on a per-product basis.

RBAC has the following custom roles:

-   **Product:admin** - The *product* admin role has permissions to
    create, read, update, and delete resources for the designated
    product.

-   **Product:creator** - The *product* creator role has permissions to
    create, read, and update resources for the designated product. The creator role cannot delete a resource. (Any destructive actions are prohibited.)

-   **Product:observer** - The *product* observer role has permissions to
    read given resources for the designated product. This role is read-only.

#### Account roles

Assign the following account roles to the users who manage your Rackspace
customer account.

-   **Billing:admin** - The **billing** admin role has
    permissions to create, read, update, and delete billing and
    payment resources for the designated product.

-   **Billing:observer** - The **billing** observer role has
    permissions to read billing and payment resources for the
    designated product. This role is read-only.

To give a new user account permissions without product permissions, use the following steps:

1. Choose the **Custom** setting and ensure that all product roles are set to
   **No Access**.
2. Assign the **billing** account role to the user.

**Note:** A user may be assigned both a product role and an account role.

### What are the contact types in the Cloud Control Panel?

Contact types are similar to tags. Using contact types can help account owners manage users. The Cloud Control Panel offers the following contact types:

-   **Primary** - This contact type is automatically assigned to the
    owner of the account. Each account has a single Primary contact.

-   **Billing** - This contact type is automatically assigned to
    the account and populated with the billing address for the account.
    There is one Billing contact per account. It is not necessary to assign
    a username to the Billing contact.

-   **Administrative** - This contact type can be assigned to users who
    primarily handle administrative duties such as billing
    and payments. Administrative contacts do not receive technical
    alerts from our automated systems. No specific account implications
    come with this role. For example, when an administrative user changes
    their address, the change does not affect the billing address for the
    account.

-   **Technical** - This contact type can be assigned to users who
    primarily perform technical tasks. These users receive monitoring
    alerts by default.

### When do I need to implement RBAC?

Implement RBAC when you would like to achieve the following results:

-   Minimize downtime and accidental changes to cloud resources by restricting account access to only a few people.

-   Help prevent unauthorized access to cloud products by assigning each user their own credentials.

-   Synchronize cloud product access with the functions of an employee's job.

### Who can use RBAC?

RBAC is available to all Rackspace customers.

### How can I get RBAC?

RBAC is automatically activated when the account owner adds users to an account. Account owners can add users
through the [Cloud Control Panel](https://mycloud.rackspace.com/) or the API.

For more information about specific RBAC-related APIs, see the [Rackspace
API documentation](https://developer.rackspace.com/docs/).

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

New products are RBAC-enabled as they are launched.

### Which products will not have RBAC?

-   RackConnect

### Next section

[Use Role-Based Access Control (RBAC)](/how-to/managing-role-based-access-control-rbac)
