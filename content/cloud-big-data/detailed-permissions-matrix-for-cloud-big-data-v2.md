---

permalink: detailed-permissions-matrix-for-cloud-big-data-v2/
audit_date:
title: Detailed Permissions Matrix for Cloud Big Data v2
type: article
created_date: '2015-06-01'
created_by: Catherine Richardson
last_modified_date: '2016-12-14'
last_modified_by: Laura Santamaria
product: Cloud Big Data
product_url: cloud-big-data
---

The Cloud Big Data permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

    - **Admin** provides full access to create, read, update, and delete.
    - **Creator** provides access to create, read, and update.
    - **Observer** provides read-only access.

The matrix displays the Cloud Big Data methods, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Credentials

Method | API action | Role | Description
--- | --- | --- | ---
List all credentials | `GET /credentials` | **Admin<br/>Creator<br/>Observer** | Lists all user credentials
List credentials by type | `GET /credentials/{type}` | **Admin<br/>Creator<br/>Observer** | Lists all user credentials of the specified type.
Create a credential | `POST /credentials/{type}` | **Admin<br/>Creator** | Creates a new credential of the specified type.
Update a credential | `PUT /credentials/{type}/{name}` | **Admin<br/>Creator** | Updates the specified credential.
Delete a credential | `DELETE /credentials/{type}/{name}` | **Admin** | Deletes the specified credential.

### Distributions

Method | API action | Role | Description
--- | --- | --- | ---
List available distributions | `GET /distros` | **Admin<br/>Creator<br/>Observer** | List all available distributions.
Show distribution details | `GET /distros/{distroId}` | **Admin<br/>Creator<br/>Observer** | For the specified distribution, lists all of the supported services and their corresponding components and modes of operation.

### Stacks

Method | API action | Role | Description
--- | --- | --- | ---
Create a stack | `POST /stacks` | **Admin<br/>Creator** | Creates a new stack. **Note:** This functionality is not yet implemented.
List all stacks | `GET /stacks` | **Admin<br/>Creator<br/>Observer** | Lists all stacks, including global stacks and user-created stacks.
Show stack details | `GET /stacks/{stackId}` | **Admin<br/>Creator<br/>Observer** | Lists details for the specified stack.
Delete a stack | `DELETE /stacks/{type}/{stackId}` | **Admin** | Deletes the specified stack. **Note:** This functionality is not yet implemented.

#### Clusters

Method | API action | Role | Description
--- | --- | --- | ---
Create a cluster | `POST /clusters` | **Admin<br/>Creator** | Creates a new cluster.
Delete a cluster | `DELETE /clusters/{clusterId}` | **Admin** | Deletes the specified cluster.
List all clusters | `GET /clusters` | **Admin<br/>Creator<br/>Observer** | Lists all clusters for your account.
Show cluster details | `GET /clusters/{clusterId}` | **Admin<br/>Creator<br/>Observer** | Lists details for the specified cluster.
Resize a cluster | `PUT /clusters/{clusterId}` | **Admin<br/>Creator** | Resizes the specified cluster.

### Nodes

Method | API action | Role | Description
--- | --- | --- | ---
List cluster nodes | `GET /clusters/{clusterId}/nodes` | **Admin<br/>Creator<br/>Observer** | Lists all nodes for the specified cluster.

### Scripts

Method | API action | Role | Description
--- | --- | --- | ---
Create a script | `POST /scripts` | **Admin<br/>Creator** | Creates a new script.
List all scripts | `GET /scripts` | **Admin<br/>Creator<br/>Observer** | Lists all scripts, including global, product-provided scripts and user-created scripts.
Update a script | `PUT /scripts/{scriptId}` | **Admin<br/>Creator** | Updates the specified script.
Delete a script | `DELETE /scripts/{scriptId}` | **Admin** | Deletes the specified script.

### Flavors

Method Name | API Action | Role | Description
--- | --- | --- | ---
List available flavors | `GET /flavors` | **Admin<br/>Creator<br/>Observer** | Lists all available flavors.

### Resource limits

Method | API action | Role | Description
--- | --- | --- | ---
List resource limits | `GET /limits` | **Admin<br/>Creator<br/>Observer** | Lists the resource limits for the user, including the remaining node count, available RAM, and remaining disk space.

### Related articles

[Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
[API documentation for RBAC in Cloud DNS](https://developer.rackspace.com/docs/cloud-big-data/v2/general-api-info/role-based-access-control/)
