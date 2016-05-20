---
permalink: creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/
audit_date:
title: Create an Outbound Port Deny Rule for Windows Firewall (Windows 2008)
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2011-07-05'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

### Creating an Outbound Port Deny Rule

1. Launch Windows Firewall with Advanced Security by clicking on **Start > Administrative Tools > Windows Firewall with Advanced Security**.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/firewalllaunch.png %}" alt="firewalllaunch.png" />

2. Select **Outbound Rules** in the left pane and click **New Rule**.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/OutboundRule.png %}" alt="OutboundRule.png" />

3. The New Outbound Rule Wizard will launch. Select **Port** and click **Next**.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/outboundport1.png %}" alt="outboundport1.png" />

4. This screen is to determine if this rule applies to TCP or UDP
protocol and all ports or specific port(s). Select either TCP or UDP and
then either select all ports or select "Specific local ports:" and fill
in the port(s) separating them with a comma if necessary. Click **Next** to
continue.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/outboundport2.png %}" alt="outboundport2.png" />

5. Since this is for an allow rule you will need to select weather to
allow this traffic for all connections (secure and insecure) or only if
the connection is secure. If you require the connection to be secure you
can also specify if it also requires Encryption or if it overrides block
rules. Click **Next** to continue.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/outboundport3block.png %}" alt="outboundport3block.png" />

6. On this screen you can select which profiles the rule applies to.
Domain applies when the inbound connection is coming from a computer
within the domain. Private applies when the inbound connection is coming
from a source that has selected Private for it's profile. Public applies
to all connections coming from a source whose profile is set to Public.
You can select one, two or all three. Click **Next** to continue.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/outboundrulewiz6.png %}" alt="outboundrulewiz6.png" />

7. This is the screen were you will give the rule a name and any
description you would like to specify. Click **Finish** to create the rule
and go back to the main screen.

  <img src="{% asset_path cloud-servers/creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/outboundrulewiz7.png %}" alt="outboundrulewiz7.png" />
