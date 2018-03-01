---
permalink: clear-keychain-access-for-mac/
audit_date:
title: Clear Keychain Access for Mac
type: article
created_date: '2018-02-28'
created_by: Mariana Morales
last_modified_date: '2018-02-28'
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

1. Look for the **Spotlight** Magnifying glass on the top right hand side of your screen **OR** click the **command + space** keys on your keyboard.

   <img src="{% asset_path exchange/clear-keychain-access/mag_glass.png %}"/>

2. **Spotlight Search** will open. Type **Keychain Access** in the search bar.

   <img src="{% asset_path exchange/clear-keychain-access/spotlight_search.png %}"/>

3. Select **Keychain Access** from the list of results.

   <img src="{% asset_path exchange/clear-keychain-access/keychain_access_result.png %}"/>

4. Enter your email address in the search bar located in the upper right hand corner of **Keychain Access**.
5. Click on the entry that you wish to remove and press the **Delete** button on your keyboard.

   <img src="{% asset_path exchange/clear-keychain-access/search_email.png %}"/>

6. A box will appear asking you to confirm the deletion. If it looks correct click **Delete**.

   <img src="{% asset_path exchange/clear-keychain-access/delete_keychain.png %}"/>



Once you have completed the above process you can reopen your desktop mail application at which point you will be prompted to enter your email credentials. If you continue to be prompted for your credentials, navigate to the Cloud Office control panel to unlock the mailbox.
