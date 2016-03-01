---
node_id: 3807
title: Rackspace Private Cloud Sandbox
type: article
created_date: '2013-12-09'
created_by: Karin Levenstein
last_modified_date: '2016-01-07'
last_modified_by: Rose Contreras
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

Rackspace Private Cloud Sandbox is a fast, free, and easy way to install
a Rackspace Private Cloud powered by OpenStack on a single physical
device. This method is suitable for anyone who wants to install an
OpenStack-powered private cloud for testing or demonstration purposes.

Rackspace Private Cloud Sandbox v1.0 runs Rackspace Private Cloud v4.2.1
powered by the [Havana release of
OpenStack](http://www.openstack.org/software/havana/).

### Rackspace Private Cloud Sandbox

The Rackspace Private Cloud Sandbox system creates a Rackspace Private
Cloud, including all of the APIs and services available in OpenStack
Havana, using a single instance.

Because this is a single-node setup, this system does not provide a
highly available or high performance solution. However, it is ideal for
demonstrations and testing.

QEMU is used as the hypervisor. QEMU has the best performance in this
environment, and it is capable of nesting virtualization: a virtual
server with the capability to virtualize instances.

This system also features a Rackspace tab in the Horizon dashboard. This
is a Python package which operates as a plugin for Horizon, so Horizon
or any other upstream packages have not been changed. Because of this
plugin, the Horizon cookbook template file for
`local_settings.py`{.filename} was modified.

More information for this project can be seen at the [RCBOPS Virtual
Appliance Builder Github
page](https://github.com/cloudnull/rcbops_virt_builder). Specific
changes are listed in the [setup notes on that
page](https://github.com/cloudnull/rcbops_virt_builder/blob/master/setup_notes.rst).

### Requirements

To set up the Rackspace Private Cloud Sandbox, you will require a
physical machine with these specifications:

-   At least 2048MB of RAM. Note that the VM will default to 2560MB when
    imported, though you can change this to suit your environment.
-   At least 35GB of storage space. The installed size of the OVA is
    6GB, and the virtual disk image size is 25GB; however it is a
    dynamically expanding disk. Be aware of the potential for the disk
    size to grow, and plan accordingly.
-   Three local-only network devices for the virtual machine. These can
    be run from a single physical access point, which should be set up
    for you automatically during the installation of the
    desktop hypervisor.
-   An active internet connection. If you do not have an active internet
    connection, you will receive an error message when you launch
    the OVA. If this happens, ensure that your internet connection is
    active and then reboot the OVA.

### Setup

The Rackspace Private Cloud Sandbox system has two different OVAs. One
is designed for VMWare Player, Fusion, and Workstation, and the other is
designed for VirtualBox.

**Note:** There is a known issue with the Chrome browser on Apple Mac computers. If you have the Hide Extensions option selected, Chrome will change the file extension from <code class="filename">.ova</code> to <code class="filename">.ovf</code>, which will cause a failure when VMWare or VirtualBox tries to import the file. To work around this issue, de-select Hide Extensions in the file download dialog box, or manually change the extension of the downloaded file to <code class="filename">.ova</code>.

#### VMWare

This section explains how to import the appliance and start the VM on
VMWare Player 6, Fusion 6, and Workstation 7 and later.

It is strongly recommended that you use this system on VMWare. You can
download VMWare Player 6 for Windows or Linux from the [VMWare
site](https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_player/6_0).

**Procedure 2.1. To set up Rackspace Private Cloud Sandbox on
VMWare**

1.  [Download the OVA
    file](http://b73074de3e3005d3cbe3-e008c7df2e56236b013895bc1d6b995e.r10.cf2.rackcdn.com/RPC-SANDBOX-VMWARE.ova)
    and save it to your local device.

2.  In VMWare, import the OVA file. Navigate to **File Import &gt; Choose
    File**.

3.  Select the OVA file, and click **Continue to import the virtual machine**.

4.  Click **Start the VM** to start the
    virtual machine.

5.  When the VM is active, you will be able to use the OpenStack image
    without the need for bridged networking.

During the import process, you may experience the following messages:

-   During the OVA import, you may be asked if you would like to upgrade
    the hardware compatibility profile. This message appears when you
    are using a new version of VMWare than the version on which the OVA
    was built. You can upgrade the profile without any
    negative consequences.
-   You may receive an error message indicating that the OVA cannot be
    imported due to OVA specifications. If you receive this message,
    click <span class="guibutton">Retry</span>, This will relax the OVA
    import requirements and enable the OVA to be imported
    without issues.

#### VirtualBox

This section explains how to set up Rackspace Private Cloud Sandbox
using VirtualBox 4.3.x. Rackspace strongly recommends that you work on a
clean installation of VirtualBox. You can download VirtualBox from the
[VirtualBox site](https://www.virtualbox.org/).

VirtualBox provides many network options. While any network setup that
functions in your environment will work, the recommended setup is:

-   A bridged network
-   A host-only network
-   An internal network

In this networking environment, the only network type that you will need
to configure is the host-only network. The internal network is
configured from within the VM, and the bridged network is configured by
the public network to which you are attached.

**Note:** When the VM is imported, Adapter 1 is set up as a bridged network by default. The bridged device that is set up is an ethernet device, and needs to be the device that you use to connect to the internet. For example, a laptop may have a setting of en1 &quot;wi-fi&quot;, whereas a desktop device may use en0 &quot;Ethernet&quot;. If you are not able to use a bridged network for any reason, you can change the network type for Adapter 1 to a NAT network. This will make instances inaccessible, but will still enable you to use all of the OpenStack APIs, including the OpenStack Dashboard.

The settings in the following procedure are a guide only, and might need
to be adjusted to suit your environment.

**Procedure 2.2. To set up Rackspace Private Cloud Sandbox on
VirtualBox 4.3.x**

1.  [Download the OVA
    file](http://b73074de3e3005d3cbe3-e008c7df2e56236b013895bc1d6b995e.r10.cf2.rackcdn.com/RPC-SANDBOX-VBOX.ova)
    and save it to your local device.

2.  In VirtualBox, navigate to <span
    class="keycap">**Preferences**</span>-<span
    class="keycap">**Network**</span>-<span class="keycap">**Host-Only
    Networks**</span>.

3.  Click on the icon to add a new host-only network and assign it
    a name.

4.  Configure the host network settings:

    ``` {.programlisting}
    IPv4 Address: 192.168.56.1
    IPv4 Network Mask: 255.255.255.0
    IPv6 Address: <Leave this field blank>
    IPv6 Network Mask Length: 0
    ```

5.  Configure the DHCP Server settings:

    ``` {.programlisting}
    Server Address: 192.168.56.100
    Server Mask: 255.255.255.0
    Lower Address Bond: 192.168.56.200
    Upper Address Bond: 192.168.56.254
    ```

    After configuring these settings, click OK to create the network.

6.  Navigate to <span class="keycap">**File**</span> <span
    class="keycap">**Import**</span> <span class="keycap">**Choose
    File**</span> .

    Select the OVA file, and click <span class="guibutton">Import</span>
    to import the virtual machine.

7.  After the import process is complete, enable acceleration. Select
    the new virtual machine and navigate to <span
    class="keycap">**Settings**</span>+<span
    class="keycap">**System**</span>+<span
    class="keycap">**Acceleration**</span> Select the following check
    boxes:

    -   <span class="guilabel">Enable VT-x/AMD-V</span>
    -   <span class="guilabel">Enable Nested Paging</span>

8.  Configure the adapter settings as follows:

    -   <span class="bold">**Adapter 1**</span>: Attach to the
        internet connection.

        This defaults to the bridged adapter on the ethernet port, but
        can be set to NAT if you cannot use a bridged network due to
        network restrictions. However, you will not be able to connect
        to built instances from within the Sandbox cluster. You will
        still be able to use Horizon and connect to the built instances
        via the Horizon console.

    -   <span class="bold">**Adapter 2**</span>: Attach to Internal
        Network (Internal Only). Accept the default name.
    -   <span class="bold">**Adapter 3**</span>: Attach to Host
        Only Adapter. The network name should match the one created in
        Step 3.
    -   <span class="bold">**Adapter 4**</span>: Attach to Internal
        Network (Internal Only).

9.  Click <span class="guibutton">OK</span> to accept the settings and
    then click <span class="guibutton">Start the VM</span> to start the
    virtual machine. This could take a long time; however it will get
    faster once the image has been saved in the cache.

**Procedure 2.3. To troubleshoot the VM**

If the VM fails on first boot:

1.  Log in to the virtual machine from a command prompt, and run these
    commands to prime the system for the first boot, and to display a
    list of devices and their corresponding hardware MAC addresses:

    ``` {.screen}
    $ touch /opt/first.boot
    $ /sbin/ip addr show | grep -E ^eth
    ```

2.  Return to **Settings Network** in the virtual machine and adjust
    the MAC addresses until they match those returned by the command.

3.  Shut down the instance and restart it. If the set up has been
    successful, the instance will boot and be assigned an IP address for
    both local and external network connections. This could take a long
    time; however it will get faster once the image has been saved in
    the cache.

### Using the private cloud

For general information about using the private cloud, refer to
the [Rackspace Private Cloud
API](http://docs.rackspace.com/rpc/api/v4/rackspace-private-cloud-upgrade/content/rpc-common-front.html).

#### Logging into the cloud

To access the system, you can use the command line interface or the
graphical Horizon dashboard. Both interfaces use the following default
credentials:

-   Username: *`admin`*
-   Password: *`Passw0rd`*

If you access the system using the command line, the root user is
enabled and has SSH access.

These credentials can be used to access any of the OpenStack APIs. For
access to the environment variables needed to access the OpenStack APIs
using the command line interface, look in the root user's
`.openrc`{.filename} file.

#### Cloud features

There is only one flavor available to the virtual machine in this
system, which is the `512MB Standard Instance`{.filename} flavor. This
ensures that instances are bootable even if they only have the minimum
amount of RAM available to them. If you require new flavors, you can
create them using either the command line interface, or the Horizon
dashboard. The virtual machine comes with one image, Ubuntu 12.04.03.

Cinder is set up on this system as a loopback file. It is a COW file
located at `/opt/cinder.img`{.filename} and will grow as you use it. A
default Cinder volume type is also created, called
`TestVolType`{.filename}.

An SSH key is automatically created, called `adminKey`{.filename}, which
can be used to boot instances.

#### Cloud performance

When you build an instance, the first boot may take some time to
complete. After the first boot, the image will be cached, and subsequent
boots will be faster.

System performance is dependent on the speed of your network and of your
host machine. The system uses nested hosting, which means that you are
virtualizing a virtual machine host which is, in turn, virtualizing
virtual machines. This means that it will frequently take some time to
complete tasks using the APIs.

All interactions you have with built instances must occur on the host
they were booted on. The instances will not be accessible outside of the
host virtual machine. Although networking will function correctly, it is
recommended that you do not put a lot of load on the built instances.
Performance will decline quickly as more load is placed on the host
machine.
