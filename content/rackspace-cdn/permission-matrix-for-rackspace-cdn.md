---
permalink: permission-matrix-for-rackspace-cdn/
audit_date: '2016-06-02'
title: Permissions matrix for Rackspace CDN
type: article
created_date: '2015-04-07'
created_by: Catherine Richardson
last_modified_date: '2017-01-20'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

The Rackspace CDN permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

- **Admin** - provides full access to create, read, update, and delete.
- **Creator** - provides limited access to create, read, and update.
- **Observer** - provides read-only access.

The matrix displays the Rackspace CDN methods grouped by category, their corresponding RESTful API methods, and the roles that are supported.

### Base operations

Method | API action | Role | Description
--- | --- | --- | ---
Retrieve the home document | `GET /v1.0/{project_id}/` | **Observer, Creator, Admin** | Retrieves the home document.
Ping the server | `GET /v1.0/{project_id}/ping` | **Observer, Creator, Admin** | Pings the server.

### Services operations

Method | API action | Role | Description
--- | --- | --- | ---
Retrieve all services | `GET /v1.0/{project_id}/services` | **Observer, Creator, Admin** | Retrieves a list of all available services.
Create a service | `POST /v1.0/{project_id}/services` | **Creator, Admin** | Creates a service.
Retrieve a service | `GET /v1.0/{project_id}/services/{service_id}` | **Observer, Creator, Admin** | Retrieves a specified service.
Update a service | `PATCH /v1.0/{project_id}/services/{service_id}` | **Creator, Admin** | Updates the specified service.
Delete a service | `DELETE /v1.0/{project_id}/services/{service_id}` | **Admin** | Deletes the specified service.

### Service assets operations

Method | API action | Role | Description
--- | --- | --- | ---
Purge a cached asset | `DELETE /v1.0/{project_id}/services/{service_id}/assets` | **Admin** | Purges a cached asset or invalidates the cache.

### Flavors operations

Method | API action | Role | Description
--- | --- | --- | ---
Retrieve flavors | `GET /v1.0/{project_id}/flavors` | **Observer, Creator, Admin** | Retrieves a list of all available flavors.
Retrieve flavor details | `GET /v1.0/{project_id}/flavors/{flavor_id}` | **Observer, Creator, Admin** | Retrieves details for the specified flavor.

### SSL certificate operations

Method | API action | Role | Description
--- | --- | --- | ---
Create an SSL certificate | `POST /v1.0/{project_id}/ssl_certificate` | **Creator, Admin** | Creates an SSL certificate.
Delete an SSL certificate | `DELETE /v1.0/{project_id}/ssl_certificate/{domain_name}` | **Admin** | Deletes an SSL certificate.

### Analytics operations

Method | API action | Role | Description
--- | --- | --- | ---
Retrieve analytics data | `GET /v1.0/{project_id}/services/{service_id}/analytics?{query parameters}` | **Observer, Creator, Admin** | Retrieves analytics data using the Rackspace Metrics API.

### Related article

[Role-based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
