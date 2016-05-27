---
permalink: permissions-matrix-for-cloud-queues/
audit_date:
title: Permissions Matrix for Cloud Queues
type: article
created_date: '2013-08-19'
created_by: Renee Rendon
last_modified_date: '2016-05-09'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

The following permissions matrix displays specific permissions for the roles in Cloud Queues. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

### As of October 4, 2013

Method Name | API Action | Role | Description
--- | --- | --- | ---
**HOME DOCUMENT** | | |
Get Home Document |	GET {version} |	**Observer & Creator & Admin** | Gets the home document.
**QUEUES** | | |
List Queues	| ```GET/ {version}/queues?marker=string&limit=integer&detailed=boolean``` | **Observer & Creator & Admin**	| Lists queues.
Create Queue | ```PUT/ {version}/queues/{queue_name}``` | **Admin only**	**Admin only**	| Creates a queue.
Delete Queue | ```DELETE/ {version}/queues/{queue_name}``` | **Admin only** | Deletes the queue.
**Admin only** Queue Existence |	```GET/ {version}/queues/{queue_name}``` |**Observer & Creator & Admin**	| Verifies whether the specified queue exists.
Set Queue Metadata | ```PUT/ {version}/queues/{queue_name}/metadata``` | **Creator & Admin** | Sets queue metadata.
Show Queue Metadata | ```GET/ {version}/queues/{queue_name}/metadata``` | **Observer & Creator & Admin** |	Returns queue metadata.
Show Queue Stats | ```GET/ {version}/queues/{queue_name}/stats``` | **Observer & Creator & Admin** | Returns queue statistics.
**MESSAGES** | | |
Post Messages | ```POST/ {version}/queues/{queue_name}/messages``` | **Creator & Admin** | Posts the message or messages for the specified queue.
Get Messages | ```GET/ {version}/queues/{queue_name}/messages?marker=string&limit=integer&echo+=boolean&include_claimed=boolean``` | **Creator & Admin**	**Admin only** | Gets the message or messages in the specified queue.
Get Messages by ID | ```GET/ {version}/queues/{queue_name}/messages/{messageId}?claim_id=string``` | **Observer & Creator & Admin** | Gets the specified set of messages from the specified queue.
Bulk-delete Messages by ID | ```DELETE /{version}/queues/{queue_name}/messages ?ids=string``` | **Creator & Admin** | Bulk-deletes for messages.
Show Message Details | ```GET/ {version}/queues/{queue_name}/messages?ids=string&claim_id=string``` | **Observer & Creator & Admin** | Shows details for the specified message from the specified queue.
Delete Message | ```DELETE/ {version}/queues/{queue_name}/messages?claim_id=string``` | **Admin only**	**Admin only**	| Deletes the specified message from the specified queue.
**CLAIMS** | | |
Claim Messages | ```POST/ {version}/queues/{queue_name}/claim?limit=integer``` | **Creator & Admin** | Claims a set of messages from the specified queue.
Query Claim	| ```GET/ {version}/queues/{queue_name}/claims/{claimId}``` | **Observer & Creator & Admin** |	Queries the specified claim for the specified queue.
Update Claim | ```PATCH/ {version}/queues/{queue_name}/claims/{claimId}``` | **Creator & Admin** | Updates the specified claim for the specified queue.
Release Claim | ```DELETE/ {version}/queues/{queue_name}/claims/{claimId}``` | **Creator & Admin** | Releases the specified claim for the specified queue.

### Cloud Queues Terminology

- **Message** - A task, a notification, or any meaningful data that gets posted to the queue. A message exists until it is deleted by a recipient or automatically by the system based on a TTL (time-to-live) value.

- **Queue** - A queue holds messages. Ideally, a queue is created per work type. For example, if you want to compress files, you would create a queue dedicated to this job. Any application that reads from this queue would only compress files.

**Related article** - [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
