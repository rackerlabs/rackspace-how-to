---
permalink: detailed-permissions-matrix-for-dns/
audit_date:
title: Permissions matrix for Cloud DNS
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-11-22'
last_modified_by: Laura Santamaria
product: Cloud DNS
product_url: cloud-dns
---

The Cloud DNS permissions matrix displays specific permissions for the following roles:

 - **Admin** - provides full access to create, read, update, and delete.
 - **Creator** - provides access to create, read, and update.
 - **Observer** - provides read-only access.

The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

### Limits

Method | API Action | Role | Description
--- | --- | --- | ---
List All Limits	| ```GET /limits``` | **Admin<br />Creator<br />Observer** | Lists all applicable limits.
List Limit Types | ```GET /limits/types``` | **Admin<br />Creator<br />Observer** | Lists the types of limits.
List Specific Limit	| ```GET /limits/type (/limits/domain_limit, /limits/rate_limit, /limits/domain_record_limit)``` | **Admin<br />Creator<br />Observer** | Lists assigned limits of the specified type.

### Domains

Method | API Action | Role | Description
--- | --- | --- | ---
List Domains | ```GET /domains```  | **Admin<br />Creator<br />Observer** | Lists all account domains.
List Domains by Name | ```GET /domains?name=domainName``` | **Admin<br />Creator<br />Observer** | Lists all domains manageable by the account specified that exactly match the the value of the name parameter.
List Domain Details	| ```GET /domains/domainId``` | **Admin<br />Creator** | Lists details for a specific domain. By default, this call displays information for records but not subdomains.
List Domain Changes	| ```GET /domains/domainId/changes?since=[date/time]``` | **Admin<br />Creator<br />Observer** | Shows all changes to the specified domain since the specified date or time.
Export Domain	| ```GET /domains/domainId/export``` | **Admin<br />Creator<br />Observer** | Exports details of the specified domain.
Search Domains | ```GET /domains/search{?name}``` | **Admin<br />Creator<br />Observer** | Lists all names manageable by the specified account that have the value of the name parameter as part of their name.
Create Domain(s) | ```POST /domains``` | **Admin<br />Creator<br />Observer**	| Creates a new domain.
Clone Domain | ```POST /domains/domainId/clone?cloneName=new-domain-name``` | **Admin<br />Creator** | Creates the specified domain by cloning the domain with ```iddomainId```.
Import Domain | ```POST /domains/import``` | **Admin<br />Creator** | Imports a new domain with the configuration specified by the request.
Modify Single Domain | ```PUT /domains/domainId``` | **Admin<br />Creator** | Modifies the configuration of a domain.
Modify Multiple Domains | ```PUT /domains``` | **Admin<br />Creator** | Modifies multiple domains.
Remove Single Domain | ```DELETE /domains/domainId``` | **Admin only** | Removes a domain.
Remove Single Domain + Subdomains | ```DELETE /domains/domainId?deleteSubdomains=true``` | **Admin only** | Removes a domain and all of its subdomains.
Remove Multiple Domains | ```DELETE /domains?id=domainId1&id=domainId2``` | **Admin only** | Removes multiple domains.
Remove Multiple Domains + Subdomains | ```DELETE /domains?id=domainId1&id=domainId2&deleteSubdomains=true``` | **Admin only** | Removes multiple domains and their subdomains.

### Subdomains

Method | API Action | Role | Description
--- | --- | --- | ---
List Subdomains	| ```GET /domains/domainId/subdomains``` | **Admin<br />Creator<br />Observer** | Lists domains that are subdomains of the specified domain.

#### Records

Method | API Action | Role | Description
--- | --- | --- | ---
List Records | ```GET /domains/domainId/records``` | **Admin<br />Creator<br />Observer** | Lists all records configured for the domain.
Search Records | ```GET /domains/domainId/records?type=record_type &name=record_name &data=record_data``` | **Admin<br />Creator<br />Observer** | Lists all records for the specified domain of the specified type that match the specified name or data.
List Record Details	| ```GET /domains/domainId/records/recordId``` | **Admin<br />Creator<br />Observer** | Lists details for a specific record.
Add Records | ```POST /domains/domainId/records``` | **Admin<br />Creator** | Adds a new record to the domain.
Modify Single Record | ```PUT /domains/domainId/records/recordId``` | **Admin<br />Creator** | Modifies the configuration of a record in the domain.
Modify Multiple Records	| ```PUT /domains/domainId/records``` | **Admin<br />Creator** | Modifies the configuration of records in the domain.
Delete Single Record | ```DELETE /domains/domainId/records/recordId``` | **Admin only** | Removes a record from the domain.
Delete Multiple Records	| ```DELETE /domains/domainId/records?id=recordId1&id=recordId2``` | **Admin only** | Removes multiple records from the domain.

### Reverse

**Note:** For Reverse DNS, in order to create a PTR record for a Cloud Load Balancer or Cloud Server, you will additionally need at least the **Observer** role for the service you are associating the PTR record with.

Method | API Action | Role | Description
--- | --- | --- | ---
List PTR Records | ```GET /rdns/service_name?href=device-resource-uri``` | **Admin<br />Creator<br />Observer** | Lists all PTR records configured for a Rackspace Cloud device.
List PTR Record Details	| ```GET /rdns/service_name/recordId?href=device-resource-uri``` | **Admin<br />Creator<br />Observer** | Lists details for a specific PTR record associated with a Rackspace Cloud device.
Add PTR Records | ```POST /rdns``` | **Admin<br />Creator** | Adds one or more new PTR records for a Rackspace Cloud device.
Modify PTR Records | ```PUT /rdns``` | **Admin<br />Creator** | Modifies one or more PTR records associated with a Rackspace Cloud device.
Remove PTR Records | ```DELETE /rdns/service-name?href=device-resource-uri&ip=optional-ip-address``` | **Admin only** | Removes one or all PTR records associated with a Rackspace Cloud device.

### Job status

Method | API Action | Role | Description
--- | --- | --- | ---
View Jobs Status | <code>GET /status/jobId?showDetails=[true&#124;false]<br />GET /status?/<br />showDetails=true&#124;false&showErrors=true&#124;false&showRunning= true&#124;false&showCompleted=true&#124;false&limit=int1&offset=int2</code> | **Admin<br />Creator<br />Observer** | Lists status of all asynchronous job requests for an account and filters the information requested by using the optional boolean request parameters.

### Related articles

- [Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
- [API Documentation](https://developer.rackspace.com/docs/)
- [Related How-To Articles](/how-to/cloud-dns/)
