---
permalink: using-event-viewer-to-troubleshoot-system-freezing/
title: 'Using Event Viewer for reports of System Freezing'
type: article
created_date: '2020-06-15'
created_by: Benji Ivey
last_modified_date:
last_modified_by:
product: Cloud Servers
product_url: cloud-servers
---

## Using Event Viewer for reports of System Freezing

This articles serves as a guide for navigating through your Event Viewer to identify system freezes.

1. Click the **Start** > **Run** and type **eventvwr**.
    - You can also open this using Powershell or in Command Prompt.
    
2. Once you are at the Event Viewer screen look in the left-hand column. Click **Windows Logs** > **Application**/**System** (Sometimes you will need to check one or both to find the issue)

3. Click **Filter** on the right hand side. Check the boxes for **Critical**, **Warning**, and **Error**.

4. Find the event associated with the freezing by searching for the time and date the issue occurred.

5. Note the Event ID and message text and use a search engine to find potential resolutions.

Note: You can use the following link to find your specific event ID and troubleshoot it. Make sure to sort by your OS in the upper right-hand corner.

https://support.microsoft.com/en-us/hub/4338813/windows-help?os=windows-7
