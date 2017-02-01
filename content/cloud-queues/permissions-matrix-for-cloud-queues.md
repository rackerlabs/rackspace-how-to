---
permalink: permissions-matrix-for-cloud-queues/
audit_date:
title: Permissions Matrix for Cloud Queues
type: article
created_date: '2013-08-19'
created_by: Renee Rendon
last_modified_date: '2017-02-01'
last_modified_by: Nate Archer
product: Cloud Queues
product_url: cloud-queues
---

The Cloud Queues permissions matrix displays specific permissions for the
following roles:

- **Admin** provides full access to create, read, update, and delete.
- **Creator** provides access to create, read, and update.
- **Observer** provides read-only access.

The matrix displays the Cloud Queues methods, their corresponding RESTful API commands,
and the roles that are supported.

### Home document operations

Method | API action | Role | Description
--- | --- | --- | ---
Get home document |	`GET {version}` |	**Observer, Creator, Admin** | Gets the home document.

### Queues operations

Method | API action | Role | Description
--- | --- | --- | ---
List queues	| `GET/ {version}/{project_id}/queues` | **Observer, Creator, Admin**	| Lists queues.
Create queue | `PUT/ {version}/{project_id}/queues/{queue_name}` | **Admin**	| Creates a queue.
Delete queue | `DELETE/ {version}/{project_id}/queues/{queue_name}` | **Admin** | Deletes the queue.
Check queue existence |	`GET/ {version}/{project_id}/queues/{queue_name}` |**Observer, Creator, Admin**	| Verifies whether the specified queue exists.
Set queue metadata | `PUT/ {version}/{project_id}/queues/{queue_name}/metadata` | **Creator, Admin** | Sets queue metadata.
Show Queue metadata | `GET/ {version}/{project_id}/queues/{queue_name}/metadata` | **Observer, Creator, Admin** |	Returns queue metadata.
Show queue stats | `GET/ {version}/{project_id}/queues/{queue_name}/stats` | **Observer, Creator, Admin** | Returns queue statistics.

### Message operations

Method | API action | Role | Description
--- | --- | --- | ---
Post messages | `POST/ {version}/{project_id}/queues/{queue_name}/messages` | **Creator, Admin** | Posts the message or messages for the specified queue.
Get messages | `GET/ {version}/{project_id}/queues/{queue_name}/messages` | **Creator, Admin** | Gets the message or messages in the specified queue.
Get messages by ID | `GET/ {version}/{project_id}/queues/{queue_name}/messages/{messageId}` | **Observer, Creator, Admin** | Gets the specified set of messages from the specified queue.
Bulk-delete messages by ID | `DELETE /{version}/queues/{queue_name}/messages` | **Creator, Admin** | Bulk-deletes for messages.
Show message details | `GET/ {version}/{project_id}/queues/{queue_name}/messages/{messageId}` | **Observer, Creator, Admin** | Shows details for the specified message from the specified queue.
Delete message | `DELETE/ {version}/{project_id}/queues/{queue_name}/messages/{messageId}` | **Admin**	| Deletes the specified message from the specified queue.


### Claim operations

Method | API action | Role | Description
--- | --- | --- | ---
Claim messages | `POST/ {version}/{project_id}/queues/{queue_name}/claim` | **Creator, Admin** | Claims a set of messages from the specified queue.
Query claim	| `GET/ {version}/{project_id}/queues/{queue_name}/claims/{claimId}` | **Observer, Creator, Admin** |	Queries the specified claim for the specified queue.
Update claim | `PATCH/ {version}/{project_id}/queues/{queue_name}/claims/{claimId}` | **Creator, Admin** | Updates the specified claim for the specified queue.
Release claim | `DELETE/ {version}/{project_id}/queues/{queue_name}/claims/{claimId}` | **Creator, Admin** | Releases the specified claim for the specified queue.
