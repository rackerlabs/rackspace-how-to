---
permalink: set-up-mobile-sync-for-webmail-on-ios-devices/
audit_date:
title: Set up Mobile Sync for Webmail on iOS devices
type: article
created_date: '2012-04-27'
created_by: Rackspace Support
last_modified_date: '2016-05-18'
last_modified_by: Kyle Laffoon
---

This article provides instructions for setting up Mobile Sync for
Rackspace Webmail on your iPhone, iPad, or iPod. Mobile Sync
synchronizes your email, contacts, and calendar events in real time.

### Prerequisites

-   This service works only if your administrator has assigned you a
    Mobile Sync license in the Cloud Office Control Panel. To set up
    email on an iOS device for a Rackspace Email account without a
    Mobile Sync license, visit our [Help
    Tool](https://emailhelp.rackspace.com/).

-   Your device must be running iOS 4.0 or newer. If you have an
    iPhone, it must be an iPhone 3GS or newer.

### Set up Mobile Sync

The screenshots in our examples are from an iPhone 3GS running iOS 4.0.
 If you have a newer device, the instructions and display might
differ from the examples.

1.  On the **Home** screen of your device, tap the **Settings** icon.

2.  In **Settings**, tap **Mail, Contacts, Calendars** &gt; **Add
    Account** &gt; **Microsoft Exchange**.

3.  On the Exchange setup screen, enter the following information:

    -   **Email**: Enter your entire email address (for example,
        myname@mydomain.com), using all lowercase letters.
    -   **Domain**: Leave this field blank.
    -   **Username**: Enter your entire email address again.
    -   **Password**: Enter the password for your email account.
    -   **Description**: Enter a descriptive name for your account (for
        example, My Work Account). This description will be visible only
        to you.

    <!--><img src="{% asset_path rackspace-email/set-up-mobile-sync-for-webmail-on-ios-devices/1.png %}" width="213" /><!-->

    **Note:** The device will attempt to verify the account. You
    might receive an `Unable to Verify Certificate` message. If you
    do, tap the **Accept** button.

4.  Tap the **Server** field, and enter **mobilesync.emailsrvr.com** in
    the **Server address** field.

    If verification succeeds, check marks
    are displayed next to every field. If any field indicates a problem,
    double-check that setting's value.

    <!--><img src="{% asset_path rackspace-email/set-up-mobile-sync-for-webmail-on-ios-devices/2.png %}" width="213" />
    <img src="{% asset_path rackspace-email/set-up-mobile-sync-for-webmail-on-ios-devices/3.png %}" width="213" /><!-->

5.  Slide the **ON/OFF** buttons to select which information to
    synchronize, and then tap **Save**.

    <!--><img src="{% asset_path rackspace-email/set-up-mobile-sync-for-webmail-on-ios-devices/4.png %}" width="213" /><!-->

    Depending on how much data is on the server, your iPhone might take
    a few minutes to synchronize all of your information.
