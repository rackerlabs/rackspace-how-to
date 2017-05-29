---
permalink: cannot-to-email/
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
**Applies to:** User

**Difficulty:** Challenging

**Time needed:** Approximately 1 hour

**Tools required:** Access to offending device, Online email access, access to a non-primary computer, access to a non-primary internet network


### Verify email delivery


#### Overview

Cannot connect to your mailbox

The topic of mailbox connectivity is broad and quickly become overwhelming. It is best to take a methodical approach to troubleshooting this issue, ruling out one possibility at a time.

To solve for being unable to connect to your mailbox, the recommendations will start large and become more targeted as you get closer to discovering the underlying issue.
•	Are you able to log into apps.rackspace.com?
o	It is important that you log into the online version of your mailbox to verify that it is still receiving email. This is a good indication that the mailbox itself is functioning properly.
•	When did the issue start?
o	An event that took place around the same time could have caused the problem. If an event comes to mind, verify that nothing about event could have caused email connectivity problems.
•	Have you recently migrated from another provider?(email help tool link)
o	After migrating your mailboxes to Rackspace Cloud Office from an external company, it is necessary to have your mail client connect to the mailbox on the new server. For example if you are using a version of Outlook to access your email, you will want to create a new profile that connects to your new mailbox at Rackspace.
•	Have you upgraded your mailboxes at Rackspace Cloud Office?(link to post mig)
o	Many time when you upgrade your mailbox, it is possible your mailbox is actually moving to a newer sever. For example if you upgrade from Exchange 2007 to Exchange 2016 you must configure mail client to connect to your mailbox on Exchange 2016.
•	Is this happening for all users on your domain?
o	If so, you should verify that your DNS is properly configured (dns link). The expiration of your domain registration, or changes to your DNS can cause you to be unable to synchronize new email to your mail client.
•	Are you able to connect to your mailbox from another computer?
o	If you are able to connect to your mailbox from another computer, the issue
•	Are you able to connect to your mailbox using a different internet connection?
