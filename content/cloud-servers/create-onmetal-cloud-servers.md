---
permalink: create-onmetal-cloud-servers/
audit_date:
title: Create OnMetal Cloud Servers
type: article
created_date: '2014-06-19'
created_by: Russell Haering
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

OnMetal Cloud Servers enables you to boot bare metal servers via the
Rackspace Cloud Control Panel interface. Use the following steps to set
up an OnMetal server through the Control Panel.

**Note:** For the parallel steps in the API, see [Using OnMetal Cloud Servers through the API](/how-to/using-onmetal-cloud-servers-through-api).

### Create an OnMetal server in the Cloud Control Panel

1.  Log in to the [Cloud Control Panel.](http://mycloud.rackspace.com)

    The Cloud Servers list opens by default.

2.  Click the **Create Server** button.
3.  In the **Server Details** section of the Create Server page, enter a
    name for the server and select the region in which the server
    will reside.

    **Note:** OnMetal servers are currently available only in the
    Northern Virginia (IAD) region. This list will be expanded as other
    regions become available.

4.  Click the **OnMetal Server** tab.
5.  Select an image for the server.

    **Note:** To avoid performance degradation, run the CentOS 6.5 image
    only on a Linux Kernel release of 3.10 or later.

6.  In the **Flavor** section, choose the appropriate configuration for
    your workload. Click each flavor class for a description.
    -   All flavors have a 32 GB system disk.
    -   All flavors include dual 10 GigE NICs in a high-availability
        bonded configuration and use VLAN tagging to access ServiceNet
        (for traffic within a Rackspace region) and PublicNet
        (the Internet).

7.  Assign a public key to the server by either selecting an existing
    key or adding a new one:
    -   To assign an existing public key, select the key name in the
        **SSH Keys** list, and skip to step 13.
    -   To add a new public key, continue with the next step.
        **IMPORTANT:** OnMetal servers *must* be created using an SSH
        key pair. For information about generating a public and private
        key pair, see [Manage SSH Key Pairs for Cloud Servers with
        python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).

8.  To add a new public key, click **Add Public Key**.
    **Note:** If you have previously added your public key, this option
    is labeled **Manage SSH Keys**.
9.  Specify a name for the public key.
10. In the **Region** field, confirm the region in which your key will
    be used.
11. Paste your entire public key in the **Public Key** field, and then
    click **Add Public Key**.
12. Confirm that your key is listed in the **SSH Keys** list for your
    new server and select it.
13. As needed, create a new network and select the PublicNet and
    ServiceNet options.
14. Click **Create Server**.
    Your server is built.

### Boot the server

1.  On the details page for your server, click the link under **Log Into
    Your Server Now** in the right-hand column. For more information,
    see [Connecting to a server using SSH on Linux or Mac OS for further information](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os).
2.  Use the following command to boot your OnMetal server.

        supernova iad boot --flavor flavorId --image imageId --key-name keyName serverName

    For example:

        supernova iad boot --flavor onmetal-compute1 --image 1387253c-7735-4542-9612-26bc9ff77a9d --key-name johndoe onmetal-test

    You should see output similar to the following example:

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

    **Note:** Although this output displays an admin password, this
    password is not actually used. You can safely ignore it.

    The server should take about five minutes to build. You can check
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

    Within a few minutes, the server is assigned public and private IP
    addresses, which you can see in the output of the `show` command.
    After the status becomes ACTIVE, the server boots for the
    first time. The server is not reachable, however, until the network
    configuration is complete, which might take another few minutes.

### Log in to the server

After the server has booted, use the SSH key pair that you specified to
log in to the server.

**Note:** CoreOS requires you to sign in as "core."

    ssh root@publicIpAddress

### Delete the server

If needed, you can also delete or cancel the server.

1.  Run the following command, replacing the example ID with your
    server's ID:

        supernova iad delete a8ea2366-9e50-4604-b6ce-e3edb8750451

2.  Use the following command to see the progress:

        supernova iad list

    The output should look similar to the following example:

        +--------------------------------------+---------+--------+------------+-------------+---------------------------------------------+
        | ID | Name | Status | Task State | Power State | Networks |
        +--------------------------------------+---------+--------+------------+-------------+---------------------------------------------+
        | d1d58868-2b14-4fa5-b01f-e51d658556a8 | highcpu | ACTIVE | deleting | Running | public=23.253.157.105; private=10.184.0.105 |
        +--------------------------------------+---------+--------+------------+-------------+---------------------------------------------+

    **Note:** Your server goes into the task state deleting. OnMetal
    server deletions take longer than virtual server deletions, usually
    a few minutes.

### Using OnMetal

The flash cards included with the OnMetal I/O flavor are unformatted.
You can RAID and format them however you like. For more information, see
[Configure flash drives in High I/O instances as Data drives](/how-to/configure-flash-drives-in-high-io-instances-as-data-drives).
