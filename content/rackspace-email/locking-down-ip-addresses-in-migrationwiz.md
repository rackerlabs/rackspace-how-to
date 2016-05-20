---
permalink: locking-down-ip-addresses-in-migrationwiz/
audit_date:
title: Lock down IP addresses in MigrationWiz
type: article
created_date: '2013-12-04'
created_by: Milton Prado
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

When performing an email migration, some customers might need to
restrict access to a defined set of IP addresses, typically for security
reasons. This article provides the range of IP addresses from which our
MigrationWiz tool can connect, and instructions on locking down your
migration to only these specific IP addresses.

**Note:** Because of the restricted IP range, migration speeds are not optimal.
Consider this when planning your migration timeline.

### IP address ranges

-   192.34.111.0 to 192.34.111.63 (aka 192.34.111.0/26) new
-   208.115.102.1 to 208.115.102.63 (aka 208.115.102.1/26)
-   198.104.255.65 to 198.104.255.126 (aka 198.104.255.64/26)
-   4.53.159.1 to 4.53.159.126 (aka 4.53.159.0/25)
-   216.176.189.162 to 216.176.189.188
-   198.104.202.70
-   4.53.158.186

### To lock down your migration profile

Now that you have the range of IP addresses, you need to lock down your
migration profile. If your migration is assisted, your migration
specialist performs these actions. If you are performing the migration
yourself, complete the following steps.

1. Log in to the [full version of MigrationWiz](/how-to/accessing-the-full-version-of-migrationwiz).

2. If you have already created a migration, click **Manage Connectors**. If you are creating a new migration, click **Create a  Connector**.

    <img src="{% asset_path rackspace-email/locking-down-ip-addresses-in-migrationwiz/Step_1.png %}" width="410" height="378" />

3. In the top-right corner of the window that opens, click **Advanced Options**.

    <img src="{% asset_path rackspace-email/locking-down-ip-addresses-in-migrationwiz/advanced.png %}" width="872" height="95" />

4. Click the **Performance** tab.

    <img src="{% asset_path rackspace-email/locking-down-ip-addresses-in-migrationwiz/Step_3.png %}" width="207" height="360" />

5. Set the **Preferred Data Center** value to **North America**.

    <img src="{% asset_path rackspace-email/locking-down-ip-addresses-in-migrationwiz/Step_4.png %}" width="435" height="235" />

6. Click the **Support** tab and type the following text in the blank field: **ProcessingRequirement=Local**

    <img src="{% asset_path rackspace-email/locking-down-ip-addresses-in-migrationwiz/Step_5.png %}" width="786" height="281" />

7. Save all changes.

All connections through your migration will now come only from the IP address ranges listed in this article.
