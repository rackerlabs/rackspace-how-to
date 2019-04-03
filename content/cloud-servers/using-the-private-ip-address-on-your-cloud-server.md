---
permalink: using-the-private-ip-address-on-your-cloud-server/
audit_date: '2019-04-05'
title: Using Private IP Address on Cloud Servers
type: article
created_date: '2011-03-15'
created_by: Rackspace Support
last_modified_date: '2019-04-05'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Each Cloud Server comes with two addresses that are available for your
use. One address is an external "real-world" IP address that is
accessible from the Internet and the other is an internal or "private"
IP address.  This internal IP address, available on the **ServiceNet** network,
is used within the cloud.

### Why do Cloud Servers have an Internal IP Address?

This internal IP address, accessible by the Cloud Server platforms, allows you
to transfer data between Cloud Servers with no bandwidth charges.

### Is ServiceNet Free?

Yes, ServiceNet is free. This standard service comes with each Cloud Server.
Your Cloud Server is pre-configured with your private IP address as soon as it is 
built.

### How Do I Find My Private IP Address?

When you log in to your Cloud Server, by using SecureShell (SSH) or the Console, type
the command `ip addr show eth1` on most distributions to find your private
IP address. Then look for the `inet addr` line. The output should be similar to the 
following sample:


        # ip addr show eth1

        eth1      Link encap:Ethernet  HWaddr 00:18:78:56:34:12
        ; inet addr:10.1.98.200  Bcast:10.1.98.255  Mask:255.255.255.0

**Note:** In this case the internal IP address is `10.1.98.200`.

### What can I use the private address for?

The private IP address has many uses:

-   High-availability heartbeat
-   Load balancing
-   Remote database connections
-   Network File System (NFS) access and `rsync` file synchronization
-   Remote backup
