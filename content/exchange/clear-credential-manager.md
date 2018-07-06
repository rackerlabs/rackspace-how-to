---
permalink: clear-credential-manager/
audit_date:
title: Clear Credential Manager
type: article
created_date: '2017-12-18'
created_by: William Loy
last_modified_date: '2018-07-06'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article describes how to remove previously stored passwords from your Outlook application so that you can update Outlook with your new password.


### Prerequisites

- **Applies to:** User or Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Access to device with stored credentials

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Clear old credentials

1.  Make sure that Outlook is closed.

2.  Click the Start Menu (or press the Windows key), and then search for **Credential Manager**.

    - **Windows 10:**

       <img src="{% asset_path exchange/clear-credential-manager/win10_start_menu.png %}"/>

    - **Windows 7 (or earlier):**

       <img src="{% asset_path exchange/clear-credential-manager/win7_start_menu.png %}"/>

3.  Click on <b>Credential Manager</b> to open it, and then click <b>Windows Credentials</b>.

    - Under the **Generic Credentials** heading, find the credentials that have Outlook(15/16) and your email address.

    - For example: ```MicrosoftOutlook15:example@yourdomainexample.com```
      It may not be exactly as shown, but use it as a base guideline.

4.  Click the arrow next to the entry to display it.

       <img src="{% asset_path exchange/clear-credential-manager/CredentialManager.png %}"/>

5.  On the detail page of the credential entry, click **remove** to remove the credential from the manager.

       <img src="{% asset_path exchange/clear-credential-manager/CredentialManagerDetail.png %}"/>

6.  Repeat this process for all credentials matching Outlook(15/16) and your email address. There may be anywhere from one to three entries listed.

7.  Close all windows, and re-open Outlook. When Outlook prompts for your credentials, enter the full email address and password for the mailbox, and check the box **Remember My Credentials**.

8.  If this process is successful, your Inbox should display, and mail should start syncing.

**Note:** If this process fails, make sure you can log in to [apps.rackspace.com](https://apps.rackspace.com/index.php) to verify that you are using the correct password.
