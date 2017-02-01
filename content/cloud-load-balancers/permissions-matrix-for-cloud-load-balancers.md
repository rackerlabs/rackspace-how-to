---
permalink: permissions-matrix-for-cloud-load-balancers/
audit_date:
title: Permissions matrix for Cloud Load Balancers
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2017-02-01'
last_modified_by: Laura Santamaria
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The Cloud Load Balancers permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

-  **Admin** provides full access to create, read, update, and delete.
-  **Creator** provides access to create, read, and update.
-  **Observer** provides read-only access.

 The matrix displays the Cloud Load Balancers methods grouped by category, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Load balancer

Method | API action | Role | Description
--- | --- | --- | ---
List load balancers | `GET /v1.0/{account}/loadbalancers` | **Admin,<br/>Creator,<br/>Observer** | Lists load balancers configured and associated with your account.
Show load balancer details | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}` | **Admin,<br/>Creator,<br/>Observer** | Shows details for a specified load balancer.
Create load balancer | `POST /v1.0/{account}/loadbalancers` | **Admin,<br/>Creator** | Creates a new load balancer with the configuration defined by the request.
Update load balancer properties | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}` | **Admin,<br/>Creator** | Updates the properties of the specified load balancer.
Delete load balancer | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}` | **Admin** | Deletes the specified load balancer and its associated configuration from the account.
Bulk-delete load balancers | `DELETE /v1.0/{account}/loadbalancers?id={loadBalancerId}` | **Admin** | Bulk-deletes load balancers.

### Error pages

Method | API action | Role | Description
--- | --- | --- | ---
Show custom error page | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/errorpage` | **Admin,<br/>Creator,<br/>Observer** | Shows the custom error page configured for the specified load balancer.
Set custom error page | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/errorpage` | **Admin,<br/>Creator** | Sets or updates a custom error page for the specified load balancer.
Delete custom error page | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/errorpage` | **Admin** | Deletes the custom error page for the specified load balancer.

### Load balancer statistics

Method | API action | Role | Description
--- | --- | --- | ---
Show load balancer statistics | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/stats` | **Admin,<br/>Creator,<br/>Observer** | Shows the statistics for the specified load balancer.

### Nodes

Method | API action | Role | Description
--- | --- | --- | ---
List nodes | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes` | **Admin,<br/>Creator,<br/>Observer** | Lists nodes configured for the specified load balancer.
Show node details | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Admin,<br/>Creator,<br/>Observer** | Shows details for the specified node.
Add node | `POST /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes` | **Admin,<br/>Creator** | Adds a node to the specified load balancer.
Update nodes | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Admin** | Updates the configuration for the specified node on the specified load balancer.
Delete node | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Admin** | Deletes the specified node from the specified load balancer.
Bulk-delete nodes | `DELETE /loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Admin** | Bulk-deletes the specified nodes from the specified load balancer.
List node service events | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/events` | **Admin,<br/>Creator,<br/>Observer** | Lists node service events.

### Virtual IPs

Method | API action | Role | Description
--- | --- | --- | ---
List virtual IPs | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/virtualips` | **Admin,<br/>Creator,<br/>Observer** | Lists virtual IPs associated with the specified load balancer.
Add virtual IP version 6 | `POST /v1.0/{account}/loadbalancers/{loadBalancerId}/virtualips` | **Admin,<br/>Creator** | Adds virtual IP version 6.
Bulk-delete virtual IPs | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/`<br/>`virtualips?id='{virtualIpId}' & id='{virtualIpId}'` | **Admin** | Bulk-deletes specified virtual IPs.
Delete virtual IP | `DELTE /v1.0/{account}/loadbalancers/{loadBalancerId}/virtualips/{virtualIpId}` | **Admin** | Deletes the specified virtual IP.

### Allowed domains

Method | API action | Role | Description
--- | --- | --- | ---
List allowed domains | `GET /v1.0/{account}/loadbalancers/alloweddomains` | **Admin,<br/>Creator,<br/>Observer** | Lists allowed domains.

### Usage reports

Method | API action | Role | Description
--- | --- | --- | ---
List billable load balancers | `GET /v1.0/{account}/loadbalancers/billable` | **Admin,<br/>Creator,<br/>Observer** | Lists billable load balancers for a specified date range. The response is paginated with a default limit of 500 and a maximum limit of 1000.
Show account-level usage | `GET /v1.0/{account}/loadbalancers/usage` | **Admin,<br/>Creator,<br/>Observer** | Shows account-level usage. **Note:** Historical usage data is available for up to 90 days of service activity.
Show historical usage | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/usage` | **Admin,<br/>Creator,<br/>Observer** | Shows historical usage. **Note:** Historical usage data is available for up to 90 days of service activity.
Show current usage | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/usage/current` | **Admin,<br/>Creator,<br/>Observer** | Shows current usage.

### Access lists

Method | API action | Role | Description
--- | --- | --- | ---
Show access list | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/accesslist` | **Admin,<br/>Creator,<br/>Observer** | Shows the access list.
Create or update access list | `POST /v1.0/{account}/loadbalancers/{loadBalancerId}/accesslist` | **Admin,<br/>Creator** | Creates or appends to an access list.
Delete access list | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/accesslist` | **Admin** | Deletes the entire access list.
Bulk-delete networks from access list | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/`<br/>`accesslist?id='{id1}' & id='{id2}'` | **Admin** | Bulk-deletes the specified networks from an access list.
Delete network from access list | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/accesslist/{networkItemId}` | **Admin**  | Deletes the specified network item from the specified access list.

### Monitor health

Method | API action | Role | Description
--- | --- | --- | ---
Show health monitor configuration | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/healthmonitor` | **Admin,<br/>Creator,<br/>Observer** | Shows the health monitor configuration, if one exists.
Update health monitor | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/healthmonitor` | **Admin,<br/>Creator** | Updates the settings for a health monitor.
Delete health monitor | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/healthmonitor` | **Admin** | Deletes a health monitor.

### Session persistence

Method | API action | Role | Description
--- | --- | --- | ---
Show session persistence configuration | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin,<br/>Creator,<br/>Observer** | Shows the session persistence configuration.
Enable session persistence | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin,<br/>Creator** | Enables session persistence.
Disable session persistence | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin** | Disables session persistence.

### Log connections

Method | API action | Role | Description
--- | --- | --- | ---
Show connection logging configuration | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/connectionlogging` | **Admin,<br/>Creator,<br/>Observer** | Shows the connection logging configuration.
Enable or disable connection logging | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/connectionlogging` | **Admin,<br/>Creator** | Enables or disables connection logging.

### Throttle connections

Method | API action | Role | Description
--- | --- | --- | ---
Show connection throttling configuration | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/connectionthrottle` | **Admin,<br/>Creator,<br/>Observer** | Shows the connection throttling configuration.
Create or update connection throttling configuration | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/connectionthrottle` | **Admin,<br/>Creator** | Creates or updates the throttling configuration. **Note:** You must specify all attributes when initially creating the connection throttle. However, when you update an existing setting, you can pass as few as one attribute.
Delete connection throttling configuration | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/connectionthrottle` | **Admin** | Deletes the connection throttling configuration.

### Content caching

Method | API action | Role | Description
--- | --- | --- | ---
Show content caching configuration | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/contentcaching` | **Admin,<br/>Creator,<br/>Observer** | Shows the current configuration of content caching.
Enable or disable content caching | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/contentcaching` | **Admin,<br/>Creator** | Enables or disables content caching.

### Protocols

Method | API action | Role | Description
--- | --- | --- | ---
List load balancing protocols | `GET /v1.0/{account}/loadbalancers/protocols` | **Admin,<br/>Creator,<br/>Observer** | Lists supported load balancing protocols.

### Algorithms

Method | API action | Role | Description
--- | --- | --- | ---
List load balancing algorithms | `GET /v1.0/{account}/loadbalancers/algorithms` | **Admin,<br/>Creator,<br/>Observer** | Lists all supported load balancing algorithms.

### SSL termination

Method | API action | Role | Description
--- | --- | --- | ---
Show SSL termination configuration | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination` | **Admin,<br/>Creator,<br/>Observer** | Shows the load balancer's SSL termination configuration.
Update SSL termination configuration | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination` | **Admin,<br/>Creator** | Updates the SSL termination configuration.
Delete SSL termination | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination` | **Admin** | Deletes SSL termination.

### Certificate mappings

Method | API action | Role | Description
--- | --- | --- | ---
List certificate mappings | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination/certificatemappings` | **Admin,<br/>Creator,<br/>Observer** | Lists certificate mappings configured for the specified load balancer. **Note:** Only the `id` and `hostName` attributes are displayed.
Add certificate mapping | `POST /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination/certificatemappings` | **Admin,<br/>Creator** | Adds a certificate mapping to the specified load balancer.
Show certificate mappings details | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination/`<br/>`certificatemappings/{certificateMappingId}` | **Admin,<br/>Creator,<br/>Observer** | Shows the details for the specified certificate mapping. **Note:** The `privateKey` attribute is not displayed for security purposes.
Update certificate mapping | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination/`<br/>`certificatemappings/{certificateMappingId}` | **Admin,<br/>Creator** | Updates the configuration for the specified certificate mapping on the specified load balancer. **Note:** The `privateKey` attribute is not displayed for security purposes.
Delete certificate mapping | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/ssltermination/`<br/>`certificatemappings/{certificateMappingId}` | **Admin** | Deletes the specified certificate mapping from the specified load balancer.

### Metadata

Method | API action | Role | Description
--- | --- | --- | ---
Add load balancer metadata | `POST /v1.0/{account}/loadbalancers/{loadBalancerId}/metadata` | **Admin,<br/>Creator,<br/>Observer** | Adds a metadata item to the load balancer.
Show load balancer metadata | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/metadata` | **Admin,<br/>Creator,<br/>Observer** | Shows all metadata associated with the specified load balancer.
Bulk-delete load balancer metadata items | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/`<br/>`metadata?id={metaId} & id={metaId}` | **Admin** | Bulk-deletes the metadata items given in the specified ID list.
Show load balancer metadata item | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Admin,<br/>Creator,<br/>Observer** | Shows details for the specified metadata item for the specified load balancer.
Update load balancer metadata item | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Admin,<br/>Creator** | Updates the configuration of the specified metadata item on the specified load balancer.
Delete load balancer metadata item | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Admin,<br/>Creator** | Deletes a metadata item from the load balancer.
Show load balancer node metadata | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata` | **Admin,<br/>Creator** | Shows all metadata associated with the specified node and load balancer.
Add load balancer node metadata item | `POST /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata` | **Admin,<br/>Creator** | Adds a metadata item to the specified node and load balancer.
Bulk-delete load balancer node metadata items | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}/`<br/>`metadata?id='{metaId}' & id='{metaId}'` | **Admin** | Bulk-deletes the metadata items given in the specified ID list.
Show load balancer node metadata item | `GET /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin,<br/>Creator,<br/>Observer** | Shows details for the specified metadata item for the specified node and load balancer.
Update load balancer node metadata item | `PUT /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin,<br/>Creator** | Updates the configuration of a metadata item on the node. **Note:** The metadata item's ID and key are immutable attributes and cannot be modified with a `PUT` request.
Delete load balancer node metadata item | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin** | Deletes the specified metadata item from the node.

### Limits

Method | API action | Role | Description
--- | --- | --- | ---
List absolute limits | `GET /v1.0/{account}/loadbalancers/absolutelimits` | **Admin,<br/>Creator,<br/>Observer** | Lists the current absolute limits for the account.
List limits | `GET /v1.0/{account}/loadbalancers/limits` | **Admin,<br/>Creator,<br/>Observer** | Lists the current limits for the account.

[Permission matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
