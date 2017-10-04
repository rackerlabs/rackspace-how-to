---
permalink: prepare-pop-imap-exchange-mail-servers-for-migration/
audit_date: '2016-09-01'
title: Prepare POP, IMAP, and Exchange mail servers for migration
type: article
created_date: '2016-08-29'
created_by: Nate Archer
last_modified_date: '2017-08-14'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

This article outlines important information to consider when you are migrating to Rackspace from one of the most common types of mail servers. Prior to migrating, we recommend that you review this information for your source (current) mail server.

After you have reviewed this information, you can follow the steps in the article [Migrate your email by using the Self-Service Migration tool](/how-to/migrate-your-email-by-using-the-self-service-migration-tool/) to complete your migration.

### POP server

POP mail servers store email on the user's local computer and not the source server so you might not need to migrate your users' mail. Therefore, we recommend a local data migration, which you can perform by following the steps in these articles:

- (Mac) [Migrating from a POP server to Rackspace email IMAP using Outlook 2011](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/)

- (Windows) [Migrating from a POP server to Rackspace Email using Outlook 2010's drag and drop method](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2010-drag-and-drop-method/)

### IMAP server

IMAP migrations copy the email data in the inbox and subfolders of the inbox if the data is stored on your source server. Any contacts, calendars, notes, and every other piece of information that is not stored in a user's inbox is *not* migrated.

The migration tool typically accesses IMAP servers by using either the incoming server's address listed in the mail client or by using the webmail address for your current mail provider. You can also use the server's IP address in place of any other host name or server address.

#### Test IMAP server access

We recommend testing IMAP server access before migrating. Access can be tested using the [DNS wonder tool](http://www.dnswonder.com/Tools/ImapTest.aspx). To use the tool, you need the following information:

- Source server name or IP address
- Server port number
- Login name, usually the email address associated with the source server
- Mailbox password

If you have issues connecting to the server, try the following actions:

- Access the server though ports 142 and 993 using SSL. Some mail providers allow a connection only through one port.
- Log in to webmail to confirm that the username and password combination you used is correct
- Reset the mailbox password

#### Remove special characters from folder names

Folders names with special characters—such as commas ( , ), periods ( . ), slashes ( / ), and ampersands ( & )—commonly cause issues during migration. Before you begin migrating, revise folder names with special characters to use only alphanumeric characters.

#### Issues for iPhone and Android users

After the migration has been performed, iPhone and Android mail users might notice messages sorted from the oldest to newest. Users might also notice gaps between the dates of messages. This is because the migration tool copies mail from the source server's mailbox in order from newest to oldest, but the user's mobile device will display information from oldest to newest.

This only affects iPhone and Android users with messages that have been migrated using the migration tool. Outlook users and users of other mail services will not be affected.

### Exchange server

Exchange migrations copy some of the email data stored on the source server, but the amount depends on where you are migrating to:

- **Rackspace Email**: Inbox and sub-folders of the inbox are migration
- **Hosted Exchange**: Inbox and subfolders of the inbox, contacts, calendars, task, and notes are migrated

When migrating from Exchange, use the administrator credentials from your source server instead of individual usernames and passwords from each mailbox. For information about setting up your admin credentials on your Exchange source server, see this [reference page](https://community.bittitan.com/kb/Pages/How do I create an administrator account for login.aspx#) from BitTitan.

#### Test Exchange server access

We recommend testing access to your Exchange before migrating. The migration tool accesses the Exchange server by using the Outlook Web App (OWA) URL. The URL should look similar to the following:

- https://mail.example.com/exchange
- https://mail.example.com/owa

To test access to the server by using the OWA URL, enter the username (either the full email address or Exchange username) and password for the individual mailbox to log in. If you use admin credentials, you can enter these credentials and then open another user's mailbox.
