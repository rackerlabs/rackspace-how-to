---
permalink: view-your-network-device-configuration/
audit_date: '2017-01-08'
title: View your network device's configuration
type: article
created_date: '2017-12-21'
created_by: Trevor Becker
last_modified_date: '2019-04-30'
last_modified_by: Stephanie Fillmon
product: Dedicated Hosting
product_url: dedicated-hosting
---

The MyRackspace Portal contains a self-service feature that enables you to
download a copy of your firewall's or load balancer's running
configuration. You can use this feature for your documentation and
auditing purposes.

### View the configuration of your network device

1. Log in to the [MyRackspace Portal](https://login.rackspace.com/) by
   using your username and password.

2. In the top navigation bar click **Select a Product > Dedicated Hosting**.

3. Select **Products** > **Devices**.

4. On the **Devices** page, click the gear icon to the left of the network
   device to view action options.

   If you cannot find your network device, use the search box on the top right
   of the page. Search for the term **Firewall** or **Load Balancer**.

5. Click **Download Network Config**.

   The length of the download depends on the size of your network device's
   configuration. After the download is complete, the configuration is
   located in your browser's download folder as a **.txt** file.

   **Note:** The network device's configuration contains sections
   named **REMOVED**. These fields have been removed because they contain
   Rackspace-specific infrastructure settings.


### View client VPN users within your firewall's configuration

Client virtual private network (VPN) users are stored in the firewall's running
configuration. The structure of a client VPN user is as follows:

    Syntax:  username <username> password <password>
    Example: username rackspace-test password Abc123

If you want to perform a client VPN user audit of your firewall, perform the
steps in the “View the configuration of your network device” section, and search
through the document for the client VPN syntax shown above.
