---
permalink: permissions-matrix-for-rackspace-monitoring/
audit_date:
title: Permissions matrix for Rackspace Monitoring
type: article
created_date: '2013-04-10'
created_by: Megan Meza
last_modified_date: '2017-02-01'
last_modified_by: Nate Archer
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

The Rackspace Monitoring permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

- **Admin** provides full access to create, read, update, and delete.
- **Creator** provides access to create, read, and update.
- **Observer** provides read-only access.

The matrix displays the Rackspace Monitoring methods groups by category, their corresponding RESTful API commands, and the RBAC roles that are supported.


### Account operations

Method | API action | Role | Description
--- | --- | --- | ---
Get account information | `GET /v1.0/account` | **Observer, Creator, Admin** | Returns account information.
Update properties on an account| `PUT /v1.0/account` | **Admin** | Updates properties on an account.
Get audit information	| `GET /v1.0/audits` | **Observer, Creator, Admin** | Returns audits information for the account.
Get limits | `GET /v1.0/limits` | **Observer, Creator, Admin** | Returns account resource limits.
Get usage | `GET /v1.0/usage` | **Observer, Creator, Admin** | Returns resource and rate limits for the account.

### Agents operations

Method | API action | Role | Description
--- | --- | --- | ---
List agents | `GET /v1.0/agents` | **Observer, Creator, Admin** | Lists all agents that have connected to the account in the last 30 days.
Get agent by ID | `GET /v1.0/agents/{agentId}` | **Observer, Creator, Admin** | Returns information about the specified agent.
List agent connections | `GET  /v1.0/agents/{agentId}/connections` | **Observer, Creator, Admin** | Lists the connections that are active for the specified agent.
List agent connections | `GET /v1.0/agents/{agentId}/connections/:connId` | **Observer, Creator, Admin** | Returns information about the specific connection for the specified agent.


### Agent host information operations

Method 	| API action | Role | Description
--- | --- | --- | ---
Get agent host info types | `GET /v1.0/agents/{agentId}/host_info_types` | **Observer, Creator,Admin** | Get information about the types of host information data supported by the agent.
Get information | `GET /v1.0/agents/{agentId}/host_info/{type}` | **Observer, Creator, Admin** | Gets the host information specified by {type}. For a complete list of agent host information, see [agent host information check](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#hostinfo-check-type-ref).


### Agent targets operations

Method | API action | Role | Description
--- | --- | --- | ---
List agent check targets for {agentCheckType} | `GET /entities/{entityId}/agent/check_types/{agentCheckType}/targets` | **Observer, Creator, Admin** | Enumerates the devices allowed for the specified agent check type on the server where the agent is installed.  For complete list of check types, see [remote checks](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#remote-check-type-ref) and [agent checks](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#agent-check-types).


### Agent tokens operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List agent tokens | `GET /v1.0/agent_tokens` | **Admin** | Lists the agent tokens.
Get agent token by ID | `GET /v1.0/agent_tokens/{tokenId}` | **Observer, Creator, Admin** | Gets information for a single agent token.
Update agent token | `PUT /v1.0/agent_tokens/{tokenId}` | **Admin** | Updates a token with the specified tokenId (label).
Delete agent token | `DELETE /v1.0/agent_tokens/{tokenId}` | **Admin** | Deletes the specified agent token from your account.
Create agent token | `POST /v1.0/agent_tokens` | **Observer, Creator, Admin** | Creates a new agent token.


### Monitoring zones operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List monitoring zones | `GET /v1.0/monitoring_zones` | **Observer, Creator, Admin** | Lists the monitoring zones for the account.
Get monitoring zone by ID | `GET /v1.0/monitoring_zones/{monitoringZoneId}` | **Observer, Creator, Admin** | Gets information about the specified monitoring zone.
Perform a traceroute from a monitoring zone | `POST /v1.0/monitoring_zones/{monitoringZoneId}/traceroute` | **Observer, Creator, Admin** | Performs a traceroute from a collector in the specified monitoring zones.


### Changelogs operation

Method 	| API action | Role | Description
--- | --- | --- | ---
List alarm changelogs | `GET /v1.0/changelogs/alarms` | **Observer, Creator, Admin** | Lists alarm changelogs for the account.


### Entities operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List entities for an account | `GET /v1.0/entities` | **Observer, Creator, Admin** | Lists the entities for an account.
Get an entity by ID | `GET /v1.0/entities/{entityId}` | **Observer, Creator, Admin** | Retrieves the current state of the specified entity.
Update an entity by ID | `PUT /v1.0/entities/{entityId}` | **Admin** | Updates an entity specified by the entityId.
Delete entity by ID | `DELETE /v1.0/entities/{entityId}` | **Admin** | Deletes the specified entity from your account. Also deletes any checks and alarms defined for that entity.
Create an entity | `POST /v1.0/entities` | **Creator, Admin** | Creates a new entity.


### Check operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List checks for an entity | `GET /v1.0/entities/{entityId}/checks` | **Creator, Admin** | Lists the checks associated with a given entityId.
Get a check by ID | `GET /v1.0/entities/{entityId}/checks/{checkId}` | **Creator, Admin** | Returns information about the specified check.
Update a check by ID | `PUT /v1.0/entities/{entityId}/checks/{checkId}` | **Admin** | Updates the specified check.
Delete a check by ID | `DELETE /v1.0/entities/{entityId}/checks/{checkId}` | **Admin** | Deletes the specfied check from your account.
Create a check | `POST /v1.0/entities/{entityId}/checks` | **Creator, Admin** | Creates a new check and associates it with an entity using the parameters listed in [Attributes](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#attributes).
Test an existing check | `POST /v1.0/entities/{entityId}/checks/{checkId}/test` | **Observer, Creator, Admin** | Tests a check inline.
Test a check | `POST /v1.0/entities/{entityId}/test-check` | **Observer Creator, Admin** | Tests a check before you create it.


### Alarm operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List alarms | `GET /v1.0/entities/{entityId}/alarms` | **Observer, Creator, Admin** | Lists the alarms on the specified entity.
Get alarm by ID | `GET /v1.0/entities/{entityId}/alarms/{alarmId}` | **Observer, Creator, Admin** | Gets information about the specified single alarm.
Update alarm by ID| `PUT /v1.0/entities/{entityId}/alarms/{alarmId}` | **Admin** | Updates an alarm with the specified alarmId. Partial updates to an alarm are acceptable. You may specify only the parameters you would like to update.
Delete alarm by ID | `DELETE /v1.0/entities/{entityId}/alarms/{alarmId}` | **Admin** | Deletes the specified alarm from the account.
Create an alarm | `POST /v1.0/entities/{entityId}/alarms` | **Creator, Admin** | Creates a new alarm for the specified entity.
Test an alarm | `POST /v1.0/entities/{entityId}/test-alarm` | **Observer, Creator, Admin** | Tests whether the alarm criteria is valid and shows how the alarm state is evaluated.


### Alarm notification history operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List alarm notification history | `GET /v1.0/entities/{entityId}/alarms/{alarmId}/notification_history` | **Observer, Creator, Admin** | Lists alarm notification history for the specified alarm.
List alarm notification history by check ID | `GET /v1.0/entities/{entityId}/alarms/{alarmId}/notification_history/{checkId}` | **Observer, Creator, Admin** | Lists alarm notification history for the specified entity, alarm and check.
List a single alarm notification | `GET /v1.0/entities/{entityId}/alarms/{alarmId}/notification_history/{checkId}/:uuid` | **Observer, Creator, Admin** | Retrieves a single alarm notification history item.


### Check type operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List check types | `GET /v1.0/check_types` | **Observer, Creator, Admin** | List all the available check types.
Get a check type by ID| `GET /v1.0/check_types/{checkTypeId}` | **Observer, Creator, Admin** | Retrieves information for the specified check type.


### Notification operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List notifications | `GET /v1.0/notifications?id={notificationId}` | **Observer, Creator, Admin** | Lists the notifications for an account, or information about notifications that you specify.
Update a notification | `PUT /v1.0/notifications/{notificationId}` | **Admin** | Updates the specified notification.
Delete Notification | `DELETE /v1.0/notifications/{notificationId}` | **Admin** | Deletes the specified notification from the account.
Create a notification | `POST /v1.0/notifications` | **Creator, Admin** | Creates a notification.
Test an existing notification | `POST /v1.0/notifications/{notificationId}/test` | **Observer, Creator, Admin** | Tests an existing notification.
Test a notification | `POST /v1.0/test-notification` | **Observer, Creator, Admin** | Tests a notification before you create it.


### Notification type operations

Method 	| API action | Role | Description
--- | --- | --- | ---
Get notification type by ID | `GET /v1.0/notification_types/{notificationTypeId}` | **Observer, Creator, Admin** | Gets information for a single notification type.
List notification types | `GET /v1.0/notification_types` | **Observer, Creator, Admin** | List all the available notification types.


### Notification plans operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List notification plans | `GET /v1.0/notification_plans` | **Observer, Creator, Admin** | Lists the notification plans for the account.
Get a notification plan by ID | `GET /v1.0/notification_plans/{notificationPanId}` | **Observer, Creator, Admin** | Gets information about the specified notification plan.
Update a notification plan by ID | `PUT /v1.0/notification_plans/{notificationPanId}` | **Admin** | Updates the specified notification plan.
Delete a notification plan| `DELETE /v1.0/notification_plans/{notificationPanId}` | **Admin** | Deletes the specified notification plan.
Create a notification plan | `POST /v1.0/notification_plans` | **Creator, Admin** | Creates a notification plan.


### Metrics operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List metrics by check ID | `GET /v1.0/entities/{entityId}/checks/{checkId}/metrics` | **Observer, Creator, Admin** | Lists the metrics associated with the specified check.
Get data points by metric name | `GET /v1.0/entities/{entityId}/checks/{checkId}/metrics/{metricNate}/plot` | **Observer, Creator, Admin** | Queries for all data points of the specified metric between two points in time.


### Alarm examples operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List alarm examples | `GET /v1.0/alarm_examples` | **Observer, Creator, Admin** | Returns a list of alarm examples.
Get alarm example by ID| `GET /v1.0/alarm_examples/{alarmExampleId}` | **Observer, Creator, Admin** | Returns information about the specified alarm example.
Evaluate alarm example | `POST /v1.0/alarm_examples/{alarmExampleId}` | **Observer, Creator, Admin** | Evaluates a specific alarm example.


### Views operations

Method 	| API action | Role | Description
--- | --- | --- | ---
Get overview | `GET /v1.0/views/overview` | **Observer, Creator, Admin** | Returns a view that contains summary information about the entities in this account.
Get alarms view by notification plan | `GET /v1.0/views/alarmsByNp/{notificationPlanId}` | **Observer, Creator, Admin** | Returns the alarms using a given notification plan ID.


### Suppressions operations

Method 	| API action | Role | Description
--- | --- | --- | ---
List suppressions | `GET /v1.0/suppressions` | **Observer, Creator, Admin** | Returns a list of suppressions.
Get a suppression by ID| `GET /v1.0/suppressions/{suppressionId}` | **Observer, Creator, Admin** | Gets details of the specified suppression.
Update a suppression | `PUT /v1.0/suppressions/{suppressionId}` | **Admin** | Updates the specified suppression.
Delete a suppression| `DELETE /v1.0/suppressions/{suppressionId}` | **Admin** | Deletes the specified suppression.
Create a suppression | `POST /v1.0/suppressions` | **Admin** | Creates a suppression.


### Suppression logs operation

Method 	| API action | Role | Description
--- | --- | --- | ---
List suppression logs | `GET /v1.0/suppression_logs` | **Observer, Creator, Admin** | Lists suppression logs for the account.

### Related article

[Role-based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac/)
