---
permalink: cloud-server-emergency-console/
audit_date: 
title: Cloud Server Emergency Console
type: article
created_date: '2019-03-27'
created_by: DaPriest Watson
last_modified_date: '2019-03-27'
last_modified_by: DaPriest Watson
product: Cloud Servers
product_url: cloud-servers
---
## Cloud Server Emergency Console

This article will cover the basics of the Emergency Console and how to use it.

#### What is the Emergency Console?
The emergency console serves as a method of connecting to your cloud server instances as if you were physically plugged into the machine, much like you would see on a dedicated server. 

#### When/Why would I use this?
Most commonly this is used in troubleshooting when you are having issues with remote connections via protocols like SSH (Secure Shell) or RDP (Remote Desktop Protocol). If you are unable to log into your cloud instance, you can use this method to open a connection via the emergency console with your specified user credentials. This would allow you to further investigate issues with services that may not be running and any other OS/Application level issues that you may be experiencing.  It is also a useful tool to quickly check whether an instance is up or for tracking down error messages when experiencing boot issues.

#### How do I access the Emergency Console?
1. Log into the [Cloud Control Panel](https://login.rackspace.com).
2. Navigate to Servers > Cloud Servers.
3. Click the "Gear" icon next to the server you want to connect to.
4. Select "Emergency Console".

This will open a new tab and load the emergency console.

#### Caveats
One of the most common things people see is a blank screen when the console tab opens. This usually just requires you to click in the screen with your mouse or hitting the spacebar or return carriage on your keyboard.

There is no copy/paste functionality for the console so you won't be able to copy things from your local workstation into the console window.
