---
permalink: updating-servicenet-routes-on-cloud-servers-created-before-june-3-2013/
audit_date: '2017-06-28'
title: 'Update ServiceNet routes on cloud servers created before June 3, 2013'
type: article
created_date: '2013-05-28'
created_by: Richard Goodwin
last_modified_date: '2017-06-28'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Rackspace has implemented two new blocks of IPv4 addresses in our ServiceNet network. With this expansion, we can add over 1,000,000 new IP addresses to support customers' hosting. The total network range list is now 10.176.0.0/12; 10.208.0.0/12.

Any cloud servers built on or after June 3, 2013 automatically have the new IP address space and routes added, and they can communicate with other cloud servers built within the new network segments.

If you use the ServiceNet IP address space for communications between your cloud servers, and you have servers (or saved images) that were created *before* June 3, 2013, you must add a new IP address route to your servers to ensure that they can communicate with cloud servers that reside in the new address range.

Additionally, if you have created cloud networks or used custom internal IP addressing that overlaps with the new subnets, you might need to modify your network configuration to ensure ongoing communication.

**Note:** If you are a Managed Operations service level or RackConnect customer with automation enabled, you should have received a ticket and update about the changes. In many cases, your servers were updated automatically as part of your support agreement. If your servers were not updated automatically, you might need to update them by following the instructions or using the scripts in this article.

### Update your cloud servers to add new routes

You can update your Linux or Windows servers by using a script or by using a manual process.

**Note:** *(RackConnect Customers)* Although the scripts check the routing table on a server for possible conflicts before adding any new routes, they cannot detect conflicts that might exist on upstream RackConnect network devices. A separate scan was made of these network devices and notifications were sent to customers with potential conflicts. *If you received a ticket notifying you of a possible conflict on your RackConnect configuration, do not use these scripts until that conflict is resolved.* If you did not receive a ticket, no conflicts were detected on your RackConnect configuration.

#### Add new routes on Linux by using the script

The script has been tested on the following base images:

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

1. Download the [Linux script](http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.4.sh) onto the target server:

        wget http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.4.sh

2. Run the script without any arguments to see usage:

        bash add_2013_cloud_routes_v1.0.4.sh

   The output is similar to the following output:

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

3. Run the script with `--check` to look for conflicting routes:

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

4. If conflicts are detected, perform the necessary steps to remedy them. If you need help, contact your Rackspace Support Team. After you resolve all identified conflicts, repeat step 3 to ensure that no conflicts remain.

5. When you are ready to add the new routes, run the script with `--add-route` instead of `--check`. You *must* perform this step as the root user.

        sudo bash add_2013_cloud_routes_v1.0.4.sh --add-route

   The output is similar to the following output:

        Auto-detected OS type as 'ubuntu'.
        Checking for conflicts with existing routes...no conflicts detected.  Safe to add routes.
        Backing up /etc/network/interfaces to /root/.cloud_routes_backup_1234567890/ ...done.
        Looking for a 10.176.0.0/12 route...no 10.176.0.0/12 route found.
        Looking for a 10.176.0.0/13 route to convert...found an existing 10.176.0.0/13 route.
        Changing existing 10.176.0.0/13 route to 10.176.0.0/12...done.
        Looking for a 10.208.0.0/12 route...no 10.208.0.0/13 route found.
        Adding route for 10.208.0.0/12...done.

   If the script encounters any errors while modifying the networking files, it provides instructions about what needs to be done. Follow these instructions, then repeat this step as needed.

6. After the script runs, perform the following steps:

   A. Run `route -n` and look for a route for 10.191.192.0/18.
   B. If a route exists for 10.191.192.0/18, remove it. The route for 10.176.0.0 encompasses this network range, and a conflict occurs if both routes are present.
   C. After you remove it, run `route -n` again to verify its removal.

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


        ip route del 10.191.192.0/18 via 10.180.0.1 dev eth1

#### Add new routes on Linux manually

1. Run `ip route show` to determine whether any conflict with 10.176.0.0/12
    or 10.208.0.0/12:

        ip route show

   A route for either 10.176.0.0/12 or 10.176.0.0/13 should exist, depending on the age of the server. Note the gateway IP (via x.x.x.x) and device (`dev ethX`) of this route; these values are your ServiceNet gateway IP address and device. In the following example output, the ServiceNet gateway IP is `10.182.0.1` and the ServiceNet device is `eth1`.

        10.182.0.0/17 dev eth1  proto kernel  scope link  src 10.182.21.219
        10.176.0.0/13 via 10.182.0.1 dev eth1
        default via 10.182.127.198 dev eth1  metric 100

2. Modify the network configuration files for your distribution so that networking changes persist after the server is restarted.

   A. If your server has a route for 10.176.0.0/13, change this route to 10.176.0.0/12 instead, keeping all other values the same.
   B. Add a route for 10.208.0.0/12 using the same ServiceNet gateway IP address and device as the 10.176.0.0/12 route.

3. Update the running network configuration. Depending upon your Linux distribution, you might have to restart the networking service or reboot.

   Alternatively, run the following commands to inject the route directly into the server's routing table without any network interruption. Substitute the appropriate values for SNET\_GW and SNET\_DEV.

        sudo ip route add 10.208.0.0/12 via SNET_GW dev SNET_DEV 2>/dev/null sudo ip route add 10.176.0.0/12 via SNET_GW dev SNET_DEV 2>/dev/null sudo ip route del 10.176.0.0/13 via SNET_GW dev SNET_DEV 2>/dev/null

4. Perform the following steps:

   A. Run `route -n` and look for a route for 10.191.192.0.
   B. If a  route for 10.191.192.0 exists, remove it. The route for 10.176.0.0 encompasses this
    network range, and a conflict occurs if both routes are present.

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


        ip route del 10.191.192.0/18 via 10.180.0.1 dev eth1

#### Add new routes on Windows by using the script

This program has been tested on the following base images:

- Windows Server 2008 R2 SP1 (with updates)
- Windows Server 2012 (with updates)

1. [Download the Windows executable](http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com/add_2013_cloud_routes_v1.0.2.exe) to the target server.

   You do not need to do this as a user with Administrator rights, but it might be easier because you need to run the program as a user with Administrator rights.

2. If you are using Internet Explorer to download the program and Enhanced Security is configured (the default for all Windows Server base images), you might be prompted that the domain is not part of your Trusted Sites. If so, add http://7c1f6a0506404b3af970-42fdda7fdbf4103081a78c20ac1c54cb.r51.cf1.rackcdn.com to your Trusted Sites and retry step 1.

    <img src="{% asset_path cloud-servers/updating-servicenet-routes-on-cloud-servers-created-before-june-3-2013/winnew12-1_0.jpg %}" alt="URL not in Trusted Sites dialog box; Clicking Add" width="550" />

    <img src="{% asset_path cloud-servers/updating-servicenet-routes-on-cloud-servers-created-before-june-3-2013/winnew12-2_0.jpg %}" alt="Add URL to Trusted Sites dialog box; Clicking Add" width="550" />

3. Because the program requires command-line switches, save it to a location on your disk that you can navigate to easily from the command line. For these steps, it is in a directory called `C:\\scripts\\`.

   If you receive a message stating that the program's publisher could not be verified, you can safely ignore this message.

4. Open a Command Prompt window (**Start > All Programs > Accessories > Command Prompt**) and change directory to where you downloaded the program.

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

5. Run `add_2013_cloud_routes_v1.0.2.exe` with the `/v` (verbose mode) flag.

   The program checks whether any conflicting routes exist on the server. If none are found, it adds the routes necessary for the new network segments. If conflicts are found, routes are not added (as shown in the following examples).

            C:\scripts>add_2013_cloud_routes_v1.0.2.exe /v
            Routes:
            0.0.0.0 0.0.0.0 166.78.179.1
            10.176.0.0 255.240.0.0 10.182.0.1
            0.0.0.0 0.0.0.0 10.182.127.198
            10.208.0.0 255.240.0.0 10.182.0.1
            Output:
            Found a possible conflicting route: 10.208.0.0 255.240.0.0 10.182.0.1
            Route conflict detected
            Routes not added.

6. If conflicts are detected, perform the necessary steps to remedy them. If you need help, contact your Rackspace Support Team.

7. After you resolve all identified conflicts, re-run the program with the same flag.

            C:\scripts>add_2013_cloud_routes_v1.0.2.exe /v
            Routes:
            0.0.0.0 0.0.0.0 166.78.179.1
            0.0.0.0 0.0.0.0 10.182.127.198
            10.176.0.0 255.248.0.0 10.182.0.1
            Output:
            Successfully added route for 10.176.0.0/12
            Successfully added route for 10.208.0.0/12
            Routes added successfully

#### Add new routes on Windows manually

1. Open a Command Prompt window and display the existing routes for "10.176.\*".

        C:\Users\Administrator>route print -4 10.176.*

One persistent route should exist for 10.176.0.0 with a netmask of either 255.248.0.0 or 255.240.0.0. Note the gateway IP address used this route; this value is your ServiceNet gateway IP address. In the following example, the ServiceNet gateway IP address is `10.182.0.1`.

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

2. Verify whether any routes for 10.208.0.0/12 exist.

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

3. If no route for 10.208.0.0/12 exists, add a new persistent route for it by using the ServiceNet gateway IP address that you noted in step 1.

        C:\Users\Administrator>route -p ADD 10.208.0.0 MASK 255.240.0.0 10.182.0.1
         OK!

   If the route that you found in step 1 had a netmask of 255.240.0.0 (/12), stop here. You are done adding routes.

   If the route that you found in step 1 had a netmask of 255.248.0.0 (/13), you must replace it with a /12 route. Proceed to the next step.

4. Add a new persistent route for 10.176.0.0/12 by using the ServiceNet gateway IP address that you noted in step 1.

        C:\Users\Administrator>route -p ADD 10.176.0.0 MASK 255.240.0.0 10.182.0.1
         OK!

5. If the previous command was successful, you can safely remove the existing 10.176.0.0/13 route that you noted in step 1 without any network disruption.

        C:\Users\Administrator>route DELETE 10.176.0.0 MASK 255.248.0.0 10.182.0.1
         OK!
