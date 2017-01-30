---
permalink: manage-spam-settings/
audit_date:
title: Manage spam settings
type: article
created_date: '2016-11-30'
created_by: Thomas Hester
last_modified_date: '2016-11-30'
last_modified_by: Laura Santamaria
product: Cloud Sites
product_url: cloud-sites
---

Using your [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com), you can manage spam settings at the domain or mailbox level. You can save your desired configuration for all users on your domain and if desired, override existing settings your users may have within their webmail interface.

### Modify individual mailbox spam settings

1. Log in to your [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com).

1. Click the **Email Hosting** section.

1. In the **Spam Filtering** section, click **Filter Settings**.

    <img src="{% asset_path cloud-sites/manage-spam-settings/managingspam1.png %}" alt="Filter Settings link in the Spam Filtering section of the Email Hosting Home tab in the Cloud Sites Email Control Panel" />

### Modify domain-level spam settings

1. Log in to your [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com).

1. Click the **Domains** section.

1. In the **Spam Filtering** section, click **Filter Settings**.

    <img src="{% asset_path cloud-sites/manage-spam-settings/managingspam2.png %}" alt= "Filter Settings link in the Spam Filtering section of the Domains Home tab in the Cloud Sites Email Control Panel" />

1. Select the mailbox or domain you wish to modify.

1. In the **Status** section, turn spam filtering **ON**, **OFF**, or **EXCLUSIVE**.

    The **EXCLUSIVE** option will only allow mailboxes to receive email from addresses and IPs on your safelist.

    **Important:** When using the **EXCLUSIVE** setting, any message sent from a user not on the safelist will be rejected and returned to sender.

1. If you turned spam filtering on, indicate how messages should be handled for Rackspace Email by selecting one of the following options:

      - **Deliver to Spam folder** - Spam messages are sent to the user's **Spam** folder. If you want to automatically delete messages from this folder, select the **Delete after _n_ days or _n_ total emails** check box and enter a specified number of days or total emails.

          **Note:** The default if selected is 7 days and 250 emails.

      - **Delete the email immediately** - Spam email will be deleted automatically and not delivered to the user's mailbox. Email will be permanently deleted and will _not_ be retrievable.

      - **Include _\[SPAM\]_ at the beginning of the subject line** - Spam email will be delivered to the user's inbox but will include the text _\[SPAM\]_ in the subject line.

      - **Deliver to the email address** - Spam messages are sent to an address in your domain that you specify.

    <img src="{% asset_path cloud-sites/manage-spam-settings/managingspam3.png %}" alt="Spam Filtering Settings page for a domain" />

1. _(Optional)_ If managing at the domain level, select the desired **Override Options**:

      - Set preferences **only** for users who have not set their own.

      - Override preferences for **all** users regardless of their own preferences.

    <img src="{% asset_path cloud-sites/manage-spam-settings/managingspam4.png %}" alt="Override Options list" />

1.  Click **Save**.

    <img src="{% asset_path cloud-sites/manage-spam-settings/managingspam5.png %}" alt="Spam Filtering Settings page for a domain" />
