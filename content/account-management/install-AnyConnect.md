---
permalink: anyconnect-install/
audit_date: '2020-03-27'
title: Install AnyConnect
type: article
created_date: '2020-03-20'
created_by: Chris Moyer
last_modified_date: '2020-03-27'
last_modified_by: Chris Moyer
product: Account Management
product_url: account-management
---

AnyConnect is a simple and reliable client-to-site VPN solution available for Windows&reg;, Mac&reg;, and various Linux&reg; distributions.

After you obtain an AnyConnect license, and you make the necessary configurations on your firewall, you need to view a corresponding ticket with important information that you need to reference. You might need to request a new username and password, as well. After you receive a username and password, you can install the AnyConnect software client.

Ensure Java is installed before proceeding with the AnyConnect client software installation.

Complete the following steps to install the AnyConnect client software:

1. Determine the WAN Management IP assigned to the firewall’s external interface.

   A ticket update provides this information, but you can also complete the following steps to locate the WAN Management IP address in the MyRackspace portal:

    a. Click the **Network** drop-down tab.

    b. Click **IP Addresses**.

    c. Locate your firewall device and copy the **Primary IPv4** address.
   The **Primary IPv4** is your firewall's management IP and should be a non-RFC1918 public IP address.

2. Open a web browser of your choice, and in the address bar, enter **https://Firewall_Management_IP_Address**.

3. To connect to the page, accept any invalid certification warnings.

   These warnings appear because the firewall uses a self-signed certificate instead
   of a certificate purchased from a trusted CA.

   To avoid the warnings in the future, you can buy a certificate from a CA. Rackspace can apply that certificate to your firewall.

4. At the AnyConnect login prompt, enter the username and password provided in the ticket.

5. If the AnyConnect client software doesn't automatically install, then install it manually.

6. After the AnyConnect software client installs, close the browser session and open Anyconnect.

7. In the **Connection** window, enter the firewall management IP address.

8. After you make the the initial connection, click past the warnings and enter the provided username and password.

   After AnyConnect establishes a VPN session, you can access your servers via their RFC1918 internal/private IP addresses.

   Future AnyConnect version updates automatically install on your local computer when you update software packages on your firewall.

9. To prevent AnyConnect from issuing warnings each time you log in, click the cog wheel button in the bottom left of the AnyConnect client and clear the **Block connections to untrusted servers** checkbox.

If you experience any issues, contact us either via a ticket update or call the toll-free support line.
