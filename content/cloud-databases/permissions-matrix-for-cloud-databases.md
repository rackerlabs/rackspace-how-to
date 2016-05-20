---
permalink: permissions-matrix-for-cloud-databases/
audit_date:
title: Permissions matrix for Cloud Databases
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-01-18'
last_modified_by: Nate Archer
product: Cloud Databases
product_url: cloud-databases
---

The following permissions matrix displays specific permissions for the
roles in Cloud Databases. The matrix displays the method names, their
corresponding RESTful API commands, and the roles that are supported.

**[API Documentation](http://developer.rackspace.com)**

**[Related How-To
Articles](/how-to/)**


**Updated July 1, 2015**

### Versions

| Method | API action | Role | Description |
|------|---------|---|--------|
| List versions | `GET /` | **Observer & Creator & Admin** |Lists information about all versions of the API. |
| List version details | `GET /{version}` | 	**Observer & Creator & Admin** | Returns detailed information about the specified version of the API. |

### Database Instances

| Method | API action | Role | Description |
|------|---------|---|--------|
| Create a database instance | `POST /instances`	| **Creator & Admin** | Creates a new database instance. |
| List all database instances |	`GET /instances`	| **Observer & Creator & Admin**	| Lists the status and information for all database instances. |
| Update a database instance | `PUT /instances/{instanceId}` | **Creator & Admin** | Associates a specified database instance with the configuration group. |
| List database instance status and details |	`GET /instances/{instanceId}`	| **Observer & Creator & Admin**	| Lists status and details for the specified database instance. |
| Delete a database instance	| `DELETE /instances/{instanceId}`	| **Admin only**  | Deletes the specified database instance. |
| Get the default configuration | `GET /instances/{instanceId}/configuration`	| **Observer & Creator & Admin**	| Lists the default MySQL configuration settings from the template that were applied to the specified instance. |
| Enable the root user | `POST /instances/{instanceId}/root` | **Admin only**	| Enables the root user for the specified database instance and returns the root password. |
| List root-enabled status | `GET /instances/{instanceId}/root` | **Observer & Creator & Admin** | Returns true if the root user is enabled for the specified database instance or false otherwise. |

### Database Instance actions

| Method | API action | Role | Description |
|------|---------|---|--------|
| Restart an instance | `POST /instances/{instanceId}/action` | **Admin only** | Restarts the database service on the specified instance. |
| Resize an instance | `POST /instances/{instanceId}/action`	| **Admin only** | Resizes the memory of the specified instance. |
| Resize the instance volume | `POST /instances/{instanceId}/action` | **Admin only**	| Resizes the volume attached to the instance. |

### Databases

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a database |	`POST /instances/{instanceId}/databases` | **Creator & Admin** | Creates a new database within the specified instance. |
| List databases for an instance | `GET /instances/{instanceId}/databases`	|	**Observer & Creator & Admin** | Lists databases for the specified instance. |
| Delete a database |	`DELETE /instances/{instanceId}/databases/{databaseName}`	| **Admin only** | Deletes the specified database. |

### Users

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create  a user |	`POST /instances/{instanceId}/users` | **Creator & Admin** |	Creates a user for the specified database instance. |
| List users a in database instance |	`GET /instances/{instanceId}/users` |	**Observer & Creator & Admin**	|	Lists the users in the specified database instance. |
| List a user |	`GET /instances/{instanceId}/users/{name}` | **Observer & Creator & Admin**	|	Lists the specified user's name and a list of databases that the user can access. |
| List user access |	`GET /instances/{instanceId}/users/{name}/databases` | **Observer & Creator & Admin**	|	Lists user access for the specified database instance. |
| Grant user access |	`PUT /instances/{instanceId}/users/{name}/databases` | **Creator & Admin** | Grants access for the specified user to one or more databases for the specified instance. |
| Delete user access |	`DELETE /instances/{instanceId}/users/{name}/databases/{database}` | **Admin only**	| Removes access to the specified database for the specified user. |
| Delete a user	| `DELETE /instances/{instanceId}/users/{name}`	| **Admin only** | Deletes the specified user from the specified database instance. |
| Change user passwords |	`PUT /instances/{instanceId}/users`	| **Admin only**	|	Changes the user passwords for the specified database instance. |
| Modify user attributes |	`PUT /instances/{instanceId}/users/{name}` |	**Admin only** | Modifies one or more of the following values for the specified user: name, password, or the host from which the user is allowed to connect to the database. |

### Flavors

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List flavors |	`GET /flavors` |	**Observer & Creator & Admin** |	Lists information for all available flavors. |
| List flavors by ID |	`GET /flavors/{flavorId}`	 |	**Observer & Creator & Admin** |	Lists information about the specified flavor. |
| List flavors for the datastore version | `GET /datastores/{datastoreType}/versions/{versionId}/flavors` |	**Observer & Creator & Admin** |			Lists flavors for a datastore version. |

### On Demand Backups

**Note**: Any user calling the on demand backup operations for Cloud Databases must have access to Cloud Files.

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a backup |	`POST /backups`	| **Creator & Admin** |	Creates a new backup for a database instance. |
|Delete a backup|	`DELETE /backups/{backupId}` |	**Admin only** | Deletes the specified backup. |
| List backups |	`GET /backups` |	**Observer & Creator & Admin** | Lists all backups for all database instances. |
| List backup by ID |	`GET /backups/{backupId}` |	**Observer & Creator & Admin** | Lists details about the specified backup. |
| List backups for instance |	`GET /instance/{instanceId}/backups` | **Observer & Creator & Admin** | Lists all backups for the specified instance.
| Restore a backup |	`POST /instances` |	 **Creator & Admin**	| Creates a new database instance from a backup. |

### Scheduled Backups

**Note:** Any user calling the scheduled backup operations for Cloud Databases must have access to Cloud Files.

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create scheduled backup |	`POST /{version}/{accountId}/schedules` |	 **Creator & Admin** | Creates a schedule for running a backup periodically. |
| List scheduled backups |	`GET /{version}/{accountId}/schedules` |	**Observer & Creator & Admin** | Lists all scheduled backups for all database instances for an account. |
| List the schedule for running a backup | 	`GET /{version}/{accountId}/schedules/{scheduleId}` |	**Observer & Creator & Admin** | Lists the specified schedule for running a backup. |
| Delete the schedule for running a backup. | `DELETE /{version}/{accountId}/schedules/{scheduleId}` | **Admin only** | Deletes the specified schedule for running a backup. |

### Replication

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create a replica </br></br> **Note:** Because the process of creating a replica creates a backup, the user calling the Create replica operation must have access to Cloud Files. | `POST /instances` |	**Creator & Admin**	| Creates a replica of the source instance. |
| List all replicas and replica source database instances. |	`GET /instances` | **Observer & Creator & Admin** |	Lists the status and information for all replicas or replica sources. |
| List a replica source |	`GET /instances{instanceId}` | **Observer & Creator & Admin** |	Lists status and details for the specified replica source instance. |
| List replica details |	`GET /instances{instanceId}` | **Observer & Creator & Admin**	| Lists status and details for the specified replica. |
| Detach a replica |	`PATCH /instances{instanceId}` | **Creator & Admin** | Detaches the specified replica instance from its replication source instance. |
| List replicas for a source instance |	`GET /{version}/{accountId}/instances/{instanceId}/replicas` | **Observer & Creator & Admin**	| Lists replicas for the specified source instance. |

### High Availability

| Method | API action | Role | Description |
|-------|---------|---|--------|
| Create an HA database instance | `POST /{version}/{accountId}/ha` |	**Creator & Admin** |	Creates a new HA instance. |
| List all HA database instances | `GET /{version}/{accountId}/ha`	|	**Observer & Creator & Admin**	|	Lists all the HA database instances. |
| List HA database instance details | `GET /{version}/{accountId}/ha/{haId}` | **Observer & Creator & Admin**	| Lists details for a specified HA instance. |
| Delete an HA database instance | `DELETE /{version}/{accountId}/ha/{haId}` | **Admin only** | Deletes an HA database instance. |
| Add HCLs to an HA database instance | `POST /{version}/{accountId}/ha/{haId}/acls` | **Creator & Admin** | Adds access control lists (ACLs) to an HA instance. |
| List ACLs for an HA instance | `GET /{version}/{accountId}/ha/{haId}/acls` | **Observer & Creator & Admin** |	Lists ACLs for an HA instance. |
| Delete ACLs from an HA instance | `DELETE /{version}/{accountId}/ha/{haId}/acls/{address}` | **Admin only** |	Deletes ACLs from an HA instance. |
| Add Replica to an HA instance | `POST /{version}/{accountId}/ha/{haId}/action`	| **Creator & Admin**	|	Adds a replica node to the HA group specified by {ha_id}. |

### Configurations

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List configurations |	`GET /configurations`	|	**Observer & Creator & Admin** |	Lists all defined configuration groups for the tenant. |
| Create a configuration |	`POST /configurations` | **Creator & Admin** |	Creates a new configuration group. |
| List configuration details |	`GET / configurations/{configId}`	| **Observer & Creator & Admin** | Lists details for the specified configuration group. |
| Update some configuration parameters | `PATCH / configurations/{configId}` | **Creator & Admin** | Updates some of the configuration parameters associated with the specified configuration group. |
| Replace all configuration parameters |	`PUT /configurations/{configId}` | **Creator & Admin**	|	Replaces all the configuration parameters associated with the specified configuration group. |
| Delete configuration group | `DELETE /configurations/{configId}` | **Admin only** | Deletes the specified configuration group. |
| List instances for a configuration | `GET / configurations/{configId}/instances` | **Observer & Creator & Admin** |	Lists instances that are associated with the specified configuration group.

### Configuration Parameters

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List configuration parameters |	`GET /datastores/{datastoreId}/versions/{versionId}/parameters` |	**Observer & Creator & Admin** | Lists configuration parameters that might be configured on the system. |
| List configuration parameter details | `GET /datastores/{datastoreId}/versions/{versionId}/parameters/{parameterId}` |**Observer & Creator & Admin** | Lists the details of a specified configuration parameter that might be configured on the system. |
| List configuration parameters without datastore |	`GET /datastores/versions/{versionId}/parameters` | **Observer & Creator & Admin** | Lists the configuration parameters that might be configured on the system without specifying a datastore.
| List configuration parameter details without datastore | `GET /datastores/versions/{versionId}/parameters/{parameterId}`	|	**Observer & Creator & Admin**	|	Lists the details of a specified configuration parameter that might be configured on the system without specifying a datastore. |
| List verbose default configuration parameters |	`GET /datastore/version/{versionId}/configuration/{flavorId}` |	**Observer & Creator & Admin** | Lists the default configuration parameters for a datastore version flavor without specifying a datastore. |

### Datastore types and versions

| Method | API action | Role | Description |
|-------|---------|---|--------|
| List all datastore types | `GET /datastores` | **Observer & Creator & Admin** |	Lists all datastore types. |
| List all datastore types for a datastore |	`GET /datastores/{datastoreId}` |	**Observer & Creator & Admin** | Lists all datastore types for the specified datastore. |
| List all datastore versions for a datastore |	`GET /datastores/{datastoreId}/versions` | **Observer & Creator & Admin** |	Lists all versions for the specified datastore. |
| List a version for a datastore. |	`GET /datastores/{datastoreId}/versions/{versionId}` | **Observer & Creator & Admin**	|	Lists the specified datastore version for the specified datastore. |


#### Cloud Databases terminology

The following terms are used to describe Cloud Databases.

#### Database

A MySQL database within a database instance.

#### Database instance

An isolated MySQL instance in a single-tenant environment on a shared
host server.

#### Flavor

An available hardware configuration for a database instance. Each flavor
has a unique combination of memory capacity and priority for CPU time.

#### Volume

User-specified storage that contains the MySQL data directory. Volumes
are automatically provisioned on shared Internet Small Computers System
Interface (iSCSI) storage area networks (SAN) that provide increased
performance, scalability, availability, and manageability.

### [Permission Matrixes for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
