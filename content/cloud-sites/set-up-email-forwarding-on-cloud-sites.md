---
permalink: set-up-email-forwarding-on-cloud-sites/
audit_date:
title: Set up email forwarding on Cloud Sites
type: article
created_date: '2011-03-10'
created_by: Rackspace Support
last_modified_date: '2015-05-06'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

**Note:** Email is no longer offered as a feature for Cloud Sites. This
article exists to support customers with legacy email accounts.

This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

Email forwarding enables you to automatically send all of the emails
received at a configured email account to one or more email addresses.

You may set up a total of 15 email forwards. Of the 15 forwarding
addresses, a maximum of 4 of them can be on an external domain (a domain
other than that on which the email is configured). These entries must be
separated by commas.

### To set up an email forward for one of your email accounts

1.  Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com/).
2.  In the left navigation pane, click **Hosting > Cloud Sites**.
3.  Select the Cloud Site domain name that contains the email account to
    which you want to add the email forwards.
4.  Click the **Email accounts** tab.
5.  Select the email account from the list.
6.  At the bottom of the page, enter the email address you want to
    forward to in the **Forwarding Address** field (multiple entries
    *must* be separated by commas).
7.  Click **Save**.

    It might take up to 15 minutes for the changes to the mail account
    to become effective.

**Note:** When the email forward has taken effect, email will no longer
arrive at this mailbox. It will be immediately sent to the forward
addresses.

### To have the mail server retain a copy of the message

1.  Log in to webmail
    ([http://webmail.emailsrvr.com](http://webmail.emailsrvr.com/ "http://webmail.emailsrvr.com"))
    for the email address that has the forwarding addresses applied
    to it.
2.  Click the **Settings** link in the top-right corner.
3.  On the left menu, click the **Incoming Email** link.
4.  Under the **Forwarding** tab, check the **Save a copy of forwarded
    email** check box.
5.  Click **Save**.

    Again, allow up to 15 minutes for these changes to take effect.
