---
permalink: permissions-matrix-for-first-generation-cloud-servers/
audit_date:
title: Permissions Matrix for First Generation Cloud Servers
type: article
created_date: '2013-06-17'
created_by: Renee Rendon
last_modified_date: '2016-01-18'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

The following permissions matrix displays specific permissions for the roles in First Generation Cloud Servers. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

[API Documentation](http://developer.rackspace.com/)

[Related Rackspace How-To Articles](/how-to/)

### First Generation Cloud Servers terminology

#### Flavor

A resource configuration for a server. Each flavor is a unique combination of disk, memory, vCPUs, and network bandwidth.

#### Image

A collection of files for a specific operating system (OS) that you use to create or rebuild a server. Rackspace provides pre-built images. You can also create custom images from servers that you have launched. Custom images can be used for data backups or as "gold" images for additional servers.

#### Server

A virtual machine (VM) instance in the Cloud Servers environment. To create a server, you must specify a name, flavor reference, and image reference.

### As of September 26, 2013

Method Name | API Action | Role | Description
--- | --- | :---: | :---: | ---
List All Servers | ```Get /servers``` | **Observer & Admin** | List all servers (IDs and names only).
List All Details for All Servers | ```GET /servers/detail``` | **Observer & Admin** | Lists all details for all servers.
Create a Server | ```POST /servers``` | **Admin only** | Creates a server.
List Details for a Specified Server | ```GET /servers/{id}``` | **Observer & Admin** | Lists details for a specified server.
Update the Editable Attributes for a Specified Server (Server Name and Password) | ```PUT /servers/{id}``` | **Admin only** | Updates one or more editable attributes for a specified server.
Delete a Specified Server |	```DELETE /servers/{id}``` | **Admin only** | Deletes a specified server.
List All Server Addresses Associated with a Specified Server | ```GET /servers/{id}/ips``` | **Observer & Admin** |Lists all server addresses associated with a specified server.
List All Public Server Addresses | ```GET /servers/{id}/ips/public``` | **Observer & Admin** | Lists all public server addresses.
List All Private Server Addresses	| ```GET /servers/{id}/ips/private``` | **Observer & Admin** | Lists all private server addresses.
Share Server Address | ```PUT /servers/{id}/ips/public/{address}``` | **Admin only** |Shares an IP address to the specified server.
Un-share Server Address	| ```PUT /servers/{id}/ips/public/{address}``` | **Admin only** | Removes a shared IP address from the specified server.
Server Actions: Reboot Server (soft), Reboot Server (hard), Rebuild Server, Resize Server, Confirm Resized Server, Revert Resized Server | ```POST /servers/{id}/action``` | **Admin only** | Performs the requested action.
List IDs, Names, and Links for All Available Flavors | ```GET /flavors``` | **Observer & Admin** | Lists IDs, names, and links for all available flavors.
Lists All Details for All Available Flavors	| ```GET /flavors/detail``` | **Observer & Admin** | Lists all details for all available flavors.
Lists Details of a Specified Flavor	| ```GET /flavors/{id}``` | **Observer & Admin** | Lists details of the specified flavor.
Lists IDs, Names, and Links for All Available Images | ```GET /images``` | **Observer & Admin** |Lists IDs, names, and links for all available images.
List All Details for All Available Images	| ```GET /images/detail``` | **Observer & Admin** | List all details for all available images.
List Details of a Specified Image	| ```GET /images/{id}``` | **Observer & Admin** |Lists details of the specified image.
Create a New Image | ```POST /images``` | **Admin only** | Creates a new image.
Delete a Specified Image | ```DELETE /images/{id}``` | **Admin only** | Deletes a specified image.
List the Backup Schedule for a Specified Server	| ```GET /servers/{id}/backup_schedule``` | **Observer & Admin** | Lists the backup schedule for a specified server.
Create/Update Backup Schedule for a Specified Server | ```POST /servers/{id}/backup_schedule``` | **Admin only** | Creates or updates the backup schedule for a specified server.
Disable Backup Schedule	| ```DELETE /servers/{id}/backup_schedule``` | **Admin only** | Disables the backup schedule for a specified server.
List ID's and Names for Shared Address Groups	| ```GET /shared_ip_groups``` | **Observer & Admin** | Lists IDs and names for shared IP groups.
Lists All Details for Shared Address Groups	| ```GET /shared_ip_groups/detail``` | **Observer & Admin** | Lists all details for shared IP groups.
Create a Shared Address Group | ```POST /shared_ip_groups``` | **Admin only** | Creates a shared IP group.
Delete a Specified Shared Address Group	| ```DELETE /shared_ip_groups/{id}``` | **Admin only** | Lists details for the specified shared IP group.
Get Current API Limits | ```GET /limits``` | **Observer & Admin** | Lists current API limits.
Get a URL for a Web Browser-mediated Console Session for a Specified Server	| ```GET /servers/{id}/console``` | **Admin only** | Gets a URL for a web browser-mediated console session for the specified server.
Rescue/Unrescue a Server | ```POST /servers/{id}/rescue``` | **Admin only** | Rescue or unrescue a server.
Create a Next Generation Cloud Servers Image from a First Generation Cloud Server that is Specified in the Request Body	| ```POST /next_gen_image_requests``` | **Admin only** | Creates a Next Generation Cloud Servers image from a First Generation Cloud Server that is specified in the request body.

### Next section

[Permission Matrix for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
