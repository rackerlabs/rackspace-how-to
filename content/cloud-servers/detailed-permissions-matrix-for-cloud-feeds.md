---
permalink: detailed-permissions-matrix-for-cloud-feeds/
audit_date: '2020-06-30'
title: Detailed Permissions Matrix for Cloud Feeds
type: article
created_date: '2014-08-27'
created_by: Renee Rendon
last_modified_date: '2020-06-30'
last_modified_by: Shubham Pandey
product: Cloud Servers
product_url: cloud-servers
---

The following permissions matrix displays specific permissions for the roles in Cloud Feeds. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

### As of January 20, 2015

| Role | Restricted Publishing: Get / Post | Private Feeds: Get / Post | Typical Feeds: Get / Post |
| --- | :---: | :---: | :---: |
| cloud feeds: observer | NO/NO | NO/NO | YES*/NO |
| cloudfeeds: service-observer | YES/NO |	YES/NO	|YES/NO |
| cloudfeeds:service-admin | YES/NO |YES/YES |YES/YES |
| cloudfeeds:cadf-publisher | NO/NO |	NO/NO  | YES\*\*/YES\*\* |
| cloudfeeds:{unique-name}-publisher | NO/YES | NO/NO | NO/NO |
| Admin | NO/NO	| NO/NO	| YES*/NO |
| Observer | NO/NO| NO/NO	| YES*/NO |
| Identity: User-Admin | NO/NO |	NO/NO | YES*/NO |
| identity:admin | NO/NO|	NO/NO |	NO/NO |
| Any other users with just valid token, irrespective of the role | NO/NO	| NO/NO | NO/NO |

* \* Users can retrieve only events matching their own Tenant ID.
* \*\* Users can retrieve and publish only CADF events.


**Note:** Beginning January 20, users must have one of the cloudfeeds roles to access feeds (read or write).

### Related articles
-  [API Documentation](https://developer.rackspace.com/docs/)
-  [Cloud Feeds FAQ](/how-to/cloud-feeds-faq)
-  [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
