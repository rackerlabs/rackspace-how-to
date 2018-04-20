---
permalink: managing-the-windows-server-2012-firewall/
audit_date: '2018-04-19'
title: Manage the Windows Server 2012 firewall
type: article
created_date: '2013-04-23'
created_by: Evan Nabors
last_modified_date: '2017-04-19'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article details how to perform the most common tasks with the firewall on Windows Server 2012. The tasks described include managing the firewall settings and creating custom inbound and outbound firewall rules.

### Manage firewall settings

The Windows Firewall with Advanced Security is a host-based firewall that runs on Windows Server 2012 and is turned on by default. Firewall settings within Windows Server 2012 are managed from within the Windows Firewall Microsoft Management Console (MMC). To review and set the Windows Firewall settings, perform the following steps:

1. Open the **Server Manager** from the task bar.

2. On the right-hand side in the top navigation bar, click **Tools** and select **Windows Firewall with Advanced
Security**.

3. Review the current configuration settings by selecting **Windows Firewall Properties** from the MMC landing page. You can access and modify the settings for each of the three firewall profiles, Domain, Private, and Public, as well as IPSec settings.

### Applying custom rules

Custom rules allow the finest level of control over inbound and outbound traffic to your Windows Server 2012. To apply custom rules, use the following steps:

1. If you have not already done so, load the Windows Firewall MMC by
opening the **Server Manager** from the task bar, clicking the
**Tools menu**, and selecting **Windows Firewall with Advanced
Security**.

2. Select either **Inbound Rules** or **Outbound Rules** under **Windows Firewall with Advanced
Security** on the left side of the MMC.

   **Note**: This step provides a listing of each of the currently configured firewall rules. Rules that are currently enabled are denoted by a green checkbox icon, while disabled rules display a grey checkbox icon. Right-clicking a rule pulls up a menu that allows you toggle the rule to enabled or disabled.

3. From the **Actions** pane next to either the **Inbound Rules** or **Outbound Rules** section, click **New Rule**.

   The new rule wizard launches.

4. Select **Custom** from the Rule Type radial button and click **Next**.

5. From the **Program** section, select the Program association for the custom firewall rule as either **All programs** or specify the path to a program and click **Next**.

6. In the **Protocol and Ports** section, select the Protocol type and click Next.

   **Note**: This walkthrough uses TCP on port 80 (HTTP) for example purposes.

7. In the **Scope** section under “Which local IP addresses does this rule apply to?,” specify the local IP addresses that utilize the radio buttons or the buttons next to the list pane for which you want to apply this rule. Under “Which remote IP addresses does this rule apply to?,” specify the remote IP addresses that utilize the radio buttons or the buttons next to the list pane for which you want to apply this rule.

8. For traffic matching the IP address or addresses that you specified in the previous step, select  **Allow the connection**, **Allow the connection if it is secure**, or **Block the connection** and click **Next**.

   **Note:** If you choose to allow the connection if it is secure, you can customize this further by clicking **Customize**.

9. Select the profiles that you want to associate with the custom rule, Domain, Public, or Private, and click **Next**.

10. Provide a name for your firewall rule and an optional description and click **Finish**.

11. After you finish creating the rule, it is automatically enabled.

The firewall rule is on the corresponding **Rule** tab as either an inbound or outbound rule depending on the type that was created. To disable or delete the rule, find the rule in the MMC, right-click it, and select either **Disable Rule** or **Delete**.
