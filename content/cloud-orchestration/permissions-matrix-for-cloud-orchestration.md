---
permalink: permissions-matrix-for-cloud-orchestration/
audit_date:
title: Permissions matrix for Cloud Orchestration
type: article
created_date: '2014-02-05'
created_by: Renee Rendon
last_modified_date: '2017-01-20'
last_modified_by: Stephanie Fillmon
product: Cloud Orchestration
product_url: cloud-orchestration
---

The Cloud Orchestration permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

- **Admin** - provides full access to create, read, update, and delete.
- **Creator** - provides limited access to create, read, and update.
- **Observer** - provides read-only access.

The matrix displays the Cloud Orchestration methods grouped by category, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Stack operations

**Note:** Orchestration users will need access to any products used in their templates.

Method | API action | Role | Description
--- | --- | --- | ---
Create stack | `POST /v1/{tenant_id}/stacks` | **Creator, Admin** | Creates a stack.
Adopt stack | `POST /v1/{tenant_id}/stacks` | **Creator, Admin** | Creates a stack from existing resources.
List stack data | `GET /v1/{tenant_id}/stacks` |	**Observer, Creator, Admin** | Lists active stacks.
Find stack | `GET /v1/{tenant_id}/stacks/{stack_name}` | **Observer, Creator, Admin** | Finds the canonical URL for a specified stack. Also works with verbs other than `GET`, so you can perform `PUT` and `DELETE` operations on a current stack.
Show stack details | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}` | **Observer, Creator, Admin** | Shows details for a specified stack.
Update stack | `PUT /v1/{tenant_id}/stacks/{stack_name}/{stack_id}` | **Creator, Admin** | Updates a specified stack.
Delete stack | `DELETE /v1/{tenant_id}/stacks/{stack_name}/{stack_id}` | **Admin** | Deletes a specified stack and any snapshots of that stack.
Preview stack | `POST /v1/{tenant_id}/stacks/preview` | **Creator, Admin** | Previews a stack.
Abandon stack | `DELETE /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/abandon` | **Admin** | Deletes a specified stack but leaves its resources intact, and returns data describing the stack and its resources.

### Stack resources

Method | API action | Role | Description
--- | --- | --- | ---
Find stack resources | `GET /v1/{tenant_id}/stacks/{stack_name}/resources` | **Observer, Creator, Admin** | Finds the canonical URL for the resource list of a specified stack.
List resources | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/resources` | **Observer, Creator, Admin** |	Lists resources in a stack.
Show resource data | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/resources/{resource_name}` | **Observer, Creator, Admin** | Shows data for a specified resource.
List resource types	| `GET /v1/{tenant_id}/resource_types` | **Observer, Creator, Admin** | Lists the supported template resource types.
Show resource schema | `GET /v1/{tenant_id}/resource_types/{type_name}` | **Observer, Creator, Admin** | Shows the interface schema for a specified resource type.
Show resource template | `GET /v1/{tenant_id}/resource_types/{type_name}/template` | **Observer, Creator, Admin** | Shows the template representation for a specified resource type.

### Stack events

Method | API action | Role | Description
--- | --- | --- | ---
Find stack events | `GET /v1/{tenant_id}/stacks/{stack_name}/events` | **Observer, Creator, Admin** | Finds the canonical URL for the event list of a specified stack.
List stack events | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/events` | **Observer, Creator, Admin** | Lists events for a specified stack.
List resource events | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/resources/{resource_name}/events` |**Observer, Creator, Admin** | Lists events for a specified stack resource.
Show event details | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/resources/{resource_name}/events/{event_id}` | **Observer, Creator, Admin** | Shows data about a specified event.

### Templates

Method | API action | Role | Description
--- | --- | --- | ---
Get stack template | `GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/template` | **Observer, Creator, Admin** | Gets a template for a specified stack.
Validate template | `POST /v1/{tenant_id}/validate` | **Creator, Admin** | Validates a specified template.

### Build information

Method | API action | Role | Description
--- | --- | --- | ---
Show build information | `GET /v1/{tenant_id}/build_info` | **Observer, Creator, Admin** | Shows build information for an Orchestration deployment.

### Related article

[Role-based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
