---
permalink: split-domain-routing/
audit_date:
title: Set up split domain routing
type: article
created_date: '2011-12-30'
created_by: Rackspace Support
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

Split domain routing (SDR) allows you to have a single domain's
mailboxes distributed between our system and an external system, working
together as if they were in one environment. This is primarily used when
a large number of mailboxes are being migrated over to our system from another
server over an extended period of time.

Mailboxes can be moved in batches to make the move more manageable for
administrators and to make the transition almost seamless for the users.
Though it is not common, SDR can also be used when you need to maintain
some mailboxes on an existing system for an extended period of time or
permanently.

If SDR will be a permanent feature of your set up they can point to
either your external mail server or us. You may want to point your MX
records to Rackspace because then all your messages get the benefit of
our spam/anti-virus filtering instead of just the Rackspace-hosted
mailboxes.

### Setting up SDR

There are two parts to setting up SDR and they relate to enabling our
system and the external system to have two-way communication. If you are
using SDR as part of a migration, you will want to keep your MX records
for the domain pointing to your existing server (described as your
external mail server in this documentation). Once the migration is
complete you can switch them to the Rackspace MX records listed here:
[Set up DNS records for Cloud Office email and Skype for
Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business).

<img src="{% asset_path rackspace-email/split-domain-routing/(E%26A)SplitDomainRouting.png %}" width="617" height="333" />

### Enabling SDR through the Cloud Office Control Panel

When SDR is enabled, our environment will forward to your external
server any messages addressed to recipients on your domain that do not
exist in our system. To enable it requires the hostname of your external
mail server (usually one of the MX records that point to your external
system) and a valid email address within the designated domain hosted on
that external mail server. We will use this address only to validate the
server. You must also open port 25 on the external mail server so that
our system can connect to it.

<img src="{% asset_path rackspace-email/split-domain-routing/(E%26A)SplitDomainRouting2.png %}" width="652" height="281" />

#### To enable SDR

1. Log in to the [Cloud Office Control Panel](http://cp.rackspace.com).
2. From the **Go to section** menu, select **Domains**.

    <img src="{% asset_path rackspace-email/split-domain-routing/a.png %}" width="152" height="96" />

3. In the **Tools** section, click the **Split Domain** link.
4. If prompted, select the domain for which you want to set up SDR.
5. Select the **Enable Split Domain Routing** check box.
6. In the **External Mail Server** box, enter the name of your external mail server.
7. In the **Verification Address** box, enter in a valid email address that is hosted on your external mail server.
8. Click **Save**.

### Configuring SDR from your own external server to Rackspace

This type of functionality is known by several names including
non-authoritative mail delivery or message routing for a shared address
space. The idea is to set up the external server so that if it is not
able to deliver a message locally, the server forwards to another system
(Rackspace). Different mail systems will have their own procedures for
configuring this.

The following Microsoft articles show how to accomplish this:

- [Exchange Server 2007](http://bit.ly/rE6YBR)
- [Exchange Server 2010](http://bit.ly/CQy7)

### Subdomain message routing

This is a suggested way to route messages from your external
server back to Rackspace. Subdomain routing uses contacts (or
forwards) set up on your external system to route the messages to a
subdomain email address. This same subdomain should be added as a
domain alias on our system in order for this to work.

The following should be in place:

-   A subdomain created with your DNS host pointing to Rackspace MX
    records - for example, **rackspace.example.com** with its own set of MX records
    pointing to **mx1.emailsrvr.com**.
-   Contacts (aliases) must be created on the external system for each
    mailbox hosted by Rackspace. The contact must forward the
    **yourdomain.com** address to the **rackspace.example.com** address. For
    example, **user@example.com** (on your external server) will have a
    forward set to **user@rackspace.example.com**. Your server will see the
    **@rackspace.example.com** address and query DNS, which will then
    resolve back to **mx1.emailsrvr.com** and deliver to the user in
    Rackspace's environment.

-   Ensure that you have requested your **rackspace.example.com**
    subdomain as a *domain alias*. In order to do this, contact Support (chat, phone call, or open a ticket).

<img src="{% asset_path rackspace-email/split-domain-routing/(E%26A)SplitDomainRouting6.png %}" width="633" height="261" />

If Rackspace is your DNS host, enter this subdomain name in the Mail Records (MX) section of the DNS Settings page in the control panel.

**Note:** For a migration, when changing the MX records, ensure that you are changing them for the new subdomain (for example, **rackspace.example.com**) and not the primary domain. After all mailboxes are on our system, you will change the MX records for the primary domain.
