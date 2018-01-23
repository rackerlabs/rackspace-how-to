---
permalink: how-to-run-a-trace-route/
audit_date:
title: How to run a trace route
type: article
created_date: 2018-01-15
created_by: William Loy
last_modified_date: '2018-01-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Trace routes help identify connectivity issues when trying to connect to your Rackspace Email mailbox.


### Prerequisites

- **Applies to:** Administrator or User
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:** Access to computer experiencing connectivity issues

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).


A Trace route illustrates the path created between your personal device and our mail server. Trace routes are useful in scenarios where the connection issue appears to be intermittent.

**Warning:** A trace route is only effective if it is performed at the exact time you are experiencing connectivity issues. It may be necessary to capture a trace route on several different occurrences of the issue.

#### Run a trace route on Windows

1. Go to the Windows Start Menu in the lower left hand of your desktop. Search **Command Prompt**.

2. Open the **Command Prompt** application.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/command_prompt.png %}"/>

3. Enter the command ```tracert secure.emailsrvr.com```.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/secure_emailsrvr_trace.png %}"/>

4. The command prompt will output a list of times and server names. When complete a trace route will end with ```Trace complete.```.




#### Run a trace route on Mac

1. Go to the spotlight tool for Mac. Search **Terminal**.

2. Open the **Terminal** application.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/terminal.png %}"/>

3. Enter the command ```traceroute secure.emailsrvr.com```.

    <img src="{% asset_path rackspace-email/how-to-run-a-trace-route/secure_emailsrvr.png %}"/>

4. The command prompt will output a list of times and server names.


#### Identifying issues

 A trace route will show the sequential server "hop" taken to reach our server in addition to the time it took to complete each hop. When reviewing a trace route we are typically looking for a delay or a failure in the trace progression.

 For example, if the average hop is between 1 and 50 milliseconds and you see a hop the takes 1000 milliseconds we have just identified a delay in connection.

 If the trace does not complete, this is also indicative of a connection issues.

#### Correcting connection issues

 Trace routes most often identify a specific network where the connection issue is occurring. Once you have identified the offending network, you should provide this information to your network administrator for that identified network.

 This could be your Internet Service Provider, your business's local network administrator, or you email administrator. Notify them of the issue for further direction in resolving the issue.
