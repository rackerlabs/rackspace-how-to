---
permalink: verify-email-delivery/
audit_date:
title: Verify Email Delivery
type: article
created_date: '2017-05-25'
created_by: William Loy
last_modified_date: '2017-05-25'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---
**Applies to:** User

**Difficulty:** Challenging

**Time needed:** Approximately 1 hour

**Tools required:** Online email access


### Verify email delivery


#### Overview
Emails do not deliver for a variety of reasons. If you are not sure if an email reached it’s  intended recipient or an email sent to you is missing, there are steps you can take to narrow down what may have happened to the message.




#### Incoming message delivery
If you expected to receive a message that never arrived, try the following steps:
- Log in at [apps.rackspace.com](apps.rackspace.com) to verify the message is not in the mailbox. If you see the message online, but not in your local mail client(Ex. Outlook) please reference [link to connectivity]
-	Perform a search on your mailbox.
    - Using your mailbox’s search function will discover a message that could be hiding in a sub-folder.
-	Does your mailbox have rules or filters applied?
    - Rules and filters can inadvertently move or even delete messages.
-	Check your Spam/Junk/Trash folders.
    - Searching your inbox should uncover messages lurking in these folders. It is best practice to manually check them even if a search does not show the messages in these folders.
-	Check your recover deleted items folder	.

    - Log into [apps.rackspace.com](apps.rackspace.com) > Place your cursor over “Trash” for Rackspace Email users or “Deleted Items” for Exchange users > right-click and select “Recover Deleted Items” from the menu. A box will pop up displaying messages in your recover deleted items folder. Detailed instructions

- Allow ample time to ensure there is not a message delay.
-	Did the sender receive a bounce message? If so, reference [Common Email Bounces](/how-to/common-email-bounces/) for possible solutions.
-	Was the message sent to an Alias, Contact, Group List, or Distribution List? If so these addresses will not forward any message flagged as spam.

    *Note: Adding the sending address to your Safelist will not correct this issue. There is no configuration that will allow spam to be forwarded.*

- If the mailbox the message is addressed to has a forward in place, the message will not forward if it is flagged as spam.

    *Warning: If you verify you are not getting any new email in apps.rackspace.com, contact your account administrator and provide them with this article [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email/).*

- Have you recently migrated from another provider?

    - After migrating your mailboxes to Rackspace Cloud Office from an external company, it is necessary to have your mail client connect to the mailbox on the new server. For example if you are using a version of Outlook to access your email, you will want to create a new profile that connects to your new mailbox at Rackspace. Instructions for configuring your mail client to connect with your recently migrated mailbox can be found by logging in at [emailhelp.rackspace.com](emailhelp.rackspace.com).

- Have you upgraded your mailboxes at Rackspace Cloud Office recently?

    - When you upgrade your mailbox, it is possible your mailbox has actually been created again on another sever. For example if you upgrade a mailbox from Exchange 2007 to Exchange 2016, your data is migrated from the Exchange 2007 mailbox, to a new mailbox on Exchange 2016. This means that you will need to configure your local mail client to connect to the mailbox on the new server. Please log into [emailhelp.rackspace.com](emailhelp.rackspace.com) for instructions for configuring your mail client after upgrading.



#### Outgoing message delivery
-	Did you receive a bounce message? If so, reference [Common Email Bounces](/how-to/common-email-bounces/) for possible solutions.
-	If you are sending from a desktop mail client such as Outlook, is the message in Drafts or the Outbox? If so, attempt resending the message.
- If you are sending to a contact, try manually entering the email address and sending again. If this is successful, verify that the contact information is correct.
-	Log into [apps.rackspace.com](apps.rackspace.com) and attempt sending the message again.
    - If you can successfully send a message online, but not from a desktop mail client you can verify your settings are correct in the [Email Help Tool](emailhelp.rackspace.com).  
-	Try sending the message from a computer connected to a different internet network such as your home, or a different office building.
-	Verify with the recipient that your message was not stored in one of their sub-folders.
-	Verify with the recipient that your message was not marked as spam. If your message was marked as spam please reference [Best practices for sending person to person email](/how-to/best-practices-for-sending-person-to-person-email/)to prevent this in the future.
