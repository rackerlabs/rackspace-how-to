---
permalink: create-onmetal-cloud-servers/
audit_date: '2018-11-09'
title: Create OnMetal Cloud Servers
type: article
created_date: '2014-06-19'
created_by: Russell Haering
last_modified_date: '2018-11-26'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

OnMetal Cloud Servers enables you to boot bare metal servers through the
Rackspace Cloud Control Panel interface. This article shows you how to set
up an OnMetal server through the Cloud Control Panel.

**Note**: For the parallel steps in the API, see [Manage OnMetal Cloud Servers
through the API](/how-to/using-onmetal-cloud-servers-through-api).

### Create an OnMetal server in the Cloud Control Panel

Use the following steps to create an OnMetal server in the Cloud Control Panel:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Servers > Cloud Servers**.

4. Click the **Create Server** button.

5. On the **Create Server** page, ensure that you've selected a region in
   which OnMetal servers are available.

    **Note**: OnMetal servers are available only in the Northern Virginia
    (IAD), Dallas (DFW), and UK (LON) regions. This list will expand as other
    regions become available.

6. Click the **OnMetal Server** tab.

7. In the **Server Details** section of the **Create Server** page, enter a
   name for the server and select the region in which the server
   will reside.

8. Click the **OnMetal Server** tab.

9. In the **Image** section, select an image for the server.

    **Note**: To avoid performance degradation, run the CentOS&reg; 6.5 image
    only on a Linux&reg; Kernel release of 3.10 or later.

10. In the **Flavor** section, choose the appropriate configuration for
    your workload. Click each flavor class for a description.

     **Note**: All OnMetal flavors include dual-bonded 10Gbe Network Interface
     Card (NIC) interfaces that enable the image operating system (OS) to
     share Public and Service network access redundantly in case one of the
     connections goes down. For details about all available flavors, see
     [OnMetal Cloud Server
     flavors](https://developer.rackspace.com/docs/cloud-servers/v2/general-api-info/flavors/#onmetal-cloud-server-flavors).

11. Assign a public Secure Shell (SSH) key to the server by either selecting
    an existing key, or adding a new one.

     **IMPORTANT**: OnMetal servers *must* be created by using an SSH
     key pair. For information about generating a public and private
     key pair, see [Manage SSH Key Pairs for Cloud Servers with
     python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).

    -   To assign an existing public key, select the key name for an existing
        public key in the **SSH Key** list, or add a new public key by using
        the following steps:
        - Click **Manage SSH Keys > Add Public Key**.
        - Enter a **Key Name**.
        - In the **Region** field, confirm the region in which your key will
          be used.
        - Paste your entire public key in the **Public Key** field.
        - Finally, click **Add Public Key**.
        - Confirm that your key is listed in the **SSH Keys** list for your
          new server and select it.

12. If necessary, create a new network and select the **PublicNet** and
    **ServiceNet** options.

13. Click **Create Server** to build your server.

### Boot the server

This section shows you how to boot the following types of OmMetal servers:

- [Linux&reg; and MacOS&reg;](#linux-and-macos)
- [Microsoft&reg; Windows&reg;](#microsoft-windows)

**Note**: To boot an OnMetal server you must first install the [nova
client](https://developer.rackspace.com/docs/cloud-servers/v2/getting-started/send-request-ovw/#id2).

#### Linux and MacOS

Use the following steps to boot an OnMetal v1 server that is running Linux or
MacOS:

1.  On the details page for your server, click the link under **Log Into
    Your Server Now** in the right-hand column. For more information,
    see [Connect to a server using SSH on Linux or Mac OS for further
    information](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os).
2.  Use the following command format to boot your OnMetal server, substituting
    the appropriate region:

        supernova iad boot --flavor flavorId --image imageId --key-name keyName serverName

    The following code includes example values:

        supernova iad boot --flavor onmetal-compute1 --image 1387253c-7735-4542-9612-26bc9ff77a9d --key-name johndoe onmetal-test

    The output should be similar to the following example:

        +------------------------+--------------------------------------+
        | Property               | Value                                |
        +------------------------+--------------------------------------+
        | status                 | BUILD                                |
        | updated                | 2014-05-31T00:23:29Z                 |
        | OS-EXT-STS:task_state  | scheduling                           |
        | key_name               | johndoe                              |
        | image                  | OnMetal - Debian 7 (Wheezy)          |
        | hostId                 |                                      |
        | OS-EXT-STS:vm_state    | building                             |
        | flavor                 | OnMetal I/O v1                       |
        | id                     | a8ea2366-9e50-4604-b6ce-e3edb8750451 |
        | user_id                | 83362                                |
        | name                   | teeth5                               |
        | adminPass              | 6FgtaEqkapRo                         |
        | tenant_id              | 545251                               |
        | created                | 2014-05-31T00:23:29Z                 |
        | OS-DCF:diskConfig      | MANUAL                               |
        | accessIPv4             |                                      |
        | accessIPv6             |                                      |
        | progress               | 0                                    |
        | OS-EXT-STS:power_state | 0                                    |
        | config_drive           |                                      |
        | metadata               | {}                                   |
        +------------------------+--------------------------------------+

    **Note**: Although this output displays an administrative password, this
    password is not actually used. You can safely ignore it.

    The server takes about five minutes to build. You can check
    the status by running the following command:

        supernova iad show instanceId

    The output should look like the following example:

        +------------------------+--------------------------------------------------------------------+
        | Property               | Value                                                              |
        +------------------------+--------------------------------------------------------------------+
        | status                 | ACTIVE                                                             |
        | updated                | 2014-05-31T00:27:34Z                                               |
        | OS-EXT-STS:task_state  | None                                                               |
        | private network        | 10.184.0.48                                                        |
        | key_name               | johndoe                                                            |
        | image                  | OnMetal - Debian 7 (Wheezy) (1387253c-7735-4542-9612-26bc9ff77a9d) |
        | hostId                 | 8a12611e45a1e15a1aec221ab05c8494524d6bf00e7fb17c5c82722a           |
        | OS-EXT-STS:vm_state    | active                                                             |
        | public network         | 23.253.157.48                                                      |
        | flavor                 | OnMetal I/O v1 (onmetal-io1)                                       |
        | id                     | a8ea2366-9e50-4604-b6ce-e3edb8750451                               |
        | user_id                | 83362                                                              |
        | name                   | teeth5                                                             |
        | created                | 2014-05-31T00:23:29Z                                               |
        | tenant_id              | 545251                                                             |
        | OS-DCF:diskConfig      | MANUAL                                                             |
        | accessIPv4             | 23.253.157.48                                                      |
        | accessIPv6             |                                                                    |
        | progress               | 0                                                                  |
        | OS-EXT-STS:power_state | 1                                                                  |
        | config_drive           |                                                                    |
        | metadata               | {}                                                                 |
        +------------------------+--------------------------------------------------------------------+

    Within a few minutes, the server is assigned public and private Internet
    Protocol (IP) addresses, which display in the output from the `show`
    command.

    After the status becomes `ACTIVE`, the server boots for the
    first time. However, the server is not reachable until the network
    configuration is complete, which might take another few minutes.

#### Windows

Use the following steps to boot an OnMetal v2 server that is running Windows:

1. To get the universally unique identifier (UUID) of the OnMetal Windows
   image that you want to use, enter the command `nova image-list` on the
   command line.

    The output should look like the following example:

    | 6b6f855f-5967-48c2-81a3-3615e69f6f8e | OnMetal - Windows Server 2016                                | ACTIVE |     

2. Boot the instance in the same way that you would [boot a Linux OnMetal
   instance](#linux-and-macos), but omit the key-name.

   The API response provides an administrative password that you can use to log
   in to your Windows instance after it has booted successfully.

### Log in to the server

After the server has booted, use the SSH key pair that you specified to
log in to the server.

**Note:** CoreOS requires you to sign in as "core."

    ssh root@publicIpAddress

### Delete the server

If necessary, you can also delete or cancel the server by using the following
steps:

1.  Run the following command, replacing the example ID with your
    server's ID and `iad` with the appropriate region, if necessary:

        supernova iad delete a8ea2366-9e50-4604-b6ce-e3edb8750451

2.  Use the following command to view the progress:

        supernova iad list

    The output should look similar to the following example:

        +--------------------------------------+---------+--------+------------+-------------+---------------------------------------------+
        | ID | Name | Status | Task State | Power State | Networks |
        +--------------------------------------+---------+--------+------------+-------------+---------------------------------------------+
        | d1d58868-2b14-4fa5-b01f-e51d658556a8 | highcpu | ACTIVE | deleting | Running | public=23.253.157.105; private=10.184.0.105 |
        +--------------------------------------+---------+--------+------------+-------------+---------------------------------------------+

    **Note**: Your server enters the task state `deleting`. OnMetal
    server deletions take longer than virtual server deletions.
    This process typically takes a few minutes.

### Using OnMetal

The flash cards that are included with the OnMetal I/O flavor are unformatted.
You can RAID and format them however you like. For more information, see
[Configure flash drives in High I/O instances as Data
drives](/how-to/configure-flash-drives-in-high-io-instances-as-data-drives).
