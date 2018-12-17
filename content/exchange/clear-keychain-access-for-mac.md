---
permalink: clear-keychain-access-for-mac/
audit_date: '2018-03-28'
title: Clear Keychain Access for Mac
type: article
created_date: '2018-02-28'
created_by: Mariana Morales
last_modified_date: '2018-03-28'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article describes how to remove previously stored passwords from your Mac's Keychain Access application to troubleshoot mailbox lockouts.


### Prerequisites

- **Applies to:** User or Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Access to device with stored credentials

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Clear old credentials

1. Click the **Spotlight** Magnifying glass in the top right corner of your screen, or press **command + space** on your keyboard.

   <img src="{% asset_path exchange/clear-keychain-access/mag_glass.png %}"/>

2. In the **Spotlight Search** search bar, type **Keychain Access**.

   <img src="{% asset_path exchange/clear-keychain-access/spotlight_search.png %}"/>

3. Select **Keychain Access** from the list of results.

   <img src="{% asset_path exchange/clear-keychain-access/keychain_access_result.png %}"/>

4. In the top right corner of **Keychain Access** enter your email address in the search bar.
5. Select the entry that you want to remove and then press the **Delete** button on your keyboard.

   <img src="{% asset_path exchange/clear-keychain-access/search_email.png %}"/>

6. A box displays asking you to confirm the deletion. If it looks correct, click **Delete**.

   <img src="{% asset_path exchange/clear-keychain-access/delete_keychain.png %}"/>


After you have completed the above process, you can reopen your desktop mail application, where you will be prompted to enter your email credentials. If you continue to be prompted for your credentials, navigate to the Cloud Office control panel to unlock the mailbox.
