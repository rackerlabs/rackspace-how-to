---
permalink: troubleshoot-email-delivery/
audit_date: '2017-06-05'
title: Troubleshoot email delivery
type: article
created_date: '2017-05-25'
created_by: William Loy
last_modified_date: '2017-07-12'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

If an incoming or outgoing message might not have been delivered, try the troubleshooting recommendations in this article.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Challenging
- **Time needed:** Approximately 1 hour
- **Tools required:** Online email access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).  

### Troubleshooting steps

Emails fail to deliver for many reasons. Try these steps to narrow down what might have happened to an incoming or outgoing message.

#### Troubleshoot incoming message delivery

If an incoming message never arrived, try the following steps:

1. **Log in to [apps.rackspace.com](https://apps.rackspace.com/index.php) to verify that the message is not in the mailbox.**

   If you see the message online, but not in your [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology), see [Troubleshoot a failed email connection](/how-to/troubleshoot-failed-email-connection).

   **Warning:** If you verify that you are not getting any new email in apps.rackspace.com, contact your account administrator and provide this article [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email/).

2. **Search for the message in your mailbox.**

   Try a variety of search criteria to determine whether the message is in a sub-folder.

3. **Check your Spam, Junk, and Trash folders for the message.**

4. **Recover deleted email.**

   a. Log in to [apps.rackspace.com](https://apps.rackspace.com/index.php).
   b. Right-click **Trash** (for Rackspace Email users) or **Deleted Items** (for Exchange users) and select **Recover Deleted Email** from the menu.

      A pop-up box displays messages that have been deleted within the last 14 days.

5. **Verify whether rules or filters might have been applied.**

   Rules and filters move or even delete messages. Rules and filters can exist in webmail or your [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology).

6. **Allow ample time to ensure there is not a message delay.**

7. **Determine whether the sender received a bounce message.**   

   If so, see [Common email bounce messages](/how-to/common-email-bounces) for possible solutions.

8. **Determine whether the message was sent to an Alias, Contact, Group List, or Distribution List.**

   These type of addresses do not deliver any message flagged as spam.

   **Note:** Adding the sending address to your safelist does not correct this issue. No configuration allows spam to be forwarded.

9. **Determine whether the receiving mailbox is forwarded to another mailbox.**

   If so, a message flagged as spam will not forward.

10. **If you recently migrated from another provider, ensure that you are connected to the mailbox on the new server**

   After migrating your mailboxes to Rackspace Cloud Office from an external company, your mail client must connect to the mailbox on the new server. For example, if you are using a version of Outlook to access your email, create a new profile that connects to your new mailbox at Rackspace. Instructions for configuring your mail client to connect with your recently migrated mailbox are at [emailhelp.rackspace.com](https://emailhelp.rackspace.com/).

11. **If you recently upgraded your mailboxes at Rackspace Cloud Office, ensure that you are connected to the mailbox.**

   When you upgrade your mailbox, your mailbox might have been created again on another sever. For example, if you upgrade a mailbox from Exchange 2007 to Exchange 2016, your data is migrated from the Exchange 2007 mailbox to a new mailbox on Exchange 2016. This means that you must configure your local mail client to connect to the mailbox on the new server. For instructions on configuring your mail client after upgrading, log in to [emailhelp.rackspace.com](https://emailhelp.rackspace.com/).

#### Troubleshoot outgoing message delivery

1. **Log in to [apps.rackspace.com](https://apps.rackspace.com/index.php) and try to send the message again.**

   If you can successfully send a message from webmail but not from a [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) you can verify that your SMTP settings are correct by logging in to the [Email Help Tool](https://emailhelp.rackspace.com/).

2. **Determine whether you got a bounce message.**

   If so, see [Common email bounce messages](/how-to/common-email-bounces) for possible solutions.

3. **If you are sending from a [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) check your Drafts and Outbox folders for the message.**    

   If the message is in one of those folders, attempt to resend it.

4. **If you are sending to a contact, manually enter the email address and resend the message.**  

   Verify that the contact information is correct.

5. **Try to send the message from a computer connected to a different Internet network.**

   For examples, send from your home network or an alternative office network.

   **Note:** Office network changes can cause email disruptions. Contact your office's network administrator if the preceding test is successful on an alternative Internet network.

6. **Verify with the recipient that your message is not stored in a subfolders.**

7. **Verify with the recipient that your message was not marked as spam.**

   If your message was marked as spam, see [Best practices for sending person to person email](/how-to/best-practices-for-sending-person-to-person-email/) to prevent this in the future.

### References

- [Cloud Office support terminology](/how-to/cloud-office-support-terminology)
- [Cloud Office Email Portal](https://apps.rackspace.com/index.php)
- [Email Help Tool](https://emailhelp.rackspace.com/)
- [Common email bounce messages](/how-to/common-email-bounces)
- [Troubleshoot a failed email connection](/how-to/troubleshoot-failed-email-connection)
