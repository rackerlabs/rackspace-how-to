---
permalink: public-folders-availability-for-hosted-exchange-2013/
audit_date:
title: Public folders availability for Hosted Exchange 2013 and 2016
type: article
created_date: '2014-12-03'
created_by: Kevin Richey
last_modified_date: '2016-04-29'
last_modified_by: Renee Rendon
product: Microsoft Exchange
product_url: exchange
---

Public folders for Hosted Exchange 2013 and Hosted Exchange 2016 improve folder administration in the Cloud Office Control Panel. Limited Admin control panel users have access to the public folders page.

### Summary of limits for Exchange 2013 and 2016 public folders

- All Hosted Exchange 2013 and 2016 customers can add public folders to their email domains.

- Exchange 2013 and 2016 customers are allowed to have up to 25 folders per domain with 250 MB of storage for each folder.

- Exchange 2007 and 2010 customers will continue to have unlimited use of public folders.

- A new control panel interface will be released for all customers.

### New control panel public folders page

Hosted Exchange customers (2007, 2010, 2013, and 2016) can use the improved control panel public folders page and can perform the following tasks from it:

- Create, copy, delete, and mail-enable folders.

- Change the reply-to address of mail-enabled folders to use an alternate domain or domain alias.

- Use easier and faster navigation and search.

- See the real-time status of your folders.

### Public folder limits for Hosted Exchange 2013 and 2016

Because of the inherent limitations in Exchange Server 2013 and 2016, Rackspace limits the public folder usage of all domains to maintain the stability of our hosted servers.

- You can create up to 25 folders (including subfolders) per email domain.

- You can store up to 250 MB of content in each folder. You cannot reallocate unused storage to other folders.

- Customers who manage folders through Outlook need a Limited Admin account in the control panel. Public folder administration is no longer available in Outlook. The primary control panel admin user can create Limited Admin accounts.

- For Exchange 2013 and 2016 customers whose folders exceed the limits, Rackspace will not automatically decrease their number or storage size. For these users, an example folder structure might display "33 of 25 folders." Customers with more than 25 folders cannot add new folders until they are below the limit. Folders that are over the 250 MB storage quota will not accept new items until content is removed to get below the quota.

The 25-folder and 250-MB-per-folder limits ensure that each Exchange environment does not exceed the inherent public folder limits that Microsoft placed on Exchange Server 2013 and 2016. Without these limits, Rackspace would jeopardize the stability of our customers' email and uptime. As Microsoft raises the limits (as they have stated they plan to do), we plan to raise ours as well.

### Limits for Hosted Exchange 2007 and 2010

Exchange 2007 and 2010 customers will have less change. Rackspace will not enforce any limits on folder and storage amounts. Control panel users will get the new public folders interface, and they can continue to manage public folders through Outlook.

Customers who plan to upgrade to Hosted Exchange 2013 and 2016 must meet the public folder limitations in that version.

The following functionality is not available in the December 2014 release:

- Moving folders in the control panel. This functionality will be available after the December 2014 release.

- Creating alternate email address user names for mail-enabled folders. Existing alternate email addresses will be retained on our servers and continue to receive mail; however, you will not be able to add others.

- Managing user permissions such as granting read, edit, or delete access.
