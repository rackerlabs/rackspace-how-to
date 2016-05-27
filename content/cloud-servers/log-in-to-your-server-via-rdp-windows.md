---
permalink: log-in-to-your-server-via-rdp-windows/
audit_date:
title: Log in to your server via RDP (Windows)
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Cloud Servers](/how-to/cloud-servers)

This article addresses how to connect and log in to your Windows Server
using Microsoft Remote Desktop Protocol.

### Windows and Mac Versions

The screenshots below show how to use RDP via Windows XP. Different
versions of Windows such Windows 7 and Windows 8 will vary slightly,
however the operation of Remote Desktop remains the same across all
versions of Windows.

On a Mac, download and install the Remote Desktop Connection Client for
Mac. The steps to connect to your server are very similar. You can
download the software
[here](https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417?mt=12).

For more information on configuring and running Remote Desktop
Connection for Mac please see this
[link](https://technet.microsoft.com/en-us/library/dn473012.aspx).

Running the Remote Desktop Connection Client

To find Remote Desktop, click **Start > All Programs > Accessories > Communications > Remote Desktop Connection**.

<img src="{% asset_path cloud-servers/log-in-to-your-server-via-rdp-windows/rdp01.PNG %}" alt="rdp01.PNG" />

Enter the IP address of the server and click **Connect**.

<img src="{% asset_path cloud-servers/log-in-to-your-server-via-rdp-windows/rdp02.PNG %}" alt="rdp02.PNG" />

If you would like to set up file transfer or enable your clipboard for
copy/paste, click **Options**.

<img src="{% asset_path cloud-servers/log-in-to-your-server-via-rdp-windows/rdp03.PNG %}" alt="rdp03.PNG" />

Click the **Local Resources** tab, select the Clipboard option, click
**More**, and then click **Drives**.

<img src="{% asset_path cloud-servers/log-in-to-your-server-via-rdp-windows/rdp05.PNG %}" alt="rdp05.PNG" />

Save your session by clicking the General tab, then clicking **Save
As**.

### Log in to Your Server

Once you have connected, you will see the Windows log in screen. To log
in for the first time, enter the Computer Name\\Administrator and the
corresponding password (this is the password that was emailed to you
when your server build was completed).

<img src="{% asset_path cloud-servers/log-in-to-your-server-via-rdp-windows/rdp04.PNG %}" alt="rdp04.PNG" />

Congratulations you have successfully connected and logged in to your
new server!
