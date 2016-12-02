---
permalink: detailed-permissions-matrix-for-dns/
audit_date: '2016-12-02'
title: Detailed permissions matrix for Cloud DNS
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-12-02'
last_modified_by: Laura Santamaria
product: Cloud DNS
product_url: cloud-dns
---

The Cloud DNS permissions matrix displays specific permissions for the following role-based access control (RBAC) roles:

 - **Admin** provides full access to create, read, update, and delete.
 - **Creator** provides access to create, read, and update.
 - **Observer** provides read-only access.

The matrix displays the Cloud DNS methods, their corresponding RESTful API commands, and the RBAC roles that are supported.

### Limits

Method | API action | Role | Description
--- | --- | --- | ---
List limits	| ```GET /limits``` | **Admin,<br />Creator,<br />Observer** | Lists all applicable limits.
List limit types | ```GET /limits/types``` | **Admin,<br />Creator,<br />Observer** | Lists the types of limits.
Show limits	| ```GET /limits/{type}``` | **Admin<br />Creator<br />Observer** | Lists assigned limits of the specified type, such as `domain_limit`, `rate_limit`, and `domain_record_limit`.

### Domains

Method | API action | Role | Description
--- | --- | --- | ---
List domains | ```GET /domains```  | **Admin,<br />Creator,<br />Observer** | Lists all account domains.
List domains by name | ```GET /domains?name={domainName}``` | **Admin,<br />Creator,<br />Observer** | Lists all domains manageable by the account that exactly match the value of the `name` parameter.
List domain details without subdomains	| ```GET /domains/{domainId}``` | **Admin,<br />Creator** | Lists details for a specific domain. By default, this operation displays information for records but not subdomains.
Show domain changes	| ```GET /domains/{domainId}/changes?since=[date/time]``` | **Admin,<br />Creator,<br />Observer** | Shows all changes to the specified domain since the specified date or time.
Export domain	| ```GET /domains/{domainId}/export``` | **Admin,<br />Creator,<br />Observer** | Exports details of the specified domain.
Search domains | ```GET /domains/search?name={domainName}``` | **Admin,<br />Creator,<br />Observer** | Lists all names manageable by the account that have the value of the `name` parameter as part of their name.
Create domain | ```POST /domains``` | **Admin,<br />Creator**	| Creates a new domain.
Clone domain | ```POST /domains/{domainId}/clone?cloneName={newDomainName}``` | **Admin,<br />Creator** | Creates a new domain by cloning the specified domain.
Import domain | ```POST /domains/import``` | **Admin,<br />Creator** | Imports a new domain with the configuration specified by the request.
Update domain | ```PUT /domains/{domainId}``` | **Admin,<br />Creator** | Modifies the configuration of a domain.
Update domains | ```PUT /domains``` | **Admin,<br />Creator** | Modifies multiple domains.
Delete domain | ```DELETE /domains/{domainId}``` | **Admin** | Removes a domain.
Delete domain  and its subdomains | ```DELETE /domains/{domainId}?deleteSubdomains=true``` | **Admin** | Removes a domain and all of its subdomains.
Delete domains | ```DELETE /domains?id={domainId1}&id={domainId2}``` | **Admin** | Removes multiple domains.
Delete domains and subdomains | ```DELETE /domains?id={domainId1}&id={domainId2}&deleteSubdomains=true``` | **Admin** | Removes multiple domains and their subdomains.

### Subdomains

Method | API action | Role | Description
--- | --- | --- | ---
List subdomains	| ```GET /domains/{domainId}/subdomains``` | **Admin,<br />Creator,<br />Observer** | Lists domains that are subdomains of the specified domain.

### Records

Method | API action | Role | Description
--- | --- | --- | ---
List records | ```GET /domains/{domainId}/records``` | **Admin,<br />Creator,<br />Observer** | Lists all records configured for the domain.
Search records | ```GET /domains/{domainId}/records?type={recordType}&name={recordName}&data={recordData}``` | **Admin,<br />Creator,<br />Observer** | Lists all records for the specified domain of the specified type that match the specified name or data.
Show record details	| ```GET /domains/{domainId}/records/{recordId}``` | **Admin,<br />Creator,<br />Observer** | Lists details for a specific record.
Add records | ```POST /domains/{domainId}/records``` | **Admin,<br />Creator** | Adds one or more new records to the domain.
Update record | ```PUT /domains/{domainId}/records/{recordId}``` | **Admin,<br />Creator** | Modifies the configuration of a record in the domain.
Update records	| ```PUT /domains/{domainId}/records``` | **Admin,<br />Creator** | Modifies the configuration of records in the domain.
Delete record | ```DELETE /domains/{domainId}/records/{recordId}``` | **Admin** | Removes a record from the domain.
Delete records	| ```DELETE /domains/{domainId}/records?id={recordId1}&id={recordId2}``` | **Admin** | Removes multiple records from the domain.

### Reverse DNS

**Note:** To create a PTR record for a cloud load balancer or cloud server, you must also have at least the **Observer** role for the service you are associating the PTR record with.

Method | API action | Role | Description
--- | --- | --- | ---
List PTR records | ```GET /rdns/{service-name}?href={deviceResourceUri}``` | **Admin,<br />Creator,<br />Observer** | Lists all PTR records configured for a Rackspace Cloud device.
Show PTR record	| ```GET /rdns/{service-name}/{recordId}?href={deviceResourceUri}``` | **Admin,<br />Creator,<br />Observer** | Lists details for a specific PTR record associated with a Rackspace Cloud device.
Add PTR records | ```POST /rdns``` | **Admin,<br />Creator** | Adds one or more new PTR records for a Rackspace Cloud device.
Update PTR records | ```PUT /rdns``` | **Admin,<br />Creator** | Modifies one or more PTR records associated with a Rackspace Cloud device.
Delete PTR records | ```DELETE /rdns/{service-name}?href={deviceResourceUri}&ip={optionalIpAddress}``` | **Admin** | Removes one or all PTR records associated with a Rackspace Cloud device.

### Job status

Method | API action | Role | Description
--- | --- | --- | ---
View Jobs Status | <code>GET /status/{jobId}?showDetails=[true&#124;false]<br />GET /status?/showDetails=true&#124;false&showErrors=true&#124; \ <br />false&showRunning=true&#124;false&showCompleted=true&#124;false&limit={int1}&offset={int2}</code> | **Admin,<br />Creator,<br />Observer** | Lists the status of all asynchronous job requests for an account and filters the information requested by using the optional Boolean request parameters.

### Related articles

- [Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
- [API documentation for RBAC in Cloud DNS](https://developer.rackspace.com/docs/cloud-dns/v1/general-api-info/role-based-access-control/)
