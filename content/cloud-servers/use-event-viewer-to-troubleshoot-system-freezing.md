---
permalink: use-event-viewer-to-troubleshoot-system-freezes/
title: 'Use Event Viewer to troubleshoot system freezes'
type: article
audit_date: '2020-06-16'
created_date: '2020-06-15'
created_by: Benji Ivey
last_modified_date: '2020-06-16'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to use the Windows&reg; Event Viewer to identify system freezes.

1. To open Event Viewer, click **Start** > **Run** and then type `eventvwr`.
   
   You can also enter `eventvwr` in PowerShell&reg; at the Command Prompt to open Event Viewer.
    
2. After Event Viewer opens, in the left-hand column, click **Windows Logs** > **Application**.

   **Note**: If you don't see any freeze events in the **Application** section, look in **Windows Logs > Systems**.

3. On the right-hand side, click **Filter** and then check the boxes for **Critical**, **Warning**, and **Error**.

4. Find the event associated with the freezing by searching for the time and date the issue occurred.

5. Note the `Event ID` and message text and use a search engine to find potential resolutions.

**Note**: You can use [Windows support](https://support.microsoft.com/en-us/hub/4338813/windows-help?os=windows-7) to find your specific event ID and troubleshoot it. Filter the support information for your Windows operating system version by using the **Select your product** drop-down menu in the upper right-hand corner.
