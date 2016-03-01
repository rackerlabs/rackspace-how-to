---
node_id: 4695
title: Rackspace Email Archiving known limitations
type: article
created_date: '2015-05-19'
created_by: Beau Bailey
last_modified_date: '2016-01-26'
last_modified_by: Catherine Richardson
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---

There are several known issues that you might encounter when using
Rackspace Email Archiving. This article describes these issue.

### Email forwarding ###

If you set up a rule on a mailbox to automatically forward messages
without saving a copy, that mailbox does *not* archive the messages that
are forwarded and deleted using the rule. Messages are archived in the
final destination mailbox only. If the final destination address is
outside of your domain, messages are not archived at all.

#### Aliases ####

If you have an alias set up to forward email to an address outside of
your domain, that email is not archived. When you send as an alias,
Rackspace only archives the sent message if you are sending from a
domain with archiving enabled or one of its accepted domains or
domain aliases. If a recipient is archived, the inbound message is
always archived for that recipient..

#### Distribution lists ####

When an email is sent from a Rackspace Email address to a Microsoft
Exchange distribution list, the archive does not include the individual
email addresses of the recipients on the distribution list.

Example: If you send an email from your Rackspace Email account to the
ABC distribution list that exists in Microsoft Exchange, the archive
will only reflect that an email was sent to the list without recording
the individual recipients&rsquo; names in the **To** field.

#### Group lists ####

If an email is sent to a group list that contains recipients on another
domain, and the outside domain has archiving, the **To** field of that
archived message might reveal the email addresses of all list members.

#### Rules ####

If archiving is enabled for the domain but an address at that domain has
a rule or filter to delete messages from specific senders, the deleted
messages are *not* archived.
