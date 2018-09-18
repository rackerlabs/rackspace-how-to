---
permalink: common-windows-issues-key-management-server-activation/
audit_date: '2017-12-03'
title: 'Common Windows Issues: Key Management Server Activation'
type: article
created_date: '2011-08-15'
created_by: Rackspace Support
last_modified_date: '2018-09-17'
last_modified_by: Thomas Williams
product: Cloud Servers
product_url: cloud-servers
---

**Problem**: Periodic activation requests to the Key Management Server (KMS)
are rejected and the operating system shows as unlicensed.

**Cause**: Windows cannot locate the KMS after changing the time zone of the
cloud server. As a result, your server's system clock does not sync with the
KMS.

**Resolution**: You must re-sync your cloud server with the KMS server:

1. Log in to your cloud server as administrator by clicking
   **Start > All Programs > Accessories**. Then, right-click **Command
   Prompt** and select **Run as Administrator**.

2. Confirm that you can ping the Rackspace KMS server by running the following command:

        ping kms.rackspace.com

   **Note**: If there is a reply, move on to step 3. No reply means that there
   is an interface, hardware, or routing issue. We recommend the following
   article for help resolving the issue: [Update ServiceNet routes on cloud
   servers created before June 3,
   2013](https://support.rackspace.com/how-to/updating-servicenet-routes-on-cloud-servers-created-before-june-3-2013/)

3. Set the KMS manually within the registry:

        slmgr.vbs /skms kms.rackspace.com:1688

4. Request activation from the KMS:

        slmgr.vbs /ato

    If you recieve the error  ``0xC004F074 The Key
    Management Server (KMS) is unavailable``, skip to step 9

5. If the device does not activate then the server may be set to MAK activation instead of KMS activation.
    To confirm which activation method is set on the device, run the following command:

        SLMGR -dlv

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

9. If step 4 returned the error ``0xC004F074 The Key
   Management Server (KMS) is unavailable``, run the following command:

        w32tm /resync

10. If the time on the cloud server is drastically different than
     what is on the KMS, the re-sync will fail.  At this point, you should
     either set the time manually or configure the server to use an NTP
     instance over the Internet.

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

11. After the time is synced up, attempt each of the following commands:

        w32tm /resync

        slmgr.vbs /ato

12. You must open UDP port 123 to allow the sync.

13. Make sure your firewall allows outbound connections to TCP port 1688.

