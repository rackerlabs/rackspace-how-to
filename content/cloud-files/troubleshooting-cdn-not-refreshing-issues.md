---
permalink: troubleshooting-CDN-not-refreshing-issues
audit_date:
title: Troubleshooting CDN Not Refreshing Issues in Cloud Files
created_date: '2018-09-11'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Files    
product_url: cloud-files
---

This article is meant to assist with issues in which customers are experiencing Cloud Files issues in which the files on the CDN do not appear to be refreshing properly.
As Managed Infrastructure customers administer services on their end, this article will assist in diagnosing if the Cloud Files issue should be remedied from the customer side, or if the issue is something that should be escalated to a member of Rackspace support, additionally pointing out helpful pieces of information that can be included when creating a ticket to receive an expedited response.

### Check Rackspace status

If you are experiencing issues with Cloud Files, visit the [Rackspace System Status](https://rackspace.service-now.com/system_status/) page and check for open issues that might be impacting the service.


### Check support tickets

Check your open support tickets for information about any incidents that might be affecting the service. To check
your open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click 
**Tickets > Ticket List** in the top navigation bar.

### Check TTL

1. A common reason that people experience files on the CDN not refreshing is due to the TTL of the container. A TTL is the **Time To Live**, which is how long needs to pass before the records expire. If a container has an exceptionally high TTL, then customers could be waiting quite a while before the contents of that container update on the CDN. To check the TTL of a container in the Cloud Control Panel, click **Rackspace Cloud** in the top title bar, then **Storage** and then **Files**.
2. Find the Container in question and click the gear icon to the left of its name, then click **Modify Time to Live (TTL)…**.
3. The TTL will present how much time must pass before the CDN will check for new versions of the files that are in the container. If there is a very high number in the TTL, then it is not surprising that the CDN files have not refreshed.

### Purge Objects

1. Customers have the option in the control panel to purge up to 25 objects per day by clicking the gear icon to the left of the object and then choosing **Refresh File (Purge)…**.
If the file was deleted and the customer needs it deleted from the CDN, this option will not be available in the Control Panel as the object is not present. Customers also have the choice to utilize the API to [Delete CDN Enabled Objects](https://developer.rackspace.com/docs/cloud-files/v1/cdn-api-reference/cdn-object-services-operations/#delete-cdn-enabled-object). The same 25 object limit still applies with API calls.
2. Please note that there are instances when there are thousands of objects in a container.  If the entire container needs to be purged immediately, it is possible to have this done and a ticket should be created by clicking **Support**, then clicking **Support Tickets**.
3. Click **Create Ticket**
4. In **Category**, for **Type** choose **Cloud Files**, then choose **CDN**.
5. In the ticket, provide the following information:
  * Do you use any CNAMEs to access this container?
  * If so, please provide the full CNAME:
  * Which access URLs do you use to access these files? HTTP/HTTPS/Streaming/iOS?
  * Does this container host a static webpage?
    * If so, what is your index page? (typically index.html)
