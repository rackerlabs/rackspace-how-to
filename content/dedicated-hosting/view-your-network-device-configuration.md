---
permalink: view-your-network-device-configuration/
audit_date: '2017-01-08'
title: View your network device's configuration
type: article
created_date: '2017-12-21'
created_by: Trevor Becker
last_modified_date: '2017-01-08'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

The MyRackspace portal contains a self-service feature that enables you to download a copy of your firewall's or load balancer's running configuration. You can use this feature for your documentation and auditing purposes.

### Viewing your network device's configuration

1. Log in to the [MyRackspace customer portal](https://my.rackspace.com/portal/auth/login) by using your account number, username, and password.

2. In the top navigation bar click **Products** > **Devices**.

   <img src="{% asset_path dedicated-hosting/view-your-network-device-configuration/net-device-config-device.png %}" />

3. On the **Devices** page, click the gear icon to the left of the network device to view action options.

   If you can not find your network device, use the search box on the top right of the page. Search for the term **Firewall** or **Load Balancer**.

   <img src="{% asset_path dedicated-hosting/view-your-network-device-configuration/net-device-config-action.png %}" />

4. Click **Download Network Config...**.

   The length of the download depends on the size of your network device's configuration. After the download is complete, the configuration is located your browser's download folder as a **.txt** file.

   **Note:** The network device's configuration contains sections named **REMOVED**. These fields have been removed because they contain Rackspace specific infrastructure settings.


### Viewing client VPN users within your firewall's configuration

Client virtual private network (VPN) users are stored in the firewall's running configuration. The struture of a client VPN user is the following:

    Syntax:  username <username> password <password>
    Example: username rackspace-test password Abc123

If you want to perform a client VPN user audit of your firewall, perform the steps in the “Viewing your network device’s configuration” section, and search through the document for the client VPN syntax shown above.
