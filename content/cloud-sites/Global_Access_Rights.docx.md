You can control how your users access services and check their mail, such as requiring SSL or disabling POP and IMAP.

1.  First, log into the [*Cloud Sites Email Control Panel*](https://cloudsites.mycpsrvr.com) and then click on the Email Hosting section.

![](../Global_Access_Rights.docx/media/image03.png){width="6.5in" height="3.3541666666666665in"}

1.  Then click on the **Settings** section.

<span id="_gjdgxs" class="anchor"></span>![](../Global_Access_Rights.docx/media/image06.png){width="6.5in" height="3.2569444444444446in"}

1.  Then click on the **Global Access Rights** section.

![](../Global_Access_Rights.docx/media/image05.png){width="6.5in" height="3.204861111111111in"}

1.  Then select the options that you would like for users on this domain.

![](../Global_Access_Rights.docx/media/image07.png){width="6.5in" height="4.888888888888889in"}

1.  Select the check box for each service that you want to grant access to, or clear the check box for each service that you want to restrict or disable access to. Each service is a different way of accessing email that is stored on the email server.

**Note:** **SSL** and **TLS** indicate that the services incorporate security technology to protect the user’s data.

-   **POP3 and POP3 (SSL)** - Email is downloaded to the user’s computer and is then deleted from the email server. This option is best for users who consistently use the same computer.

-   **IMAP and IMAP (SSL)** - Email is stored on the email server only. The user manages email directly from the server, rather than downloading the email to a computer. This option is best for users who need to manage email and email folders from multiple locations - such as at the office, on the road, and from a mobile device.

-   **Webmail and Webmail (SSL)** - Webmail provides anytime, anywhere access to email stored on the email server. With Webmail, a user can read, send, and manage email - just like using desktop email software. This option is best for users who need to access and manage email (and email folders) from multiple locations - such as at the office, on the road, or from a mobile device.

-   **SMTP and SMTP (SSL)** - The SMTP service allows the user to send email. If you disable SMTP, the user cannot send email using the SMTP server. (SMTP is an always-secure service.)

1.  When you make a change, you can apply those changes in one of three ways:

    a.  Default: Redefines the default for new mailboxes only. Current mailboxes are not affected.

    b.  Apply Changes: Apply only the changes you have made, for all the mailboxes in the domain, and the default.

    c.  Override: Applies all of the settings for all the mailboxes in the domain, and the default.

2.  Click **Save** to apply your changes for that domain.

  --
  --


