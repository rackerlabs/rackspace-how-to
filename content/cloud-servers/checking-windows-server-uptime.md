---
permalink: checking-windows-server-uptime
audit_date:
title: Checking Windows Server Uptime
created_date: '2019-01-14'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

To check the uptime on your windows server you can run "net statistics server" or "systeminfo".

"net statistics server" also reports statistics for the system for example the number of files being accessed, systems errors, permission violations, password violations, and the total uptime from the last time the server was restarted. Checking uptime via net statistics server:
1. Go to **Start** -> **Run**.
2. Write **CMD** and press on **Enter** key.
3. Write the command **net statistics server** and press **Enter**.
4. The line that start with **Statistics since …** provides the time that the server was up from.
You can also use **net stats srv**.
Systeminfo reports more information about the server OS that is installed. For example it reports hostname, OS Name, OS Version, Original Install date, System boot time, System Time, Timezone, total physical memory, Virtual Memory: Max Size, Virtual Memory: Available, Virtual Memory, and Network Card(s). Checking uptime via systeminfo:
1. Go to **Start** -> **Run**.
2. Write **CMD** and press on **Enter** key.
3. Write the command **net statistics server** and press on **Enter** key.
4. The line that start with **Statistics since …** provides the time that the server was up from.
