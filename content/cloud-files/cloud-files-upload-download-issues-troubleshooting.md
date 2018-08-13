---
permalink: cloud-files-upload-download-issues-troubleshooting/
audit_date: '2018-08-10'
title: Troubleshoot Cloud Files upload and download issues
type: article
created_date: '2018-08-10'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---

This article is intended to help customers who have Managed Infrastructure service level agreements (SLAs) and are 
experiencing issues uploading to or downloading from Rackspace Cloud Files.

Specifically, this information helps you diagnose if the Cloud Files issue is remedied from the customer side, or if you 
should escalate it to Rackspace Support. It also specifies helpful information to include when you create a ticket in order 
to expedite our response.

### Check Rackspace status

If you are experiencing issues with Cloud Files, visit the 
[Rackspace System Status](https://rackspace.service-now.com/system_status/) page and check for open issues that might 
be impacting the service. 

### Check support tickets

Check your open support tickets for information about any incidents that might be affecting the service. To check
your open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click 
**Tickets > Ticket List** in the top navigation bar.

### Troubleshoot problems with Cloud Files uploads and downloads

If the system status is normal and there are no open support tickets pertaining to Cloud Files, you can attempt to 
troubleshoot the issue by using the following steps:

1. Check if the issue is related to the way that the upload or download is being processed. If the failure is occurring 
   through the Cloud Control Panel, try another method such as 
   [Cyberduck](https://developer.rackspace.com/docs/cloud-files/v1/getting-
   started/tools-and-applications-for-Cloud-Files/#cyberduck), 
   a third-party tool that can be configured to use direct calls with the Cloud Files API. For more information, see [How to configure Cyberduck for Rackspace Cloud Files](https://community.rackspace.com/general/f/general-discussion-forum/8486/how-to-configure-cyberduck-for-rackspace-cloud-files). 
   
   If you receive an error message, document it so that you can include it in your support request and then skip to step 6.
2. If the failure occurs in Cyberduck, attempt the upload or download from the Cloud Control Panel. In the top 
   navigation bar, click **Rackspace Cloud > Storage > Files**.
3. If you're trying to upload a file, click on the name of the container in which you want to store it. If you're trying to 
   download a file, click on the name of the container in which the file is stored. 
   
   The container details appear.
4. To test your ability to upload, drag and drop a small file into the window. For example, you can use a small picture or 
   text file. 
   
   **Note**: Ensure that your test file doesn't contain sensitive information.
5. To download a file, click the gear icon next to the filename, then select **Download File...**.
6. If the second method that you choose replicates the problem that you initially encountered, document any errors 
   and create a support ticket in the Cloud Control Panel by clicking **Tickets > Create Ticket** in the top 
   navigation bar. 
   
   The **Create Ticket** page appears.
7. In the **Category** section, select **Cloud Files** for the **Type**. 
8. Update the support ticket with the error message that you received and any other issues that you encountered with the upload or download, including the methods attempted. This information expedites your request.
