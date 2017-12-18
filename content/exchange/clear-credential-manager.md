---
permalink: clear-credential-manager/
audit_date: '2017-12-18'
title: Clear Credential Manager
type: article
created_date: '2017-12-18'
created_by: William Loy
last_modified_date: '2017-12-18'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article describes how to forward a Microsoft Exchange mailbox to forward to another email address.


### Prerequisites

- **Applies to:** User or Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Access to device with stored credentials

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

1. Make sure Outlook is closed down completely

2. Click on the Start Menu (or press the Windows key) and then search for **Control Panel**

**Windows 10:**


  <img src="{% asset_path exchange/clear-credential-manager/win10_start_menu.png %}"/>

**Windows 7 (or earlier):**


  <img src="{% asset_path exchange/clear-credential-manager/win7_start_menu.png %}"/>



3. Double-click on **Credential Manager**</li>

4. Click on **Windows Credentials** once the window opens.

  - Under the **Generic Credentials** heading, find the credentials that have Outlook(15/16) and your email address

  - For example (it may not be exactly as shown, but use as a base guideline): **MicrosoftOutlook15:example@yourdomainexample.com**

5. Click on the arrow next to the entry to display it


   <img src="{% asset_path exchange/clear-credential-manager/CredentialManager.png %}"/>

6. On the detail page of the credential entry, hit remove to remove it from the manager

    <img src="{% asset_path exchange/clear-credential-manager/CredentialManagerDetail.png %}"/>

7. Repeat for all credentials matching Outlook(15/16) and your email address (should not be more than one to three entries)

8. Once you're done. Close all windows and re-open Outlook. It will prompt you for your password, as it no longer has it stored

9. If successful, you should be taken to your Inbox and mail should start syncing.

Also, make sure you can log in to [apps.rackspace.com](https://apps.rackspace.com/index.php).
