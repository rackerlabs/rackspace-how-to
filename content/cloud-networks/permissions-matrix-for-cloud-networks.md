---
permalink: permissions-matrix-for-cloud-networks/
audit_date:
title: Permissions Matrix for Cloud Networks
type: article
created_date: '2013-08-20'
created_by: Renee Rendon
last_modified_date: '2016-01-20'
last_modified_by: Rose Contreras
product: Cloud Networks
product_url: cloud-networks
---

The following permissions matrix displays specific permissions for the roles in Cloud Networks. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

[API Documentation](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-api-reference)

[Related How-To Articles](/how-to/)

[Cloud Networks Terminology](/how-to/permissions-matrix-for-cloud-networks)

### As of October 30, 2014

The following permissions matrix displays specific permissions for roles using the Neutron API.

Method Name | API Action | Role | Description
--- | --- | :---: | ---
**NETWORKS** | | |
List Networks | ```GET /networks``` |	**Creator & Admin**	**Admin only**	| Lists networks to which the specified tenant has access.
List Details for a Network | ```GET /networks/{network-id}``` |	**Creator & Admin**	**Admin only**	| Shows information for a specified network ID.
Create a Network | ```POST /networks``` | **Creator & Admin**	| Creates a network.
Update a Specified Network | ```PUT /networks/{network-id}``` | **Admin only**	| Updates editable attributes for a specified network.
Delete a Specified Network | ```DELETE /networks/{network-id}``` | **Admin only** | Deletes the specified network and its associated resources.
**SUBNETS** | | |
List Subnets | ```GET /subnets``` | **Observer & Creator & Admin** | Lists subnets to which the specified tenant has access.
List Details for a Subnet | ```GET /subnets/{subnet-id}``` |	**Creator & Admin**	**Admin only**	| Shows information for a specified subnet.
Create a Subnet | ```POST /subnets``` | **Creator & Admin** | Creates a subnet on a specified network.
Update a Specified Subnet | ```PUT /subnets/{subnet-id}``` | **Admin only** | Updates editable attributes for a specified subnet.
Delete a Subnet	| ```DELETES /subnets/{subnet-id}``` | **Admin only** | Deletes a specified subnet.
**PORTS** | | |
List Ports | ```GET /ports``` | **Creator & Admin**	**Admin only** | Lists ports to which the tenant has access.
List Details for a Port | ```GET /ports/{port-id}``` | **Observer & Creator & Admin** | Shows information for a specified port.
Create a Port	```POST /ports``` | **Creator & Admin**	| Creates a port on a specified network.
Update Editable Attribute of a Port | ```PUT /ports/{port-id}``` | **Admin only**	Updates a editable attributes for a specified port.
Delete Specified Port | ```DELETE /ports/{port-id}``` | **Admin only** | Deletes a specified port.


The following permissions matrix displays specific permissions for the roles using the nova-network API.

Method Name | API Action | Role | Description
--- | --- | :---: | ---
**Networks** | | |
List Networks | ```GET/os-networksv2``` | **Creator & Admin**	**Admin only** | Lists the networks configured for a specified tenant ID.
Create Network | ```POST/os-networksv2``` | **Creator & Admin** | Creates a network for the specified tenant ID.
Provision Server and Attach Networks | ```POST/servers``` | **Creator & Admin**	| Provisions a new server and attaches networks.
Show Network | ```GET/os-networkv2/id``` |  **Admin only**	 **Creator & Admin**	| Shows information for a specified network ID.
Delete Network | ```DELETE/GET/os-networkv2/id``` | **Admin only** | Deletes the specified network.
**Virtual Interfaces** | | |
List Virtual Interfaces | ```GET/servers/instance_id/os-virtual-interfacesv2``` | **Observer & Creator & Admin** | Lists the virtual interfaces configured for a server instance.
Create Virtual Interface | ```POST/servers/instance_id/os-virtual-interfacesv2``` | **Creator & Admin** | Creates a virtual interface for a network and attaches the network to a server instances.
Delete Virtual Interface | ```DELETE/servers/instances_id/os-virtual-interfacesv2/interface_id``` | **Admin only** | Deletes a virtual interface from a server instance.

## Cloud Networks Terminology

### Network

A sequence of connection points that communicate with each other.

### Server

A virtual machine (VM) instance in the Cloud Servers environment. To create a server, you must specify a name, flavor reference, and image reference.

### Virtual Interface

An extension to the networking API that is specifically used for attaching and detaching networks.
