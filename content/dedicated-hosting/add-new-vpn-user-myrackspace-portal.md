---
permalink: add-new-vpn-user-myrackspace-portal/
audit_date: '2019-10-22'
title: Add a new VPN user in the MyRackspace Portal
type: article
created_date: '2016-11-10'
created_by: Trevor Becker
last_modified_date: '2019-10-22'
last_modified_by: Trevor Becker
product: Dedicated Hosting
product_url: dedicated-hosting
---

Adding new client VPN users is now an automated task within the MyRackspace
Portal. This article describes how to add a new VPN user by using a ticket
template.

### Create a ticket in the MyRackspace Portal

1. Log in to the [MyRackspace Portal](https://login.rackspace.com) by using your
   username and password.

2. In the top navigation bar, click **Select a Product > Dedicated Hosting**.

3. Select **Tickets > Create New Ticket**.

4. On the **Create New Ticket** page, click the **Subject** text field, and in
   the drop down menu, select **VPN User Management - add, reset, delete VPN user(s) on firewall(s)**.

   <img src="{% asset_path dedicated-hosting/add-new-vpn-user-myrackspace-portal/image001.png %}" />

5. Check the box next to **Create new VPN user on firewall**.

6. In the **Firewall** dropdown field, select the appropriate firewall(s).

   a. If you have HA firewalls, you may select only one firewall in the dropdown.
   Automation will add the user to both firewalls.

   b. If you need to add the VPN user to all firewalls on the account, ensure
   you select all firewalls in this field.

7. Enter your desired VPN username in the **VPN Username** field.

   a. The VPN username is case-sensitive and require at least 3 characters.

   b. Do not include the question mark (?) or a space ( ) within the VPN username field.

8. The **Generate Random Password** box is checked by default. If you would like
   to add a custom password, un-check this box.

   Once un-checked, the custom password field is displayed.

   This password must have at least 8 characters with uppercase, lowercase,
   numbers, and special characters.

9. Click the **Create Ticket** button at the bottom of the page.

   After the ticket is created, you are redirected back to your ticket list in
   the MyRackspace Portal. Automation runs in the background while the ticket is
   created, which typically takes less than a minute to complete. After you
   refresh your browser, the ticket *Create New VPN User on Firewall Request (from template)* is in **Confirm Solved** status.

10. Retrieve the password for your new VPN user by opening the ticket. The
    password is in the most recent comment.

   <img src="{% asset_path dedicated-hosting/add-new-vpn-user-myrackspace-portal/image002.png %}" />

### Limitations

VPN user automation currently does not allow for the following modifications:

- VPN-filters
- Group-lock
- Framed IP addresses

If you need changes included in the list of limitations, open a ticket so that
Rackspace Support can process your request manually.
