---
permalink: troubleshoot-remote-desktop-services/
audit_date: '2020-06-30'
title: 'Troubleshoot Remote Desktop services'
type: article
created_date: '2020-06-10'
created_by: Paola Howard
last_modified_date: '2020-06-11'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to troubleshoot problems with Microsoft&reg; Remote Desktop Protocol (RDP).

### Log in by using the Emergency Console

To access the Emergency Console, see [Start a console session](https://support.rackspace.com/how-to/start-a-console-session/).

If you can't log in by using the Emergency Console, reset your *Administrator* user password. For help, see
[How to change your server root admin password from your account](https://support.rackspace.com/how-to/how-to-change-your-server-rootadmin-password-from-your-account/).

### Check to see if the Remote Desktop Service is running

After you access the server by using the Emergency Console, ensure the RDP service is running. Use the following steps:

1. To access services, navigate to **Start** menu, click **Run**, enter **services.msc**, and click **OK**.

2. Look for **Remote Desktop Services** in the list of services and ensure the status shows as **Running**.

3. If the service shows **Stopped**, right-click the service and choose **Start** to restart the service.

### Check the Windows Firewall with Advanced Security to ensure the connection is allowed

1. To access the Windows&reg; firewall, navigate to **Server Manager > Tools > Windows Firewall with Advanced Security**.

2. This screen shows you which profiles are enabled. Ask the user for their local IP address to add to the
   **Remote Desktop** rule.

### Check the authentication logs

**Note:** Use this step for situations where a specific user cannot log in by using RDP.

1. To find the authentifcation logs, navigate to **Server Manager > Tools > Event Viewer > Windows Logs > Security**.

2. Use the username of the affected user to search the logs for a specific error message to help determine
   the best course for continuing to troubleshoot the issue.
