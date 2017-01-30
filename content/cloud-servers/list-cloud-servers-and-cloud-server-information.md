---
permalink: list-cloud-servers-and-cloud-server-information/
audit_date:
title: List Cloud Servers and Cloud Server Information
type: article
created_date: '2013-10-23'
created_by: Rose Contreras
last_modified_date: '2016-07-05'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

In addition to viewing CPU, RAM, and disk space configuration
information for available cloud servers, you can also view disk, I/O,
and networking information. Use this information to help you decide
which cloud server is right for your needs. You can view the servers
through either the command-line nova client or the Cloud Control Panel
GUI.

### View server information through novaclient

For information about installing the nova client on Windows, Linux, or
Mac systems, see [Using python-novaclient with the Rackspace Cloud](/how-to/using-python-novaclient-with-the-rackspace-cloud).

On the command line, run the following command::

     nova flavor-list

All available server configurations are displayed.

The server list contains the following information:

-   ID - The configuration ID
-   Name - The configuration name, labeled by RAM size and performance
    type
-   Memory_MB - The amount of RAM that the configuration has
-   Disk - The size of the disk in GB (for General Purpose Cloud
    Servers, the size of the system disk)
-   Ephemeral - The size of the data disk
-   Swap - The size of the swap space
-   VCPUs - The number of virtual CPUs associated with the configuration
-   RXTX_Factor - The amount of bandwidth, in Mbps, allocated to the
    PublicNet ports, ServiceNet ports, and isolated networks
    (Cloud Networks) attached to a server
-   Is_Public - Not used

You will see one of the following possible result sets, depending on
whether the region you selected supports General Purpose Cloud Servers:

**Server list for General Purpose and Compute, I/O, or Memory servers**

    +------------------+--------------------+-----------+------+-----------+------+-------+-------------+-----------+
    | ID               | Name               | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
    +------------------+--------------------+-----------+------+-----------+------+-------+-------------+-----------+
    | 2                | 512 MB Standard    | 512       | 20   | 0         | 512  | 1     | 88.0        | N/A       |
    | 3                | 1 GB Standard      | 1024      | 40   | 0         | 1024 | 1     | 120.0       | N/A       |
    | 4                | 2 GB Standard      | 2048      | 80   | 0         | 2048 | 2     | 240.0       | N/A       |
    | 5                | 4 GB Standard      | 4096      | 160  | 0         | 2048 | 2     | 400.0       | N/A       |
    | 6                | 8 GB Standard      | 8192      | 320  | 0         | 2048 | 4     | 600.0       | N/A       |
    | 7                | 15 GB Standard     | 15360     | 620  | 0         | 2048 | 6     | 800.0       | N/A       |
    | 8                | 30 GB Standard     | 30720     | 1200 | 0         | 2048 | 8     | 1200.0      | N/A       |
    | performance2-120 | 120 GB Performance | 122880    | 40   | 1200      |      | 32    | 10000.0     | N/A       |
    | performance2-15  | 15 GB Performance  | 15360     | 40   | 150       |      | 4     | 1250.0      | N/A       |
    | performance2-30  | 30 GB Performance  | 30720     | 40   | 300       |      | 8     | 2500.0      | N/A       |
    | performance2-60  | 60 GB Performance  | 61440     | 40   | 600       |      | 16    | 5000.0      | N/A       |
    | performance2-90  | 90 GB Performance  | 92160     | 40   | 900       |      | 24    | 7500.0      | N/A       |
    +------------------+--------------------+-----------+------+-----------+------+-------+-------------+-----------+

**Server list for only General Purpose servers**

    +------------------+--------------------+-----------+------+-----------+------+-------+-------------+-----------+
    | ID               | Name               | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
    +------------------+--------------------+-----------+------+-----------+------+-------+-------------+-----------+
    | 2                | 512 MB Standard    | 512       | 20   | 0         | 512  | 1     | 88.0        | N/A       |
    | 3                | 1 GB Standard      | 1024      | 40   | 0         | 1024 | 1     | 120.0       | N/A       |
    | 4                | 2 GB Standard      | 2048      | 80   | 0         | 2048 | 2     | 240.0       | N/A       |
    | 5                | 4 GB Standard      | 4096      | 160  | 0         | 2048 | 2     | 400.0       | N/A       |
    | 6                | 8 GB Standard      | 8192      | 320  | 0         | 2048 | 4     | 600.0       | N/A       |
    | 7                | 15 GB Standard     | 15360     | 620  | 0         | 2048 | 6     | 800.0       | N/A       |
    | 8                | 30 GB Standard     | 30720     | 1200 | 0         | 2048 | 8     | 1200.0      | N/A       |
    +------------------+--------------------+-----------+------+-----------+------+-------+-------------+-----------+

Copy the ID of the configuration that you want to use from the ID field.
You need it to create your server. To create a cloud server with nova
client, see the [Cloud Servers Developer Guide](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/).

### View server information through the Cloud Control Panel

You can view all the available information for your cloud server through
the Cloud Control Panel GUI. On a single page, you choose what type of
server to create (Windows or Linux) and the server configuration that
best meets your needs. Each server option has a unique configuration of
RAM, CPU, and disk space.

1. Log in to the Cloud Control Panel.
2. On the Cloud Servers page, click **Create Server**.
3. Enter a name and choose a location for your server.
4. Select the operating system for your server.
5. Select the configuration (flavor) by choosing the class of server: General Purpose, Compute, I/O, or Memory.
6. Use the slider bar to select the configuration of your server.

   The following information is listed for each configuration:
    -   CPU - The number of vCPUs
    -   RAM - The amount of RAM
    -   Boot Source - Allows you to boot a server from a remotely
        attached volume, which moves the system disk from local to
        remote
    -   System Disk - The size of the system disk (either 20 GB or
        40 GB)
    -   Network - The network throughput
    -   Disk I/O - A comparison of the I/O speed of this configuration
        with the I/O speed of other configurations - Good, Better, or
        Best

   A description of the selected configuration can help you decide if the configuration is right for you.

When you are satisfied with your server information and configuration,
click **Create Server.**
