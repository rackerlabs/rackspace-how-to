---
permalink: managing-the-windows-server-2012-firewall/
audit_date:
title: Manage the Windows Server 2012 Firewall
type: article
created_date: '2013-04-23'
created_by: Evan Nabors
last_modified_date: '2013-04-30'
last_modified_by: Evan Nabors
product: Cloud Servers
product_url: cloud-servers
---

This article will detail how to perform the most common tasks with the
windows firewall on Windows Server 2012. This includes managing the
firewall settings and creating custom inbound and outbound firewall
rules.

### Managing Firewall Settings

The Windows Firewall with Advanced Security is a host-based firewall that runs on
Windows Server 2012 and is turned on by default. Firewall settings
within Windows Server 2012 are managed from within the Windows Firewall
MMC (Microsoft Management Console). To review and set Firewall settings
perform the following:

1. Open the **Server Manager** from the task bar.

2. Click the **Tools menu** and select **Windows Firewall with Advanced
Security**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/firewall.png %}" width="747" height="531" /></span>

3. First review the current configuration settings by selecting
**Windows Firewall Properties** from the MMC landing page. This **allows
access to modify the settings** for each of the three firewall profiles,
**Domain, Private, and Public** as well as IPSec settings.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/firewall_properties.png %}" width="664" height="471" />

### Applying Custom Rules

Custom Rules allow the finest level of control over inbound and outbound
traffic to your Windows Server 2012.

1. If you have not done so already load the Windows Firewall MMC by
opening the **Server Manager** from the task bar, clicking the
**Tools menu**, and selecting **Windows Firewall with Advanced
Security**.

2. Select either **Inbound Rules** or **Outbound Rules** under **Windows Firewall with Advanced
Security** on the left side of the management console.

  **Note**: This will provide a listing on each of the currently configured firewall rules. Rules that are
currently enabled are denoted by green checkbox icon, while disabled
rules display a grey checkbox icon. Right-clicking a rule will allow you
toggle enable/disable.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/enable_disable.png %}" width="732" height="520" />

3. From the right side of either the **Inbound Rules** or **Outbound Rules **tab click **New Rule**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/new_rule.png %}" width="734" height="522" />

4. Select **Custom** from the Rule Type radial button and click **Next**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_type.png %}" width="732" height="591" />

5. Select the **Program association** for the Custom Firewall Rule as either All programs or the path to a program and click **Next**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_program.png %}" width="733" height="591" />

6. From the Protocol type field **select the protocol type** and click **Next**.

  **Note**: This walkthrough uses TCP on
port 80 (HTTP) for example purposes.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_protocol.png %}" width="733" height="590" />

7. Select an **IP address association** for both local and remote addresses and click **Next**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_scope.png %}" width="852" height="687" />

8. Select an action to take on matching traffic and click **Next**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_action.png %}" width="852" height="687" />

9. Select the profiles associated with the custom rule and click **Next**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_profile.png %}" width="852" height="688" />

10. Provide a name for your Firewall rule and an optional description and click **Finish**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_name.png %}" width="851" height="688" />

11. Once created, the rule will be enabled. The firewall rule can be found on the corresponding Rule tab, either inbound or outbound depending on the type created. To disable or delete the rule find the rule in the MMC, right-click it, and select either **Disable Rule** or **Delete**.

  <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/custom_disable.png %}" width="851" height="603" />
