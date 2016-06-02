---
permalink: permission-matrix-for-rackspace-cdn/
audit_date:
title: Permission Matrix for Rackspace CDN
type: article
created_date: '2015-04-07'
created_by: Catherine Richardson
last_modified_date: '2016-06-02'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

The following permissions matrix displays specific permissions for the roles in Rackspace CDN. The matrix displays the method names and the roles that are supported.

Endpoint | RBAC-Creator | RBAC-Observer | RBAC-Admin | RBAC-Operator
--- | --- | --- | --- | ---
` GET /` | Yes | Yes | Yes | Yes
`GET /ping` | Yes | Yes | Yes | Yes
`GET /health` | No | No | No | Yes
`GET /health/{subsystem}` | No | No | No | Yes
`POST /services` | Yes | No | Yes | No
`GET /services` | Yes | Yes | Yes | Yes
`GET /services/\{service_id\}` | Yes | Yes | Yes | Yes
`PATCH /services/\{service_id\}` | Yes | No | Yes | No
`DELETE /services/\{service_id\}` | No | No | Yes | Yes
`DELETE /service/\{service_id\}/assets` | No | No | Yes | Yes
`GET /flavors` | Yes | Yes | Yes | Yes
`GET /flavors/\{flavor_id\}` | Yes | Yes | Yes | Yes
`POST /flavors` | No | No | No | Yes
`DELETE /flavors/\{flavor_id\}` | No | No | No | Yes

**Related information**: [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
