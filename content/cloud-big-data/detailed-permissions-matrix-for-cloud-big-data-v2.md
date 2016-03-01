---
node_id: 4702
title: Detailed Permissions Matrix for Cloud Big Data v2
type: article
created_date: '2015-06-01'
created_by: Catherine Richardson
last_modified_date: '2016-01-21'
last_modified_by: Margaret Eker
product: Cloud Big Data
product_url: cloud-big-data
---

The following permissions matrix displays specific permissions for the roles in Cloud Big Data v2. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

**Note:**  For additional information about RBAC, see the [API Documentation](http://developer.rackspace.com/docs).


### As of June 30, 2015

Method | API Action | Role | Description
:---: | :---: | :---:
**CREDENTIALS** | | |
List all credentials | <code>GET /credentials</code> | **Observer & Creator & Admin** | Lists all user credentials
List credentials by type | <code>GET /credentials/{type}</code> | **Observer & Creator & Admin** |	Lists all user credentials of the specified type.
Create a credential | <code>POST /credentials/{type}</code> | **Creator & Admin** | Creates a new credential of the specified type.
Update a credential | <code>PUT /credentials/{type}/{name}</code> | **Creator & Admin** | Updates the specified credential.
Delete a credential | <code>DELETE /credentials/{type}/{name}</code> | **Admin only** | Deletes the specified credential.
**DISTROS** | | |
List available distros | <code>GET /distros</code> | **Observer & Creator & Admin** | List all available distros.
Show distro details | <code>GET /distros/{distroId}</code> | **Observer & Creator & Admin** | For the specified distro, lists all of the supported services and their corresponding components and modes of operation.
**STACKS** | | |
Create a stack | <code>POST /stacks</code> | **Creator & Admin** | Creates a new stack. **Note:** This functionality is not yet implemented.
List all stacks | <code>GET /stacks</code> | **Observer & Creator & Admin** | Lists all stacks, including global stacks and user-created stacks.
Show stack details | <code>GET /stacks/{stackId}</code | **Observer & Creator & Admin** | Lists details for the specified stack.
Delete a stack | DELETE /stacks/{type}/{stackId} | **Admin only** | Deletes the specified stack. **Note:** This functionality is not yet implemented.
**CLUSTERS** | | |
Create a cluster | <code>POST /clusters</code> | **Creator & Admin**  | Creates a new cluster.
Delete a cluster | <code>DELETE /clusters/{clusterId}</code> | ** Admin only** | Deletes the specified cluster.
List all clusters	| <code>GET /clusters</code> | **Observer & Creator & Admin** | Lists all clusters for your account.
Show cluster details | <code> GET /clusters/{clusterId}</code>	| **Observer & Creator & Admin** | Lists details for the specified cluster.
Resize a cluster | <code>PUT /clusters/{clusterId}</code> | **Creator & Admin** | Resizes the specified cluster.
**NODES** | | |
List cluster nodes | <code>GET /clusters/{clusterId}/nodes</code> | **Observer & Creator & Admin** | Lists all nodes for the specified cluster.
**SCRIPTS** | | |
Create a script	| <code>POST /scripts</code> | **Creator & Admin** | Creates a new script.
List all scripts | <code>GET /scripts</code> | **Observer & Creator & Admin** | Lists all scripts, including global, product-provided scripts and user-created scripts.
Update a script	| <code>PUT /scripts/{scriptId}</code> | **Creator & Admin** | Updates the specified script.
Delete a script	| <code>DELETE /scripts/{scriptId}</code> | **Admin only** | Deletes the specified script.
**FLAVORS** | | |
List available flavors | <code>GET /flavors</code> | **Observer & Creator & Admin** | Lists all available flavors.
**RESOURCE LIMITS** | | |
List resource limits	| <code>GET /limits</code> | **Observer & Creator & Admin** | Lists the resource limits for the user, including the remaining node count, available RAM, and remaining disk space.


### Cloud Big Data terminology

#### Credentials

Credentials allow you to set up SSH keys and other connector credentials for use with clusters.

#### Distros

Distros provide a list of supported distributions and their corresponding versions, as well as a list of supported services and components per distribution.

#### Stacks

Stacks are high-level building blocks of software that compose a Big Data architecture. Stacks are composed of services, which in turn are composed of components. A stack is specific to a distribution because of to the differences in services that are supported across distributions.

#### Clusters

A cluster is a group of servers (nodes). In Cloud Big Data, the servers are virtual.

#### Node

In a network, a node (or server) is a connection point&mdash;either a redistribution point or an end point for data transmissions. In general, a node has programmed or engineered capability to recognize and process or forward transmissions to other nodes. A node is a member of a cluster.

#### Scripts

You can create a custom script that runs during various phases of the cluster's life cycle. The script is invoked on all nodes of the cluster. The script type currently supported is POST_INIT, which runs after the cluster is completely set up. The script must be executable. Preferably, the script should be a bash script, but it could be a Python script or a self-contained executable that works with the base libraries of the installed OS.

#### Flavor

A flavor is an available configuration for Cloud Big Data. Each flavor has a unique combination of memory capacity and priority for CPU time.

#### Resource limits

Resource limits include items such as remaining node count, available RAM, and remaining disk space for the user.

[**&lt; Permissions Matrices for RBAC**](/how-to/permissions-matrix-for-role-based-access-control-rbac)
