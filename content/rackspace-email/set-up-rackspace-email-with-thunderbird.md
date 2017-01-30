---
permalink: set-up-rackspace-email-with-thunderbird/
audit_date:
title: Set up Rackspace Email with Thunderbird
type: article
created_date: '2014-05-20'
created_by: Ian Avery
last_modified_date: '2015-03-30'
last_modified_by: Kelly Holcomb
product: Rackspace Email
product_url: rackspace-email
---

This article shows you how to set up your Rackspace Email account using
your Thunderbird email client.

1.  Open Thunderbird.
2.  In the navigation pane, click **Local Folders** and under **Create a
    new account**, click **Email**.

    <img src="{% asset_path rackspace-email/set-up-rackspace-email-with-thunderbird/thunderbird_create_acccount.png %}" width="336" height="194" />

3.  When prompted to create a new email address, click the **Skip this
    and use my existing email** button at the bottom of the dialog box.
4.  In the Mail Account Setup dialog box, enter the following
    information in the fields provided:

    -   **Your name**: Enter the name that you want to appear in the
        **From** field of messages that you send.
    -   **Email address**: Enter your entire email address (for example,
        **yourName@example.com**).
    -   **Password**: Enter the password for the email account that you
        are setting up.

    <img src="{% asset_path rackspace-email/set-up-rackspace-email-with-thunderbird/Screen%20Shot%202014-05-21%20at%208.20.05%20AM.png %}" width="468" height="424" />

5.  Click **Continue**.
6.  When Thunderbird attempts to automatically detect the server
    settings, click **Manual config**. You must enter the
    settings manually.

    <img src="{% asset_path rackspace-email/set-up-rackspace-email-with-thunderbird/Screen%20Shot%202014-05-21%20at%208.27.35%20AM.png %}" width="452" height="204" />

    The dialog box expands to show new fields.

    <img src="{% asset_path rackspace-email/set-up-rackspace-email-with-thunderbird/Screen%20Shot%202014-05-21%20at%208.35.41%20AM.png %}" width="702" height="426" />

7.  Enter the following values in the **Incoming** row:
    -   IMAP
    -   **Server hostname**: secure.emailsrvr.com
    -   **Port**: 993
    -   **SSL**: SSL/TLS (This value should autopopulate when you enter
        the port number.)
    -   **Authentication**: Autodetect

8.  Enter the following values in the **Outgoing** row:
    -   **Server hostname**: secure.emailsrvr.com
    -   **Port**: 465
    -   **SSL**: SSL/TLS (This value should autopopulate when you enter
        the port number.)
    -   **Authentication**: Autodetect

9.  Click **Re-test**.

    The **Authentication** fields should change to **Normal Password**,
    and the following message should appear in the middle of the screen:
    `The following setting were found by probing the given server`.

10. Click **Done**.

    The setup process is done. You should now see your mailbox added in
    Thunderbird and mail will start populating the Inbox.
