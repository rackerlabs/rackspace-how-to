---
permalink: anyconnect-install/
audit_date: '2020-03-20'
title: Install AnyConnect
type: article
created_date: '2020-03-20'
created_by: Chris Moyer
last_modified_date: '2020-03-24'
last_modified_by: Chris Moyer
product: Account Management
product_url: account-management
---

AnyConnect is a simple and reliable client-to-site VPN solution available
for Windows, Mac, and various Linux distributions.

After you license and configure AnyConnect on your firewall, there should be a
corresponding ticket with important information that you will need to reference.
You may need to request that a new username and password be set up, as well. After you
receive a username and password, you can install the AnyConnect software client.

Before you begin, install Java before you install the AnyConnect client software.

Complete the following steps to install the AnyConnect client software:

1. Determine the WAN Management IP assigned to the firewall's external interface.

   This information should be provided in a ticket update, but you can also complete
   the following steps to locate the WAN Management IP address in the MyRackspace portal:

    a. Click the **Network** drop-down tab.

    b. Click **IP Addresses**.

    c. Locate your firewall device and copy the **Primary IPv4** address.
   The **Primary IPv4** is your firewall's management IP and should be a non-RFC1918 public IP address.

2. Open a web browser of your choice, and in the address bar, enter **https://Firewall_Management_IP_Address**.

3. To connect to the page, accept any invalid certifications warnings.

   These warnings appear because the firewall uses a self-signed certificate instead
   of a certificate purchased from a trusted CA.

   To avoid the warnings in the future, you can buy a certificate from a CA. Rackspace can apply that certificate to your firewall.

4. At the AnyConnect login prompt, enter the username and password provided in the ticket.

5. If the AnyConnect client software doesn't automatically install, then install it manually.

6. After the AnyConnect software client installs, close the browser session and open Anyconnect.

7. In the **Connection** window, enter the firewall management IP address.

8. After the initial connection is made, click past the warnings and enter the provided username and password.

   After AnyConnect establishes a VPN session, you can access your servers via their RFC1918 internal/private IP addresses.

   Future AnyConnect version updates automatically install on your local computer when the software packages are updated on your firewall.

9. To prevent AnyConnect from issuing warnings each time you log in, click the cog wheel button in the bottom left of the AnyConnect client and clear the **Block connections to untrusted servers** checkbox.

If you experience any issues, contact us either via a ticket update or call the toll-free support line.
