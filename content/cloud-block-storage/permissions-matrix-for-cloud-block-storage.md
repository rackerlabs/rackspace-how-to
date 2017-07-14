---
permalink: permissions-matrix-for-cloud-block-storage/
audit_date:
title: Permissions matrix for Cloud Block Storage
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2017-01-09'
last_modified_by: Stephanie Fillmon
product: Cloud Block Storage
product_url: cloud-block-storage
---

The Cloud Block Storage permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

 - **Admin** provides full access to create, read, update, and delete.
 - **Creator** provides access to create, read, and update.
 - **Observer** provides read-only access.

The matrix displays the Cloud Block Storage methods, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Volumes

Method | API action | Role | Description
--- | --- | --- | ---
Create a volume | `POST /v1/{tenant_Id}/volumes` | **Creator, Admin** | Creates a volume.
Retrieve volumes | `GET /v1/{tenant_id}/volumes` | **Observer, Creator, Admin** | Retrieves summary information for all block storage volumes that the tenant who submits the request can access.
Retrieve volumes (detailed) | `GET /v1/{tenant_id}/volumes/detail` | **Observer, Creator, Admin** | Retrieves detailed information for all block storage volumes that the tenant who submits the request can access.
Retrieve details for a volume | `GET /v1/{tenant_id}/volumes/{volume_id}` | **Observer, Creator, Admin** | Retrieves details for a specified volume.
Update a volume | `PUT /v1/{tenant_id}/volumes/{volume_id}` | **Observer, Creator, Admin** | Updates the name and description for a volume.
Delete a volume | `DELETE /v1/{tenant_id}/volumes/{volume_id}` | **Admin** | Deletes a single volume.

### Volume types

Method | API Action | Role | Description
--- | --- | --- | ---
Retrieve volume types |`GET /v1/{tenant_id}/types` | **Observer, Creator, Admin** | Retrieves volume types.
Retrieve volume type details | `GET /v1/{tenant_id}/types/{volume_type_id}` | **Creator, Admin** | Retrieves details for a specified volume type.

### Snapshots

Method | API Action | Role | Description
--- | --- | --- | ---
Create a snapshot | `POST /v1/{tenant_id}/snapshots` | **Creator, Admin** | Creates a snapshot.
Retrieve snapshots | `GET /v1/{tenant_id}/snapshots` | **Observer, Creator, Admin** | Retrieves summary information for all block storage snapshots that the tenant who submits the request can access.
Retrieve snapshots (detailed) | `GET /v1/{tenant_id}/snapshots/detail` | **Observer, Creator, Admin** | Retrieves detailed information for all block storage snapshots that the tenant who submits the request can access.
Retrieve details for a snapshot | `GET /v1/{tenant_id}/snapshots/{snapshot_id}` | **Observer, Creator, Admin** | Retrieves details for the specified snapshot.
Delete a snapshot | `DELETE /v1/{tenant_id}/snapshots/{snapshot_id}` | **Admin only** | Deletes a snapshot.

### Related articles

- [Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
