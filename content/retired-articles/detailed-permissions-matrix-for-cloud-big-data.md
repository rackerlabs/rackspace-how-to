---
permalink: detailed-permissions-matrix-for-cloud-big-data/
audit_date:
title: Detailed Permissions Matrix for Cloud Big Data
type: article
created_date: '2013-09-12'
created_by: Renee Rendon
last_modified_date: '2016-09-26'
last_modified_by: Renee Rendon
---

The following permissions matrix displays specific permissions for the roles in Cloud Big Data v1. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

**Note:** For additional information about RBAC, see the [API Documentation](http://developer.rackspace.com/docs).

### As of February 4, 2014

Method | API Action | Role | Description
:---: | :---: | :---:
**PROFILES** | | |
Get User Profile | <code>GET /profile</code> | **Observer & Creator & Admin** | Returns detailed profile information for the current user.
Create a User Profile | <code>POST /profile</code> | **Creator & Admin** | Creates a profile or updates the information in an existing profile.
**CLUSTERS** | | |
Create a Cluster | <code>POST /clusters</code> | **Creator & Admin** | Creates a new cluster.
Delete a Cluster | <code>DELETE /clusters/{clusterId}</code> | **Admin only** | Deletes a specified cluster.
List Clusters | <code>GET /clusters</code> | **Observer & Creator & Admin** | Lists all clusters for your account.
Get Cluster Details | <code>GET /clusters/{clusterId}</code> | **Observer & Creator & Admin** | Returns details for a specified cluster.
Perform an Action on a Cluster | <code>POST /clusters/{clusterId}/action</code> | **Creator & Admin** | Performs an actionon a specified cluster, such as resizing.
**NODES** | | |
List Nodes in a cluster | <code>GET /clusters/{clusterId}/nodes</code> | **Observer & Creator & Admin** | Lists all nodes for a specified cluster.
Get Node Details | <code>GET /clusters/{clusterId}/nodes/{nodeId}</code> | **Observer & Creator & Admin** | Returns details for a specified node in a specified cluster.
**FLAVORS** | | |
List Available Flavors |<code>GET /flavors&nbsp;</code> | **Observer & Creator & Admin** | Lists all available flavors.
Get Flavor Details | <code>GET /flavors/{flavorId}</code> | **Observer & Creator & Admin** | Lists the details for the specified flavor.
List Supported Cluster Types for a Flavor | <code>GET /flavors/{flavorid}/types</code> | **Observer & Creator & Admin** | Lists the supported cluster types for the specified flavor.
**TYPES** | | |
List Cluster Types | <code>GET /types</code> | **Observer & Creator & Admin** | Returns a list of cluster types.
Get Cluster Type Details | <code>GET /types/{typeId}</code> | **Observer & Creator & Admin** | Returns details for the specified cluster type.
List Supported Flavors for a Cluster Type | <code>GET /types/{typeid}/flavors</code> | Lists the supported flavors for the specified cluster type.
**RESOURCE LIMITS** | | |
List Resource Limits for User | <code>GET /limits</code> | Displays the resource limits for the user.




### Cloud Big Data Terminology

#### Cluster

A group of servers (nodes). In Cloud Big Data, the servers are virtual.

#### Node

In a network, a node is a connection point, either a redistribution point or an end point for data transmissions. In general, a node has programmed or engineered capability to recognize and process or forward transmissions to other nodes.

[Permissions Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
