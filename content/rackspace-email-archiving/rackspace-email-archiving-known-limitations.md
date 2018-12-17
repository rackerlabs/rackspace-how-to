---
permalink: rackspace-email-archiving-known-limitations/
audit_date: '2018-01-23'
title: Rackspace Email Archiving known limitations
type: article
created_date: '2015-05-19'
created_by: Beau Bailey
last_modified_date: '2018-01-23'
last_modified_by: William Loy
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---

There are several known issues that you might encounter when using
Rackspace Email Archiving. This article describes these issues.

### Email forwarding

If you set up a rule on a mailbox to automatically forward messages
without saving a copy, that mailbox does *not* archive the messages that
are forwarded and deleted by using the rule. Messages are archived in the
final destination mailbox only. If the final destination address is
outside of your domain, messages are not archived.

#### Aliases

If you have an alias set up to forward email to an address outside of
your domain, the forwarded email is not archived. When you send as an alias,
Rackspace archives the sent message only if you are sending from a
domain with archiving enabled or one of its accepted domains or
domain aliases. If a recipient is archived, the inbound message is
always archived for that recipient.

#### Distribution lists

When an email is sent from a Rackspace Email address to a Microsoft
Exchange distribution list, the archive does not include the individual
email addresses of the recipients on the distribution list.

Example: If you send an email from your Rackspace Email account to the
ABC distribution list that exists in Microsoft Exchange, the archive
only reflects that an email was sent to the list without recording
the individual recipients' names in the **To** field.

#### Group lists

If an email is sent to a group list that contains recipients on another
domain, and the outside domain has archiving, the **To** field of that
archived message might reveal the email addresses of all list members.

#### Rules

If archiving is enabled for the domain but an address at that domain has
a rule or filter to delete messages from specific senders, the deleted
messages are *not* archived.


#### Spam

If a message is flagged as spam, the message is not archived.
