---
permalink: permissions-matrix-for-next-generation-cloud-servers/
audit_date: '2016-12-06'
title: Permissions matrix for Cloud Servers
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-12-06'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

The Cloud Servers permissions matrix displays specific permissions for the
following roles:

- **Admin** provides full access to create, read, update, and delete.
- **Creator** provides access to create, read, and update.
- **Observer** provides read-only access.

The matrix displays the Cloud Servers methods, their corresponding RESTful API commands,
and the roles that are supported.

Method | API action | Role | Description
--- | --- | --- | ---
Retrieve list of servers | `GET /servers` | **Observer, Creator, Admin** | Lists IDs, names, and links for all servers.
List servers with details | `GET /servers/detail` | **Observer, Creator, Admin** |	Lists all details for all servers.
Create server | `POST /servers` | **Creator, Admin** | Creates a server.
Show server details | `GET /servers/{server_id}` | **Observer, Creator, Admin**	| Lists details for a specified server.
Update server	| `PUT /servers/{server_id}` |	**Admin** | Updates one or more editable attributes for a specified server.
Delete server<br /><br /> **Note:** The user must also have a Cloud Block Storage Admin role. | `DELETE /servers/{server_id}` | **Admin**	| Deletes a specified server.
Create a server key pair | `POST /os-keypairs` } |  **Creator, Admin** | Generates a key pair consisting of a private key and a public key.
Retrieve list of key pairs	| `GET /os-keypairs` |  **Creator, Admin**	| Lists a key pair consisting of a private key and a public key.
Delete key pair | `DELETE /os-keypairs/{keypair_name}` | **Creator, Admin**	| Deletes a key pair of a specified name.
Retrieve list of server addresses | `GET /servers/{id}/ips` | **Observer, Creator, Admin** |	Lists all networks and server addresses associated with a specified server.
List Addresses by Network	| `GET /servers/{id}/ips/{networkLabel}` | **Observer, Creator, Admin** | Lists addresses associated with a specified server and network.
Change password, Reboot server, Rebuild server, Resize server, Confirm server resize, Revert server resize, Rescue server, Unrescue server, and Create image | `POST /servers/{server_id}/action` | **Admin** |	Performs the requested action.
Attach volume to server<br /><br /> **Note:** The user must also have a Cloud Block Storage Admin or Creator role. | `POST /servers/{server_id}/os-volume_attachments` | **Observer, Creator, Admin**	| Attaches a volume to the specified server.
List server volumes	| `GET /servers/{server_id}/os-volume_attachments` | **Observer, Creator, Admin** | Lists the attached volumes for the specified server.
Show volume attachment details |	`GET /servers/{server_id}/os-volume_attachments/{attachment_id}` | **Observer, Creator, Admin** | Lists volume details for the specified volume attachment ID.
Delete volume attachment | `DELETE /servers/{server_id}/os-volume_attachments/{attachment_id}`  | **Admin**	| Deletes a specified volume attachment from a specified server instance.
Retrieve list of flavors | `GET /flavors` | **Observer, Creator, Admin** | Lists IDs, names, and links for all available flavors.
Retrieve list of flavors with details | `GET /flavors/detail` | **Observer, Creator, Admin** | Lists all details for all available flavors.
Retrieve flavor details | `GET /flavors/{flavor_id}` | **Observer, Creator, Admin** | Lists details of the specified flavor.
Retrieve list of images |	`GET /images` | **Observer, Creator, Admin** | Lists IDs, names, and links for all available images.
Retrieve list of images with details	| `GET /images/detail` | **Observer, Creator, Admin**	| List all details for all available images.
Retrieve image details	| `GET /images/{image_id}` | **Observer, Creator, Admin** |	Lists details of the specified image
Delete image | `DELETE /images/{image_id}` | **Admin** | Deletes the specified image.
List server metadata | `GET /servers/{server_id}/metadata` | **Observer, Creator, Admin** | Lists all metadata associated with a server.
Retrieve image metadata for a specified image | `GET /images/{image_id}/metadata` | **Observer, Creator, Admin**	| Lists all metadata associated with an image.
Set server metadata | `PUT /servers/{server_id}/metadata` | **Admin**	| Sets metadata for the specified server.
Set image metadata for a specified image | `POST /images/{image_id}/metadata` | **Admin** | Sets metadata for the specified image.
Update server metadata | `POST /servers/{server_id}/metadata` | **Admin**	| Updates metadata items for the specified server.
Show server metadata item details | `GET /servers/{server_id}/metadata/{key}` | **Observer, Creator, Admin** | Retrieves a single metadata item associated with a server.
Retrieve image metadata item for a specified image | `GET /images/{image_id}/metadata/{key}` | **Observer, Creator, Admin**	| Retrieves a single metadata item associated with an image.
Set server metadata item  | `PUT /servers/{server_id}/metadata/{key}` | **Admin** | Sets a metadata item for a specified server.
Set image metadata item for a specified image	| `PUT /images/{image_id}/metadata/{key}` | **Admin** | Sets a metadata item for a specified image.
Delete server metadata item | `DELETE /servers/{server_id}/metadata/{key}` | **Admin** | Deletes a metadata item for the specified server.
Delete image metadata item for a specified image | `DELETE /images/{image_id}/metadata/{key}` | **Admin** | Deletes a metadata item for the specified image.
Retrieve list of limits including used limits | `GET /limits` | **Observer, Creator, Admin** | Expands the limits operation to show the project usage, including RAM and instance quotas usage.
Enable scheduled images | `POST /servers/{server_id}/rax-si-image-schedule` | **Creator, Admin**	| Enables scheduled images on a server by creating an `image_schedule` resource.
Show scheduled images	| `GET /servers/{server_id}/rax-si-image-schedule` | **Observer, Creator, Admin** |	Shows scheduled images for the specified server.
Disable scheduled images | `DELETE /servers/{server_id}/rax-si-image-schedule` |	**Admin** | Disables scheduled images by deleting the `image_schedule` resource that indicates the scheduled image service should create snapshots of this server.
Retrieve list of networks |	`GET /os-networksv2` | **Observer, Creator, Admin**	| Lists the networks configured for a specified tenant ID.
Create network | `POST /os-networksv2` | **Creator, Admin** | Creates a network for a specified tenant ID.
Create server with networks | `POST /servers` | **Creator, Admin** | Provisions a new server with specified networks.
Show network	| `GET /os-networksv2/{network_id}` | **Observer, Creator, Admin** | Shows information for a specified network ID.
Delete network | `DELETE /os-networksv2/{network_id}` |	**Admin** | Deletes a specified network.
Retrieve list of virtual interfaces | `GET /servers/{server_id}/os-virtual-interfacesv2` | **Observer, Creator, Admin** |	Lists all virtual interfaces configured for a server instance.
Create virtual interface and attach to server| `POST /servers/{server_id}/os-virtual-interfacesv2` | **Creator, Admin** | Creates a virtual interface for a network and attaches the network to a server instance.
Delete virtual interface | `DELETE /servers/{server_id}/os-virtual-interfacesv2/{interface_id}` |	**Admin** | Deletes a virtual interface from a server instance.

### Related article

[Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
