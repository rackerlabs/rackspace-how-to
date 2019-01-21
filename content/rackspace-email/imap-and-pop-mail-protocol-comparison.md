---
permalink: imap-and-pop-mail-protocol-comparison/
audit_date: '2019-01-15'
title: IMAP and POP mail protocol comparison
type: article
created_date: '2012-06-04'
created_by: Rackspace Support
last_modified_date: '2019-01-15'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

If you are using Rackspace Email and are setting up your email software
(for example, Microsoft&reg; Outlook or Mac&reg; Mail), you must indicate whether
you want to receive email by using an Internet Message Access Protocol (IMAP) or Post Office Protocol (POP) connection. IMAP is the recommended method because it gives you complete access to
all email and all email folders from multiple computers or mobile
devices. This article describes the differences between the IMAP and POP
mail protocols.

For Rackspace Email settings for both IMAP and POP, see [Rackspace Email
and Hosted Exchange settings](/how-to/rackspace-email-and-hosted-exchange-settings).

### IMAP

When you check your email with an IMAP connection, you are accessing and
managing your email directly from the email server. Following are
some features of IMAP:

-   **Access:** Because emails are stored on the email server, you can
    access and manage your email and email folders from multiple
    computers or mobile devices.

-   **New items:** IMAP uses fetch technology. When a new email
    arrives, your email client fetches new messages at defined
    time intervals.

-   **Storage:** If you have limited online storage space, you might
    need to delete some emails periodically to avoid exceeding your
    storage capacity.

-   **Backup:** Email is automatically backed up every evening. If you
    accidentally delete an email, your email administrator can retrieve
    it, even up to 14 days later.

-   **Internet connection:** You must have an Internet connection
    to access your email.

**Note:** By default, email clients store your sent, draft, and trash
email on your computer, rather than storing it on the email server (as
it should with an IMAP connection). You might need to map your email
folders within your email client.

### POP

When you check your email with a POP connection, new email messages are
downloaded to your computer and are then deleted from the email
server. Following are some features of POP:

-   **Access:** Because your email is stored on your computer, you must
    be at your computer to access your email.

-   **New items:** POP uses fetch technology. When a new email
    arrives, your email client fetches new messages at defined
    time intervals.

-   **Storage:** You don't need to worry about running out of online
    storage space. Because emails are downloaded to your computer, you
    can keep as many emails as your computer can store.

-   **Backup:** In case you need to retrieve lost or deleted emails, you should implement an effective backup system for your
    computer.

-   **Internet connection:** You must have an Internet connection to
    download your email, but you can view your downloaded email offline
    (that is, without an Internet connection).

**Warning:** Because a POP connection deletes email from the email server, no backup of email exists on the email server.

### Mobile Sync

When you check your email by using Mobile Sync, you are accessing and
managing your email directly from the email server. Following are some features of Mobile Sync:

**Note**: This service is only available to Rackspace Email Plus users. See [Getting started with Rackspace Email Plus](/how-to/rackspace-email-plus-getting-started) for details.

-   **Access**: Because emails are stored on the email server, you can
    access and manage your email and email folders from multiple
    computers or mobile devices.

-   **New Items:** Mobile Sync uses push technology. When a new
    email arrives, the email is pushed to your device instantly.

-   **Storage**: If you have limited online storage space, you might
    need to delete some emails periodically to avoid exceeding your
    storage capacity.

-   **Backup**: Email is automatically backed up every evening. If you
    accidentally delete an email, your email administrator can retrieve
    it, even up to 14 days later.

-   **Internet connection**: You must have an Internet connection to
    access your email.
