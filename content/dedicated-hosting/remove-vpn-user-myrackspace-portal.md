---
permalink: remove-vpn-user-myrackspace-portal/
audit_date: '2017-11-03'
title: Remove a VPN user in the MyRackspace Portal
type: article
created_date: '2017-10-16'
created_by: Trevor Becker
last_modified_date: '2017-11-03'
last_modified_by: Stephanie Fillmon
product: Dedicated Hosting
product_url: dedicated-hosting
---

Removing a client VPN user is now an automated task within the MyRackspace portal. You can use the **Delete contact** ticket template to not only remove a user from the MyRackspace Portal account contacts list and phone support, but also to delete automatically the client VPN user from all of your Rackspace dedicated firewalls. This article describes how to remove a VPN user by using a ticket template.

### Remove VPN user location

1. Log in to the [MyRackspace customer portal](https://my.rackspace.com/portal/auth/login).

   You will need your Rackspace account number, as well as your username and password.

2. In the top navigation bar, click on the **Tickets** tab, and select **Create Ticket**.

3. On the **Create New Ticket** page, click the **Subject** text field, and in the drop down menu, select **Delete Contact**.

   <img src="{% asset_path dedicated-hosting/remove-vpn-user-myrackspace-portal/delete-contact.png %}" />

4. Complete the following fields:

    a. Select the contact name in the drop-down field.

    b. Select the **MyRackspace Portal + Phone Support + Systems & Devices** option.

    c. Fill in the name of the VPN user you want to delete.

       **Note:** You can obtain a list of currently configured client VPN users by [downloading your firewall's configuration](https://community.rackspace.com/products/f/43/t/5892).

5. Click **Create Ticket**.

   <img src="{% asset_path dedicated-hosting/remove-vpn-user-myrackspace-portal/ticket-details.png %}" />

### Automation process

After you create a ticket, the automation process begins. The following overview describes
the automation process:

1. The automation creates an array of all the firewalls on your account.

2. The automation then sends the commands to remove the VPN user specified from
all firewalls within the array.

3. The ticket is updated and closed if there are no errors.

   If errors exist, the ticket generates in the Network Security queue, where a Network
   Security Racker completes the task manually.

   **Note:** This process can take longer to complete if the ticket is sent to Network Security.
