---
permalink: permissions-matrix-for-cloud-databases/
audit_date: '2017-01-04'
title: Permissions matrix for Cloud Databases
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2017-01-04'
last_modified_by: Nate Archer
product: Cloud Databases
product_url: cloud-databases
---

The Cloud Databases permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

- **Admin** provides full access to create, read, update, and delete.
- **Creator** provides access to create, read, and update.
- **Observer** provides read-only access.

The matrix displays the Cloud Databases methods grouped by category, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Versions

| Method | API action | Role | Description |
|------|---------|---|--------|
| List versions | `GET /` | **Admin, Creator, Observer** |Lists information about all versions of the API. |
| List version details | `GET /{version}` | 	**Admin, Creator, Observer** | Returns detailed information about the specified version of the API. |

### Database instances

| Method | API action | Role | Description |
|------|---------|---|--------|
| Create a database instance | `POST /{version}/{accountId}/instances`	| **Admin, Creator** | Creates a new database instance. |
| List all database instances |	`GET /{version}/{accountId}/instances`	| **Admin, Creator, Observer**	| Lists the status and information for all database instances. |
| Update a database instance | `PUT /{version}/{accountId}/instances/{instanceId}` | **Admin, Creator** | Associates a specified database instance with the configuration group. |
| Change database instance name | `PATCH /{version}/{accountId}/instances/{instanceId}` | **Admin, Creator** | Changes the name of the instance to the new specified name. |
| List database instance status and details |	`GET /{version}/{accountId}/instances/{instanceId}`	| **Admin, Creator, Observer**	| Lists status and details for the specified database instance. |
| Delete a database instance	| `DELETE /{version}/{accountId}/instances/{instanceId}`	| **Admin**  | Deletes the specified database instance. |
| Get the default configuration | `GET /{version}/{accountId}/instances/{instanceId}/configuration`	| **Admin, Creator, Observer**	| Lists the default MySQL configuration settings from the template that were applied to the specified instance. |
| Enable the root user | `POST /{version}/{accountId}/instances/{instanceId}/root` | **Admin**	| Enables the root user for the specified database instance and returns the root password. |
| List root-enabled status | `GET /{version}/{accountId}/instances/{instanceId}/root` | **Admin, Creator, Observer** | Returns true if the root user is enabled for the specified database instance. Returns false otherwise. |

### Database instance actions

| Method | API action | Role | Description |
|------|---------|---|--------|
| Restart an instance | `POST /{version}/{accountId}/instances/{instanceId}/action` | **Admin** | Restarts the database service on the specified instance. |
| Resize an instance | `POST /{version}/{accountId}/instances/{instanceId}/action`	| **Admin** | Resizes the memory of the specified instance. |
| Resize the instance volume | `POST /{version}/{accountId}/instances/{instanceId}/action` | **Admin**	| Resizes the volume attached to the instance. |

### Databases

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a database |	`POST /{version}/{accountId}/instances/{instanceId}/databases` | **Admin, Creator** | Creates a new database within the specified instance. |
| List databases for an instance | `GET /{version}/{accountId}/instances/{instanceId}/databases`	|	**Admin, Creator, Observer** | Lists databases for the specified instance. |
| Delete a database |	`DELETE /{version}/{accountId}/instances/{instanceId}/databases/{databaseName}`	| **Admin** | Deletes the specified database. |

### Users

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create  a user |	`POST /{version}/{accountId}/instances/{instanceId}/users` | **Admin, Creator** |	Creates a user for the specified database instance. |
| List a user|	`GET /{version}/{accountId}/instances/{instanceId}/users` |	**Admin, Creator, Observer**	|	Lists the users in the specified database instance. |
| List users in a database instance |	`GET /{version}/{accountId}/instances/{instanceId}/users/{name}` | **Admin, Creator, Observer**	|	Lists the specified user's name and a list of databases that the user can access. |
| List user access |	`GET /{version}/{accountId}/instances/{instanceId}/users/{name}/databases` | **Admin, Creator, Observer**	|	Lists all the databases to which the specified user has access. |
| Grant user access |	`PUT /{version}/{accountId}/instances/{instanceId}/users/{name}/databases` | **Admin, Creator** | Grants access for the specified user to one or more databases for the specified instance. |
| Revoke user access |	`DELETE /{version}/{accountId}/instances/{instanceId}/users/{name}/databases/{database}` | **Admin**	| Removes access to the specified database for the specified user. |
| Delete a user	| `DELETE /{version}/{accountId}/instances/{instanceId}/users/{name}`	| **Admin** | Deletes the specified user from the specified database instance. |
| Change user passwords |	`PUT /{version}/{accountId}/instances/{instanceId}/users`	| **Admin**	|	Changes the user passwords for the specified database instance. |
| Modify user attributes |	`PUT /{version}/{accountId}/instances/{instanceId}/users/{name}` |	**Admin** | Modifies one or more of the following values for the specified user: name, password, or the host from which the user is allowed to connect to the database. |

### Flavors

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List flavors |	`GET /{version}/{accountId}/flavors` |	**Admin, Creator, Observer** |	Lists information for all available flavors. |
| List flavors by ID |	`GET /{version}/{accountId}/flavors/{flavorId}`	 |	**Admin, Creator, Observer** |	Lists information about the specified flavor. |
| List flavors for the datastore version | `GET /{version}/{accountId}/datastores/{datastoreType}/versions/{versionId}/flavors` |	**Admin, Creator, Observer** | Lists flavors for a datastore version. |

### On-demand backups

**Note**: Any user who calls the on-demand backup operations for Cloud Databases must have access to Cloud Files.

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a backup |	`POST /{version}/{accountId}/backups`	| **Admin, Creator** |	Creates a new backup for a database instance. |
| Delete a backup|	`DELETE /{version}/{accountId}/backups/{backupId}` |	**Admin** | Deletes the specified backup. |
| List backups |	`GET /{version}/{accountId}/backups` |	**Admin, Creator, Observer** | Lists all backups for all database instances. |
| List backup by ID |	`GET /{version}/{accountId}/backups/{backupId}` |	**Admin, Creator, Observer** | Lists details about the specified backup. |
| List backups for instance |	`GET /{version}/{accountId}/instance/{instanceId}/backups` | **Admin, Creator, Observer** | Lists all backups for the specified instance.
| Restore a backup |	`POST /{version}/{accountId}/instances` |	 **Admin, Creator**	| Creates a new database instance from a backup. |

### Scheduled Backups

**Note:** Any user who calls on the scheduled backup operations for Cloud Databases must have access to Cloud Files.

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a scheduled backup |	`POST /{version}/{accountId}/schedules` |	 **Admin, Creator** | Creates a schedule for running a backup periodically. |
| List scheduled backups |	`GET /{version}/{accountId}/schedules` |	**Admin, Creator, Observer** | Lists all scheduled backups for all database instances for an account. |
| List the schedule for running a backup | 	`GET /{version}/{accountId}/schedules/{scheduleId}` |	**Admin, Creator, Observer** | Lists the specified schedule for running a backup. |
| Delete the schedule for running a backup | `DELETE /{version}/{accountId}/schedules/{scheduleId}` | **Admin** | Deletes the specified schedule for running a backup. |
| Update schedule for backups by schedule ID | `PUT /{version}/{accountId}/schedules/{scheduleId}` | **Admin, Creator** | Updates the schedule for running backups for the specified schedule. |

### Replication

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a replica </br></br> **Note:** Because the process of creating a replica creates a backup, the user calling this operation must have access to Cloud Files. | `POST /{version}/{accountId}/instances` |	**Admin, Creator**	| Creates a replica of the source instance. |
| List all replicas and replica source database instances |	`GET /{version}/{accountId}/instances` | **Admin, Creator, Observer** |	Lists the status and information for all replicas or replica sources. |
| List a replica source |	`GET /{version}/{accountId}/instances{instanceId}` | **Admin, Creator, Observer** |	Lists status and details for the specified source instance. |
| List replica details |	`GET /{version}/{accountId}/instances{instanceId}` | **Admin, Creator, Observer**	| Lists status and details for the specified replica. |
| Detach a replica |	`PATCH /{version}/{accountId}/instances{instanceId}` | **Admin, Creator** | Detaches the specified replica instance from its source instance. |
| List replicas for a source instance |	`GET /{version}/{accountId}/instances/{instanceId}/replicas` | **Admin, Creator, Observer**	| Lists replicas for the specified source instance. |
| Convert replication setup to HA | `POST /{version}/{accountId}/instances/{instanceId}/action` | **Admin** | Converts the replication set-up to HA. |

### High availability

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create an HA database instance | `POST /{version}/{accountId}/ha` |	**Admin, Creator** |	Creates a new HA instance. |
| List all HA database instances | `GET /{version}/{accountId}/ha`	|	**Admin, Creator, Observer**	|	Lists all the HA database instances. |
| List HA database instance details | `GET /{version}/{accountId}/ha/{haId}` | **Admin, Creator, Observer**	| Lists details for a specified HA instance. |
| Delete an HA database instance | `DELETE /{version}/{accountId}/ha/{haId}` | **Admin** | Deletes an HA database instance. |
| Add ACLs to an HA instance | `POST /{version}/{accountId}/ha/{haId}/acls` | **Admin, Creator** | Adds access control lists (ACLs) to an HA instance. |
| List ACLs for an HA instance | `GET /{version}/{accountId}/ha/{haId}/acls` | **Admin, Creator, Observer** |	Lists ACLs for an HA instance. |
| Delete ACLs from an HA instance | `DELETE /{version}/{accountId}/ha/{haId}/acls/{address}` | **Admin** |	Deletes ACLs from an HA instance. |
| Add a replica to an HA instance </br> </br> **Note:** Adding a new replica node would restart the mha manager service (which monitors the source/replica instances to trigger failover) and the haproxy service on the load balancer nodes.| `POST /{version}/{accountId}/ha/{haId}/action`	| **Admin, Creator** |	Adds a replica node to the HA group specified by {ha_id}. |


### Configurations

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List configurations |	`GET /{version}/{accountId}/configurations`	|	**Admin, Creator, Observer** |	Lists all defined configuration groups for the tenant. |
| Create a configuration |	`POST /{version}/{accountId}/configurations` | **Admin, Creator** |	Creates a new configuration group. |
| List configuration details |	`GET / configurations/{configId}`	| **Admin, Creator, Observer** | Lists details for the specified configuration group. |
| Update some configuration parameters | `PATCH / configurations/{configId}` | **Admin, Creator** | Updates some of the configuration parameters associated with the specified configuration group. |
| Replace all configuration parameters |	`PUT /{version}/{accountId}/configurations/{configId}` | **Admin, Creator**	|	Replaces all the configuration parameters associated with the specified configuration group. |
| Delete configuration group | `DELETE /{version}/{accountId}/configurations/{configId}` | **Admin** | Deletes the specified configuration group. |
| List instances for a configuration | `GET /{version}/{accountId}/ configurations/{configId}/instances` | **Admin, Creator, Observer** |	Lists instances that are associated with the specified configuration group.

### Configuration parameters

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List configuration parameters |	`GET /{version}/{accountId}/datastores/{datastoreId}/versions/{versionId}/parameters` |	**Admin, Creator, Observer** | Lists configuration parameters that might be configured on the system. |
| List configuration parameter details | `GET /{version}/{accountId}/datastores/{datastoreId}/versions/{versionId}/parameters/{parameterId}` |**Admin, Creator, Observer** | Lists the details of a specified configuration parameter that might be configured on the system. |
| List configuration parameters without datastore |	`GET /{version}/{accountId}/datastores/versions/{versionId}/parameters` | **Admin, Creator, Observer** | Lists the configuration parameters that might be configured on the system without specifying a datastore.
| List configuration parameter details without datastore | `GET /{version}/{accountId}/datastores/versions/{versionId}/parameters/{parameterId}`	|	**Admin, Creator, Observer**	|	Lists the details of a specified configuration parameter that might be configured on the system without specifying a datastore. |
| List verbose default configuration parameters |	`GET /datastore/version/{versionId}/configuration/{flavorId}` |	**Admin, Creator, Observer** | Lists the default configuration parameters for a datastore version flavor without specifying a datastore. |

### Datastore types and versions

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List all datastore types | `GET /{version}/{accountId}/datastores` | **Admin, Creator, Observer** |	Lists all datastore types. |
| List datastore type |	`GET /{version}/{accountId}/datastores/{datastoreId}` |	**Admin, Creator, Observer** | Lists all the datastore types for the specified datastore. |
| List datastore versions for a datastore |	`GET /{version}/{accountId}/datastores/{datastoreId}/versions` | **Admin, Creator, Observer** |	Lists all versions for the specified datastore. |
| List datastore version | `GET /{version}/{accountId}/datastores/{datastoreId}/versions/{versionId}` | **Admin, Creator, Observer**	|	Lists the specified datastore version for the specified datastore. |



### Related article
- [Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)

- [Cloud Databases API reference documentation](https://developer.rackspace.com/docs/cloud-databases/v1/api-reference/)
