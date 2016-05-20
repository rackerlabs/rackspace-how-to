---
permalink: spam-preferences-safe-lists-and-black-list-in-rackspace-email/
audit_date:
title: 'Spam preferences, safelists, and blacklists in Rackspace Email'
type: article
created_date: '2012-05-25'
created_by: Rackspace Support
last_modified_date: '2014-07-14'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

Rackspace gives you the flexibility to set your own spam preferences. This includes editing and managing domain-wide spam settings, safelists, and blacklists, and the ability to
override the spam filtering for the entire domain. This article describes how to manage accomplish these tasks in the [Cloud Office Control Panel](https://cp.rackspace.com).

### Manage domain spam settings

To manage your domain-level spam settings, go to the **Domains** section of the control panel and select **Filter Settings**, **Blacklists**, or **Safelists**.

<img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/DomainsSpam_1.JPG %}" width="537" height="133" />

**Note:** If you have multiple domains, you might be prompted to select the domain you intend to make changes to.

### Manage individual user spam settings

1. To manage individual user's spam settings, go to the **Rackspace Email** section of the control panel and select **Filter Settings**, **Blacklists**, or **Safelists**.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/RSSpam.JPG %}" width="527" height="148" />

2. Select the user for which you want to update spam settings.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/RSEUsers_0.JPG %}" width="658" height="241" />

### Set spam filtering options

1. For individual mailboxes, click **Filter Settings** in the **Rackspace Email** section. For the domain, click **Filter Settings** in the **Domains** section.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/DomainsSpam_0.JPG %}" width="527" height="110" />

2. In the Status section, turn the spam filtering on or off. You can also select **Exclusive** to receive email *only* from senders on your domain's safelist.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/Afterdomain1_1.JPG %}" width="499" height="398" />

3. Select the preferred settings for Rackspace Email in your domain. Following is a description of each option:

    -   **Deliver to Spam folder** - Spam messages are sent to the user's Spam folder. To automatically delete messages from this folder, select the **Delete after *n* days or *n* total email** check box and enter a specified number of days, total emails, or both.

    -   **Delete the email immediately** - Spam email will be deleted automatically and not delivered to the user's mailbox.

    -   **Include "\[SPAM\]" at the beginning of the subject line** - Spam email will be delivered to the user's Inbox, but will include the text **"\[SPAM\]"** in the subject line.

    -   **Deliver to the email address** - Spam messages are sent to an email address of your choice that resides on your domain.

4. In the **Override Options** section, indicate whether to apply these settings to users who have not already set their spam preferences, or whether these settings should override spam preferences for all users.

    **Note:** The override options are not presented if you chose to set options for an individual Rackspace Email mailbox.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/SpamFiltering%20Override.png %}" width="403" height="153" />

5. Click **Save**.

### Manage safelists

Safelists allow you to add a sender's email address, domains, or IP address to deliver directly to the mailbox. This is useful when a sender is flagged as spam but you don't want the sender's email to be delivered to the Spam/Junk Folder.

1. For individual mailboxes, click **Safelists** in the **Rackspace Email** section. For the domain, click **Safelists** in the **Domains** section.

     <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/CPFiltersettingsSL_0.jpg %}" width="519" height="106" />

2. To add a domain name or email address to the safelist, enter the domain or email address in the box, and then click **Add**.
3. To remove a domain or email address, select the name in the list and then click **Remove**. To remove all domain names or email addresses listed in the window, click **Clear**.

   **Note:** If you have multiple domain names or email addresses to add, use the bulk import option to upload a **.csv** or **.txt** file containing the information.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/SpamFiltering%20SL%20Domains%20and%20Email.png %}" width="335" height="385" />

4.  To add an IP address to the safelist, enter the IP address (or range) in the box and then click **Add**.
5.  To remove an IP address, select the address in the list and then click **Remove**. To remove all IP addresses listed in the window, click **Clear**.

    **Note:** If you have multiple IP addresses to add, use the bulk import option to upload a **.csv** or **.txt** file containing the information.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/SpamFiltering%20SL%20IP.png %}" width="327" height="377" />

6.  Click **Save**.

### Manage blacklists

Blacklists allow you block a sender's email address, domain, or IP address from delivering to your mailbox. Objects that are blacklisted are not delivered to the mailbox.

1. For individual mailboxes, click **Backlists** in the **Rackspace Email** section. For the domain, click **Blacklists** in the **Domains** section.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/CPFiltersettingsBL_0.jpg %}" width="519" height="106" />

2.  To add a domain name or email address to the blacklist, enter the domain or email address in the box, and then click **Add**.
3.  To remove a domain or email address, select the name in the list and then click **Remove**. To remove all domain names or email addresses listed in the window, click **Clear**.

    **Note:** If you have multiple domain names or email addresses to add, use the bulk import option to upload a **.csv** or **.txt** file containing the information.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/SpamFiltering%20BL%20Domains%20and%20Email.png %}" width="331" height="389" />

4. To add an IP address to the blacklist, enter the IP address (or range) in the box and then click **Add**.
5. To remove an IP address, select the address in the list and then click **Remove**. To remove all IP addresses listed in the window, click **Clear**.

    **Note:** If you have multiple IP addresses to add, use the bulk import option to upload a **.csv** or **.txt** file containing the information.

    <img src="{% asset_path rackspace-email/spam-preferences-safe-lists-and-black-list-in-rackspace-email/SpamFiltering%20BL%20IP.png %}" width="346" height="374" />

6.  Click **Save**.
