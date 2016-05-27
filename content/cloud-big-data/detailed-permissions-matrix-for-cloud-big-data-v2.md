---

permalink: detailed-permissions-matrix-for-cloud-big-data-v2/
audit_date:
title: Detailed Permissions Matrix for Cloud Big Data v2
type: article
created_date: '2015-06-01'
created_by: Catherine Richardson
last_modified_date: '2016-04-29'
last_modified_by: Renee Rendon
product: Cloud Big Data
product_url: cloud-big-data
---

The following permissions matrix displays specific permissions for the roles in Cloud Big Data v2. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

**Note:**  For additional information about RBAC, see the [API Documentation](http://developer.rackspace.com/docs).

**As of June 30, 2015**

#### Credentials

Method Name | API Action | Role | Description
--- | --- | :---: | ---
List all credentials | `GET /credentials` | **Observer<br>Creator<br>Admin** | Lists all user credentials
List credentials by type | ```GET /credentials/{type}``` | **Observer<br> Creator<br>Admin** |	Lists all user credentials of the specified type.
Create a credential | ```POST /credentials/{type}``` | **Creator<br>Admin** | Creates a new credential of the specified type.
Update a credential | ```PUT /credentials/{type}/{name}``` | **Creator<br> Admin** | Updates the specified credential.
Delete a credential | ```DELETE /credentials/{type}/{name}``` | **Admin only** | Deletes the specified credential.

#### DISTROS

Method Name | API Action | Role | Description
--- | --- | :---: | ---
List available distros | ```GET /distros``` | **Observer<br>Creator<br> Admin** | List all available distros.
Show distro details | ```GET /distros/{distroId}``` | **Observer<br>Creator Admin** | For the specified distro, lists all of the supported services and their corresponding components and modes of operation.

#### STACKS

Method Name | API Action | Role | Description
--- | --- | :---: | ---
Create a stack | ```POST /stacks``` | **Creator<br>Admin** | Creates a new stack. **Note:** This functionality is not yet implemented.
List all stacks | ```GET /stacks``` | **Observer<br>Creator<br>Admin** | Lists all stacks, including global stacks and user-created stacks.
Show stack details | ```GET /stacks/{stackId}``` | **Observer<br>Creator Admin** | Lists details for the specified stack.
Delete a stack | ```DELETE /stacks/{type}/{stackId}``` | **Admin only** | Deletes the specified stack. **Note:** This functionality is not yet implemented.

#### CLUSTERS

Method Name | API Action | Role | Description
--- | --- | :---: | ---
Create a cluster | ```POST /clusters``` | **Creator<br>Admin**  | Creates a new cluster.
Delete a cluster | ```DELETE /clusters/{clusterId}``` | **Admin only** | Deletes the specified cluster.
List all clusters	| ```GET /clusters``` | **Observer<br>Creator<br>Admin** | Lists all clusters for your account.
Show cluster details | ```GET /clusters/{clusterId}```	| **Observer<br> Creator<br>Admin** | Lists details for the specified cluster.
Resize a cluster | ```PUT /clusters/{clusterId}``` | **Creator<br>Admin** | Resizes the specified cluster.

#### NODES

Method Name | API Action | Role | Description
--- | --- | :---: | ---
List cluster nodes | ```GET /clusters/{clusterId}/nodes``` | **Observer<br>Creator<br>Admin** | Lists all nodes for the specified cluster.

#### SCRIPTS

Method Name | API Action | Role | Description
--- | --- | :---: | ---
Create a script	| ```POST /scripts``` | **Creator<br>Admin** | Creates a new script.
List all scripts | ```GET /scripts``` | **Observer<br>Creator<br>Admin** | Lists all scripts, including global, product-provided scripts and user-created scripts.
Update a script	| ```PUT /scripts/{scriptId}``` | **Creator<br>Admin** | Updates the specified script.
Delete a script	| ```DELETE /scripts/{scriptId}``` | **Admin only** | Deletes the specified script.

#### FLAVORS

Method Name | API Action | Role | Description
--- | --- | :---: | ---
List available flavors | ```GET /flavors``` | **Observer<br>Creator<br>Admin** | Lists all available flavors.

#### RESOURCE LIMITS

Method Name | API Action | Role | Description
--- | --- | :---: | ---
List resource limits	| ```GET /limits``` | **Observer<br>Creator<br>Admin** | Lists the resource limits for the user, including the remaining node count, available RAM, and remaining disk space.


### Cloud Big Data terminology

#### Credentials

Credentials allow you to set up SSH keys and other connector credentials for use with clusters.

#### Distros

Distros provide a list of supported distributions and their corresponding versions, as well as a list of supported services and components per distribution.

#### Stacks

Stacks are high-level building blocks of software that compose a Big Data architecture. Stacks are composed of services, which in turn are composed of components. A stack is specific to a distribution because of to the differences in services that are supported across distributions.

####Clusters

A cluster is a group of servers (nodes). In Cloud Big Data, the servers are virtual.

####Node

In a network, a node (or server) is a connection point - either a redistribution point or an end point for data transmissions. In general, a node has programmed or engineered capability to recognize and process or forward transmissions to other nodes. A node is a member of a cluster.

#### Scripts

You can create a custom script that runs during various phases of the cluster's life cycle. The script is invoked on all nodes of the cluster. The script type currently supported is POST_INIT, which runs after the cluster is completely set up. The script must be executable. Preferably, the script should be a bash script, but it could be a Python script or a self-contained executable that works with the base libraries of the installed OS.

#### Flavor

A flavor is an available configuration for Cloud Big Data. Each flavor has a unique combination of memory capacity and priority for CPU time.

#### Resource limits

Resource limits include items such as remaining node count, available RAM, and remaining disk space for the user.

[**&lt; Permissions Matrices for RBAC**](/how-to/permissions-matrix-for-role-based-access-control-rbac)
