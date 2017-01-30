---
permalink: permissions-matrix-for-role-based-access-control-rbac/
audit_date:
title: Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting
type: article
created_date: '2013-06-17'
created_by: Renee Rendon
last_modified_date: '2016-11-18'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The RBAC permissions matrix displays the type of product roles, **Admin**, **Creator**, and **Observer**, that are available within each cloud product.

- **Admin** - provides full access to create, read, update, and delete.
- **Creator** - provides limited access to create, read, and update.
- **Observer** - provides read-only access.

**Note:** Admin and Observer are *global roles*, which apply across all RBAC-enabled cloud products.

The following products are not RBAC-enabled: Cloud Sites, RackConnect, and Mailgun.

### Product Roles

Product | ADMIN | CREATOR | OBSERVER
--- | --- | --- | ---
[Cloud Servers](/how-to/permissions-matrix-for-next-generation-cloud-servers) | **YES** | **YES** | **YES**
[Cloud Files](/how-to/permissions-matrix-for-cloud-files) | **YES** | **NO** | **YES**
[Rackspace CDN](/how-to/permission-matrix-for-rackspace-cdn) | **YES** | **YES** | **YES**
[Cloud Databases](/how-to/permissions-matrix-for-cloud-databases) | **YES** | **YES** | **YES**
[Cloud Load Balancers](/how-to/permissions-matrix-for-cloud-load-balancers) | **YES** | **YES** | **YES**
[Cloud Queues](/how-to/permissions-matrix-for-cloud-queues) | **YES** | **YES** | **YES**
[Cloud Networks](/how-to/permissions-matrix-for-cloud-networks) | **YES** | **YES** | **YES**
[Cloud Monitoring](/how-to/detailed-permissions-matrix-for-rackspace-monitoring) | **YES** | **YES** | **YES**
[Cloud Block Storage](/how-to/permissions-matrix-for-cloud-block-storage) | **YES** | **YES** | **YES**
[Rackspace Auto Scale](/how-to/permissions-matrix-for-auto-scale) | **YES** | **NO** | **YES**
[Cloud Images](/how-to/detailed-permissions-matrix-for-cloud-images) | **YES** | **YES** | **YES**
[Cloud Big Data v1](/how-to/detailed-permissions-matrix-for-cloud-big-data) | **YES** | **YES** | **YES**
[Cloud Big Data v2](/how-to/detailed-permissions-matrix-for-cloud-big-data-v2) | **YES** | **YES** | **YES**
[Cloud Backup](/knowledge_center/detailed-permissions-matrix-for-cloud-backup) | **YES** | **YES** | **YES**
[Cloud Orchestration](/how-to/permissions-matrix-for-cloud-orchestration) | **YES** | **YES** | **YES**
[Cloud DNS](/how-to/detailed-permissions-matrix-for-dns) | **YES** | **YES** | **YES**
[Cloud Feeds](/how-to/detailed-permissions-matrix-for-cloud-feeds) | **NO** | **NO** | **YES**

### Account Access

ACCOUNT ACCESS | ADMIN | OBSERVER
-------------- | --- | ---
[Billing Services](/how-to/detailed-permissions-matrix-for-billing-services) | **YES** | **YES**
[Payment Services](/how-to/detailed-permissions-matrix-for-billing-services) | **YES** | **YES**
