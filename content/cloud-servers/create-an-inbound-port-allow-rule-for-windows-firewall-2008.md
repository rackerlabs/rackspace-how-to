---
permalink: create-an-inbound-port-allow-rule-for-windows-firewall-2008/
audit_date:
title: Create an Inbound port allow rule for Windows Firewall 2008
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-11-07'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Create a Cloud Server](/how-to/create-a-cloud-server)

### Creating an Inbound Port Allow Rule

1. Launch Windows Firewall with Advanced Security by clicking on **Start > Administrative Tools > Windows Firewall with Advanced Security**.

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/firewalllaunch.png %}" alt="firewalllaunch.png" />

2. Select **Inbound Rules** in the left pane and click **New Rule** under Inbound Rules in the Actions Pane

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrule.png %}" alt="inboundrule.png" />

3. The New Inbound Rule Wizard will launch. Select **Port** and click **Next**.

   <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport1.png %}" alt="inboundport1.png" />

4. This screen is to determine if this rule applies to TCP or UDPprotocol and all ports or specific port(s). Select either TCP or UDP and then either select all ports or select "Specific local ports:" and fill in the port(s) separating them with a comma if necessary. Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport2.png %}" alt="inboundport2.png" />

5. Since this is for an allow rule you will need to select weather to allow this traffic for all connections (secure and insecure) or only if the connection is secure. If you require the connection to be secure you can also specify if it also requires Encryption or if it overrides block rules. Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundport3.png %}" alt="inboundport3.png" />

6. On this screen you can select which profiles the rule applies to. Domain applies when the inbound connection is coming from a computer within the domain. Private applies when the inbound connection is coming from a source that has selected Private for it's profile. Public applies to all connections coming from a source whose profile is set to Public. You can select one, two or all three. Click **Next** to continue.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrulewiz6.png %}" alt="inboundrulewiz6.png" />

7. This is the screen were you will give the rule a name and any description you would like to specify. Click **Finish** to create the rule and go back to the main screen.

    <img src="{% asset_path cloud-servers/create-an-inbound-port-allow-rule-for-windows-firewall-2008/inboundrulewiz7.png %}" alt="inboundrulewiz7.png" />

That covers the basics of what you need to know for connecting to, and
setting up security for both Linux and Windows Cloud Servers.  If you
have made it through this entire guide, you know that this is a somewhat
complicated process with, a lot of potentially new information to
digest. The good news is that, if you use your server's backup
capabilities wisely, you should only have to go through these steps
once.  

In the next article we show you how to save an image after of your
Cloud Server. This is extremely useful for when you build your next
server, you can use the saved image with the security already
configured.

### Next steps

[Create an image of a server and restore a server form a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
