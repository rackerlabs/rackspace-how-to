---
permalink: rackspace-directory-sync-operation-guide/
audit_date:
title: 'Rackspace Directory Sync Operation Guide'
type: article
created_date: '2014-04-29'
created_by: Aaron Medrano
last_modified_date: '2016-01-29'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

This article provides step-by-step information about using your Active
Directory to synchronize by using Rackspace Directory Sync and Rackspace
Hosted Email. It provides instructions for creating new email addresses,
distribution lists, and contacts for Hosted Exchange.

### Add a new mailbox

If the email address does not exist in the control panel, a new mailbox
will be created during the next synchronization.

**Note:** User objects must be direct members of the specified email
security group. Nested groups are seen by Directory Sync to create a
distribution group and not create mailboxes for users in the nested
group.

1.  Set the Active Directory user's email address property
    (`mail` attribute) to the email address.
2.  Add the new user to the email security group.

Directory Sync creates a mailbox for the user and synchronize the user's
password. If this is a first-time setup, the password must be changed to
ensure that the password is synchronized.

### Create a mailbox for an existing user

If the email address exists in the control panel, the Active Directory
user synchronizes to the existing mailbox.

**Note:** User objects must be direct members of the specified email
security group. Nested groups are seen by Directory Sync to create a
distribution group and not create mailboxes for users in the nested
group.

1.  Ensure that the Active Directory user's email address property
    (`mail`<span> </span>attribute) matches the email address.
2.  Add the User object to the email security group.

Directory Sync creates a mailbox for the user and synchronizes the
user's password. If this is a first-time setup, the password must be
changed to ensure that the password is synchronized.

### Remove a user mailbox

1.  Remove the user from the email security group.
    **Note**: Directory Sync disables the user's mailbox.
2.  Go to the administration Control Panel.
3.  Confirm that the mailbox is disabled.
4.  Delete the mailbox.

**Note:** To prevent accidental deletions, Directory Sync
does not automatically delete mailboxes.

### Create a distribution list

1.  Create a group within the Active Directory (or use an already
    existing group). This Active Directory group can be either a
    security group or a distribution list.

2.  Set the group email address property
    (`mail`<span> </span>attribute).
    -   For new distribution lists, provide an email address before
        subscribing to the Hosted Exchange security group.
    -   For existing distribution lists, add an email address if it
        doesn't exist, or update the email address to match the email in
        the Cloud Office Control Panel before synchronizing. If the
        email address doesn't match what is in the Cloud Office Control
        Panel, a new distribution list is created.

3.  Subscribe the new group created in step 1 to the Hosted Exchange
    group specified in the Directory Sync settings. You must set the
    email address in step 2 before you subscribe the distribution group
    to the Hosted Exchange security group.

**Note:** For memberships of the distribution list created in step 1 to
synchronize as members of the distribution list in the control panel,
the members must also be subscribed to either the Hosted Exchange group
or the Hosted Email group specified in the Directory Sync settings.

### Delete a distribution list

To delete a distribution list, remove the Distribution List group from
the Hosted Exchange security group specified in the Directory Sync
settings.

**Note:** After the next synchronization, the distribution list is
deleted from the Cloud Office Control Panel.

### Create a contact (Exchange)

1.  Create a Contact object within the Active Directory.

    **Note:** When you are creating the contact, the Display Name within
    the object will create the Display Name within the Cloud Office
    Control Panel for the contact.

2.  After the Contact object is created, set the email address. The
    email address points to the external email address of the contact.

3.  Subscribe the new contact to the Hosted Exchange group specified in
    the Directory Sync settings.

**Note:** The `objectGUID` attribute of the contact is used as the
username for the contact within the Cloud Office Control Panel. Active
Directory automatically creates this and is how Directory Sync
references the contact through our API.

Customers with multiple email domains must edit the `otherMailBox`
attribute (of the Contact object) to contain the domain to synchronize.
You only need to have the domain set within this attribute.

### Delete a contact (Exchange)

To delete a contact from Exchange, remove the contact from the Hosted
Exchange security group specified in the Directory Sync settings.

**Note:** After the next synchronization, the contact will be deleted
from the Cloud Office Control Panel.

### Change the external email address of a contact (Exchange)

1.  Remove the contact from the Hosted Exchange security group set in
    the Directory Sync settings.
2.  Allow the Directory Sync tool to synchronize the new changes. Either
    a manual or an automatic operation can synchronize the new changes.
3.  Change the email address of the contact.
4.  Add the contact address to the Hosted Exchange security group
    and synchronize.

### Rename a Hosted Service security group

1.  On the Settings page, select **Do Not Sync** from the email service
    list and then click **Save & Start Sync**.
2.  In Active Directory, rename the security group and the pre-Windows
    2000 group name. The group name and pre-Windows 2000 group name must
    be identical.
3.  Back on the Settings page, select the new group name from the list
    and then click **Save & Start Sync**.

### Add an alternate email address (optional synchronization)

1.  Enable synchronization. This is value is turned off by default.

    1.  In the **\\Directory Sync Service\\web** directory, open the
        **appSettings.config** file.
    2.  Find the following config value:

            <add key="SyncProxyAddresses" value="False" />

    3.  Change the `value` attribute to `True` to enable synchronization
        of the proxy addresses. This setting will be persistent.

2.  Open Active Directory Users and Computers.
3.  Open the Attribute Editor of the User Object. The **Advanced
    Features** tab must be enabled in the **View** settings to display
    this tab.
4.  Go to the **proxyAddresses** attribute and click **Edit**.
5.  Add the alternate email address.

**Note:** The alternate email addresses are formatted as
**SMTP:userA@example.com**. For all alternate email addresses beginning
with **SMTP:**, the full email address must be listed. Domain Aliases
cannot be placed in this attribute. Only the Primary Domain and
Accepted Domains can be listed in this attribute, because domain aliases
are automatically created from the primary domain.
