---
permalink: nested-imap-folders-in-apple-mail/
audit_date:
title: Nested IMAP folders in Apple Mail
type: article
created_date: '2013-12-05'
created_by: Milton Prado
last_modified_date: '2014-12-30'
last_modified_by: Jered Heeschen
product: Rackspace Email
product_url: rackspace-email
---

This article provides information about a known issue with Apple Mail
and IMAP configurations, referred to as *nested folders*. When nested
folders occur, users see multiple child subfolders labeled INBOX
underneath the main Inbox folder (as shown in the following figure). This issue is related to the
functionality of Apple Mail and the IMAP protocol. Nested folders with
Apple Mail are not specific to the Rackspace Email environment.

<img src="{% asset_path rackspace-email/nested-imap-folders-in-apple-mail/Nested%20copy.jpg %}" width="296" height="316" />

The information in this article might help you in resolving the issue
with nested folders. If you are unable to correct the issue, we
recommend contacting the vendor for full support with Apple Mail.

###  Change the IMAP prefix

Apple Mail enables users to isolate a folder that is used to sort mail
data on the email server through what is known as an IMAP path prefix.
By adjusting this prefix, some users have been able to resolve the
issue.

You can change the IMAP prefix in the advanced settings of the IMAP
mailbox, as follows:

1. Select **Mail > Preferences > Accounts**.
2. Select the IMAP account.
3. Click the **Advanced** tab.
4. Try one or both of the following possible fixes:

    - Change the case of the prefix. For example, change INBOX to Inbox.
    - Add a slash (/) at the end of the prefix - for example, INBOX/ or Inbox/. A slash helps Apple Mail recognize that the path ends in a folder.

<img src="{% asset_path rackspace-email/nested-imap-folders-in-apple-mail/2_1.jpg %}" width="542" height="560" />

###  Change mailbox behavior

Another suggestion is to adjust mailbox behavior. In the following
example, the **Trash** folder is causing an issue. Try enabling and
disabling the **Move deleted messages to the Trash mailbox** option and
the **Store deleted messages on the server** option.

<img src="{% asset_path rackspace-email/nested-imap-folders-in-apple-mail/3_2.jpg %}" width="547" height="562" />

### Reset Apple Mail preferences

You can also try resetting Apple Mail preferences. The IMAP prefix
settings are located in the account settings file for Apple Mail.
Sometimes a corruption of this file can cause these issues. Try
removing this file. Note that removing this file might result in you
having to enter your account credentials again, however, your IMAP
configuration and all mail will stay in Apple Mail.

You can find the file in the following
directory: ***userName***/**Library**/**Containers**/**com.apple.mail**/**Data**/**Library**/**Preferences**

<img src="{% asset_path rackspace-email/nested-imap-folders-in-apple-mail/4_39.png %}" width="335" height="164" />

By default, the **Library** folder (under your username folder)
is hidden. To access it, perform the following steps:

1. Open a new Finder window.

2. Click **Go** from the menu bar.

3. Hold down the **Alt/Option** key on your keyboard.

4. Click **Library** from the list of folders.

You can now navigate to the path where your **com.apple.mail.plist** file is
located.

<img src="{% asset_path rackspace-email/nested-imap-folders-in-apple-mail/Library.jpg %}" width="511" height="321" />
