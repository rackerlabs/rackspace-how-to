---
permalink: common-windows-issues-key-management-server-activation/
audit_date:
title: 'Common Windows Issues: Key Management Server Activation'
type: article
created_date: '2011-08-15'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Problem**:  Periodic activation requests to the KMS are rejected and
the operating system is seen as unlicensed.

**Cause**: Windows cannot locate the Key Management Server (KMS) after
changing the time zone of the Cloud Server.  Now your Cloud Server's
system clock does not sync with the KMS.

**Resolution**: You will need to resynch your Cloud Server with the KMS
server:

1. Log in to your Cloud Server as Administrator (Start, All Programs,
   Accessories, right-click Command Prompt and select Run as
   Administrator).

2. Choose the data center in the following table that corresponds to
   the location of your server and run the applicable command from the
   command prompt.
   
   | Data Center      | Command                                            |
   |------------------|----------------------------------------------------|
   | ORD (Chicago)    | `ping winactivate.ord1.servers.rackspacecloud.com` |
   | DFW (Dallas)     | `ping winactivate.dfw1.servers.rackspacecloud.com` |
   | IAD (Ashburn)    | `ping winactivate.iad3.servers.rackspacecloud.com` |
   | LON (London)     | `ping winactivate.lon3.servers.rackspacecloud.com` |
   | HKG (Hong Kong)  | `ping winactivate.hkg1.servers.rackspacecloud.com` |
   | SYD (Sydney)     | `ping winactivate.syd2.servers.rackspacecloud.com` |
   
   **Note**: If there is a reply, move on to step 3.  No reply means that there
   is an interface, hardware, or routing issue.

3. Set the KMS manually within the registry.
   
   | Data Center     | Command                                                            |
   |-----------------|--------------------------------------------------------------------|
   | ORD (Chicago)   | `slmgr.vbs /skms winactivate.ord1.servers.rackspacecloud.com:1688` |
   | DFW (Dallas)    | `slmgr.vbs /skms winactivate.dfw1.servers.rackspacecloud.com:1688` |
   | IAD (Ashburn)   | `slmgr.vbs /skms winactivate.iad3.servers.rackspacecloud.com:1688` |
   | LON (London)    | `slmgr.vbs /skms winactivate.lon3.servers.rackspacecloud.com:1688` |
   | HKG (Hong Kong) | `slmgr.vbs /skms winactivate.hkg1.servers.rackspacecloud.com:1688` |
   | SYD (Sydney)    | `slmgr.vbs /skms winactivate.syd2.servers.rackspacecloud.com:1688` |

4. Request activation from the KMS:
    
       slmgr.vbs /ato

5. If step 4 returns an error reading EXACTLY "0xC004F074 The Key 
   Management Server (KMS) is unavailable", run the following:
   
        w32tm /resync
   
6. If the time on the Cloud Server is drastically different than
     what is on the KMS the resync will fail.  At this point you will need to
     either set the time manually or configure the server to use an NTP
     instance over the internet.
     
     <table>
     <tr>
       <th>Data Center</th>
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
   
7. Once the time is synced up, attempt the following:
    
        w32tm /resync
        slmgr.vbs /ato

8. You will also need to open UDP port 123 to allow the sync.

9. Make sure your firewall allows outbound connections to TCP port
   1688.
