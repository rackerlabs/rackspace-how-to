---
permalink: configure-a-renamed-email-address-on-outlook-2011-for-mac/
audit_date: '2017-09-14'
title: Configure a renamed email address on Outlook 2011 for Mac
type: article
created_date: '2017-08-23'
created_by: William Loy
last_modified_date: '2017-09-14'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

After you rename a Rackspace Email address, your devices will receive new mail only after you configure them to connect to the new email address. This article describes how to configure a renamed email address in Outlook 2011 for Mac.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 20 minutes
- **Tools required:**  Mailbox password and access to the devices you want to connect

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

**Warning:** If the old email address connects via POP, you must migrate the POP data to an IMAP account so that no data is lost. Follow the instructions in [Migrate from a POP server to IMAP in Outlook for Mac](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/).

### Configure mail settings

1. Quit Outlook 2011 by right-clicking the icon and selecting **Quit**.

2. Open Outlook 2011 while pressing the **Option** key.

   The Microsoft Database Utility opens.

3. Create a new identity by clicking the **+** sign and then naming the identity.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-outlook-2011-for-mac/microsoft-database-utility.png %}" />

4. Set the new identity as the default by highlighting it, clicking the gear icon, and then selecting **Set as Default**.

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-outlook-2011-for-mac/microsoft-database-utility-default.png %}" />

5. Close the Microsoft Database Utility and open Outlook 2011.

6. In the upper-left corner of the menu bar, click **Outlook > Preferences**.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-outlook-2011-for-mac/Outlook_Dropdown.png %}" />

7. On the Preferences screen, under **Personal Settings**, click **Accounts**.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-outlook-2011-for-mac/OL2011-accounts.png %}" />

8. On the Accounts screen, click **Other Email** and enter the following information:

   - **Email Address:** Your renamed Rackspace Email address
   - **Password:** Your mailbox password.
   - **User name:** Your renamed Rackspace Email address
   - **Type:** IMAP

   - Incoming server settings:
      - **Incoming Server:** secure.emailsrvr.com
      - **Override default port:** Selected
      - **Use SSL to connect (recommended):** Selected
      - **Incoming Server Port:** 993

   - Outgoing server settings:
      - **Outgoing Server:** secure.emailsrvr.com
      - **Override default port:** Selected
      - **Use SSL to connect (recommended):** Selected
      - **Outgoing Server Port:** 465

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-outlook-2011-for-mac/server-settings.png %}" />

9. Click **Add Account**.

10. Click **More Options** and enter the following information:

    - **Authentication:** Use Incoming Server information
    - **Unqualified domain:** Leave this field blank

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-outlook-2011-for-mac/more-options.png %}" />

11. Click **OK**.

12. Close the accounts window and click **Send/Receive** in Outlook.

You have now successfully configured Outlook 2011 to connect to the renamed email address.

**Note:** If you see items missing in the new Outlook account, you must import the data from the old profile. See [Migrate from a POP server to Rackspace Email IMAP](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/).
