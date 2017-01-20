---
permalink: permission-matrix-for-cloud-backup/
audit_date: '2017-01-20'
title: Permissions matrix for Cloud Backup
type: article
created_date: '2017-01-20'
created_by: Stephanie Fillmon
last_modified_date: '2017-01-20'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

The Cloud Backup permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

- **Admin** provides full access to create, read, update, and delete.
- **Creator** provides limited access to create, read, and update.
- **Observer** provides read-only access.

The matrix displays the Cloud Backup methods grouped by category, their corresponding RESTful API methods, and the RBAC roles that are supported.

### Agent operations

Method | API action | Role | Description
--- | --- | --- | ---
List the agent details | `GET /v1.0/{tenant_id}/agent/{machineAgentId}` | **Observer, Creator, Admin** | Lists details about the agent and the server on which it is installed.
Enable or disable an agent | `POST /v1.0/{tenant_id}/agent/enable` | **Creator, Admin** | Enables or disables an agent. Disabling an agent does not delete it or its data. You can re-enable disabled agents later.
Enable volume encryption | `POST /v1.0/{tenant_id}/agent/encrypt` | **Creator, Admin** | Enables volume encryption with AES-256 encryption if it is not already enabled.
Change the encryption password | `POST /v1.0/{tenant_id}/agent/changeencryption` | **Admin** | Changes the encryption password.
Delete an agent | `POST /v1.0/{tenant_id}/agent/delete` | **Admin** | Immediately and permanently deletes an agent and its backup data.
Migrate a vault | `PUT /v1.0/{tenant_id}/agent/migratevault` | **Admin** | Migrates a backup vault from one agent to another.
Update the agent backup behavior | `POST /v1.0/{tenant_id}/agent/{machineAgentId}` | **Creator, Admin** | Updates the backup data center, or enables or disables ServiceNet for the Cloud Backup agent, or both.
List the agent details by host server ID | `GET /v1.0/{tenant_id}/agent/server/{hostServerId}` | **Observer, Creator, Admin** | Lists details about the server and its agent by using the host server ID.

### User operations

Method | API action | Role | Description
--- | --- | --- | ---
List all agents for the user | `GET /v1.0/{tenant_id}/user/agents` | **Observer, Creator, Admin** | Retrieves information for all agents for the current user.
Wake up agents | `POST /v1.0/{tenant_id}/user/wakeupagents` | **Creator, Admin** | Wakes up the agent before you perform tasks by sending a message to an agent. You should wait 10 to 20 seconds after using this operation before starting a backup or restore.

### Backup configuration operations

Method | API action | Role | Description
--- | --- | --- | ---
Create a backup configuration | `POST /v1.0/{tenant_id}/backup-configuration` | **Creator, Admin** | Creates a backup configuration for the authenticated user and returns details of a backup configuration.
Update a backup configuration | `PUT /v1.0/{tenant_id}/backup-configuration/{backupConfigurationId}` | **Creator, Admin** | Updates an existing backup configuration.
List backup configuration details | `GET /v1.0/{tenant_id}/backup-configuration/{backupConfigurationId}` | **Observer, Creator, Admin** | Lists detailed information for the specified backup configuration.
List all backup configurations for the user | `GET /v1.0/{tenant_id}/backup-configuration` | **Observer, Creator, Admin** | Lists all backup configurations for the current user.
List all backup configurations for an agent | `GET /v1.0/{tenant_id}/backup-configuration/system/{machineAgentId}` | **Observer, Creator, Admin** | Lists the backup configurations for the specified agent.
Enable or disable a backup configuration | `POST /v1.0/{tenant_id}/backup-configuration/enable/{backupConfigurationId}` | **Creator, Admin** | Enables or disables a backup configuration.
Delete a backup configuration | `DELETE /v1.0/{tenant_id}/backup-configuration/{backupConfigurationId}` | **Admin** | Deletes the specified backup configuration.

### Backup operations

Method | API action | Role | Description
--- | --- | --- | ---
Start or stop a backup manually | `POST /v1.0/{tenant_id}/backup/action-requested` | **Creator, Admin** | Manually starts or stops a backup and returns the identifier of the instance of the backup.
List backup details | `GET /v1.0/{tenant_id}/backup/{backupId}` | **Observer, Creator, Admin** | Lists details about the specified backup.
List completed backups | `GET /v1.0/{tenant_id}/backup/completed/{backupConfigurationId}` | **Observer, Creator, Admin** | Lists the details for backups that can still be restored.
Get a backup report | `GET /v1.0/{tenant_id}/backup/report/{backupId}` | **Observer, Creator, Admin** | Gets details about a completed backup.

### Restore configuration operations

Method | API action | Role | Description
--- | --- | --- | ---
Create a restore configuration | `PUT /v1.0/{tenant_id}/restore` | **Creator, Admin** | Creates a new restore configuration and returns detailed information about the restore.
Update a restore configuration | `POST /v1.0/{tenant_id}/restore` | **Creator, Admin** | Updates an existing restore configuration.
Include or exclude a file in a restore configuration | `PUT /v1.0/{tenant_id}/restore/files` | **Creator, Admin** | Specifies whether to include a file in or exclude a file from a restore configuration.
List included or excluded files in a restore configuration | `GET /v1.0/{tenant_id}/restore/files/{restoreId}` | **Observer, Creator, Admin** | Lists files that are included in or excluded from a restore configuration.
Delete a restore configuration | `DELETE /v1.0/{tenant_id}/restore/files/{restoreId}` | **Creator, Admin** | Deletes a restore configuration file.

### Restore operations

Method | API action | Role | Description
--- | --- | --- | ---
List the backups available for a restore | `GET /v1.0/{tenant_id}/backup/availableforrestore` | **Observer, Creator, Admin** | Lists the backups that are eligible for restore (a backup that has completed at least once and has not been deleted and is not expired).
Start or stop a restore manually | `POST /v1.0/{tenant_id}/restore/action-requested` | **Creator, Admin** | Manually starts or stops a restore.
List details about a restore | `GET /v1.0/{tenant_id}/restore/{restoreId}` | **Observer, Creator, Admin** | Lists details about the specified restore.
Get a restore report | `GET /v1.0/{tenant_id}/restore/report/{restoreId}` | **Observer, Creator, Admin** | Gets a report for the specified, completed restore.

### Activity operations

Method | API action | Role | Description
--- | --- | --- | ---
List all activity for an agent | `GET /v1.0/{tenant_id}/system/activity/{agentId}` | **Observer, Creator, Admin** | Lists all in-progress and completed activity for an agent. Activity types are Backup, Cleanup, and Restore.
List all activity for a user | `GET /v1.0/{tenant_id}/activity` | **Observer, Creator, Admin** | Lists all activity completed or in-progress for the user.

### Related article

[Role-based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
