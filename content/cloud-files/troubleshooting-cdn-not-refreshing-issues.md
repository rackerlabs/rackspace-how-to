---
permalink: troubleshooting-CDN-not-refreshing-issues
audit_date:
title: Troubleshooting the Cloud Files CDN when files are not refreshing
created_date: '2018-09-11'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Files    
product_url: cloud-files
---

This article is to assist you if you are experiencing Cloud Files issues in which the files on the CDN do not appear to be refreshing properly.

### Check Rackspace status

If you are experiencing issues with Cloud Files, visit the [Rackspace System Status](https://rackspace.service-now.com/system_status/) page and check for open issues that might be impacting the service.


### Check support tickets

Check your open support tickets for information about any incidents that might be affecting the service. To check
your open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click 
**Tickets > Ticket List** in the top navigation bar.

### Check the Time to Live

A common reason that people experience files on the CDN not refreshing is due to the Time to Live (TTL).
of the container. The TTL is the , which is how much time needs to pass before the records expire. If a container has an exceptionally high TTL, you could be waiting quite a while before the contents of that container update on the CDN. 

Use these steps to check the TTL of a container in the Cloud Control Panel:

1. Click **Rackspace Cloud** in the top title bar, then click **Storage** > **Files**.
2. Find the container in question and click the gear icon to the left of its name.  Then click **Modify Time to Live (TTL)…**.  The TTL presents how much time must pass before the CDN checks for new versions of the files that are in the container. If the TTL is a very high number, then it is not surprising that the CDN files have not refreshed.

### Purge objects

You have the option in the Control Panel to purge up to 25 objects per day.

Click the gear icon to the left of the object and then choose **Refresh File (Purge)…**.

If the file was deleted and you need it deleted from the CDN, this option will not be available in the Control Panel as the object is not present. You also have the choice to utilize the API to [Delete CDN Enabled Objects](https://developer.rackspace.com/docs/cloud-files/v1/cdn-api-reference/cdn-object-services-operations/#delete-cdn-enabled-object). The same 25 object limit still applies with API calls.

Note: There are instances when there are thousands of objects in a container.  If the entire container needs to be purged immediately, it is possible to have this done by Rackspace Support.

You can create a ticketr by using the following steps:

1. Click **Support**, then click **Support Tickets**.
2. Click **Create Ticket**
3. In **Category**, for **Type**, choose **Cloud Files**, and then choose **CDN**.
4. In the ticket, provide the following information:
  * Do you use any CNAMEs to access this container?  If so, please provide the full CNAME.
  * Which access URLs do you use to access these files? HTTP/HTTPS/Streaming/iOS?
  * Does this container host a static webpage?  If so, what is your index page (typically index.html)?
