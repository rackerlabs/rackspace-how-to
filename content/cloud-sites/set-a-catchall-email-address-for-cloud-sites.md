---
permalink: set-a-catchall-email-address-for-cloud-sites/
audit_date:
title: Set a catchall email address for Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Notes:** This article refers to a feature that is no longer available
for Cloud Sites. It is provided for legacy support only.

A catchall address is a designated mailbox to which email sent to a
non-existent email address on your domain is delivered. For example,
assume that you have the following mailboxes set up on your account:

-   **john@yourdomain.com**
-   **bill@yourdomain.com**
-   **catchall@yourdomain.com** (the catchall address)

Any email sent to **john@yourdomain.com** is delivered to that corresponding
mailbox. The same is true for email sent to **bill@yourdomain.com**.
However, what happens to email sent to **frank@yourdomain.com**, which does
not have a corresponding mailbox set up in the system?

Normally the email would be rejected with a `user unknown` message and
returned to the sender. However, if you have a catchall address set up,
like **catchall@yourdomain.com**, the email is delivered to the catchall
mailbox. This is true for email sent to any other addresses that have
not been set up as mailboxes on the system.

### To set up a catchall email account for a particular domain

1.  Log in to the [Cloud Sites Control Panel.](https://manage.rackspacecloud.com)
2.  In the left navigation pane, select **Hosting > Cloud Sites**.
3.  Select the domain for which you want to add a catchall account.
4.  Click the **Email Accounts** tab.
5.  Add the email account that you want to use for the catchall address
    (for example, **catchall@yourdomain.com**).
6.  Under **Mail Preferences** at the bottom of the page, select **Send
    them to this account (catchall)** and select the account that you
    want to use from the menu.
