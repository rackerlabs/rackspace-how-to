---
permalink: adding-an-ip-to-a-windows-server/
audit_date:
title: 'Adding an IP to a Windows Server'
type: article
created_date: '2020-05-04'
created_by: Travis Cook
last_modified_date:
last_modified_by:
product: Cloud Servers
product_url: cloud-servers
---


## Adding an IP to a Windows Server

In the event that the IP you have requested was not added automatically through automation, the following article will walk you through the steps to manually add the IP to your server. 

**NOTE:** You will need to request a new IP via ticket in order to have an an additional IP.

The two methods that will be covered will be adding via PowerShell and adding it through the Windows GUI (Graphical User Interface)

### PowerShell Method:

Windows 2012+
1. Open Windows Powershell by using the following steps:
    * Press the **Windows Key** and **R** on the keyboard to open the **Run** dialog box.
    * Enter **powershell.exe** and press **Enter**.
2. Command:  `New-NetIPAddress -InterfaceAlias "AdapterName" -IPAddress IPAddress -PrefixLegnth ##` (Subnet Mask CIDR Format without slash)
Command Example: 
```New-NetIPAddress -InterfaceAlias "Public" -IPAddress 192.168.100.112 -PrefixLegnth 24```


### GUI Method:

1. Open the Windows Control Panel.
2. Navigate to **Network and Internet** > **Network and Sharing Center** > **Change Adapter Settings**.
3. Right-click the neword adapter associated with the public interface and click properties.
4. Double-click Internet Protocol Version 4(TCP/IPV4)
6. Click on Advanced.
7. Under **IP Adresses**, click **Add**.
8. Type in the new IP.
9. Click Apply to save the new IP address.

## Verifying the new IP address

1. Open Windows Powershell by using the following steps:
    * Press the **Windows Key** and **R** on the keyboard to open the **Run** dialog box.
    * Enter **powershell.exe** and press **Enter**.
2. Enter the command `ping <ipaddress>` replacing **<ipaddress>** with the newly added IP.
3. A successful response indicates the IP address was added successfully.
