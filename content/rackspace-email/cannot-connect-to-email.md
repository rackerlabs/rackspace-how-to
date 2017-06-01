---
permalink: cannot-connect-to-email/
audit_date:
title: Cannot Connect to Email
type: article
created_date: '2017-05-29'
created_by: William Loy
last_modified_date: '2017-05-29'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---
This article provides troubleshooting recommendations in the event that your local email client cannot make a connection to your mailbox.

### Prerequisites

- **Applies to:** User

- **Difficulty:** Challenging

- **Time needed:** Approximately 1 hour

- **Tools required:** Access to offending device, online email access, access to a non-primary computer, access to a non-primary internet network

See [Cloud Office Terms](/how-to/cloud-office-terms/) for definitions of the above criteria.  

### Cannot Connect to Email

The topic of mailbox connectivity is broad. It is best to take a methodical approach to troubleshooting this issue, ruling out one possibility at a time.

1. **Are you able to log into [apps.rackspace.com](apps.rackspace.com)?**
    - It is important that you log into the online version of your mailbox to verify that it is still receiving email. This is a good indication that the mailbox itself is functioning properly.

2. **When did the issue start?**
    - An event that took place around the same time could have caused the problem.

    *Example: Changes have been made to your office or home network or you have recently updated your mailbox password.*   

3. **Have you recently migrated from another provider?**
    - After migrating your mailboxes to Rackspace Cloud Office from an external company, it is necessary to have your mail client connect to the mailbox on the new server.

    *Example: if you are using a version of Outlook to access your email, you will want to create a new profile that connects to your new mailbox at Rackspace. Instructions for configuring your mail client to connect with your recently migrated mailbox can be found at [emailhelp.rackspace.com](emailhelp.rackspace.com).*

4. **Have you upgraded your mailboxes at Rackspace Cloud Office?**
    - When you upgrade your mailbox, it is possible your mailbox has actually been created again on another sever. For example if you upgrade a mailbox from Exchange 2007 to Exchange 2016, your data is migrated from the Exchange 2007 mailbox, to a new mailbox on Exchange 2016. This means that you will need to configure your local mail client to connect to the mailbox on the new server. Please visit [emailhelp.rackspace.com](emailhelp.rackspace.com) for instructions for configuring your mail client after upgrading.

5. **Is this happening for all users on your domain?**
    - If so, you should verify with your administrator that your DNS is properly configured to [receive email at Rackspace Cloud Office](/how-to/set-up-dns-records-for-cloud-office-email/). The expiration of your domain registration, or changes to your DNS can cause you to be unable to synchronize new email to your mail client.

6. **Are you able to connect to your mailbox from another computer?**
    - If you are able to connect to your mailbox from another computer, the issue may be local to your primary computer.

7. **Are you able to connect to your mailbox using a different internet connection?**
    - If you are able to connect to your mailbox using a different internet network, the issue may reside with the offending internet network. In this case you will want to contact your network administrator or your internet service provider for further instructions.

Being unable to connect to your mailbox is an issue that can be challenging to identify because of the multitude of possibilities. If these recommendations do not narrow down those possibilities please contact your administrator for further direction.

### References

[Cloud Office Terms](/how-to/cloud-office-terms/)

[Cloud Office email login portal](apps.rackspace.com)

[Email Help Tool](emailhelp.rackspace.com)

[Set up DNS Records for Cloud Office email]((/how-to/set-up-dns-records-for-cloud-office-email/))
