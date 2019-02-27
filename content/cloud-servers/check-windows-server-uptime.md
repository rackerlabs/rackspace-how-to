---
permalink: check-windows-server-uptime/
audit_date: '2019-01-15'
title: Check Windows Server uptime
type: article
created_date: '2019-01-15'
created_by: Shaun Crumpler
last_modified_date: '2019-01-15'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

You can check the uptime of your Windows&reg; Server&reg; from the command line by running either the `net statistics server` 
or the `systeminfo` command.

### Use the net statistics server command

In addition to uptime, the `net statistics server` command also displays statistics for the system, such as the number of 
files that are being accessed, systems errors, permission violations, password violations, and the total uptime since the last 
time the server was restarted. Use the following steps to check server uptime by using the `net statistics server` command:

1. [Connect to your cloud server](/how-to/connect-to-a-cloud-server/) on the command line.
2. Type `net statistics server` and press **Enter**.

   **Note**: You can also shorten this command to `net stats srv`.
   
3. Look for the line that starts with `Statistics since`, which indicates the date and time when the uptime started.

### Use the systeminfo command

The `systeminfo` command reports the following additional information about the operating system (OS) 
that is installed on the server:

- `Host Name`
- `OS Name`
- `OS Version`
- `Original Install date`
- `System Boot Time`
- `System Time`
- `Timezone`
- `Total Physical Memory`
- `Virtual Memory: Max Size`
- `Virtual Memory: Available`
- `Virtual Memory`
- `Network Card`

Use the following steps to check server uptime by using the `systeminfo` command:

1. [Connect to your cloud server](/how-to/connect-to-a-cloud-server/) on the command line. 
2. Type `systeminfo` and press **Enter**.
3. Look for the line that starts with `Statistics since`, which indicates the date and time when the uptime started.
