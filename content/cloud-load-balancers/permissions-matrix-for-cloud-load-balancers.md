---
permalink: permissions-matrix-for-cloud-load-balancers/
audit_date:
title: Permissions Matrix for Cloud Load Balancers
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2017-01-18'
last_modified_by: Laura Santamaria
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The Cloud Load Balancers permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

-  **Admin** provides full access to create, read, update, and delete.
-  **Creator** provides access to create, read, and update.
-  **Observer** provides read-only access.

 The matrix displays the Cloud Load Balancers methods grouped by category, their corresponding RESTful API commands, and the RBAC roles that are supported.

**Warning:** If SSL is enabled on a load balancer that is configured with nodes that are NOT in the same datacenter, then decrypted traffic will be sent in clear text over the public internet to the external nodes and will no longer be secure.

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
Bulk-delete virtual IPs | `DELETE /v1.0/{account}/loadbalancers/{loadBalancerId}/virtualips?={virtualIpId}` | **Admin** | Bulk-deletes specified virtual IPs.
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
Show Access List | `GET /loadbalancers/{loadBalancerId}/accesslist` | **Admin,<br/>Creator,<br/>Observer** | Show the access list.
Create or Update Access List | `POST /loadbalancers/{loadBalancerId}/accesslist` | **Admin,<br/>Creator** | Create or append to an existing access list.
Delete Access List | `DELETE /loadbalancers/{loadBalancerId}/accesslist` | **Admin** | Delete the entire access list.
Bulk-delete Specified Networks | `DELETE /loadbalancers/{loadBalancerId}/accesslist/{?networkItemId}` | **Admin** | Bulk-delete the specified networks from an access list.
Delete Network Item from Access List | `DELETE /loadbalancers/{loadBalancerId}/accesslist/{networkItemId}` | **Admin**  | Delete a network item from a specified access list.

### Monitor health

Method | API action | Role | Description
--- | --- | --- | ---
Show Health Monitor Configuration | `GET /loadbalancers/{loadBalancerId}/healthmonitor` | **Admin,<br/>Creator,<br/>Observer** | Show the health monitor configuration, if one exists.
Update Health Monitor | `PUT /loadbalancers/loadBalancerId/healthmonitor` | **Admin,<br/>Creator** | Update the settings for a health monitor.
Delete Health Monitor | `DELETE /loadbalancers/loadBalancerId/healthmonitor` | **Admin** | Delete a health monitor.

### Session persistence

Method | API action | Role | Description
--- | --- | --- | ---
Show Session Persistence Configuration | `GET /loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin,<br/>Creator,<br/>Observer** | List session persistence configuration.
Enable Session Persistence | `PUT /loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin,<br/>Creator** | Enable session persistence.
Disable Session Persistence | `DELETE /loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin** | Disable session persistence.

### Log connections

Method | API action | Role | Description
--- | --- | --- | ---
Show Connection Logging Configuration | `GET /loadbalancers/{loadBalancerId}/connectionlogging` | **Admin,<br/>Creator,<br/>Observer** | Show connection logging configuration.
Enable or Disable Connection Logging | `PUT /loadbalancers/{loadBalancerId}/connectionlogging` | **Admin,<br/>Creator** | Enable or disable connection logging. **Note:** Enable connection logging requires that the user have access to Cloud Files, which is used for storing the logs.

### Throttle connections

Method | API action | Role | Description
--- | --- | --- | ---
Show Connection Throttling Configuration | `GET /loadbalancers/{loadBalancerId}/connectionthrottling` | **Admin,<br/>Creator,<br/>Observer** | Show connection throttling configuration.
Create or Update Connection Throttling Configuration | `PUT /loadbalancers/{loadBalancerId}/connectionthrottling` | **Admin,<br/>Creator** | Create or update throttling configuration.
Delete Connection Throttling Configuration | `DELETE /loadbalancers/{loadBalancerId}/connectionthrottling` | **Admin** | Delete connection throttling configurations.

### Content caching

Method | API action | Role | Description
--- | --- | --- | ---
Show Content Caching Configuration | `GET /loadbalancers/{loadBalancerId}/contentcaching` | **Admin,<br/>Creator,<br/>Observer**	| Show current configuration of content caching.
Enable or Disable Content Caching | `PUT /loadbalancers/{loadBalancerId}/contentcaching` | **Admin,<br/>Creator** | Enable or disable content caching.

### Protocols

Method | API action | Role | Description
--- | --- | --- | ---
List Load Balancer Protocols | `GET /loadbalancers/protocol` | **Admin,<br/>Creator,<br/>Observer** | List supported load balancing protocols.

### Algorithms

Method | API action | Role | Description
--- | --- | --- | ---
List Load Balancer Algorithms | `GET /loadbalancers/algorithms` | **Admin,<br/>Creator,<br/>Observer** | List all supported load balancing algorithms.

### SSL termination and certificate mappings

Method | API action | Role | Description
--- | --- | --- | ---
Show SSL Termination Configuration | `GET /loadbalancers/{loadBalancerId}/ssltermination` | **Admin,<br/>Creator,<br/>Observer** | Show the load balancer's SSL termination configuration.
Update SSL Termination | `PUT /loadbalancers/{loadBalancerId}/ssltermination` | **Admin,<br/>Creator** | Update the SSL termination.
Delete SSL Termination | `DELETE /loadbalancers/{loadBalancerId}/ssltermination` | **Admin** | Delete SSL termination.
List Certificate Mappings | `GET /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings` | **Admin,<br/>Creator,<br/>Observer** | List certificate mappings that are configured for a specified load balancer.
Add Certificate Mapping | `POST /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings` | **Admin,<br/>Creator** | Add a certificate mapping to a specified load balancer.
Show Certificate Mappings Details | `GET /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings/{certificateMappingId}` | **Admin,<br/>Creator,<br/>Observer** | Show details for a specified certificate mapping.
Update Certificate Mapping | `PUT /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings/{certificateMappingId}` | **Admin,<br/>Creator** | Update the configuration for a specified certificate mapping on a specified load balancer.
Delete Certificate Mapping | `DELETE /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings/{certificateMappingId}` | **Admin** | Delete a certificate mapping from a specified load balancer.

### Metadata

Method | API action | Role | Description
--- | --- | --- | ---
Add Load Balancer Metadata | `POST /loadbalancers/{loadBalancerId}/metadata` | **Admin,<br/>Creator,<br/>Observer** | Add a new metadata item to the load balancer.
Show Load Balancer Metadata | `GET /loadbalancers/{loadBalancerId}/metadata` | **Admin,<br/>Creator,<br/>Observer** | Show all metadata associated with the specified load balancer.
Bulk-delete Load Balancer Metadata Items | `DELETE /loadbalancers/{loadBalancerId}/metadata{?metaId}` | **Admin** | Bulk-delete the metadata items given specified id list.
Show Load Balancer Metadata Item | `GET /loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Admin,<br/>Creator,<br/>Observer** | Show details for a specified metadata item for a specified load balancer.
Update Load Balancer Metadata Item | `PUT /loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Admin,<br/>Creator** | Update the configuration of a metadata item on the load balancer.
Delete Load Balancer Metadata Item | `DELETE /loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Admin,<br/>Creator** | Delete a metadata item from the load balancer.
Show Load Balancer Node Metadata | `GET loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata` | **Admin,<br/>Creator** | Show all metadata associated with a specified node and load balancer.
Add Load Balancer Node Metadata | `POST loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata` | **Admin,<br/>Creator** | Adds a metadata item to a specified node and load balancer.
Bulk-delete Load Balancer Node Metadata Items | `DELETE loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata{?metaId}` | **Admin** | Bulk-deletes the metadata items given specified id list.
Show Load Balancer Node Metadata Item | `GET loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin,<br/>Creator,<br/>Observer** | Show details for a specified metadata item for a specified node and load balancer.
Update Load Balancer Node Metadata Item | `PUT loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin,<br/>Creator** | Update the configuration of a metadata item on the node.
Delete Load Balancer Node Metadata Item | `loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin** | Delete a metadata item from the node.

### Limits

Method | API action | Role | Description
--- | --- | --- | ---
List Absolute Limits | `GET /loadbalancers/absolutelimits/` | **Admin,<br/>Creator,<br/>Observer** | Return the current absolute limits for the account.
List Limits | `GET /loadbalancers/limits` | **Admin,<br/>Creator,<br/>Observer** | Return the current limits for the account.

[Permission matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
