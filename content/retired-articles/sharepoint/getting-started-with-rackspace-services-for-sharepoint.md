---
permalink: getting-started-with-rackspace-services-for-sharepoint/
audit_date:
title: Get started with Rackspace services for SharePoint
type: article
created_date: '2012-09-24'
created_by: Rae D. Cabello
last_modified_date: '2016-01-26'
last_modified_by: Catherine Richardson
---

### Overview ###

Rackspace offers Cloud Servers images that include SharePoint and SQL
Server pre-installed. These images have been specifically designed to
meet the needs of SharePoint users who are interested in easily
deploying a SharePoint instance for testing.



### Sharepoint images ###

SharePoint Foundation 2010 with:

-   MS SQL Express 2008 R2

<!-- -->

-   MS SQL Standard 2008 R2

SharePoint Foundation 2013 with:

-   MS SQL 2012 Standard



### Setup instructions ###

During the instance build, SharePoint Foundation 2010, MS SQL Express
2008 R2, or MS SQL Standard 2008 R2 are installed in a standalone or
farm configuration based on which image is selected. A default web
application and site collection have been created on a TCP port 80 and
is accessible by the local Administrator account. The Windows Firewall
has been configured to prevent external access to both TCP ports 80 and 443.
 If you would like to allow external access to those ports, please
follow these steps:

1\. First thing you'll do is login as
the **Administrator**, select **Start**, and then open up your **Command
Prompt**.

2\. Next, enter the following string:

    netsh advfirewall firewall add rule name="Open Port 80" dir=in action=allow protocol=TCP localport=80
    netsh advfirewall firewall add rule name="Open Port 443" dir=in action=allow protocol=TCP localport=443

Optionally on Windows 2012 you can launch the Windows PowerShell from
the task bar and enter the following string:


    New-NetFirewallRule -DisplayName "Open Port 443" -Action Allow -Direction Inbound -Enabled True -LocalPort 443 -Protocol TCP
    New-NetFirewallRule -DisplayName "Open Port 80" -Action Allow -Direction Inbound -Enabled True -LocalPort 80 -Protocol TCP

3\. Next, open your preferred browser and head directly to your server's
URL (e.g. http://example.com). Enter your Administrator credentials to
access the default web application.

The Central Administration service has been configured and is running on
a random port on via your cloud server. To access it, start a remote
desktop session with your cloud server, login as the **Administrator**,
select **Start (**or enter the Start Screen on Windows 2012**)**, then
select **SharePoint Central Administration** from the menu. A browser
window will open to the correct URL and port.
