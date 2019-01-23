---
permalink: rackspace-directory-sync-administrators-guide/
audit_date:
title: 'Rackspace Directory Sync Administration Guide'
type: article
created_date: '2013-04-25'
created_by: Kevin Richey
last_modified_date: '2019-01-23'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

This article provides information for administrators using
Rackspace Directory Sync. It includes information on how Directory Sync
works with Active Directory&reg; and local domains to synchronize to Rackspace
Hosted Email.

Using Directory Sync for your organization includes these benefits:

-   **Same sign-on**: Users have one password for their
    local network access and their email accounts for a same
    sign-on experience.
-   **Ease of management**: Administrators can manage mail-enabled objects directly from a
    familiar Microsoft&reg; Active Directory interface. Choose which user
    objects to synchronize. Synchronize a single user in
    your Active Directory, or synchronize all of them at the same time.
-   **Save time**: Directory Sync can save considerable effort and time when onboarding new
    employees and managing password policies in large numbers.
-   **Business automation**: Rackspace Directory Sync is built to use
    the Rackspace Email cloud's public REST APIs to facilitate automation.
-   **Secure**: All data exchanged is encrypted using Secure Sockets Layer (SSL) and synchronization
    is one-way only.
-   **Cost effective**: Rackspace Directory Sync is available at no
    additional cost.

#### Supported objects and platforms

Rackspace Directory Sync supports the synchronization of the following
Active Directory objects:

-   Active Directory user mailboxes
-   Active Directory user passwords for same sign-on
-   Active Directory contacts (Hosted Exchange)
-   Distribution groups (Hosted Exchange)

Directory Sync supports the following Rackspace Email platforms:

-   Hosted Exchange 2010
-   Hosted Exchange 2013
-   Hosted Exchange 2016
-   Hosted Exchange Hybrid
-   Rackspace Email

Directory Sync supports the following Active Directory platforms:

-   Windows Server&reg; 2008 and 2008 R2
-   Windows&reg; 2012 and 2012 R2

#### Directory Sync limitations

-   Does not synchronize with Hosted Exchange 2007
-   Existing mail data does not migrate with Directory Sync to our
    hosted environment.
    We offer several methods that you can use to migrate your own data,
    as described in the article [Email migration
    services](/how-to/email-migration-services).
-   Synchronizes user passwords at the moment a password is changed.
    Passwords cannot be synchronized retroactively because they are
    unreadable from Active Directory. Users must change their passwords
    for Directory Sync to synchronize the change with their mailbox.
-   Not Lightweight Directory Access Protocol (LDAP) compatible.
-   Windows Server 2003 and the Active Directory functional level of
    2003 are not supported.

#### Installation and configuration

See [Rackspace Directory Sync: Install and
configure](/how-to/rackspace-directory-sync-install-and-configure)
to get started.

**Note:** You *must* restart the domain controller during installation
in order for the password synchronization to work.

#### How Directory Sync works

Directory Sync automatically synchronizes changes from your
local directory to your email accounts every five minutes. You can also
click **Sync Now** to synchronize immediately.

Directory Sync synchronizes one-way only. It does not synchronize information from
Hosted Exchange or Rackspace Email back to your Active Directory. If you
change any information, such as passwords, by using Outlook&reg; Web App or
Control Panel, your mailboxes are not synchronized with Active
Directory.

#### Domain names

Directory Sync synchronizes one local Active Directory domain with
multiple email domains.

The domain names can be the same or different. You specify the local
Active Directory domain at set up.

#### Security groups

Directory Sync uses Active Directory security groups to manage which
objects are synchronized with your email service. If you use Hosted
Exchange, create a new security group for the users that synchronize with Exchange mailboxes. If you use Rackspace Email, create
a new security group for the users that synchronize with
Rackspace Email mailboxes. If you use both Hosted Exchange and Rackspace
Email, you create two security groups. Directory Sync creates and
manages mailboxes for all user objects that you add to the security
groups.

#### User mailboxes

Directory Sync associates Active Directory user objects with email
accounts by using their mail attribute. The mail attribute is the email
address property associated with the user.

#### Password synchronization

Password synchronization occurs after the user object has synchronized
to the mailbox. Password changes occur on their own synchronization
interval and with a higher priority than other synchronization sessions.

When you install Directory Sync, it cannot automatically synchronize
existing passwords because they are unreadable from Active Directory.
Users continue to use their old email passwords. When users manually
change their password, Directory Sync synchronizes it with their
mailbox. Be sure to assign user objects to email security groups before
you change passwords. Otherwise, Directory Sync does not set the new
passwords.

When you create new mailboxes, those users must change their passwords before
they can access their email.

If you manage your Active Directory with multiple domain controllers,
your must install the Directory Sync Password Handler on all secondary
domain controllers. This handler is used to synchronize password changes on
secondary domain controllers to the primary domain controller and then
synchronize those changes to Rackspace Hosted Mail.

#### Distribution list membership synchronization

Synchronize users within distribution lists or security groups from
Active Directory to distribution list membership within the
Control Panel. Directory Sync uses the group's email address property to
synchronize with the Hosted Exchange distribution list.

#### Exchange contacts

Synchronize contact objects within Active Directory to your Exchange
contacts within the Hosted Exchange environment. Within Active
Directory, you can set up the external email address to which the
contact forwards. Directory Sync uses the contact object's mail
attribute to set this.

#### Alternate email addresses (optional synchronization)

The `proxyAddresses` attribute is used to create alternate email
addresses (aliases) for the Hosted Exchange environment. If you
set the `proxyAddresses` attribute to include `SMTP: userA@example.net`,
then Directory Sync will add the address `userA@example.net` to the
environment as an alias to that email address.

-   Any address that begins with **SMTP:** in the `proxyAddresses`
    attribute creates an alternate email address associated with the
    user's mailbox.
-   These addresses cannot include a domain alias in the address but can
    include either the primary domain or accepted domains.
-   You can create alternate email addresses associated with domain aliases can be
    created by using the primary domain. For example,
    `SMTP:userB@example.com` creates the alternate address
    `userB@example.net`.
-   Accepted domains are created with the full email address (including
    the domain). For example, `SMTP:userA@example.org` creates the
    alternate address `userA@example.org`.

#### How to enable synchronization of proxy addresses:

1.  The setting is located in the `appSettings.config` file in the
    `\Directory Sync Service\web` directory.
2.   Go to the following configuration value:

        `<add key="SyncProxyAddresses" value="False" />`

3.  Change the setting to `True` to enable syncing of the
    proxy addresses. Future upgrade installations do not revert this setting.

#### Additional notes

-   The **Attribute Editor** is visible in the **Active Directory Users and
    Computer** (ADUC) console with the **Advanced Features** enabled in the
    **View** tab.
-   You must configure domain aliases and accepted domains with the help
    of Cloud Office Support before configuring alternate addresses to ensure that they are synchronized correctly.
-   During the initial set up, ensure the `proxyAddresses`
    attribute does not contain any domain aliases to avoid errors.
-   Alternate addresses are available to Exchange mailboxes only. They do not
    work with distribution lists or contacts.

### Security

This section describes some security considerations.

#### User password requirements

Directory Sync does not set an email password that does not meet minimal
password requirements. We recommend that you change your domain password
rules to meet or exceed these requirements.

#### Rackspace Email and Hosted Exchange password requirements

Note the following email requirements:

-   At least eight characters long.
-   At least 3 of the following:
    -   At least one lowercase character
    -   At least one uppercase character
    -   At least one number
    -   At least one non-alphanumeric (!, \$, \#, %, space, and so on).

#### Network ports

You do not have to open any inbound ports from the Internet to your
domain controllers.

Enable the following ports on the Directory Sync server:

-   **443** - Outbound HTTPS connections from Directory Sync service to
    [Rackspace API](http://api.emailsrvr.com)
-   **8732** - Open for connections from other domain controllers to the
    Directory Sync server. Not used for any connections outside
    your network. This port is used by the domain controller password
    hooks.
-   **8080** - This port is only used locally on the Directory Sync service machine for
    web browser. You may block this port for any external connections.

#### Network encryption

HTTPS secures communications between Directory Sync and. Microsoft® WCF Transport Security, which uses Windows Authentication and encryption, secures communications between the Active Directory password hook and Directory Sync.

### Synchronized user attributes

Directory Sync synchronizes the following user attributes with
Hosted Exchange and Rackspace Email mailboxes. Some attributes differ between
Rackspace Email and Exchange mailboxes.

List Format: Email Attribute: **Active Directory Services Interface** (ADSI) property (limitations)

-   Email Address: mail
-   Password: password
-   Display Name: displayName
-   Last Name: sn
-   First Name: givenName
-   Generation Qualifier: generationQualifier (Rackspace Email only)
-   Initials: initials (Rackspace Email only)
-   Organization Unit: o (Rackspace Email only)
-   Business Number: telephoneNumber
-   Pager Number: pager
-   Home Number: homePhone
-   Mobile Number: mobile
-   FAX Number: facsimileTelephoneNumber
-   Home FAX Number: otherFacsimileTelephoneNumber (Rackspace
    Email only)
-   Street: streetAddress
-   City: l
-   State: st
-   Postal Code: postalCode
-   Country: co
-   Title: title
-   User ID: employeeID (Rackspace Email only)
-   Employee Type: employeeType (Rackspace Email only)
-   User Account Control: userAccountControl
-   Company: company (Exchange only)
-   Department: department (Exchange only)
-   Proxy Addresses: proxyAddresses (Exchange only)
-   Office: physicalDeliveryOfficeName (Exchange only)
