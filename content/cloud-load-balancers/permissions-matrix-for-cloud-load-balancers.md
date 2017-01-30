---
permalink: permissions-matrix-for-cloud-load-balancers/
audit_date:
title: Permissions Matrix for Cloud Load Balancers
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-09-26'
last_modified_by: Nate Archer
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The following permissions matrix displays specific permissions for the roles in Cloud Load Balancers. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

**As of May 24, 2015**

**Warning:** If SSL is enabled on a load balancer that is configured with nodes that are NOT in the same datacenter, then decrypted traffic will be sent in clear text over the public internet to the external node(s) and will no longer be secure. 

Method Name | API Action | Role | Description
:---: | :---: | :---: | :---:
**LOAD BALANCER** | | |
List Load Balancers | `GET /loadbalancers` | **Observer & Creator & Admin** | Provide a list of all load balancers configured and associated with your account.
List Load Balancer Details | `GET /loadbalancers/{loadBalancerId}` | **Observer & Creator & Admin** | Provide a list of all load balancers configured and associated with your account.
Create Load Balancer | `POST /loadbalancers` | **Creator & Admin** | Create a new load balancer with the configuration defined by the request.
Update Load Balancer Attributes | `PUT /loadbalancers/{loadBalancerId}` | **Creator & Admin** | Asynchronously update the attributes of the specified load balancer.
Remove Load Balancer | `DELETE /loadbalancers/{loadBalancerId}` | **Admin only** | Remove the specified load balancer and its associated configuration from the account.
Remove Load Balancer Batch Delete | `DELETE /loadbalancers{?id}` | **Admin only** | Bulk-delete load balancers.
**ERROR PAGES** | | |
List Error Page | `GET /loadbalancers/{loadBalancerId}/errorpage` | **Observer & Creator & Admin** | List error page configured for the specified load balancer.
Update Error Page | `PUT /loadbalancers/{loadBalancerId}/errorpage` | **Creator & Admin** | Set custom error page for the specified load balancer.
Delete Error Page | `DELETE /loadbalancers/{loadBalancerId}/errorpage` | **Admin only** | Delete custom error page for the specified load balancer.
**LOAD BALANCER STATISTICS** | | |
List Load Balancer Stats | `GET /loadbalancers/{loadBalancerId}/stats` | **Observer & Creator & Admin** | Provide detailed stats output for a specific load balancer.
**NODES** | | |
List Nodes | `GET /loadbalancers/{loadBalancerId}/nodes` | **Observer & Creator & Admin** | List node(s) configured for the load balancer.
List Details of Specific Node | `GET /loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Observer & Creator & Admin** | List details of a specific node.
Add Nodes | `POST /loadbalancers/{loadBalancerId}/nodes` | **Creator & Admin** | Add a new node to the load balancer.
Modify Nodes | `PUT /loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Admin only** | Modify the configuration of a node on the load balancer.
Delete Nodes | `DELETE /loadbalancers/{loadBalancerId}/nodes/{?nodeId}` | **Admin only** | Delete a node from a specified load balancer.
Delete Nodes Batch | `DELETE /loadbalancers/{loadBalancerId}/nodes/{nodeId}` | **Admin only** | Bulk-delete the specified nodes from a specified load balancer.
List Nodes | `GET /loadbalancers/{loadBalancerId}/nodes` | **Observer & Creator & Admin** | List node(s) configured for the load balancer.
**VIRTUAL IPs** | | |
List Virtual IPs | `GET /loadbalancers/loadBalancerId/virtualips` | **Observer & Creator & Admin** | List virtual IPs that are associated with a specified load balancer.
Add Virtual IPs | `POST /loadbalancers/{loadBalancerId}/virtualips` | **Creator & Admin** | Add virtual IP version 6.
Bulk-delete Virtual IPs | `DELETE /loadbalancers/{loadBalancerId}/virtualips/{?virtualIpId}` | **Admin only** | Bulk-delete specified virtual IPs.
Delete Virtual IPs | `GET /loadbalancers/{loadBalancerId}/virtualips/{virtualIpId}` | **Admin only** | Delete a specified virtual IP.
**ALLOWED DOMAINS** | | |
List Allowed Domains | `GET /loadbalancers/alloweddomains` | **Observer & Creator & Admin** | View a list of allowed domains.
**USAGE REPORTS** | | |
List Billable Load Balancers | `GET /loadbalancers/billable{?startTime,endTime,offset, limit}` | **Observer & Creator & Admin** | List billable load balancers for the given date range. The response is paginated with a default limit of 500 and a maximum limit of 1000.
Show Account-level Usage | `GET /loadbalancers/usage{?startTime,endTime}` | **Observer & Creator & Admin** | Show account-level usage.
Show Historical Usage | `GET /loadbalancers/{loadBalancerId}/usage{?startTime,endTime}` | **Observer & Creator & Admin** | Show historical usage. **Note:** Historical usage data is available for up to 90 days of service activity.
Show Current Usage | `GET /loadbalancers/{loadBalancerId}/usage/current/{?startTime,endTime}` | **Observer & Creator & Admin** | Show current usage.
**ACCESS LISTS** | | |
Show Access List | `GET /loadbalancers/{loadBalancerId}/accesslist` | **Observer & Creator & Admin** | Show the access list.
Create or Update Access List | `POST /loadbalancers/{loadBalancerId}/accesslist` | **Creator & Admin** | Create or append to an existing access list.
Delete Access List | `DELETE /loadbalancers/{loadBalancerId}/accesslist` | **Admin only** | Delete the entire access list.
Bulk-delete Specified Networks | `DELETE /loadbalancers/{loadBalancerId}/accesslist/{?networkItemId}` | **Admin only** | Bulk-delete the specified networks from an access list.
Delete Network Item from Access List | `DELETE /loadbalancers/{loadBalancerId}/accesslist/{networkItemId}` | **Admin only**  | Delete a network item from a specified access list.
**MONITOR HEALTH** | | |
Show Health Monitor Configuration | `GET /loadbalancers/{loadBalancerId}/healthmonitor` | **Observer & Creator & Admin** | Show the health monitor configuration, if one exists.
Update Health Monitor | `PUT /loadbalancers/loadBalancerId/healthmonitor` | **Creator & Admin** | Update the settings for a health monitor.
Delete Health Monitor | `DELETE /loadbalancers/loadBalancerId/healthmonitor` | **Admin only** | Delete a health monitor.
**SESSION PERSISTENCE** | | |
Show Session Persistence Configuration | `GET /loadbalancers/{loadBalancerId}/sessionpersistence` | **Observer & Creator & Admin** | List session persistence configuration.
Enable Session Persistence | `PUT /loadbalancers/{loadBalancerId}/sessionpersistence` | **Creator & Admin** | Enable session persistence.
Disable Session Persistence | `DELETE /loadbalancers/{loadBalancerId}/sessionpersistence` | **Admin only** | Disable session persistence.
**LOG CONNECTIONS** | | |
Show Connection Logging Configuration | `GET /loadbalancers/{loadBalancerId}/connectionlogging` | **Observer & Creator & Admin** | Show connection logging configuration.
Enable or Disable Connection Logging | `PUT /loadbalancers/{loadBalancerId}/connectionlogging` | **Creator & Admin** | Enable or disable connection logging. **Note:** Enable connection logging requires that the user have access to Cloud Files, which is used for storing the logs.
**THROTTLE CONNECTIONS** | | |
Show Connection Throttling Configuration | `GET /loadbalancers/{loadBalancerId}/connectionthrottling` | **Observer & Creator & Admin** | Show connection throttling configuration.
Create or Update Connection Throttling Configuration | `PUT /loadbalancers/{loadBalancerId}/connectionthrottling` | **Creator & Admin** | Create or update throttling configuration.
Delete Connection Throttling Configuration | `DELETE /loadbalancers/{loadBalancerId}/connectionthrottling` | **Admin only** | Delete connection throttling configurations.
**CONTENT CACHING** | | |
Show Content Caching Configuration | `GET /loadbalancers/{loadBalancerId}/contentcaching` | **Observer & Creator & Admin**	| Show current configuration of content caching.
Enable or Disable Content Caching | `PUT /loadbalancers/{loadBalancerId}/contentcaching` | **Creator & Admin** | Enable or disable content caching.
**PROTOCOLS** | | |
List Load Balancer Protocols | `GET /loadbalancers/protocol` | **Observer & Creator & Admin** | List supported load balancing protocols.
**ALGORITHMS** | | |
List Load Balancer Algorithms | `GET /loadbalancers/algorithms` | **Observer & Creator & Admin** | List all supported load balancing algorithms.
**SSL TERMINATION & CERTIFICATE MAPPINGS** | | |
Show SSL Termination Configuration | `GET /loadbalancers/{loadBalancerId}/ssltermination` | **Observer & Creator & Admin** | Show the load balancer's SSL termination configuration.
Update SSL Termination | `PUT /loadbalancers/{loadBalancerId}/ssltermination` | **Creator & Admin** | Update the SSL termination. 
Delete SSL Termination | `DELETE /loadbalancers/{loadBalancerId}/ssltermination` | **Admin only** | Delete SSL termination.
List Certificate Mappings | `GET /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings` | **Observer & Creator & Admin** | List certificate mappings that are configured for a specified load balancer.
Add Certificate Mapping | `POST /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings` | **Creator & Admin** | Add a certificate mapping to a specified load balancer.
Show Certificate Mappings Details | `GET /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings/{certificateMappingId}` | **Observer & Creator & Admin** | Show details for a specified certificate mapping.
Update Certificate Mapping | `PUT /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings/{certificateMappingId}` | **Creator & Admin** | Update the configuration for a specified certificate mapping on a specified load balancer.
Delete Certificate Mapping | `DELETE /loadbalancers/{loadBalancerId}/ssltermination/certificatemappings/{certificateMappingId}` | **Admin only** | Delete a certificate mapping from a specified load balancer.
**METADATA** | | |
Add Load Balancer Metadata | `POST /loadbalancers/{loadBalancerId}/metadata` | **Observer & Creator & Admin** | Add a new metadata item to the load balancer.
Show Load Balancer Metadata | `GET /loadbalancers/{loadBalancerId}/metadata` | **Observer & Creator & Admin** | Show all metadata associated with the specified load balancer.
Bulk-delete Load Balancer Metadata Items | `DELETE /loadbalancers/{loadBalancerId}/metadata{?metaId}` | **Admin only** | Bulk-delete the metadata items given specified id list.
Show Load Balancer Metadata Item | `GET /loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Observer & Creator & Admin** | Show details for a specified metadata item for a specified load balancer.
Update Load Balancer Metadata Item | `PUT /loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Creator & Admin** | Update the configuration of a metadata item on the load balancer.
Delete Load Balancer Metadata Item | `DELETE /loadbalancers/{loadBalancerId}/metadata/{metaId}` | **Creator & Admin** | Delete a metadata item from the load balancer.
Show Load Balancer Node Metadata | `GET loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata` | **Creator & Admin** | Show all metadata associated with a specified node and load balancer.
Add Load Balancer Node Metadata | `POST loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata` | **Creator & Admin** | Adds a metadata item to a specified node and load balancer.
Bulk-delete Load Balancer Node Metadata Items | `DELETE loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata{?metaId}` | **Admin only** | Bulk-deletes the metadata items given specified id list.
Show Load Balancer Node Metadata Item | `GET loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Observer & Creator & Admin** | Show details for a specified metadata item for a specified node and load balancer.
Update Load Balancer Node Metadata Item | `PUT loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Creator & Admin** | Update the configuration of a metadata item on the node.
Delete Load Balancer Node Metadata Item | `loadbalancers/{loadBalancerId}/nodes/{nodeId}/metadata/{metaId}` | **Admin only** | Delete a metadata item from the node.
**LIMITS** | | |
List Absolute Limits | `GET /loadbalancers/absolutelimits/` | **Observer & Creator & Admin** | Return the current absolute limits for the account.
List Limits | `GET /loadbalancers/limits` | **Observer & Creator & Admin** | Return the current limits for the account.

### Cloud Load Balancer Terminology

#### Algorithm

A process that defines how traffic should be directed between back-end nodes.

#### Connection Logging

A feature that allows logs to be delivered to a Cloud Files account every hour. For HTTP-based protocol traffic, these are Apache-style access logs. For all other traffic, this is connection and transfer logging.

#### [Content Caching](/how-to/content-caching-for-cloud-load-balancers)

An operation that stores recently-accessed files on the load balancer for easy retrieval by web clients.

#### Error Page

The HTML file that is shown to an end user who is attempting to access a load balancer.

#### Health Monitor

A configurable feature of each load balancer. It is used to determine whether or not a back-end node is usable for processing a request. The load balancing service currently supports active health monitoring.

#### [Load Balancers](/how-to/configure-a-load-balancer)

A logical device which belongs to a cloud account. It is used to distribute workloads between multiple back-end systems or services, based on the criteria defined as part of its configuration.

#### Metadata

Metadata can be associated with each load balancer and each node for the client's personal use. It is defined using key-value pairs where the key and value consist of alphanumeric characters. A key is unique per load balancer.

#### Node

A back-end device providing a service on a specified IP and port.

#### Session Persistence

A feature of the load balancing service that forces multiple requests from clients to be directed to the same node.

#### Usage Reports

A report that provides a view of all transfer activity, average number of connections, and number of virtual IPs associated with the load balancing service.

#### Virtual IP

An Internet Protocol (IP) configured on the load balancer for use by clients connecting to a service that is load balanced. Incoming connections are distributed to back-end nodes based on the configuration of the load balancer.

[Permission matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
