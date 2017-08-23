---
permalink: renamed-email-address-configuration-for-outlook-2016-on-mac/
audit_date: '2017-08-22'
title: Renamed email address configuration for Outlook 2016 on Mac
type: article
created_date: '2017-08-22'
created_by: William Loy
last_modified_date: '2017-08-22'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Instructions for setting up a renamed email address in Outlook 2016 for Mac.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 20 minutes
- **Tools required:**  Mailbox password and access to the devices you want to connect

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

Once you have renamed a Rackspace Email address, your devices such as desktop computers, laptops, and mobile phones will not receive new email until you configure them to connect to the new email address.

Warning: If the old email address connects via POP, you will want to migrate the POP data to an IMAP account so no data is lost in the rename configuration. Follow the instructions in [Migrate from a POP server to IMAP in Outlook for Mac](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/).

#### Outlook 2016 for Mac

1. Quit **Outlook 2016** by right-clicking the icon and selecting *Quit*.
2. Open **Finder** and select **Applications**.
3. Highlight **Outlook 2016** in the application menu, and right-click the icon.
4. Click **Show Package Contents** .

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-outlook-2016-on-mac/show-pack-contents.png %}" />

5. Click the **Contents** folder, then click the **SharedSupport** folder.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-outlook-2016-on-mac/shared-support.png %}" />

6. Open **Outlook Profile Manager**. You will be taken to a list of existing profiles. Click the **+** sign and name the new profile.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-outlook-2016-on-mac/profile-manager.png %}" />

7. Close **Outlook Profile Manager** and open **Outlook 2016**. You will be prompted to set up your email in the new profile.
8. Enter the renamed email address and click **Continue**.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-outlook-2016-on-mac/OL16mac-setup-SC2.png %}" />

    Note: Outlook 2016 might default to selecting Exchange as the account type. Select **Not Exchange?** in the upper right-hand corner if this happens.

9. Select **IMAP/POP** and enter the following details:

    - **Type:** IMAP
    - **Email address:** renamedaddress@yourdomainexample.com (*Use the new mailbox address here*)
    - **Username:** renamedaddress@yourdomainexample.com (*Use the new mailbox address here*)
    - **Password:** Your mailbox password
        - *Incoming Server Settings:*
            - **Incoming Server:** secure.emailsrvr.com
            - **Port:** 993
            - **Use SSL to connect:** Checked
        - *Outgoing Server Settings:*
            - **Outgoing Server:** secure.emailsrvr.com
            - **Port:** 465
            - **Use SSL to connect:** Checked

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-outlook-2016-on-mac/OL16mac-setup-SC1.png %}" />

10. Click **Add Account** and click **Done**.

You have now successfully configured Outlook 2016 to connect to the renamed email address.

Warning: If you notice items missing in the new Outlook account, you will need to import the data from the old profile. See [Migrate from a POP server to Rackspace Email IMAP](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/).
