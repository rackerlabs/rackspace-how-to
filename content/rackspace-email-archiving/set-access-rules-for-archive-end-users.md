---
permalink: set-access-rules-for-archive-users/
audit_date:
title: Set access rules for archive users
type: article
created_date: '2015-07-27'
created_by: Beau Bailey
last_modified_date: '2018-03-13'
last_modified_by: William Loy
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---


### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

Use this procedure to limit who can access the email archive by
verifying registered addresses.

1.  Log in to the [Archive
    Manager](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f).
    For more information, see [Log in to the Archive
    Manager](/how-to/log-in-to-the-archive-manager).

2.  In the upper-right corner of the window, click **Admin User** to
    access the Admin User dashboard.

    **Note:** There are three dashboards for top-level
    administrators:  **Search**, **Admin**, and **Admin User**.

3.  Select the tab, **End User Access Rules.**

    <img src="{% asset_path rackspace-email-archiving/set-access-rules-for-archive-users/Screen%20Shot%202015-08-27%20at%2011.34.43%20AM.png %}" width="551" height="207" />

4.  Specify which domains are allowed to access the archive and which
    domains are denied access:

    -   **Allow List** - Specify the email domains that can access
        the archive. For example,  if you want to allow access only to
        users with your company domain, **@acme.com**, type
        **\*@acme.com** under **Allow rules**. Only users with this
        domain can access the archive in future logins.

        To add more domains to this list, move down to the next row and
        continue to follow this process until you have added all the
        appropriate domains to the allow list.

        **Note:**  If you are updating only the allow list, skip to the 4th step. Otherwise, proceed to the following **Deny List** option to
        deny specific email domains.

    -   **Deny List** - You might prefer that your users not register into
        their login with certain domain names. For example, consumer
        domains such as **@hotmail.com** and **@yahoo.com** tend to be
        unpopular with IT administrators. To create a deny list for
        these domains, for example, type **\*@hotmail.com**, and add
        **\*@yahoo.com** to the next row.

5.  Click **Update**.
