---
permalink: set-global-access-rights-with-the-cloud-office-control-panel/
audit_date:
title: Set global access rights in the Cloud Office Control Panel
type: article
created_date: '2014-04-10'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

You can control how users access services and check their email, such as
requiring SSL or disabling POP or IMAP.

To adjust access rights for an entire domain, perform the following steps:

1.  Log in to the [Cloud Office Control Panel](https://apps.rackspace.com/?cp).
2.  From the **Go to section** menu, select **Rackspace Email**.
3.  In the **Email Accounts** section, click **Settings**.
4.  If you have multiple domains, select the appropriate domain name. To change domains, click **change domain**.
5.  Click **Global Access Rights**.
6.  Select the check box for each service that you want to grant access
    to, or clear the check box for each service that you want to
    restrict or disable access to. Each service is a different way of
    accessing email that is stored on the email server.

    **Note:** **SSL** and **TLS** indicate that the services incorporate
    security technology to protect the user's data.

    -   **POP3 and POP3 (SSL)** - Email is downloaded to the user's computer and is then deleted from the email server. This option is best for users who consistently use the same computer.

    -   **IMAP and IMAP (SSL)** - Email is stored on the email server only. The user manages email directly from the server, rather than downloading the email to
    a computer. This option is best for users who need to manage email
    and email folders from multiple locations - such as at the office, on
    the road, and from a mobile device. Users also benefit from having
    their email automatically backed up every evening; if a user
    accidentally deletes email, it can be easily retrieved - even up to 14
    days later.

    -   **Webmail and Webmail (SSL)** - Webmail provides anytime, anywhere access to email stored on the email server. With Webmail, a user can read, send, and manage
    email - just like using desktop email software. This option is best
    for users who need to access and manage email (and email folders)
    from multiple locations - such as at the office, on the road, or from
    a mobile device.

    -   **SMTP and SMTP (SSL)** - The SMTP service allows the user to send email. If you disable SMTP, the user cannot send email using the SMTP server. (SMTP is an
    always-secure service.)

7.  Select the option that you want to apply to your setup.

8.  Click **Save**.
