---
permalink: running-additional-passes-with-migrationwiz/
audit_date:
title: Run additional passes with MigrationWiz
type: article
created_date: '2013-12-04'
created_by: Milton Prado
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

When you are migrating email to Rackspace, all email might not be
migrated over to the new Rackspace mailboxes after the first migration
pass. This incomplete migration usually occurs during the Switch Over
phase when changing MX records. During that time, email might continue
to be delivered to the environment from which you are migrating.

To mitigate this issue, you can run additional migration passes. These
extra passes capture differential data and migrate any new items that
might not have been available during the first migration.

### Details about additional passes

Every mailbox being migrated receives up to 10 passes at no additional
charge. Following are some additional details about migration passes:

- MigrationWiz does not duplicate items that have been migrated by the service itself. No matter how many times you submit a migration, you should not encounter duplicates.

- MigrationWiz does not delete items during delta migration passes. For example, an email which was migrated during a first migration pass and later deleted at the source, that email is not deleted from the destination Rackspace mailbox during additional passes.

- MigrationWiz does not update items during additional migration passes; it only migrates items that were not migrated during a previous migration. For example, if an email was migrated during a first migration pass and was later modified at the source, that email is not updated in the destination Rackspace mailbox during an    additional migration pass.

- If you move emails to different source sub-folders during a migration, those emails might appear in a second folder after an additional pass. For example, suppose that emails in source folder A were migrated, but later those emails were moved to source folder B. MigrationWiz remembers which emails it migrated from folder A. However, because items have been moved to a new source folder B,     MigrationWiz migrates these emails to folder B in the destination Rackspace mailbox.

### Run additional passes when migrating via MigrationWiz

1. Log in to the migration portal via the link that was sent to you when
you signed up for MigrationWiz.

    The link looks similar to the following one: **https://rackspace.selfmigration.com/Public/Default.aspx?t=MjEyMTRiMGYtOW**.
After you log in, you are directed to the page that you were previously
on.

2. To view all migration projects, click the **My migrations** link in
the upper-right corner of the page.

3. In the **Actions** column of the **Migrations Projects** table, click
the **Migrate New Items** icon. The **Status** changes to
Processing, indicating that the pass has begun.

<img src="{% asset_path rackspace-email/running-additional-passes-with-migrationwiz/2013-12-04_1555%20copy.jpg %}" width="756" height="422" />
