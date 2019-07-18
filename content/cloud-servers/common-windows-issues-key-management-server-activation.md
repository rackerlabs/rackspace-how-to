---
permalink: common-windows-issues-key-management-server-activation/
audit_date: '2017-12-03'
title: 'Common Windows Issues: Key Management Server Activation'
type: article
created_date: '2011-08-15'
created_by: Rackspace Support
last_modified_date: '2018-12-06'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Problem**: Periodic activation requests to the Key Management Server (KMS)
are rejected and the operating system shows as unlicensed.

**Cause**: There are two main causes of this issue: (1) Windows cannot locate the KMS and (2) the
server's clock differs from the KMS's clock by more than four hours.

Use the steps in the following sections to resolve this issue:

### Ensure that the Windows Server is configured to use the correct KMS server

Locate the appropriate KMS server in the following list:

<table>
     <tr>
       <th>Data center</th>
       <th>KMS Server</th>
     </tr>
     <tr>
       <td>ORD (Chicago)</td>
       <td>winactivate.ord1.servers.rackspacecloud.com</td>
     </tr>
     <tr>
       <td>DFW (Dallas)</td>
       <td>winactivate.dfw1.servers.rackspacecloud.com</td>
     </tr>
     <tr>
       <td>IAD (Ashburn)</td>
       <td>winactivate.iad3.servers.rackspacecloud.com</td>
     </tr>
     <tr>
       <td>LON (London)</td>
       <td>winactivate.lon3.servers.rackspacecloud.com</td>
     </tr>
     <tr>
       <td>HKG (Hong Kong)</td>
       <td>winactivate.hkg1.servers.rackspacecloud.com</td>
     </tr>
     <tr>
       <td>SYD (Sydney)</td>
       <td>winactivate.syd2.servers.rackspacecloud.com</td>
     </tr>
</table>

1. Log in to your cloud server as administrator by clicking
   **Start > All Programs > Accessories**. Then, right-click **Command
   Prompt** and select **Run as Administrator**.

2. Confirm that you can ping the Rackspace KMS server by running the following command:

        ping kms-server-from-table-above 

   **Note**: If there is a reply, move on to step 1c. No reply means that there
   is an interface, hardware, or routing issue. We recommend the following
   article for help resolving the issue: [Update ServiceNet routes on cloud
   servers](/how-to/updating-servicenet-routes-on-cloud-servers/)

3. Set the KMS manually within the registry:

        slmgr.vbs /skms kms-server-from-table-above:1688

4. Request activation from the KMS:

        slmgr.vbs /ato

    If you recieve the error  ``0xC004F074 The Key
    Management Server (KMS) is unavailable``, skip to step 2

5. If the device does not activate then the server may be set to MAK activation instead of KMS activation.
    To confirm which activation method is set on the device, run the following command:

        slmgr -dlv

    Look for the **Product Key Channel** setting. **Volume:GVLK** means the device is set to **KMS activation**,
    **Volume:MAK** means the device is set to **MAK** activation.

    The following images show sample outputs:

    **KMS Activation Output**:

     <img src="{% asset_path cloud-servers/common-windows-issues-key-management-server-activation/kms.jpg %}" />

    **MAK Activation Output**:

     <img src="{% asset_path cloud-servers/common-windows-issues-key-management-server-activation/mak.png %}" />

6. If your device is set to **MAK activation** then you should set the device back to **KMS activation**.
    First find and take note of the appropriate KMS client setup key from Microsoft: [KMS Client Setup Keys](https://technet.microsoft.com/library/jj612867.aspx)

    To find wich Server edition you are running, run the following command and look for the section labelled **OS name**:

        systeminfo | findstr OS

    Example:

        PS C:\Users\Administrator> systeminfo | findstr OS
        OS Name:                   Microsoft Windows Server 2012 R2 Datacenter

7. Set the device to **KMS acivation** using the key found in the  previously referenced article and entering the following command:

        slmgr /ipk %key%

    Make sure to replace **%key%** with the key from the Microsoft document.

8. To activate the device, run the below command:

        slmgr.vbs /ato

### Ensure that the server clock is synced with the KMS clock

If step 1d above returned the error `0xC004F074 The Key Management Server (KMS) is unavailable`, the time on the
cloud server is drastically different than what is on the KMS.

1. At this point, you should configure the server to use an NTP time source by executing the appropriate command.

     <table>
     <tr>
       <th>Data center</th>
       <th>Command</th>
     </tr>
     <tr>
       <td>ORD (Chicago)</td>
       <td><code>net stop w32time<br>w32tm /config /manualpeerlist:time.ord1.rackspace.com /syncfromflags:MANUAL<br>net start          w32time</code></td>
     </tr>
     <tr>
       <td>DFW (Dallas)</td>
       <td><code>net stop w32time<br>w32tm /config /manualpeerlist:time.dfw1.rackspace.com /syncfromflags:MANUAL <br>net start    w32time</code></td>
     </tr>
     <tr>
       <td>IAD (Ashburn)</td>
       <td><code>net stop w32time<br>w32tm /config /manualpeerlist:time.iad3.rackspace.com /syncfromflags:MANUAL <br>net start    w32time</code></td>
     </tr>
     <tr>
       <td>LON (London)</td>
       <td><code>net stop w32time<br>w32tm /config /manualpeerlist:time.lon3.rackspace.com /syncfromflags:MANUAL <br>net start    w32time</code></td>
     </tr>
     <tr>
       <td>HKG (Hong Kong)</td>
       <td><code>net stop w32time<br>w32tm /config /manualpeerlist:time.hkg1.rackspace.com /syncfromflags:MANUAL <br>net start     w32time</code></td>
     </tr>
     <tr>
       <td>SYD (Sydney)</td>
       <td><code>net stop w32time<br>w32tm /config /manualpeerlist:time.syd2.rackspace.com /syncfromflags:MANUAL <br>net start    w32time</code></td>
     </tr>
     </table>

2. After the time is synced up, attempt each of the following commands:

        w32tm /resync

        slmgr.vbs /ato

3. You must open UDP port 123 to allow the sync.

4. Make sure your firewall allows outbound connections to TCP port 1688.
