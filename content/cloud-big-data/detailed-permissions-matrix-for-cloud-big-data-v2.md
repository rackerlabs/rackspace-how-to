---

permalink: detailed-permissions-matrix-for-cloud-big-data-v2/
audit_date: '2016-12-20'
title: Detailed permissions matrix for Cloud Big Data v2
type: article
created_date: '2015-06-01'
created_by: Catherine Richardson
last_modified_date: '2016-12-20'
last_modified_by: Laura Santamaria
product: Cloud Big Data
product_url: cloud-big-data
---

The Cloud Big Data v2 permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

  - **Admin** provides full access to create, read, update, and delete.
  - **Creator** provides access to create, read, and update.
  - **Observer** provides read-only access.

The matrix displays the Cloud Big Data v2 methods grouped by category, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Credentials

Method | API action | Role | Description
--- | --- | --- | ---
List all credentials | `GET /v2/{tenantId}/credentials` | **Admin<br/>Creator<br/>Observer** | Lists all user credentials.
List credentials by type | `GET /v2/{tenantId}/credentials/{type}` | **Admin<br/>Creator<br/>Observer** | Lists all user credentials of the specified type.
Create a credential | `POST /v2/{tenantId}/credentials/{type}` | **Admin<br/>Creator** | Creates a new credential of the specified type.
Update a credential | `PUT /v2/{tenantId}/credentials/{type}/{name}` | **Admin<br/>Creator** | Updates the specified user credential.
Delete a credential | `DELETE /v2/{tenantId}/credentials/{type}/{name}` | **Admin** | Deletes the specified credential.

### Distros

Method | API action | Role | Description
--- | --- | --- | ---
List available distros | `GET /v2/{tenantId}/distros` | **Admin<br/>Creator<br/>Observer** | Lists all available distros.
Show distro details | `GET /v2/{tenantId}/distros/{distroId}` | **Admin<br/>Creator<br/>Observer** | For the specified distro, lists all of the supported services and their corresponding components and modes of operation.

### Stacks

Method | API action | Role | Description
--- | --- | --- | ---
Create a stack | `POST /v2/{tenantId}/stacks` | **Admin<br/>Creator** | Creates a new stack.<br/><br/>**Note:** This functionality is not yet implemented.
List all stacks | `GET /v2/{tenantId}/stacks` | **Admin<br/>Creator<br/>Observer** | Lists all stacks, including global stacks and user-created stacks.
Show stack details | `GET /v2/{tenantId}/stacks/{stackId}` | **Admin<br/>Creator<br/>Observer** | Shows details for the specified stack.
Delete a stack | `DELETE /v2/{tenantId}/stacks/{stackId}` | **Admin** | Deletes the specified stack.<br/><br/>**Note:** This functionality is not yet implemented.

### Clusters

Method | API action | Role | Description
--- | --- | --- | ---
Create a cluster | `POST /v2/{tenantId}/clusters` | **Admin<br/>Creator** | Creates a new cluster.<br/><br/>**Note:** You must create a stack before you create a cluster.
Delete a cluster | `DELETE /v2/{tenantId}/clusters/{clusterId}` | **Admin** | Deletes the specified cluster.
List all clusters | `GET /v2/{tenantId}/clusters` | **Admin<br/>Creator<br/>Observer** | Lists all clusters for your account.
Show cluster details | `GET /v2/{tenantId}/clusters/{clusterId}` | **Admin<br/>Creator<br/>Observer** | Shows details for the specified cluster.
Resize a cluster | `PUT /v2/{tenantId}/clusters/{clusterId}` | **Admin<br/>Creator** | Resizes the specified cluster.

### Nodes

Method | API action | Role | Description
--- | --- | --- | ---
List cluster nodes | `GET /v2/{tenantId}/clusters/{clusterId}/nodes` | **Admin<br/>Creator<br/>Observer** | Lists all nodes for the specified cluster.

### Scripts

Method | API action | Role | Description
--- | --- | --- | ---
Create a script | `POST /v2/{tenantId}/scripts` | **Admin<br/>Creator** | Creates a new script.
List all scripts | `GET /v2/{tenantId}/scripts` | **Admin<br/>Creator<br/>Observer** | Lists all scripts, including global, product-provided scripts and user-created scripts.
Update a script | `PUT /v2/{tenantId}/scripts/{scriptId}` | **Admin<br/>Creator** | Updates the specified user script.
Delete a script | `DELETE /v2/{tenantId}/scripts/{scriptId}` | **Admin** | Deletes the specified user script.

### Flavors

Method | API action | Role | Description
--- | --- | --- | ---
List available flavors | `GET /v2/{tenantId}/flavors` | **Admin<br/>Creator<br/>Observer** | Lists all available flavors, including the drive size and amount of RAM.

### Resource limits

Method | API action | Role | Description
--- | --- | --- | ---
Show resource limits | `GET /v2/{tenantId}/limits` | **Admin<br/>Creator<br/>Observer** | Shows the absolute resource limits for the user, including the remaining node count, available RAM, and remaining disk space.

### Related articles

[Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)<br/>
[API documentation for RBAC in Cloud Big Data v2](https://developer.rackspace.com/docs/cloud-big-data/v2/general-api-info/role-based-access-control/)
