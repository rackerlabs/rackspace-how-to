---
permalink: detailed-permissions-matrix-for-cloud-feeds/
audit_date:
title: Detailed Permissions Matrix for Cloud Feeds
type: article
created_date: '2014-08-27'
created_by: Renee Rendon
last_modified_date: '2016-01-16'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

The following permissions matrix displays specific permissions for the roles in Cloud Feeds. The matrix displays the method names, their corresponding RESTful API commands, and the roles that are supported.

### As of January 20, 2015

Role | Private Feeds: Get or Post | Other: Get or Post
--- | :---: | :---:
Cloud Feeds: Observer | &nbsp; | GET
Admin | &nbsp; | &nbsp;
Observer | &nbsp; | &nbsp;
Identity: User-Admin | &nbsp; |&nbsp;
Any other users with just valid token, irrespective of the role | &nbsp; | &nbsp;

**Note:** Beginning January 20, users must have one of the cloudfeeds roles to access feeds (read or write).

### Related articles
-  [API Documentation](https://developer.rackspace.com/docs/)
-  [Cloud Feeds FAQ](/how-to/cloud-feeds-faq)
-  [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
