---
permalink: add-new-vpn-user-myrackspace-portal/
audit_date: '2018-03-06'
title: Add a new VPN user in the MyRackspace Portal
type: article
created_date: '2016-11-10'
created_by: Trevor Becker
last_modified_date: '2018-03-08'
last_modified_by: Cat Lookabaugh
product: Dedicated Hosting
product_url: dedicated-hosting
---

Adding new client VPN users is now an automated task within the MyRackspace portal. This article describes how to add a new VPN using a ticket template.

### Create a ticket in the MyRackspace portal

1. Log in to the [MyRackspace customer portal](https://my.rackspace.com/portal/auth/login).

   You will need your Rackspace account number, as well as your username and password.

2. In the top navigation bar, click **Create Ticket**.

3. On the **Create New Ticket** page, click the **Subject** text field, and, in the drop down menu, select **Create New VPN User on Firewall**.

   <img src="{% asset_path dedicated-hosting/add-new-vpn-user-myrackspace-portal/add-new-vpn-user-select-ticket.png %}" />

4. Enter your desired VPN username in the **VPN Username** field, and then select the firewall(s) to which you want to add the new user. Then, click **Create Ticket**.

   Do not include the question mark (?) or a space ( ) within the VPN username field.

   VPN user automation can generate a secure password for the username you entered, or you can create a custom password. This password must have at least 8 characters with uppercase, lowercase, numbers, and special characters.

   After the ticket is created, you are redirected back to your ticket list in the MyRackspace portal. Automation runs in the background while the ticket is created, which typically takes less than a minute to complete. After you refresh your browser, the ticket *Create New VPN User on Firewall Request (from template)* is in **Confirm Solved** status.

5. Retrieve the password for your new VPN user by opening the ticket. The password is in the most recent comment.

### Limitations

VPN user automation currently does not allow for the following modifications:

- VPN-filters
- Group-lock
- Framed IP addresses

If you need changes included in the list of limitations, open a ticket so that Rackspace Support can process your request manually.
