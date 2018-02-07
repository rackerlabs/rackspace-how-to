---
permalink: run-a-trace-route/
audit_date: '2018-02-07'
title: Run a trace route
type: article
created_date: '2018-01-15'
created_by: William Loy
last_modified_date: '2018-02-07'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
--- 

Trace routes help identify connectivity issues when you are trying to connect to your Rackspace Email mailbox.


### Prerequisites

- **Applies to:** Administrator or User
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:** Access to the computer experiencing connectivity issues

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

A trace route illustrates the path created between your personal device and our mail server. Trace routes are useful in scenarios where the connection issue seems to be intermittent.

**Warning:** A trace route is only effective if it is performed at the exact time that you are experiencing connectivity issues. It might be necessary to capture a trace route for several different occurrences of the issue.


#### Run a trace route on Windows

1. Go to the Windows Start menu in the lower left side of your desktop. Search for **Command Prompt**.

2. Open the **Command Prompt** application.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/command_prompt.png %}"/>

3. Enter the command `tracert secure.emailsrvr.com`.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/secure_emailsrvr_trace.png %}"/>

4. At the command prompt, a list of times and server names displays. When complete, a trace route ends with `Trace complete.`


#### Run a trace route on Mac

1. Go to the Spotlight tool for Mac. Search for **Terminal**.

2. Open the **Terminal** application.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/terminal.png %}"/>

3. Enter the command ```traceroute secure.emailsrvr.com```.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/secure_emailsrvr.png %}"/>

   A list of times and server names displays.


#### Identifying issues

A trace route shows the sequential server hops taken to reach a server, in addition to the time it took to complete each hop. When reviewing a trace route, you are typically looking for a delay or a failure in the trace progression.

For example, if the average hop is between 1 and 50 milliseconds and you see a hop the takes 1000 milliseconds, you have identified a delay in connection.

If the trace does not complete, it might be a sign of connection issues.


#### Correcting connection issues

Trace routes most often identify a specific network where the connection issue is occurring. After you have identified the offending network, you should provide this information to your network administrator for that identified network. This might be your Internet service provider, your business's local network administrator, or your email administrator. Notify them of the issue for further direction in resolving the issue.
