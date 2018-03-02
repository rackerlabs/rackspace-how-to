---
permalink: set-an-archiving-retention-policy/
audit_date:
title: Set an Archiving Retention Policy
type: article
created_date: '2018-03-01'
created_by: William Loy
last_modified_date: '2018-03-01'
last_modified_by: William Loy
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---

This article describes how to set a retention policy in your email archive. This feature can be useful for companies that enact polices that only allow the retention of email records for a certain duration of time.


### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).


### Set an archive retention policy

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) by using your Rackspace Cloud Office admin ID and password.
2. Scroll down to the **Domains** section. In the far right column of this sections click the link titled **Email Archiving**

   <img src="{% asset_path rackspace-email-archiving/set-an-archiving-retention-policy/domains_archive.png %}" />

3. Locate and click the domain you want to enable a retention policy for.
4. Click the **Manage My Archive** button. You will be taken to the dashboard for the domain's archive.

   <img src="{% asset_path rackspace-email-archiving/set-an-archiving-retention-policy/manage_archive.png %}" />

5. Click **Admin** in the upper right hand corner.

   <img src="{% asset_path rackspace-email-archiving/set-an-archiving-retention-policy/admin_tab.png %}" />

6. Click the **Policies** tab at the top of the screen.

   <img src="{% asset_path rackspace-email-archiving/set-an-archiving-retention-policy/policies.png %}" />

7. Check the box to right of **Enable Retention Policy**. Set the duration you would like items to be retained in the email archive.

    **Warning:** Any items older than the set retention duration will be immediately purged from the archive and be unrecoverable. Items that later exceed the retention duration will also be permanently deleted.

    <img src="{% asset_path rackspace-email-archiving/set-an-archiving-retention-policy/enable_retention.png %}" />

8. Confirm that you want to implement the retention policy by clicking **OK**.

    <img src="{% asset_path rackspace-email-archiving/set-an-archiving-retention-policy/warning.png %}" />

Archive retention polices should only be created for specific reasons. There is no need to keep your archive under a certain data limit should you choose to not have a retention policy.
