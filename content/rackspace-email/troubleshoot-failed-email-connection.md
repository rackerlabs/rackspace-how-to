---
permalink: troubleshoot-failed-email-connection/
audit_date: '2017-06-05'
title: Troubleshoot a failed email connection
type: article
created_date: '2017-05-29'
created_by: William Loy
last_modified_date: '2017-05-29'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

If your local email client cannot make a connection to your mailbox, try the troubleshooting recommendations in this article.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Challenging
- **Time needed:** Approximately 1 hour
- **Tools required:** Access to offending device, online email access, access to a nonprimary computer, and access to a nonprimary Internet network

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Troubleshooting steps

Because many factors can affect mailbox connectivity, we recommend a methodical approach to troubleshooting this issue. Address each of the following questions before moving on to the next one.

1. **Can you log in to [apps.rackspace.com](https://apps.rackspace.com/index.php)?**

   Log in to the online version of your mailbox to verify that it is still receiving email. If so, this is a good indication that the mailbox itself is functioning properly.

2. **When did the issue start?**

   An event that occurred about the same time could have caused the problem.

   For example, changes have been made to your office or home network or you have recently updated your mailbox password.  

3. **Have you recently migrated from another provider?**

   After migrating your mailboxes to Rackspace Cloud Office from an external company, your [mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) must connect to the mailbox on the new server. Instructions for configuring your mail client to connect with your recently migrated mailbox are at [emailhelp.rackspace.com](https://emailhelp.rackspace.com/).

4. **Have you upgraded your mailboxes at Rackspace Cloud Office?**

   When you upgrade your mailbox, your mailbox might have been created again on another server. For example, if you upgrade a mailbox from Exchange 2007 to Exchange 2016, your data is migrated from the Exchange 2007 mailbox to a new mailbox on Exchange 2016. This means that you must configure your [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) to connect to the mailbox on the new server. For instructions on configuring your mail client after upgrading, see [emailhelp.rackspace.com](https://emailhelp.rackspace.com/).

5. **Is the connectivity issue happening for all users on your domain?**

   Verify with your administrator that your DNS is properly configured to [receive email at Rackspace Cloud Office](/how-to/set-up-dns-records-for-cloud-office-email/). The expiration of your domain registration, or changes to your DNS can cause you to be unable to synchronize new email to your local mail client.

6. **Can you connect to your mailbox from another computer?**

   If you can connect to your mailbox from another computer, the issue might be local to your primary computer.

7. **Can you connect to your mailbox by using a different [Internet network](/how-to/cloud-office-support-terminology/#cloud-office-terminology)?**

   If you can connect to your mailbox by using a different Internet network, the issue might reside within the network you normally use. In this case, contact your network administrator or your Internet service provider for more information.

If you address these steps and your email client still does not connect to your mailbox, contact your administrator for help.

### References

- [Cloud Office support terminology](/how-to/cloud-office-support-terminology/)

- [Cloud Office email login portal](https://apps.rackspace.com/index.php)

- [Email Help Tool](https://emailhelp.rackspace.com/)

- [Set up DNS Records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email/)
