---
permalink: cloud-files-upload-download-issues-troubleshooting/
audit_date:
title: Cloud Files Upload/Download Issues Troubleshooting
type: article
created_date: '2018-08-10'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---

This article is meant to assist customers who are experiencing issues uploading or downloading to the Rackspace Cloud Files product.

As Managed Infrastructure customers administer services on their end, this article will assist in diagnosing if the Cloud Files issue should be remedied from the customer side, or if the issue is something that should be escalated to a member of Rackspace support, additionally pointing out helpful pieces of information that can be included when creating a ticket to receive an expedited response.

**Before starting the process below, check status.rackspace.com for open issues that could be impacting your Cloud Files. Also, check current support tickets to assure that there is not an incident that is causing issues. If there is no open support ticket about Cloud Files, proceed with the troubleshooting steps below.

1. If an issue is experienced with uploading or downloading a Cloud File, the first and easiest way to check if the issue is in the method in which the upload or download is being processed. If the failure is coming within the Control Panel, try another method such as Cyberduck. Cyberduck is a great third-party tool that contains an option specifically for Cloud Files that uses direct calls with the Cloud Files API. Cloud Files With Cyberduck <https://community.rackspace.com/general/f/general-discussion-forum/8486/how-to-configure-cyberduck-for-rackspace-cloud-files> is an excellent article to get started. If an error is received, document it and skip to step 7.
2. On the flip side, if the problems are being experienced with Cyberduck, attempt an upload or download within the Cloud Control Panel. Click “Rackspace Cloud" in the top title bar, then "Storage" and then "Files":
<Image 1>
3. Choose the container where the file is trying to upload to or download from to pull up the Container's details:
<Image 2>
4. To upload a file, drag and drop a small file (assuring to not use anything that contains sensitive information). This can be a small picture or text file:
<Image 3>
5. To download a file, click the gear icon next to the File Name and then choose "Download File...":
<Image 4>
6. If the issue is replicated in the second upload/download method document any error issues, create a support ticket by clicking “Support” in the top bar in the Cloud Control Panel, then click “Support Tickets”:
<Image 5>
7. Click “Create Ticket”:
<Image 6>
8. In Category, choose the “Type” of “Cloud Files”:
<Image 7>
9. Update the support ticket with the error message received and any others issues that have been experienced with the upload/download, including methods attempted. This will assist Rackspace support in expediting your issue.
