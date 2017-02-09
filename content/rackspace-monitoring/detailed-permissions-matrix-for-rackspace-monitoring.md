---
permalink: detailed-permissions-matrix-for-rackspace-monitoring/
audit_date:
title: Detailed Permissions Matrix for Rackspace Monitoring
type: article
created_date: '2013-04-10'
created_by: Megan Meza
last_modified_date: '2016-06-09'
last_modified_by: Stephanie Fillmon
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

The following permissions matrix displays specific permissions for the
roles in Rackspace Monitoring. The matrix displays the method names,
their corresponding RESTful API commands, and the roles that are
supported.

### As of October 8, 2013

Method Name	| API Call | Role | Description
--- | --- | --- | ---
**Account Operations** | | |
Get Account | ```GET /v1.0/account``` | **Observer  Creator  Admin** | Returns account information.
Update Account| ```PUT /v1.0/account``` | **Admin** | Updates properties on an account.
List Audits	| ```GET /v1.0/audits``` | **Observer  Creator  Admin** | Lists audits for this account.
Get Limits | ```GET /v1.0/limits``` | **Observer  Creator  Admin** | Returns account resource limits.
Get Usage | ```GET /v1.0/usage``` | **Observer  Creator  Admin** | Retrieves usage information for a given period of time. Defaults to last seven days.
**Agents Operations** | | |
List Agents | ```GET /v1.0/agents``` | **Observer  Creator  Admin** | Lists all agents that have connected in the last 30 days.
Fetch Agents | ```GET /v1.0/agents/:agentId``` | **Observer  Creator  Admin** | Lists a single agent.
List Agent Connections | ```GET  /v1.0/agents/:agentId/connections``` | **Observer  Creator  Admin** | Lists the connections for a single agent.
Fetch Agent Connection | ```GET /v1.0/agents/:agentId/connections/:connId``` | **Observer  Creator  Admin** | Gets details for a specified image member.
**Agent Host Information Operations** | | |
GET Host Information 'x' through agent | ```GET /v1.0/agents/:agentId/host_info/x``` | **Observer  Creator  Admin** | Gets information on the host's 'x'.  For complete list of agent host info, see [agent host infor check](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#hostinfo-check-type-ref).
**Agent Targets Operations** | | |
List Agent Check Targets for 'agentCheckType' | ```GET /entities/entityId/agent/check_types/agentCheckType/targets``` | **Observer  Creator  Admin** | Enumerates the devices allowed for the specified agent check type on the server where the agent is installed.  For complete list of check types, see [remote checks](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#remote-check-type-ref) and [agent checks](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#agent-check-types).
**Agent Tokens Operations** | | |
List Agent Tokens | ```GET /v1.0/agent_tokens``` | **Admin** | Lists the agent tokens.
GET Agent Token | ```GET /v1.0/agent_tokens/:tokendId``` | **Observer  Creator  Admin** | Gets information for a single agent token.
Update Agent Token | ```PUT /v1.0/agent_tokens/:tokendId``` | **Admin** | Updates a token with the specified tokenId (label).
Delete Agent Token | ```DELETE /v1.0/agent_tokens/:tokendId``` | **Admin** | Deletes the specified agent token from your account.
Create Agent Token | ```POST /v1.0/agent_tokens``` | **Observer  Creator  Admin** | Creates a new agent token.
**Monitoring Zones Operations** | | |
List Monitoring Zones | ```GET /v1.0/monitoring_zones``` | **Observer  Creator  Admin** | Lists the monitoring zones.
Get Monitoring Zone | ```GET /v1.0/monitoring_zones/:monitoringZoneId``` | **Observer  Creator  Admin** | Gets information for a single monitoring zone.
Execute Traceroute | ```POST /v1.0/monitoring_zones/:monitoringZoneId/traceroute``` | **Observer  Creator  Admin** | Performs a traceroute from a collector in the specified monitoring zones.
**Changelog Operations** | | |
List Alarm Changelogs | ```GET /v1.0/changelogs/alarms``` | **Observer  Creator  Admin** | Lists alarm changelogs for this account.
**Entities Operations** | | |
List Entities | ```GET /v1.0/entities``` | **Observer  Creator  Admin** | Lists the entities for this particular account.
Get Entity | ```GET /v1.0/entities/:entityId``` | **Observer  Creator  Admin** | Retrieves the current state of an entity.
Update Entity | ```PUT /v1.0/entities/:entityId``` | **Admin only** | Updates an entity specified by the entityId.
Delete Entity | ```DELETE /v1.0/entities/:entityId``` | **Admin only** | Deletes an entity from your account. Also deletes any checks and alarms defined for that entity.
Create Entity | ```POST /v1.0/entities``` | **Creator  Admin** | Creates a new entity.
**Checks Operations** | | |
List Checks | ```GET /v1.0/entities/:entityId/checks``` | **Creator  Admin** | Lists the checks associated with a given entityId.
Get Check | ```GET /v1.0/entities/:entityId/checks/:checkId``` | **Creator  Admin** | Returns the specified check.
Update Check | ```PUT /v1.0/entities/:entityId/checks/:checkId``` | **Admin only** | Updates a check with the specified checkId.
Delete Check | ```DELETE /v1.0/entities/:entityId/checks/:checkId``` | **Admin only** | Deletes a check from your account.
Create Check | ```POST /v1.0/entities/:entityId/checks``` | **Creator  Admin** | Creates a new check and associates it with an entity using the parameters listed in [Attributes](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#attributes).
Test Existing Check | ```POST /v1.0/entities/:entityId/checks/:checkId/test``` | **Observer  Creator  Admin** | Tests a check inline.
Test New Check | ```POST /v1.0/entities/:entityId/test-check``` | **Observer Creator  Admin** | Tests a check before creating it.
**Alarms Operations** | | |
List Alarms | ```GET /v1.0/entities/:entityId/alarms``` | **Observer  Creator  Admin** | Lists the alarms on the specified entity.
Get Alarm | ```GET /v1.0/entities/:entityId/alarms/:alarmId``` | **Observer  Creator  Admin** | Gets information for a single alarm.
Update Alarm | ```PUT /v1.0/entities/:entityId/alarms/:alarmId``` | **Admin only** | Updates an alarm with the specified alarmId. Partial updates to an alarm are acceptable. You may specify only the parameters you would like to update.
Delete Alarm | ```DELETE /v1.0/entities/:entityId/alarms/:alarmId``` | **Admin only** | Deletes an alarm from your account.
Create Alarm | ```POST /v1.0/entities/:entityId/alarms``` | **Creator  Admin** | Creates a new alarm for the specified entity. Specify the alarm's characteristics using a valid set of parameters from the table shown in the [Attributes](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#alarms) section.
Test New Alarm | ```POST /v1.0/entities/:entityId/test-alarm``` | **Observer  Creator  Admin** | Test runs an alarm.
**Alarm Notification History Operations** | | |
List Check IDs for Alarms | ```GET /v1.0/entities/:entityId/alarms/:alarmId/notification_history``` | **Observer  Creator  Admin** | List checks for which alarm notification history is available.
List Alarm Notification History | ```GET /v1.0/entities/:entityId/alarms/:alarmId/notification_history/:checkId``` | **Observer  Creator  Admin** | Lists alarm notification history for a given entity, alarm and check.
Get Alarm Notification History | ```GET /v1.0/entities/:entityId/alarms/:alarmId/notification_history/:checkId/:uuid``` | **Observer  Creator  Admin** | Retrieves a single alarm notification history item.
**Check Types Operations** | | |
List Check Types | ```GET /v1.0/check_types``` | **Observer  Creator  Admin** | List all the available check types.
Get Check Type | ```GET /v1.0/check_types/:checkTypeId``` | **Observer  Creator  Admin** | Retrieves information for a single check type.
**Notification Types Operations** | | |
List Notification Types | ```GET /v1.0/notification_types``` | **Observer  Creator  Admin** | List all the available notification types.
**Notification Operations** | | |
Get Notification Type | ```GET /v1.0/notification_types/:notificationTypeId``` | **Observer  Creator  Admin** | Gets information for a single notification type.
List Notifications | ```GET /v1.0/notifications``` | **Observer  Creator  Admin** | Lists the notifications for this particular account.
Get Notification| ```GET /v1.0/notifications/:notificationId``` | **Observer  Creator  Admin** | Gets information for a single notification.
Update Notification | ```PUT /v1.0/notifications/:notificationId``` | **Admin only** | Updates a notification with the specified notificationId.
Delete Notification | ```DELETE /v1.0/notifications/:notificationId``` | **Admin only** | Deletes a notification from your account.
Create Notification | ```POST /v1.0/notifications``` | **Creator  Admin** | Creates a notification.
Test Existing Notification | ```POST /v1.0/notifications/:notificationId/test``` | **Observer  Creator  Admin** | Tests an existing notification.
Test New Notification | ```POST /v1.0/test-notification``` | **Observer  Creator  Admin** | Test runs a notification.
**Notification Plans Operations** | | |
List Notification Plans | ```GET /v1.0/notification_plans``` | **Observer  Creator  Admin** | Lists the alarms on the specified entity.
Get Notification Plan | ```GET /v1.0/notification_plans/:notificationPlanId``` | **Observer  Creator  Admin** | Gets information for a single notification plan.
Update Notification Plans | ```PUT /v1.0/notification_plans/:notificationPlanId``` | **Admin only** | Updates a notification plan with the specified notificationPlanId. Partial updates to a notification plan are acceptable. You may specify only the parameters you would like to update.
Delete Notification Plan| ```DELETE /v1.0/notification_plans/:notificationPlanId``` | **Admin only** | Deletes a notification plan.
Create Notification Plan | ```POST /v1.0/notification_plans``` | **Creator  Admin** | Creates a notification plan.
**Metrics Operations** | | |
List Metrics | ```GET /v1.0/entities/entityId/checks/checkId/metrics``` | **Observer  Creator  Admin** | Lists the metrics associated with the specified check.
Get Data Points for Plot | ```GET /v1.0/entities/:entityId/checks/:checkId/metrics/:metricName/plot``` | **Observer  Creator  Admin** | Queries for all data points of `metricName` between two points in time.
**Alarm Examples Operations** | | |
List Alarm Examples | ```GET /v1.0/alarm_examples``` | **Observer  Creator  Admin** |  	Returns a list of alarm examples.
Get Alarm Example | ```GET /v1.0/alarm_examples/:alarmExampleId``` | **Observer  Creator  Admin** | Gets a specific alarm example.
Bind Alarm Example | ```POST /v1.0/alarm_examples/:alarmExampleId``` | **Observer  Creator  Admin** | Evaluates a specific alarm example.
**VIEWS Operations** | | |
List Overview | ```GET /v1.0/views/Overview``` | **Observer  Creator  Admin** | Returns the overview view for this account.
**Suppressions Operations** | | |
List Suppressions | ```GET /v1.0/suppressions``` | **Observer  Creator  Admin** | Returns a list of suppressions.
Get Suppression | ```GET /v1.0/suppresssions/:suppressionId``` | **Observer  Creator  Admin** | Gets details for a specific suppression.
Update Suppression | ```PUT /v1.0/suppressions/:suppressionId``` | **Admin only** | Updates a specific suppression.
Delete Suppression| ```DELETE /v1.0/suppressions/:suppressionId``` | **Admin only** | Deletes a specific suppression.
Create Suppression | ```POST /v1.0/suppressions``` | **Admin only** | Creates a suppression.

**Related information**: [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
