---
permalink: permissions-matrix-for-cloud-files/
audit_date: '2016-12-01'
title: Permissions matrix for Cloud Files
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-12-01'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

The Cloud Files permissions matrix displays specific permissions for the following roles:

- **Admin** provides full access to create, read, update, and delete.
- **Observer** provides read-only access.

The matrix displays the Cloud Files methods, their corresponding RESTful API commands, and the roles that are supported.

Method | API action | Role | Description
------ | ---------- | ---- | -----------
Get account metadata | `HEAD /v1/{account}` | **Observer, Admin** | Shows account metadata.
Create or update account metadata | `POST /v1/{account}` | **Admin** | Creates or updates account metadata.
Show account details and list containers | `GET /v1/{account}` | **Observer, Admin** | Lists the storage containers in your account and sorts them by name.
Delete account metadata | `POST /v1/{account}` | **Admin** | Deletes account metadata.
Create container | `PUT /v1/{account}/{container}` | **Admin** | Creates a Cloud Files container.
Delete container | `DELETE /v1/{account}/{container}` | **Admin** | Deletes an empty container.
Show container metadata | `HEAD /v1/{account}/{container}` | **Observer, Admin** | Shows container metadata.
Create or update container metadata | `POST /v1/{account}/{container}` | **Admin** | Creates or updates the container metadata.
Show container details and list objects | `GET /v1/{account}/{container}` | **Observer, Admin** | Shows details for a specified container and lists objects in the container.
Get object content and metadata | `GET /v1/{account}/{container}/{object}` | **Observer, Admin** | Retrieves the content and metadata for the object.
Create or update object | `PUT /v1/{account}/{container}/{object}` | **Admin** | Creates or updates the content and metadata for a specified object.
Copy object | `COPY /v1/{account}/{container}/{object}` | **Admin** | Copies an existing object to another object with a new name.
Delete object | `DELETE /v1/{account}/{container}/{object}` | **Admin** | Permanently deletes an object.
Show object metadata | `HEAD /v1/{account}/{container}/{object}` | **Observer, Admin** | Retrieves object metadata.
Create or update object metadata | `POST /v1/{account}/{container}/{object}` |  **Admin** | Creates or updates object metadata.

### Related article

[Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
