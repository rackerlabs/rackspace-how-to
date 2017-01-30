---
permalink: spam-settings-for-rackspace-email/
audit_date:
title: Spam Settings for Rackspace Email
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This documentation refers to a feature that is no longer
available for Cloud Sites. This article is here for the purpose of
legacy support only.

If our spam filtering software suspects that an incoming
message is spam, it will be sent to the Spam folder. However, in some
cases spam messages may be delivered to your Inbox or some messages you
want to receive may be delivered to the Spam folder. You can customize
your spam filtering settings and level of filtering within
webmail.

To verify if spam filtering is enabled, please see [Is spam filtering enabled on my email accounts?](/how-to/manage-spam-filtering-for-your-cloud-sites-email-accounts)

### The Catch All Account

If you're account is configured to be the "catch all", then
spam will not be filtered and you will still see messages coming in as
[SPAM] even though you may have it set to do otherwise.

### Blacklisting Users/Domains

Email sent to you from domains, email addresses, and IPs on
your blacklist will be blocked and will not be delivered to your
mailbox. To manage your blacklist, do the following:

1.  Click the **Settings** link, located in the upper right
    corner of the webmail window.
2.  In the left pane, click **Spam Settings**.
3.  Click the **Blacklist** tab.

**To add a domain or email address to the list:**

1.  Click the **Add** button.
2.  Enter a domain or email address in the space provided.
    Note: We recommend that you not blacklist domains from large email
    systems, such as hotmail.com or yahoo.com, as this could prevent you
    from receiving legitimate email. Also, you can use a "%" as a
    wildcard in the domain or email address (For
    example: @%.ru).
3.  Click the **Add** button.

    **Note:** Domains and email addresses that are blacklisted
    will appear in the **Blacklisted Domains & Email
    Addresses** box.

**To add an IP to the list:**

1.  Click **Add**.
2.  Enter an IP or IP range in the space provided. Note: You
    can use a "%" as a wildcard in the last three octets to specify
    IP ranges. For example: 216.12.34.%, 216.12.%.%, and 216.%.%.% are
    all valid ranges.
3.  Click **Add**.
4.  Click **Save**.

    **Note:** IP addresses that are blacklisted will appear in
    the **Blacklisted IP Addresses** box.

### Removing Users/Domains From the Blacklist

Email sent to you from domains, email addresses, and IPs on
your blacklist will be blocked and will not be delivered to your
mailbox. To manage your blacklist, do the following:

Click **Settings**, located in the upper right
corner of the webmail window.

1.  In the left pane, click **Spam Settings**,
    then click the **Blacklist** tab.
2.  Click the corresponding **Delete** button.
3.  Click **Yes** to confirm you want to delete the items.
4.  Click **Save**.

### Adding users/domains to your Safelist

Email that you receive from domains, email addresses, and
IPs on your safelist will bypass the spam filters, ensuring you receive
email from those senders. To add a domain, email address, or IP to your
safelist, do the following:

1.  Click **Settings**, located in the upper right
    corner of the webmail window.
2.  In the left pane, click **Spam Settings**.
3.  Click the **Safelist** tab.

To add a domain or email address to the list:

1.  Click the **Add** button.
2.  Enter a domain or email address in the space provided.

    **Note**: We recommend that you not safelist domains from large
    email systems, such as hotmail.com or yahoo.com, as this could
    result in spam arriving in your Inbox. Also, you can use a "%" as a
    wildcard in the domain or email address (For
    example: @%.ru).
3.  Click the **Add** button.

**Note:** Domains and email addresses that are safelisted
will appear in the **Safelisted Domains & Email
Addresses** box.

To add an IP to the list:

1.  Click the **Add** button.
2.  Enter an IP or IP range in the space provided. **Note:**
    You can use a "%" as a wildcard in the last three octets to specify
    IP ranges. For example: 216.12.34.%, 216.12.%.%, and 216.%.%.% are
    all valid ranges.
3.  Click the **Add** button.
4.  Click the **Save** button.

**Note:** IP addresses that are safelisted will appear in
the **Safelisted IP Addresses** box.

### Report Spam

To report unfiltered spam, in any folder other than the
Spam folder, do one of the following:

1.  Select or open the email.
2.  Click **Report Spam**.
    *Optionally*, you can also right-click the email and select **Report Spam**.

To report several emails, select the check box next to
each email you want to report, then:

1.  Click the **Select Action** drop-down menu
2.  Select **Report Spam**

**Note**: When you report spam, a copy of the email will be
sent to Cloudmark, our spam filtering provider, and the email will be
moved to your "Spam" folder.

**Report a message as not spam:**

To report a legitimate email that has been filtered into the
"Spam" folder, open your "Spam" folder and do one of the
following:

1.  Select or open the email
2.  Click the **Not Spam** link, or right-click the email
    and select **Not Spam**.

To report several emails, select the check box next to each
email you want to report, then:

1.  Click the **Select Action** drop-down menu.
2.  Select **Not Spam**.

**Note**: When you mark an email as "Not Spam," the email
will be moved into your "Inbox" folder, and the sender will be added to
your Safelist.

**Edit Spam Settings per Email user:**

Spam filtering tools work to detect and filter out spam. The
changes you make to your spam filtering preferences will be in effect
regardless of your email software; even if you use Outlook, Netscape
Mail, Eudora, etc., your spam will be filtered, according to your
preferences, before the email reaches your inbox.

1. Click **Settings**, located in the upper right corner of the webmail window.
2. Click **Spam Settings**, located in the left pane.

In the **Spam Filtering** section, you can turn spam
filtering on or off. Or, you can turn on the **Exclusive** setting,
which will allow you to receive incoming email only from addresses or
IPs on your safelist. For more information about safelists, please see
the specific topics related to safelists.

If you turned spam filtering on, you will need to specify
how you want spam to be handled. In the **Spam Handling** section,
select from the following:

1.  Deliver to the Spam folder - Spam email will be delivered
    to your Spam folder. To specify Spam folder cleanup options, click
    the **Cleanup Options** link:

  -   **Delete after \[    \] days or \[    \] total
    emails** - Indicate whether email messages in the Spam folder should
    be deleted after a certain number of days or a certain number of
    email messages, whichever occurs first.
  -   **Never automatically delete spam** - Select this if you
    want your spam messages delivered to the Spam folder, but you do not
    want spam messages automatically deleted.

2.  Delete the email immediately - Spam email will be
    deleted automatically.
3.  Deliver to the email address - Spam email will be
    forwarded to the email address you indicate.
4.  Include [SPAM] at the beginning of the subject
    line - Spam email will be delivered to your Inbox, but will include
    the text "[SPAM]" in the Subject line.
5.  Click the **Save** button
