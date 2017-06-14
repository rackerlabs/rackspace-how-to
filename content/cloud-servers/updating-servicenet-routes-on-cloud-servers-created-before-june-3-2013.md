---
audit_date:
title: 'Update ServiceNet Routes on Cloud Servers Created Before June 3, 2013'
type: article
created_date: '2013-05-28'
created_by: Richard Goodwin
last_modified_date: '2015-07-07'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

As our cloud infrastructure continues to grow, Rackspace is implementing
two new blocks of IPv4 addresses in our ServiceNet network.  With this
new expansion, we will be able to add over 1,000,000 new IP addresses to
support customers hosting.

-   The **current** address space for Cloud Servers within ServiceNet is 10.176.0.0/13.
-   The **new** address ranges will be 10.184.0.0/13 and 10.208.0.0/12.
-   Because 10.176.0.0/13 and 10.184.0.0/13 are adjacent network blocks, the **total** network range list will be 10.176.0.0/12; 10.208.0.0/12.

Cloud Servers created on or after 6/3/2013 may be assigned addresses in
the new address ranges, and don't require any additional configuration.

### Required Actions for Cloud Servers Customers:

Any new Cloud Servers built on or after June 3, 2013. will automatically
have the new IP space and routes added so that they can communicate with
any Cloud Servers built within the new network segments.  For other
scenarios:

-   If you currently use the ServiceNet IP address space for
    communication between your Cloud Servers, and you have servers (or
    saved images) created before June 3, 2013, you will need to add a
    new IP route to your servers to ensure proper communication to any
    Cloud Servers that reside in the new address range. **  If you do
    not update the routes on your existing Cloud Servers, they will not
    be able to communicate with new servers over ServiceNet until they
    are updated.**

-   If you are a Managed Cloud Service Level or RackConnect customer
    with automation enabled, you should have received a ticket and
    update about the changes and in many cases your servers will be
    updated automatically as part of your support agreement. However, if
    your servers were not updated automatically, you may be required to
    update them by following the instructions or using the scripts
    provided in the next section.

-   In addition, if you have created Cloud Networks or used custom
    internal IP addressing that overlaps with the new subnets, you may
    need to modify your network configuration to ensure proper
    ongoing communication.

### Steps and Resources for Updating Your Cloud Servers

Scripts are located at the following links:

-   [Linux shell
    script](http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.4.sh)
    ([HTTPS
    link](https://f32480f5ae9f57b7fcd0-42fdda7fdbf4103081a78c20ac1c54cb.ssl.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.4.sh))
-   [Windows
    executable](http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.2.exe)
    ([HTTPS
    link](https://f32480f5ae9f57b7fcd0-42fdda7fdbf4103081a78c20ac1c54cb.ssl.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.2.exe))

#### Special Note to RackConnect Customers

Although the scripts linked above check the routing table on a Cloud
Server for possible conflicts before adding any new routes, they cannot
detect conflicts that may exist on upstream RackConnect network
devices.  A separate scan was made of these network devices and
notifications were sent to customers with potential conflicts.   **If
you have received a ticket notifying you of a possible conflict on your
RackConnect configuration, please do not use these scripts until that
conflict is resolved** .  If you are a RackConnect customer and have not
received such a ticket, no conflicts were detected on your RackConnect
configuration.

### How do I add the new routes to my Cloud Server?

#### Linux - Using the Script

This script has been tested on the following Base Images:

-   Arch Linux 2013.2
-   CentOS 5.6
-   CentOS 5.8
-   CentOS 5.9
-   CentOS 6.0
-   CentOS 6.2
-   CentOS 6.3
-   Debian 6.06 (Squeeze)
-   Fedora 17 (Beefy Miracle)
-   Fedora 18 (Spherical Cow)
-   Gentoo 13.1
-   openSUSE 12
-   Red Hat Enterprise Linux 5.5
-   Red Hat Enterprise Linux 5.8
-   Red Hat Enterprise Linux 6.1
-   Red Hat Enterprise Linux 6.3
-   Ubuntu 10.04 LTS (Lucid Lynx)
-   Ubuntu 12.04 LTS (Precise Pangolin)
-   Ubuntu 12.10 (Quantal Quetzal)
-   Ubuntu 13.04 (Raring Ringtail)

1.  Download the Linux script onto the target server.

        wget http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.4.sh

2.  Run the script without any arguments to see usage:

        bash add_2013_cloud_routes_v1.0.4.sh

    The output will be similar to:

        Auto-detected OS type as 'ubuntu'.
        Usage: bash add_2013_cloud_routes.sh [-n] {--check | --add-route }

            Utility to check whether a Rackspace Cloud Server has any routes that
        may conflict with the new network routes being added in June 2013.  If no
        conflicts are found, script may also be used to automatically add routes
        to the server for the following two new IP ranges:
                10.176.0.0/12
                10.208.0.0/12

            Either --check or --add-route must be provided before the script will
        do anything other than print this usage statement.

        Available command-line options:
          --check:      Check to see if there are any conflicts that may prevent
                        the new routes from being added.  This mode makes no
                        changes to the system.

          --add-route:  Attempt to add the new routes to the server.  Will not
                        add any routes if system fails conflicts check.  Script
                        must be run as the root user if this option is provided.

          -n, --no-op:  Run script without actually making any changes.  Not
                        particularly useful unless you want to see what would be
                        done by --add-route without any changes being made.

3.  Run the script with --check to ensure there are no conflicting
    routes:

        bash add_2013_cloud_routes_v1.0.4.sh --check

    The output will be similar to:

        Auto-detected OS type as 'ubuntu'.
        Checking for conflicts with existing routes...no conflicts detected.  Safe to add routes.

    or

        Auto-detected OS type as 'ubuntu'.
        Checking for conflicts with existing routes...CONFLICT DETECTED!
        The following routes currently overlap the IP space for the new routes being added:
        10.209.0.0/24 dev eth2  proto kernel  scope link  src 10.209.0.39
        Aborting.  No routes have been added.

4.  If any conflicts are detected, take whatever steps are necessary to
    remedy them. If you need assistance with this step, please contact
    your Rackspace Support Team. Once all identified conflicts have been
    resolved, repeat step 3 to ensure no further conflicts remain.

5.  When you are ready to add the new routes, run the script with
    --add-route instead of --check. This step MUST be performed as the
    root user.

        sudo bash add_2013_cloud_routes_v1.0.4.sh --add-route

    The output will be similar to:

        Auto-detected OS type as 'ubuntu'.
        Checking for conflicts with existing routes...no conflicts detected.  Safe to add routes.
        Backing up /etc/network/interfaces to /root/.cloud_routes_backup_1234567890/ ...done.
        Looking for a 10.176.0.0/12 route...no 10.176.0.0/12 route found.
        Looking for a 10.176.0.0/13 route to convert...found an existing 10.176.0.0/13 route.
        Changing existing 10.176.0.0/13 route to 10.176.0.0/12...done.
        Looking for a 10.208.0.0/12 route...no 10.208.0.0/13 route found.
        Adding route for 10.208.0.0/12...done.

6.  If the script encounters any errors modifying the networking files,
    it will give further instructions about what needs to be done.
    Follow these instructions, then repeat step 5 as needed.

7.  After the script runs, run `route -n` and check to see if there is a
    route for 10.191.192.0/18. If there is a route for 10.191.192.0/18,
    remove it since the route for 10.176.0.0 encompasses this network
    range and will cause conflict.

        # route -n

        Kernel IP routing table

        Destination     Gateway         Genmask         Flags Metric Ref    Use Iface

        50.56.186.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0

        10.191.192.0    10.180.0.1      255.255.192.0   UG    0      0        0 eth1

        10.180.0.0      0.0.0.0         255.255.128.0   U     0      0        0 eth1

        169.254.0.0     0.0.0.0         255.255.0.0     U     1002   0        0 eth0

        169.254.0.0     0.0.0.0         255.255.0.0     U     1003   0        0 eth1

        10.208.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        10.176.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        0.0.0.0         50.56.186.1     0.0.0.0         UG    0      0        0 eth0


        # ip route del 10.191.192.0/18 via 10.180.0.1 dev eth1


        # route -n

        Kernel IP routing table

        Destination     Gateway         Genmask         Flags Metric Ref    Use Iface

        50.56.186.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0

        10.180.0.0      0.0.0.0         255.255.128.0   U     0      0        0 eth1

        169.254.0.0     0.0.0.0         255.255.0.0     U     1002   0        0 eth0

        169.254.0.0     0.0.0.0         255.255.0.0     U     1003   0        0 eth1

        10.208.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        10.176.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        0.0.0.0         50.56.186.1     0.0.0.0         UG    0      0        0 eth0


        ip route del 10.191.192.0/18 via <ServiceNet gateway> dev eth1

### Linux - Manual Method

1.  Verify that no routes on the system conflict with 10.176.0.0/12
    or 10.208.0.0/12.

        ip route show

    There should already be a route for either 10.176.0.0/12 or
    10.176.0.0/13, depending on the age of the Cloud Server. Note the
    gateway IP (via X.X.X.X) and device (dev ethX) of this route - this
    is your ServiceNet gateway IP and device.  For example, in the
    output below, the ServiceNet gateway IP is "10.182.0.1" and the
    ServiceNet device is "eth1".

        10.182.0.0/17 dev eth1  proto kernel  scope link  src 10.182.21.219
        10.176.0.0/13 via 10.182.0.1 dev eth1
        default via 10.182.127.198 dev eth1  metric 100

2.  Modify the network configuration files for your distribution so
    networking changes will survive a reboot.
    a.  If your server has a route for 10.176.0.0/13, change this route
        to 10.176.0.0/12 instead, keeping all other values the same.
    b.  Add a route for 10.208.0.0/12 using the same ServiceNet gateway
        IP and device as the 10.176.0.0/12 route.

3.  Update the running network configuration. Depending upon
    distribution, this may require a restart of the networking service
    or a reboot. Alternatively, for a no-downtime approach, the
    following commands will inject the route directly into the server's
    routing table without any network interruption. Substitute the
    appropriate values for SNET\_GW and SNET\_DEV.


        sudo ip route add 10.208.0.0/12 via SNET_GW dev SNET_DEV 2>/dev/null sudo ip route add 10.176.0.0/12 via SNET_GW dev SNET_DEV 2>/dev/null sudo ip route del 10.176.0.0/13 via SNET_GW dev SNET_DEV 2>/dev/null

4.  Run route -n and check to see if there is a route for 10.191.192.0
    if there is remove it as the route for 10.176.0.0 encompasses this
    network range and will cause conflicts.

    Example:

        # route -n

        Kernel IP routing table

        Destination     Gateway         Genmask         Flags Metric Ref    Use Iface

        50.56.186.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0

        10.191.192.0    10.180.0.1      255.255.192.0   UG    0      0        0 eth1

        10.180.0.0      0.0.0.0         255.255.128.0   U     0      0        0 eth1

        169.254.0.0     0.0.0.0         255.255.0.0     U     1002   0        0 eth0

        169.254.0.0     0.0.0.0         255.255.0.0     U     1003   0        0 eth1

        10.208.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        10.176.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        0.0.0.0         50.56.186.1     0.0.0.0         UG    0      0        0 eth0


        # ip route del 10.191.192.0/18 via 10.180.0.1 dev eth1



        # route -n

        Kernel IP routing table

        Destination     Gateway         Genmask         Flags Metric Ref    Use Iface

        50.56.186.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0

        10.180.0.0      0.0.0.0         255.255.128.0   U     0      0        0 eth1

        169.254.0.0     0.0.0.0         255.255.0.0     U     1002   0        0 eth0

        169.254.0.0     0.0.0.0         255.255.0.0     U     1003   0        0 eth1

        10.208.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        10.176.0.0      10.180.0.1      255.240.0.0     UG    0      0        0 eth1

        0.0.0.0         50.56.186.1     0.0.0.0         UG    0      0        0 eth0


        ip route del 10.191.192.0/18 via <ServiceNet gatewway> dev eth1

### Windows - Using the Script

This program has been tested on the following Base Images:

-   Windows Server 2008 R2 SP1 (with updates)
-   Windows Server 2012 (with updates)

1.  Download the Windows executable onto the target server from the link
    provided at the beginning of this article.  You do not have to do
    this as a user with Administrator rights, but it may be easier since
    you will need to run the program as a user with
    Administrator rights.

2.  If you are using Internet Explorer to download the program and
    Enhanced Security is configured (the default for all Windows Server
    base images), you may be prompted that the domain is not part of
    your Trusted Sites.  If so, add
    "http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com"
    to your Trusted Sites and retry step 1.

    <img src="{% asset_path cloud-servers/updating-servicenet-routes-on-cloud-servers-created-before-june-3-2013/winnew12-1_0.jpg %}" alt="URL not in Trusted Sites dialog box; Clicking Add" width="550" />

    <img src="{% asset_path cloud-servers/updating-servicenet-routes-on-cloud-servers-created-before-june-3-2013/winnew12-2_0.jpg %}" alt="Add URL to Trusted Sites dialog box; Clicking Add" width="550" />

3.  Since the program requires command-line switches, it cannot be run
    directly from Internet Explorer.  Save the executable to a location
    on your disk that you will be able to navigate to easily from the
    command-line.  For demonstration purposes, we chose to save it to a
    directory called C:\\scripts\\.  If you receive a message stating
    that the program's publisher could not be verified, this message is
    safe to ignore.

4.  Open a Command Prompt window (Start &gt; All Programs &gt;
    Accessories &gt; Command Prompt) and change directory to where you
    downloaded the program.

        Microsoft Windows [Version 6.1.7601]
        Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

        C:\Users\Administrator>cd \scripts

        C:\scripts>dir add_2013_*.exe
         Volume in drive C is C_DRIVE
         Volume Serial Number is 24C1-B6E0

         Directory of C:\scripts

        01/01/2013  00:00 AM           114,688 add_2013_cloud_routes_v1.0.2.exe
                       1 File(s)        114,688 bytes
                       0 Dir(s)  29,827,129,344 bytes free

5.  With no flags, the program simply displays the persistent routes
    currently in the server's routing table.


        C:\scripts>add_2013_cloud_routes_v1.0.2.exe
        Existing Persistent Routes:

        0.0.0.0 0.0.0.0 166.78.179.1
        10.176.0.0 255.240.0.0 10.182.0.1
        0.0.0.0 0.0.0.0 10.182.127.198

6.  When provided with either the /u (User mode) or /v (Verbose Mode)
    flag, the program checks to see if there are any conflicting routes
    on the server. If none are found, it adds the routes necessary for
    the new network segments.
    -   Normal Mode


            C:\scripts>add_2013_cloud_routes_v1.0.2.exe /u
            Route Conflict Detected
            Routes not added. Use the /v switch to receive verbose output.

    -   Verbose Mode

            C:\scripts>add_2013_cloud_routes_v1.0.2.exe /v
            Routes:
            0.0.0.0 0.0.0.0 166.78.179.1
            10.176.0.0 255.240.0.0 10.182.0.1
            0.0.0.0 0.0.0.0 10.182.127.198
            10.208.0.0 255.240.0.0 10.182.0.1
            Output:
            Found a possible conflicting route: 10.208.0.0 255.240.0.0 10.182.0.1
            Route conflict detected
            Routes not added. Use the /v switch to receive verbose output.

7.  If conflicts are detected, take whatever steps are necessary to
    remedy them. If you need assistance with this step, please contact
    your Rackspace Support Team. Once all identified conflicts have been
    resolved, re-run the program with the same flag (/u or /v).
    -   Normal Mode


            C:\scripts>add_2013_cloud_routes_v1.0.2.exe /u
            Routes added successfully

    -   Verbose Mode


            C:\scripts>add_2013_cloud_routes_v1.0.2.exe /v
            Routes:
            0.0.0.0 0.0.0.0 166.78.179.1
            0.0.0.0 0.0.0.0 10.182.127.198
            10.176.0.0 255.248.0.0 10.182.0.1
            Output:
            Successfully added route for 10.176.0.0/12
            Successfully added route for 10.208.0.0/12
            Routes added successfully

### Windows - Manual Method

1.  Open a Command Prompt window and display the existing routes
    for "10.176.\*". There should be one persistent route for 10.176.0.0
    with a netmask of either 255.248.0.0 or 255.240.0.0. Find this
    route, and note the Gateway Address used by it - this is our
    ServiceNet gateway IP. In the example below, the ServiceNet gateway
    IP is "10.182.0.1".


        C:\Users\Administrator>route print -4 10.176.*
        ===========================================================================
        Interface List
         13...bc 76 4e 04 85 72 ......Citrix PV Ethernet Adapter #1
         15...bc 76 4e 05 19 40 ......Citrix PV Ethernet Adapter #2
          1...........................Software Loopback Interface 1
         14...00 00 00 00 00 00 00 e0 Microsoft ISATAP Adapter
         11...00 00 00 00 00 00 00 e0 Microsoft Teredo Tunneling Adapter
         17...00 00 00 00 00 00 00 e0 Microsoft ISATAP Adapter #3
        ===========================================================================

        IPv4 Route Table
        ===========================================================================
        Active Routes:
        Network Destination        Netmask          Gateway       Interface  Metric
               10.176.0.0      255.248.0.0       10.182.0.1    10.182.26.193     20
        ===========================================================================
        Persistent Routes:
          Network Address          Netmask  Gateway Address  Metric
               10.176.0.0      255.248.0.0       10.182.0.1      10
        ===========================================================================

2.  Make sure that there are no existing routes for 10.208.0.0/12


        C:\Users\Administrator>route print -4 10.208.*
        ===========================================================================
        Interface List
         13...bc 76 4e 04 85 72 ......Citrix PV Ethernet Adapter #1
         15...bc 76 4e 05 19 40 ......Citrix PV Ethernet Adapter #2
          1...........................Software Loopback Interface 1
         14...00 00 00 00 00 00 00 e0 Microsoft ISATAP Adapter
         11...00 00 00 00 00 00 00 e0 Microsoft Teredo Tunneling Adapter
         17...00 00 00 00 00 00 00 e0 Microsoft ISATAP Adapter #3
        ===========================================================================

        IPv4 Route Table
        ===========================================================================
        Active Routes:
          None
        Persistent Routes:
          None

3.  If no route for 10.208.0.0/12 exists, add a new persistent route for
    it, using the ServiceNet gateway IP gathered in Step 1.

        C:\Users\Administrator>route -p ADD 10.208.0.0 MASK 255.240.0.0 10.182.0.1
         OK!

4.  If the route found in Step 1 had a netmask of 255.240.0.0 (/12),
    **STOP HERE** . You are finished adding routes.

5.  If the route found in Step 1 had a netmask of 255.248.0.0 (/13), we
    still need to replace it with a /12 route. Add a new persistent
    route for 10.176.0.0/12, using the ServiceNet gateway IP gathered in
    Step 1.

        C:\Users\Administrator>route -p ADD 10.176.0.0 MASK 255.240.0.0 10.182.0.1
         OK!

6.  If the previous command was successful, you can safely remove the
    existing 10.176.0.0/13 route that we found in Step 1 without any
    network disruption.

        C:\Users\Administrator>route DELETE 10.176.0.0 MASK 255.248.0.0 10.182.0.1
         OK!

If you have any questions about the change or its impact, or you need
assistance making the required updates to your servers, our Fanatical
Support team is here to assist.
