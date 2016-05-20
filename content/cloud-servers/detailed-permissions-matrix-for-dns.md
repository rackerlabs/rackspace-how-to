---
permalink: detailed-permissions-matrix-for-dns/
audit_date:
title: Detailed Permissions Matrix for DNS
type: article
created_date: '2013-04-10'
created_by: Renee Rendon
last_modified_date: '2016-01-18'
last_modified_by: Rose Contreras
product: Cloud DNS
product_url: cloud-dns
---

The following permissions matrix displays specific permissions for the roles in Cloud DNS. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

## As of July 16, 2014

Method Name | API Action | Role | Description
--- | --- | --- | ---
**LIMITS** | | |
List All Limits	| ```GET /limits``` | **Observer & Creator & Admin**	| Lists all applicable limits.
List Limit Types | ```GET /limits/types``` | **Observer & Creator & Admin** | Lists the types of limits.
List Specific Limit	| ```GET /limits/type (/limits/domain_limit, /limits/rate_limit, /limits/domain_record_limit)``` | **Observer & Creator & Admin** | List assigned limits of the specified type.
**DOMAINS** | | |
List Domains | ```GET /domains```  | **Observer & Creator & Admin** | Lists all account domains.
List Domains by Name | ```GET /domains?name=domainName``` | **Observer & Creator & Admin** | Filters domains by domain name: lists all domains manageable by the account specified that exactly match the the value of the name parameter.
List Domain Details	| ```GET /domains/domainId``` | **Creator & Admin** | check	Lists details for a specific domain. By default this call displays information for records but not subdomains.
List Domain Changes	| ```GET /domains/domainId/changes?since=[date/time]``` | **Observer & Creator & Admin** | Shows all changes to the specified domain since the specified date/time.
Export Domain	| ```GET /domains/domainId/export``` | **Observer & Creator & Admin** | Exports details of the specified domain.
Search Domains | ```GET /domains/search{?name}``` | **Observer & Creator & Admin** | Searches domains by domain name: lists all names manageable by the specified account that have the value of the name parameter as part of their name.
Create Domain(s) | ```POST /domains``` | **ObsCreator & Admin**	 	check	check	Creates a new domain.
Clone Domain | ```POST /domains/domainId/clone?cloneName=new-domain-name``` | **Creator & Admin** | Creates specified domain by cloning domain with ```iddomainId```.
Import Domain | ```POST /domains/import``` | **Creator & Admin** | Imports a new domain with the configuration specified by the request.
Modify Single Domain | ```PUT /domains/domainId``` | **Creator & Admin** | Modifies the configuration of a domain.
Modify Multiple Domains | ```PUT /domains``` | **Creator & Admin** | Modifies multiple domains.
Remove Single Domain | ```DELETE /domains/domainId``` | **Admin only** | Removes a domain.
Remove Single Domain + Subdomains | ```DELETE /domains/domainId?deleteSubdomains=true``` | **Admin only** | Removes a domain and all its subdomains.
Remove Multiple Domains | ```DELETE /domains?id=domainId1&id=domainId2``` | **Admin only** | Removes multiple domains.
Remove Multiple Domains + Subdomains | ```DELETE /domains?id=domainId1&id=domainId2&deleteSubdomains=true``` | **Admin only** | Removes multiple domains and their subdomains.
**SUBDOMAINS** | | |
List Subdomains	| ```GET /domains/domainId/subdomains``` | **Observer & Creator & Admin** | Lists domains that are subdomains of the specified domain.
**RECORDS** | | |
List Records | ```GET /domains/domainId/records``` | **Observer & Creator & Admin** | Lists all records configured for the domain.
Search Records | ```GET /domains/domainId/records?type=record_type &name=record_name &data=record_data``` | **Observer & Creator & Admin** | Lists all records for the specified domain of the specified type that match the specified name and/or data.
List Record Details	| ```GET /domains/domainId/records/recordId``` | **Observer & Creator & Admin** | Lists details for a specific record.
Add Records | ```POST /domains/domainId/records``` | **Creator & Admin** |Adds new record(s) to the domain.
Modify Single Record | ```PUT /domains/domainId/records/recordId``` | **Creator & Admin** | Modifies the configuration of a record in the domain.
Modify Multiple Records	| ```PUT /domains/domainId/records``` | **Creator & Admin** | Modifies the configuration of records in the domain.
Delete Single Record | ```DELETE /domains/domainId/records/recordId``` | **Admin only** | Removes a record from the domain.
Delete Multiple Records	| ```DELETE /domains/domainId/records?id=recordId1&id=recordId2``` | **Admin only** | Removes multiple records from the domain.
**REVERSE** | **Note:** For Reverse DNS, in order to create a PTR record for a Cloud Load Balancer, First Generation Cloud Server, or Next Generation Cloud Server, you will additionally need at least the Observer role for the service you are associating the PTR record with. | |
List PTR Records | ```GET /rdns/service_name?href=device-resource-uri``` | **Observer & Creator & Admin** | Lists all PTR records configured for a Rackspace Cloud device.
List PTR Record Details	| ```GET /rdns/service_name/recordId?href=device-resource-uri``` | **Observer & Creator & Admin** | Lists details for a specific PTR record associated with a Rackspace Cloud device.
Add PTR Records | ```POST /rdns``` | **Creator & Admin** | Adds new PTR record(s) for a Rackspace Cloud device.
Modify PTR Records | ```PUT /rdns``` | **Creator & Admin** | Modifies one or more PTR records associated with a Rackspace Cloud device.
Remove PTR Records | ```DELETE /rdns/service-name?href=device-resource-uri&ip=optional-ip-address``` | **Admin only** | Removes one or all PTR records associated with a Rackspace Cloud device.
**JOB STATUS** | | |
View Jobs Status | <code>GET /status/jobId?showDetails=[true&#124;false]<br />GET /status?/<br />showDetails=true&#124;false&showErrors=true&#124;false&showRunning= true&#124;false&showCompleted=true&#124;false&limit=int1&offset=int2</code> | **Observer & Creator & Admin** | Lists status of all asynchronous job requests for an account and filters the information requested by using the optional boolean request parameters.

### Cloud DNS Terminology

#### DNS

The Domain Name System (DNS) is a system by which internet domain name-to-address and address-to-name resolutions are determined. All domains and their components, such as mail servers, utilize DNS to resolve to the appropriate locations. DNS servers are usually set up in a master-slave relationship such that failure of the master invokes the slave. DNS servers may also be clustered or replicated such that changes made to one DNS server are automatically propagated to other active servers.

#### Domain

A domain is an entity/container of all DNS-related information containing one or more records.

#### Record

A DNS record belongs to a particular domain and is used to specify information about the domain. There are several types of DNS records. Each record type contains particular information used to describe that record's purpose. Examples include mail exchange (MX) records, which specify the mail server for a particular domain, and name server (NS) records, which specify the authoritative name servers for a domain.

#### Subdomain

Subdomains are domains within a parent domain, and subdomains cannot be registered. Subdomains allow you to delegate domains. Subdomains can themselves have subdomains, so third-level, fourth-level, fifth-level, and deeper levels of nesting are possible.

### Related articles

-  [API Documentation](https://developer.rackspace.com/docs/)
-  [Related How-To Articles](/how-to/)
-  [Cloud DNS Terminology](/how-to/detailed-permissions-matrix-for-dns)
-  [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
