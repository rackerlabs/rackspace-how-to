---
permalink: fix-outlook-synchronization-errors/
audit_date:
title: Fix Outlook synchronization errors
type: article
created_date: '2015-06-12'
created_by: Rackspace Support
last_modified_date: '2015-08-05'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

If you recently migrated to Exchange 2010 or have been using Outlook
2010, you might see synchronization errors that appear as unread emails
and continue to increase. Microsoft is currently working to resolve this
issue, but in the interim you can use the following workaround.

### Customize the search folders

1.  In the navigation pane of your Outlook email view, expand
    the **Search Folders** folder.

2.  Right-click the **Unread Mail** folder and select **Customize This
    Search Folder**.

    <img src="{% asset_path rackspace-email/fix-outlook-synchronization-errors/1_55.png %}" width="326" height="378" />

3.  Click **Browse**.

    <img src="{% asset_path rackspace-email/fix-outlook-synchronization-errors/2_52.png %}" width="301" height="170" />

4.  Clear the **Search subfolders** check box at the bottom of the
    dialog box.

    <img src="{% asset_path rackspace-email/fix-outlook-synchronization-errors/3a.png %}" width="346" height="316" />

5.  In the Select Folder(s) window, uncheck all folders except for
    the Inbox. If there are any rules that move new emails into any
    other folder, you will want to include those also.

6.  Click **OK** and then click **OK** again to confirm.
