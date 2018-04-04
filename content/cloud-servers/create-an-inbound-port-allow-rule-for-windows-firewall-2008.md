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

The following article describes how to make an Inbound port allow rule for Windows Firewall 2008. 

### Prerequisite

[Create a Cloud Server](/how-to/create-a-cloud-server)

### Creating an Inbound Port Allow Rule

** 

1. Launch Windows Firewall with Advanced Security by clicking on **Start > Administrative Tools > Windows Firewall with Advanced Security**.

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/firewalllaunch.png %}" alt="firewalllaunch.png" />

2. Select **Inbound Rules** in the left pane and click **New Rule** under Inbound Rules in the Actions Pane

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrule.png %}" alt="inboundrule.png" />

3. The New Inbound Rule Wizard will launch. Select **Port** and click **Next**.

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport1.png %}" alt="inboundport1.png" />

4. This step of the Wizard specifies which ports the rule is applied to and whether that rule applies to connections established using the TCP and UDP protocol. 

   - If *no* specific ports are applicable, apply the rule to all local ports by selecting **All local ports**.
   - If specifc ports are applicable, select **Specific local ports**, then fill in the port(s), seperating each port with a comma.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport2.png %}" alt="inboundport2.png" />

5. Because this is an allow rule, select whether to allow this traffic over all connections (secure and insecure) or only if the connection is secure. If you require the connection to be secure you can also specify if it also requires Encryption or if it overrides block rules. Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport3.png %}" alt="inboundport3.png" />

6. Select which profiles the rule applies to. 

   - The "Domain" profile applies when the inbound connection is coming from an interface with the "Domain" profile selected. 
   - The "Private" profile applies when the inbound connection is coming from a source network that has selected Private for its profile. 
   - The "Public" profile applies to all connections coming from a source whose profile is set to Public. 
   
   Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrulewiz6.png %}" alt="inboundrulewiz6.png" />

7. Give the rule a name and any description you would like. Click **Finish** to create the rule and go back to the main screen.

### Next steps

[Create an image of a server and restore a server form a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
