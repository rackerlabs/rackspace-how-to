---
permalink: detailed-permissions-matrix-for-cloud-images/
audit_date: '2016-12-05'
title: Permissions matrix for Cloud Images
type: article
created_date: '2013-10-28'
created_by: Renee Rendon
last_modified_date: '2016-12-05'
last_modified_by: Cat Lookabaugh
product: Cloud Images
product_url: cloud-images
---

The Cloud Images permissions matrix displays specific permissions for the
following roles:

- **Admin** provides full access to create, read, update, and delete.
- **Creator** provides access to create, read, and update.
- **Observer** provides read-only access.

The matrix displays the Cloud Images methods, their corresponding RESTful API commands, and the roles that are supported.

| Method | API action | Role | Description |
| ------ | ---------- | ---- | ----------- |
List images | `GET /v2/images` | **Observer, Creator, Admin** | Lists public virtual machine (VM) images.
Get image details| `GET /v2/images/{image_id}` | **Observer, Creator, Admin** | Gets the details for the specified image.
Update an Image	| `PATCH /v2/images/{image_id}` | **Admin** | Updates the specified image.
Delete an Image | `DELETE /v2/images/{image_id}` | **Admin** | Deletes the specified image.
Create image member | `POST /v2/images/{image_id}/members` | **Creator, Admin** | Adds the specified tenant ID as an image member (user).
List image members | `GET /v2/images/{image_id}/members` | **Observer, Creator, Admin** | Returns a collection of members (user) with whom the image has been shared.
Get image member details | `GET /v2/images/{image_id}/members/{member_id}` | **Observer, Creator, Admin** | Gets details for a specified image member.
Update image member | `PUT /v2/images/{image_id}/members/{member_id}` | **Admin** | Sets the specified status for the specified member (user) of the specified image.
Delete image member | `DELETE /v2/images/{image_id}/members/{member_id}` | **Admin** | Deletes the specified tenant ID from the member list of the specified image.
Add image tag | `PUT /v2/images/{image_id}/tags/{tag}` | **Observer, Creator, Admin** | Adds the specified tag to the specified image.
Delete image tag	| `DELETE /v2/images/{image_id}/tags/{tag}` | **Observer, Creator, Admin** | Deletes the specified tag from the specified image.
Get images schema | `GET /v2/schemas/images` | **Observer, Creator, Admin** | Gets a json-schema document that represents an images entity, which is a container of image entities.
Get image schema | `GET /v2/schemas/image` | **Observer, Creator, Admin** | Gets a json-schema document that represents a single image entity.
Get image members schema | `GET /v2/schemas/members` | **Observer, Creator, Admin** | Gets a json-schema document that represents an image members entity.
Get image member schema | `GET /v2/schemas/member` | **Observer, Creator, Admin** | Gets a json-schema document that represents an image member entity.
Get task schema	| `GET /v2/schemas/task` | **Observer, Creator, Admin** | Gets a json-schema document that represents a specified task entity.
Get tasks schema | `GET /v2/schemas/tasks` | **Observer, Creator, Admin** | Gets a json-schema document that represents a tasks entity.
List tasks | `GET /v2/tasks` | **Observer, Creator, Admin** | Returns a collection of tasks.
Create a task to import or export images | `POST /v2/tasks` | **Admin** | Creates an import or export image task.
Get task details | `GET /v2/tasks/{task_id}` | **Observer, Creator, Admin** | Gets the details for a specified task.

### Related article

[Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
