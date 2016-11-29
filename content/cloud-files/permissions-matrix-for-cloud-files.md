---
permalink: permissions-matrix-for-cloud-files/
audit_date:
title: Permissions Matrix for Cloud Files
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-11-29'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

The Cloud Files permissions matrix displays specific permissions for the following roles:

- **Admin** - provides full access to create, read, update, and delete.
- **Observer** - provides read-only access.

The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

Method | API Action | Role | Description
--- | --- | --- | ---
Read Account Metadata | ```HEAD /account``` | **Observer Admin** | View quick metadata on an account.
Write Account Metadata | `POST /account` | **Admin only** | Write metadata on an account.
List Containers | `GET /account` | **Observer Admin** | View a list of containers in an account.
Create Container | `PUT /account/container` | **Admin only** | Create containers, or storage compartments, for your data.
Delete Container | `DELETE /account/container` | **Admin only** | Permanently remove a container. (The container must be empty before it can be removed.)
Read Container Metadata | `HEAD /account/container` | **Observer Admin** | View quick metadata on a container.
Write Container metadata | `POST /account/container` | **Admin only** | Write metadata on a container.
List Objects | `GET /account/container` | **Observer Admin** | View names and details of objects within a container.
Read Object | `GET /account/container/object` | **Observer & Admin** | Retrieve the object's data.
Create/Update Object | `PUT /account/container/object` | **Admin only** | Write or overwrite an object's content and metadata.
Copy Object | `PUT /account/container/destobject` | **Admin only** | Copy an existing object to another object in Cloud Files. (The destination container must exist before attempting the copy.)
Delete Object | `DELETE /account/container/object` | **Admin only** | Permanently remove an object from the storage system (data and metadata).
Retrieve Object Metadata | `HEAD /account/container/object` | **Observer Admin** | Retrieve object metadata and other standard HTTP headers.
Update Object Metadata | `POST /account/container/object` |  **Admin only** | Set your own custom object metadata.

### Related article

[Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
