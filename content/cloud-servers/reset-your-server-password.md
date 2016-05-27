---
permalink: reset-your-server-password/
audit_date:
title: Reset Your Server Password
type: article
created_date: '2012-07-19'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Create a Cloud Server](/how-to/create-a-cloud-server)

An extremely important aspect of managing your server is controlling the
(Linux) **root** or (Windows) **Administrator** account password. You
can always reset it through the [Cloud Control Panel](http://mycloud.rackspace.com).

**Note:** Changing the server password may also initiate a system
reboot. Make sure all your configuration changes on your machine have
been saved before resetting your password, or they will not take effect.

-   First Generation Linux servers will reboot after a password change.
-   Next Generation servers do not require or initiate a reboot after a
    password change.

### Reset your server password

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. Click the gear icon next to the server for which you want to
change the password.

3. Under "Manage", click **Change Password**.

  <img src="{% asset_path cloud-servers/reset-your-server-password/CCP-change-password.png %}" alt="" />

4. Enter the new password and click **Save Password**.

  <img src="{% asset_path cloud-servers/reset-your-server-password/CCP-input-new-password.png %}" alt="" />

After you enter the new password, your server will reboot and the new
password will be set.

### Next section

[Deleting your server](/how-to/deleting-your-server)
