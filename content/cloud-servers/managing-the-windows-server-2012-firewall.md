---
permalink: managing-the-windows-server-2012-firewall/
audit_date:
title: Manage the Windows Server 2012 Firewall
type: article
created_date: '2013-04-23'
created_by: Evan Nabors
last_modified_date: '2017-04-14'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article will detail how to perform the most common tasks with the
windows firewall on Windows Server 2012. This includes managing the
firewall settings and creating custom inbound and outbound firewall
rules.

### Manage firewall settings

The Windows Firewall with Advanced Security is a host-based firewall that runs on Windows Server 2012 and is turned on by default. Firewall settings
within Windows Server 2012 are managed from within the Windows Firewall
MMC (Microsoft Management Console). To review and set Firewall settings
perform the following:

1. Open the **Server Manager** from the task bar.

2. In the right-hand side of the top navigation bar, click **Tools** and select **Windows Firewall with Advanced
Security**.

3. First review the current configuration settings by selecting
**Windows Firewall Properties** from the MMC landing page. This allows
access to modify the settings for each of the three firewall profiles,
Domain, Private, and Public, as well as IPSec settings.

### Applying Custom Rules

Custom Rules allow the finest level of control over inbound and outbound
traffic to your Windows Server 2012.

1. If you have not already done so, load the Windows Firewall MMC by
opening the **Server Manager** from the task bar, clicking the
**Tools menu**, and selecting **Windows Firewall with Advanced
Security**.

2. Select either **Inbound Rules** or **Outbound Rules** under **Windows Firewall with Advanced
Security** on the left side of the management console.

   **Note**: This will provide a listing on each of the currently configured firewall rules. Rules that are currently enabled are denoted by green checkbox icon, while disabled rules display a grey checkbox icon. Right-clicking a rule will pull up a menu that will allow you toggle it to enabled/disabled.

3. From the **Actions** pane next to either **Inbound Rules** or **Outbound Rules** section click **New Rule**.

   The new rule wizard launches.

4. Select **Custom** from the Rule Type radial button and click **Next**.

5. Select the Program association for the Custom Firewall Rule as either **All programs** or specify the path to a program and click **Next**.

6. From the **Protocol type** field select the protocol type and click **Next**.

   **Note**: This walkthrough uses TCP on port 80 (HTTP) for example purposes.

   <img src="{% asset_path cloud-servers/managing-the-windows-server-2012-firewall/rule_protocol.png %}" width="733" height="590" />

7. In the **Scope** section of the wizard under “Which local IP addresses does this rule apply to?” specify which local IP addresses will utilize the radio buttons and/or the buttons next to the list pane you wish to apply this rule to. Under “Which remote IP addresses does this rule apply to?”, specify which remote (not on this server) IP addresses utilizing the radio buttons and/or the buttons next to the list pane you wish to apply this rule to.

8. For traffic matching the IP address(es) you specified in the previous step, select whether to **Allow the connection**, **Allow the connection if it is secure**, or **Block the connection** and click **Next**.

   **Note:** If you choose to allow the connection if it is secure, you can customize this further by clicking **Customize**.

9. Select which profiles you want to associate with the custom rule, Domain, Public, or Private, and click **Next**.

10. Provide a name for your Firewall rule and an optional description and click **Finish**.

11. After you finish creating the rule, it is automatically enabled.

   The firewall rule can be found on the corresponding Rule tab, either inbound or outbound depending on the type created. To disable or delete the rule find the rule in the MMC, right-click it, and select either **Disable Rule** or **Delete**.
