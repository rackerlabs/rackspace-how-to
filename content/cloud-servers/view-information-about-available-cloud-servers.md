---
permalink: view-information-about-available-cloud-servers/
audit_date: '2017-08-01'
title: View information about available cloud servers
type: article
created_date: '2013-10-23'
created_by: Rose Contreras
last_modified_date: '2017-08-01'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

In addition to viewing CPU, RAM, and disk space configuration information for available cloud servers, you can also view disk, I/O, and networking information. Use this information to help you decide which cloud server is right for your needs. You can view the available servers through either the command-line nova client or the Cloud Control Panel GUI.

### View server information through novaclient

For information about installing the nova client on Windows, Linux, or
Mac systems, see [Using python-novaclient with Rackspace Cloud Servers](/how-to/using-python-novaclient-with-the-rackspace-cloud).

On the command line, run the following command:

    nova flavor-list

All available server configurations are displayed. The list contains the following information:

- ID - The server configuration ID
- Name - The configuration name, labeled by RAM size and performance type
- Memory_MB - The amount of RAM that the configuration has
- Disk - The size of the disk in GB (for General Purpose Cloud Servers, the size of the system disk)
- Ephemeral - The size of the data disk
- Swap - The size of the swap space
- VCPUs - The number of virtual CPUs associated with the configuration
- RXTX_Factor - The amount of bandwidth, in Mbps, allocated to the PublicNet ports, ServiceNet ports, and isolated networks (cloud networks) attached to a server
- Is_Public - Not used

Copy the ID of the configuration that you want to use from the ID field. You need it to create your server.

For instructions on creating a cloud server through the nova client, see the [Cloud Servers API guide](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/).

### View server information through the Cloud Control Panel

You can view all the available information for your cloud server through the Cloud Control Panel GUI. On a single page, you choose what type of server to create (Windows or Linux) and the server configuration that best meets your needs. Each server option has a unique configuration of RAM, CPU, and disk space.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).
2. In the top navigation bar, click **Servers > Cloud Servers**.
3. On the Cloud Servers page, click **Create Server**.
4. In the **Flavor** section, view server configuration information by first choosing the class of server--General Purpose, Compute, Memory, I/O, or Standard--and then using the slider bar to select the specific configuration.

   The following information is listed for each configuration:

      - CPU - The number of vCPUs
      - RAM - The amount of RAM
      - Boot Source - Allows you to boot a server from a remotely attached volume, which moves the system disk from local to remote
      - System Disk - The size of the system disk
      - Network - The network throughput
      - Disk I/O - A comparison of the I/O speed of this configuration with the I/O speed of other configurations (Good, Better, or Best)

   A description of the selected configuration can help you decide if the configuration is right for you. You can also click the **Comparison Chart** link to see a comparison chart for all the configurations in each class.

For instructions on creating a cloud server through the Cloud Control Panel, see [Create a cloud server](/how-to/create-a-cloud-server).
