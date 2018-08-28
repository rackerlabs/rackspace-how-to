---
permalink: cloud-files-deletion-and-purge-requests
audit_date: '2018-08-28'
title: Cloud Files Deletion and Purge Requests
type: article
created_date: '2018-08-28'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---

This article discusses Cloud Files purge requests, delete requests, and the information that you should include with these 
requests. 

Rackspace defines purge and delete requests in the following way:

- **Purge**: A purge request is a request to clear the cache at the edge nodes from the Rackspace Content Delivery Network 
  (CDN) provider. Clearing the cache enables new versions of the files in the container to appear on the CDN. A purge is 
  sometimes needed if a high time to live is placed on a container.

- **Delete**: A delete request is a request to permanently delete a container and the files within it. A delete request 
  is required when a container and the files within it are no longer needed. After the delete request is completed 
  successfully, billing for the files stops.
  
It is important to understand whether you need to request a purge or a delete operation.

Cloud Files customers may purge up to 25 items per day. However, this limit can cause issues for containers that are 
associated with many files. As a result, a container purge might be necessary. 

After you understand which operation needs to be performed, you can open a ticket.

For a purge request, add the following information to the ticket:

- The name of the container.
- The region in which the container is located.
- A note indicating that you are requesting a purge of the specificied data, and that you understand that the purge is 
  needed to refresh the cache on the CDN. You should also note that you understand that files in the container, as well as   
  the container itself, will not be deleted.

For a delete request, add the following information to the ticket:

- The name of the container.
- The region in which the container is located.
- A note indicating that you understand that the files in the container to be deleted will be deleted irrevocably, 
  and that there will be no way to retrieve this data after the deletion is complete.

This information enables Rackspace Support to expedite your ticket. In addition, stating that you understand the differences 
between a purge and a delete request in a delete request ticket reduces the number of communications that are required to 
verify your deletion request.
