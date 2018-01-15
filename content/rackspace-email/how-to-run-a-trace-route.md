---
permalink: how-to-run-a-trace-route/
audit_date:
title: How to run a trace route
type: article
created_date: 2018-01-15
created_by: William Loy
last_modified_date: '2018-01-15'
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

**Warning:** A trace route is only effective if it is performed at the exact time you are experiencing connectivity issues.

#### Run a trace route on Windows

1. Go to the Windows Start Menu in the lower left hand of your desktop. Search **Command Prompt**.

2. Open the **Command Prompt** application.

3. Enter the command ```tracert secure.emailsrvr.com```.

4. The command prompt will output a list of times and server names. When complete a trace route will end with ```Trace complete.```.
