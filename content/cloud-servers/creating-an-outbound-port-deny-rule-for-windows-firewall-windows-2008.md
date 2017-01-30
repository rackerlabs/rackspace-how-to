---
permalink: creating-an-outbound-port-deny-rule-for-windows-firewall-windows-2008/
audit_date:
title: Create an Outbound Port Deny Rule for Windows Firewall (Windows 2008)
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article shows how to create an outbound port deny rule for Windows Firewall (Windows 2008).

1. Launch Windows Firewall with Advanced Security by clicking on **Start > Administrative Tools > Windows Firewall with Advanced Security**.

2. Select **Outbound Rules** in the left pane and click **New Rule**.

3. The New Outbound Rule Wizard launches. Select **Port** and click **Next**.

4. This screen is to determine if this rule applies to TCP or UDP
protocol and all ports or specific port(s). Select either TCP or UDP and
then either select all ports or select "Specific local ports:" and fill
in the port(s) separating them with a comma if necessary. Click **Next** to
continue.

5. Since this is for an allow rule you will need to select weather to
allow this traffic for all connections (secure and insecure) or only if
the connection is secure. If you require the connection to be secure you
can also specify if it also requires Encryption or if it overrides block
rules. Click **Next** to continue.

6. On this screen you can select which profiles the rule applies to.
Domain applies when the inbound connection is coming from a computer
within the domain. Private applies when the inbound connection is coming
from a source that has selected Private for it's profile. Public applies
to all connections coming from a source whose profile is set to Public.
You can select one, two or all three. Click **Next** to continue.

7. This is the screen were you will give the rule a name and any
description you would like to specify. Click **Finish** to create the rule
and go back to the main screen.
