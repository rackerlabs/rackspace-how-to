---
permalink: cloud-server-emergency-console/
audit_date: '2019-03-27'
title: Cloud server emergency console
type: article
created_date: '2019-03-27'
created_by: DaPriest Watson
last_modified_date: '2019-03-27'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article covers the basics of the emergency console and how to use it.

### What is the emergency console?

The emergency console serves as a method for connecting to your cloud server instances
as if you were physically plugged into the machine, much like you see on a dedicated server. 

### When and why would I use this?

Most commonly, you use this console in troubleshooting when you are having issues with
remote connections via protocols like Secure Shell (SSH) or Remote Desktop Protocol (RDP). If
you are unable to log in to your cloud instance, you can use this method to open a connection
via the emergency console with your specified user credentials. This method allows you to further
investigate issues with services that may not be running and any other operating system (OS) or
application-level issues that you might be experiencing.  This console is also a useful tool
to quickly check whether an instance is up or for tracking down error messages when you experience boot issues.

### How do I access the emergency console?

Use the following steps to access the emergency console:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. Navigate to **Servers** > **Cloud Servers**.
3. Click the gear icon next to the server you want to connect to.
4. Select **Emergency Console**.

   This step opens a new tab and loads the emergency console.

### Caveats

One of the most common things people see is a blank screen when the console tab opens, which
usually just requires you to click in the screen with your mouse or hit the spacebar or
return carriage on your keyboard.

No copy and paste functionality is available for the console so you aren't able to copy things
from your local workstation into the console window.
