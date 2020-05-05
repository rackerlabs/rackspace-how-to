---
permalink: adding-an-ip-to-a-windows-server/
audit_date: '2020-05-05'
title: 'Adding an IP to a Windows Server'
type: article
created_date: '2020-05-04'
created_by: Travis Cook
last_modified_date: '2020-05-05'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---


In the event that the Internet Protocol (IP) address that you have requested was not added automatically through automation, the following article describes the steps to manually add the IP address to your server. 

**Note:** You must request a new IP address by opening a ticket in order to have an an additional IP address.

You can add a new IP address by using PowerShell or the Windows Graphical User Interface (GUI).

### PowerShell

**Windows 2012+**

Open Windows Powershell by using the following steps:

1. Press the **Windows Key** and **R** on the keyboard to open the **Run** dialog box.
2. Enter **powershell.exe** and press **Enter**.
3. Use the following command (Subnet Mask CIDR Format without slash):
   
       New-NetIPAddress -InterfaceAlias "AdapterName" -IPAddress IPAddress -PrefixLegnth ## 
       
The command should look similar to the following example command:

    New-NetIPAddress -InterfaceAlias "Public" -IPAddress 192.168.100.112 -PrefixLegnth 24


### GUI

1. Open the Windows Control Panel.
2. Navigate to **Network and Internet** > **Network and Sharing Center** > **Change Adapter Settings**.
3. Right-click the network adapter associated with the public interface and click properties.
4. Double-click Internet Protocol Version 4 (TCP/IPV4).
6. Click **Advanced**.
7. Under **IP Adressess**, click **Add**.
8. Type in the new IP address.
9. Click **Apply** to save the new IP address.

### Verify the new IP address

Open Windows Powershell by using the following steps:

1. Press the **Windows Key** and **R** on the keyboard to open the **Run** dialog box.
2. Enter **powershell.exe** and press **Enter**.
3. Enter the command `ping <ipaddress>` replacing **<ipaddress>** with the newly added IP address.

A successful response indicates the IP address was added successfully.
