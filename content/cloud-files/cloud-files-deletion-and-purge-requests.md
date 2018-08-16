---
permalink: cloud-files-deletion-and-purge-requests
audit_date:
title: Cloud Files Deletion and Purge Requests
type: article
created_date: '2018-08-16'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---

The daily allowable for Cloud Files purges is 25 items.  This can cause issues for containers with a hefty number of files though, so container purges are needed at times.  First, it is important to understand what exactly is needing to be done with Cloud Files, either a purge or a delete.  They are two very different things.

**Purge**: A purge request is to clear the cache at the edge nodes from the Backspace CDN provider.  By clearing the cache, new versions of files in the container are able to appear on the CDN, and is needed at times if a high Time To Live is placed on a container.

**Delete**: A delete request is when the desire is for a container and the files within to be permanently deleted.  This is needed when a container and the files within are no longer needed and upon the successful deletion, billing for the files will be stopped.

Understanding what is needed, a ticket can now be opened.

For a purge, please add the following to the ticket:
a. The container name
b. The region that the container is in
c. That you are requesting a purge of the data above and understand that the purge is needed to refresh the cache on the CDN and understand that files in the container, as well as the container itself, will not be deleted.

For a deletion, please add the following to the ticket:
a. The container name
b. The region that the container is in
c. That you understand that the files in the container that is to be deleted will irrevocably be deleted and that there will be no way to get back this data once the deletion is completed.

By providing the above information, Rackspace support can expedite the ticket.  In the case of the deletion request, understanding the differences between a purge and a delete request and stating such in the ticket will reduce the amount of responses for deletion verification before ticket resolution.
