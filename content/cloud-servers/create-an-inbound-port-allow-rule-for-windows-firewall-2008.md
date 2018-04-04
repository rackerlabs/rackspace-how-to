---
permalink: create-an-inbound-port-allow-rule-for-windows-firewall-2008/
audit_date: '2018-04-04'
title: Create an Inbound port allow rule for Windows Firewall 2008
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-04-04'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to create an Inbound port allow rule for Windows Firewall 2008. 

1. Launch Windows Firewall with Advanced Security by clicking **Start > Administrative Tools > Windows Firewall with Advanced Security**.

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/firewalllaunch.png %}" alt="firewalllaunch.png" />

2. Select **Inbound Rules** in the left pane and click **New Rule** under Inbound Rules in the Actions Pane

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrule.png %}" alt="inboundrule.png" />

3. The **New Inbound Rule Wizard** will launch. Select **Port** and click **Next**.

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport1.png %}" alt="inboundport1.png" />

4. This step of the Wizard specifies which ports the rule is applied to and whether that rule applies to connections established using the TCP and UDP protocol. 

   - If *no* specific ports are applicable, select **All local ports** to apply the rule to all local ports.
   - If specifc ports are applicable, select **Specific local ports**, and then fill in the port(s), seperating each port with a comma.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport2.png %}" alt="inboundport2.png" />

5. Because this is an allow rule, select whether to allow traffic over all connections (secure and insecure) or only secure connections. If you require a secure connection, you can specify whether it also requires encryption, or if it overrides block rules. Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport3.png %}" alt="inboundport3.png" />

6. Select the profiles to which this rule applies. 

   - The *Domain* profile applies when the inbound connection is coming from another interface with the *Domain* profile selected. 
   - The *Private* profile applies when the inbound connection is coming from a source network with the *Private* profile selected. 
   - The *Public* profile applies to all connections coming from a source with the *Public* profile selected. 
   
   Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrulewiz6.png %}" alt="inboundrulewiz6.png" />

7. Give the rule a name and any description that you want. Click **Finish** to create the rule and go back to the main screen.

### Related information


- [Create a Cloud Server](/how-to/create-a-cloud-server)
- [Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
