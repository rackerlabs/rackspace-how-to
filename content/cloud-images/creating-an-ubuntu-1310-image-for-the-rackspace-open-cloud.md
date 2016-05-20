---
permalink: creating-an-ubuntu-1310-image-for-the-rackspace-open-cloud/
audit_date:
title: Create an Ubuntu 13.10 image for the Rackspace open cloud
type: article
created_date: '2014-02-17'
created_by: Cloud Images
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Images
product_url: cloud-images
---

You can use the Cloud Images service to import custom virtual machine
disk images into the Rackspace open cloud. In order for your images to
be bootable as servers in the Rackspace cloud, however, they must be
properly prepared. This article provides a detailed example of how to
prepare an image of a particular operating system. After you've worked
through it, you'll have a better idea of how to go about creating your
own custom image for the Rackspace cloud.

### Prerequisites

-   XenServer hypervisor already set up with a network available for the
    new VM.
-   A server that hosts your kickstart file via HTTP or HTTPS.
-   A Rackspace Cloud account in the region where you want to import
    your image.

### Tips and warnings

The instructions in this article are provided to you as an example
of how to prepare an image. Read through them carefully before
using them. They are provided "as is" without warranty of any kind,
either expressed or implied, including, but not limited to, the
implied warranties of merchantability and fitness for a
particular purpose.

The instructions are written so you can create and re-create the
same VM repeatedly as you perfect your image.

**Note:** The scripts will automatically delete old VMs and templates that were created in previous runs.

Ensure that whatever kickstart file you use installs the XenServer
and nova agents together, or the cloud-init agent.

**Note**: Cloud-init currently isn't working because of a bug with
config-drive in OpenStack.

- The XenServer 6.2.0 tools ISO can be downloaded
  from: <http://boot.rackspace.com/files/xentools/xs-tools-6.2.0.iso>,
  and installed with the following command:

        mkdir -p tmp; mount -o loop xs-tools-6.2.0.iso tmp; cd tmp/Linux; ./install.sh; cd ../..; umount tmp

- Nova agent installation instructions are at
  [Using Nova Agent for Linux](https://github.com/rackerlabs/boot.rackspace.com/wiki/Using-Nova-Agent-for-Linux).

- cloud-init installation instructions are
  at [Using Cloud-Init for Linux](https://github.com/rackerlabs/boot.rackspace.com/wiki/Using-Cloud-Init-for-Linux).

The instructions refer to a custom kickstart file located
at `http://host.com/kickstart.cfg`. It's set as the value of the
shell variable `KICKFILE` and then used as the value of `ks` in the
`PV-args`. These instructions assume that you have such a file. If
you don't, you can remove `ks=$KICKFILE` from the `PV-args`
parameter, or you can [create a new kickstart file](http://www.centos.org/docs/4/html/rhel-sag-en-4/s1-kickstart2-file.html). If you remove `ks=$KICKFILE` from the `PV-args` parameter, you will
have to answer several questions in the Linux installer.

If your VM network requires static IPs, you must perform the following tasks:

- Remove `ip=dhcp` from the PV-args parameter and add an entry
  similar to the following one:

      ip=10.1.2.3 netmask=255.255.255.0 gateway=10.1.2.1 dns=8.8.8.8

- Modify the `network` section of your kickstart file so it reads
  similar to the following entry:

      network --onboot yes --device eth0 --bootproto static --ip 10.1.2.3 --netmask 255.255.255.0 --gateway 10.1.2.1 --nameserver 8.8.8.8 --ipv6 auto --hostname localhost

### Quick instructions

1.  Use the following one-liner to kickstart the VM and generate the VHD
    file.

    It performs the following actions:

      - Sets variables.
      - Deletes any old VMs or templates with the same name.
      - Creates a new template based on the CentOS 6.0 64-bit template.
      - Creates the VIM and VIF.
      - Sets the install-repository parameter and PV-args parameter.
      - Starts the VM, which automatically installs itself and halts.

    **NOTE:** This one-liner assumes that the kickstart file handles the
    installation of the necessary XenServer, nova, or cloud-init agents
    in post-installation. Ensure that your kickstart file does the same.
    Details about the agent installations are in the "Tips and
    Warnings" section.

        VMNAME=ubuntutestvm1; TEMPLATENAME=Ubuntu13.10; NETNAME=publicnet; MIRROR="http://mirror.rackspace.com/ubuntu/"; KICKFILE="http://host.com/kickstart.cfg"; VMUUID=`xe vm-list name-label=$VMNAME params=uuid --minimal`; NETUUID=`xe network-list name-label=$NETNAME params=uuid --minimal`; TEMPLATEUUID=`xe template-list name-label=$TEMPLATENAME params=uuid --minimal`; TEMPLATESOURCE=`xe template-list name-label=Ubuntu\ Lucid\ Lynx\ 10.04\ \(64-bit\) params=uuid --minimal`; SR=`mount |grep sr-mount |cut -d' ' -f3`; if [ "$VMUUID" != "" ]; then xe vm-uninstall uuid=$VMUUID --force; fi; if [ "$TEMPLATEUUID" != "" ]; then xe template-uninstall template-uuid=$TEMPLATEUUID --force; fi; TEMPLATEUUID=`xe vm-clone uuid="$TEMPLATESOURCE" new-name-label="$TEMPLATENAME"`; xe template-param-set uuid=$TEMPLATEUUID other-config:debian-release=saucy; VMUUID=`xe vm-install template=$TEMPLATENAME new-name-label=$VMNAME`; VMVHD=`xe vbd-list vm-name-label=$VMNAME params=vdi-uuid --minimal`.vhd; xe vif-create vm-uuid=$VMUUID network-uuid=$NETUUID mac=random device=0; xe vm-param-set uuid=$VMUUID other-config:install-repository=$MIRROR; xe vm-param-set uuid=$VMUUID PV-args="console=hvc0 ks=$KICKFILE netcfg/disable_autoconfig=true netcfg/get_nameservers=173.203.4.9 netcfg/get_ipaddress=10.23.207.242 netcfg/get_netmask=255.255.248.0 netcfg/get_gateway=10.23.200.1 netcfg/confirm_static=true netcfg/get_hostname=localhost netcfg/get_domain=domain"; xe vm-start uuid=$VMUUID

2.  Shut down the VM.

        xe vm-shutdown uuid=$VMUUID

3.  Use the echo command to find your image.

        echo "Your prepared image is named '$VMVHD' and is located in the directory '$SR' "

#### Detailed Instructions

1.  Log in to XenServer as root.
2.  Set the following variables:

        # The name of your VM
        VMNAME=ubuntutestvm1
        # The name of the new OS template
        TEMPLATENAME=Ubuntu13.10
        # The name of the VM network
        NETNAME=publicnet
        # The URL to the mirror for the OS install
        MIRROR="http://mirror.rackspace.com/ubuntu/"
        # The URL to the kickstart file **Point this to your own kickstart file!**
        KICKFILE="http://host.com/kickstart.cfg"
        # Grab UUID of previous VM
        VMUUID=`xe vm-list name-label=$VMNAME params=uuid --minimal`
        # Grab UUID of network
        NETUUID=`xe network-list name-label=$NETNAME params=uuid --minimal`
        # Grab template UUID
        TEMPLATEUUID=`xe template-list name-label=$TEMPLATENAME params=uuid --minimal`
        # Grab source template UUID
        TEMPLATESOURCE=`xe template-list name-label=Ubuntu\ Lucid\ Lynx\ 10.04\ \(64-bit\) params=uuid --minimal`
        # Grab location of local disk XenServer SR
        SR=`mount |grep sr-mount |cut -d' ' -f3`

3.  If a previous VM or template exists with a matching name, delete it.

        if [ "$VMUUID" != "" ]; then xe vm-uninstall uuid=$VMUUID --force; fi; if [ "$TEMPLATEUUID" != "" ]; then xe template-uninstall template-uuid=$TEMPLATEUUID --force; fi

4.  If a Xen OS template doesn't already exist for this OS, create one:

        TEMPLATEUUID=$(xe vm-clone uuid=`xe template-list name-label=Ubuntu\ Lucid\ Lynx\ 10.04\ \(64-bit\) params=uuid --minimal` new-name-label="$TEMPLATE"); xe template-param-set uuid=$TEMPLATEUUID other-config:debian-release=saucy

5.  Create a new template, store the UUID in \$TEMPLATEUUID, and set the
    debian-release parameter to saucy.

        TEMPLATEUUID=`xe vm-clone uuid="$TEMPLATESOURCE" new-name-label="$TEMPLATENAME"`; xe template-param-set uuid=$TEMPLATEUUID other-config:debian-release=saucy

6.  Create the VM and store the UUID in \$VMUUID. Store VBD file name
    for the VM in \$VMVHD.

        VMUUID=`xe vm-install template=$TEMPLATENAME new-name-label=$VMNAME`; VMVHD=`xe vbd-list vm-name-label=$VMNAME params=vdi-uuid --minimal`.vhd

7.  Create the VIF for the VM and attach it to the appropriate network.

        xe vif-create vm-uuid=$VMUUID network-uuid=$NETUUID mac=random device=0

8.  Set the other-config:install-repository parameter to
    Rackspace mirror.

        xe vm-param-set uuid=$VMUUID other-config:install-repository=$MIRROR

9.  Set the PV-args parameter, which sets the kickstart file location,
    the kickstart device, DHCP, and no IPv6 during installation.

    **Note:** This instruction assumes that the kickstart file handles the
    installation of the necessary XenServer, nova, or cloud-init agents
    in post-installation. Ensure that your kickstart file does the same.
    Details about the agent installations are in the "Tips and
    Warnings" section.

        xe vm-param-set uuid=$VMUUID PV-args="console=hvc0 ks=$KICKFILE netcfg/disable_autoconfig=true netcfg/get_nameservers=173.203.4.9 netcfg/get_ipaddress=10.23.207.242 netcfg/get_netmask=255.255.248.0 netcfg/get_gateway=10.23.200.1 netcfg/confirm_static=true netcfg/get_hostname=localhost netcfg/get_domain=domain"

10. Start the VM

        xe vm-start uuid=$VMUUID

11. Wait for installation to finish.

    You can connect to the console by using VNC; for example:

        # Establish ssh port forwarding to the appropriate VNC port on the XenServer
        ssh -L 5902:localhost:5902 root@10.1.2.3

        # Now from your desktop you can connect to the console to watch the installation progress
        xvnc4viewer 127.0.0.1:5902

12. After the installation is finished and the VM has shut down, issue a
    proper shutdown command:

        xe vm-shutdown uuid=$VMUUID

13. Use the echo command to remind yourself where the image file that
    you prepared is located.

        echo "Your prepared image is named '$VMVHD' and is located in the directory '$SR' "

    **Note:** You can move the image file anywhere you like. You can
    also rename it. We recommend that you give the file a name that
    describes what's on the image. The image file is a binary file with
    no extractable metadata, so you cannot use the file to see what is
    in it.

14. Import the image to the Rackspace cloud.

### Summary

Following is a quick summary of how to do this by using the Cloud
Images API.

**Note:** This summary assumes that you have already uploaded the image to a container called **images** in the region where you want to import the image and that you have named your image **ubuntu1310v1.vhd**.

        # Set your token to $TOKEN, tenantid to $TENANTID and endpoint to $IMAGESURL
        TOKEN="YOURTOKENHERE"
        TENANTID="YOURTENANTIDHERE"
        IMAGESURL="https://iad.images.api.rackspacecloud.com/v2"

        # Create the import image task
        curl -s $IMAGESURL/tasks -X POST -H "X-Auth-Project-Id: $TENANTID" -H "Accept: application/json"  -H "Content-Type: application/json" -H "X-Tenant-Id: $TENANTID" -H "X-User-Id: $TENANTID" -H "X-Auth-Token: $TOKEN" -d '{"type": "import", "input": {"import_from": "images/ubuntu1310v1.vhd", "image_properties" : {"name": "Custom Ubuntu 13.10 v1"}}}'

The output of the above command (piped through `python -m json.tool`) is:

        {
            "created_at": "2014-01-03T01:24:21Z",
            "expires_at": "2014-01-03T01:24:21Z",
            "id": "31f3e9c2-6b98-4f66-afdb-b249b24c82b4",
            "input": {
                "image_properties": {
                    "name": "Custom Ubuntu 13.10 v1"
                },
                "import_from": "images/ubuntu1310v1.vhd"
            },
            "owner": "000000",
            "schema": "/v2/schemas/task",
            "self": "/v2/tasks/31f3e9c2-6b98-4f66-afdb-b249b24c82b4",
            "status": "pending",
            "type": "import",
            "updated_at": "2014-01-03T01:24:21Z"
        }

Note the 'id' field of the task response above. You can use it to
"poll" the task to check on its status. A task is a complex
asynchronous activity, so you don't need to poll more often than
every 30 seconds or so. Here's an example of how to poll:

        # Check on the status of the import task
        curl -s $IMAGESURL/tasks/31f3e9c2-6b98-4f66-afdb-b249b24c82b4 -X GET -H "X-Auth-Project-Id: $TENANTID" -H "Accept: application/json"  -H "Content-Type: application/json" -H "X-Tenant-Id: $TENANTID" -H "X-User-Id: $TENANTID" -H "X-Auth-Token: $TOKEN" | python -mjson.tool

Eventually, your task will reach a final status of either 'success'
or 'error'. Here's what a successful task looks like:

        {
            "created_at": "2014-01-03T01:24:21Z",
            "expires_at": "2014-01-05T01:24:49Z",
            "id": "31f3e9c2-6b98-4f66-afdb-b249b24c82b4",
            "input": {
                "image_properties": {
                    "name": "Custom Ubuntu 13.10 v1"
                },
                "import_from": "images/ubuntu1310v1.vhd"
            },
            "owner": "000000",
            "result": {
                "image_id": "7a3515d4-ddd9-4297-bd36-06d2140bf11b"
            },
            "schema": "/v2/schemas/task",
            "self": "/v2/tasks/31f3e9c2-6b98-4f66-afdb-b249b24c82b4",
            "status": "success",
            "type": "import",
            "updated_at": "2014-01-03T01:24:49Z"
        }

Now you can do regular image-type stuff with your image.

        # Look at your new image
        supernova personal-iad image-show "Custom Ubuntu 13.10 v1"
        +------------------------------------------------+--------------------------------------+
        | Property                                       | Value                                |
        +------------------------------------------------+--------------------------------------+
        | status                                         | ACTIVE                               |
        | metadata com.rackspace__1__visible_rackconnect | 1                                    |
        | updated                                        | 2014-01-03T01:24:49Z                 |
        | metadata com.rackspace__1__build_core          | 1                                    |
        | name                                           | Custom Ubuntu 13.10 v1               |
        | created                                        | 2014-01-03T01:24:24Z                 |
        | metadata com.rackspace__1__options             | 0                                    |
        | metadata org.openstack__1__architecture        | x64                                  |
        | metadata com.rackspace__1__visible_core        | 1                                    |
        | minDisk                                        | 0                                    |
        | metadata com.rackspace__1__visible_managed     | 1                                    |
        | metadata com.rackspace__1__build_managed       | 1                                    |
        | metadata org.openstack__1__os_distro           | org.ubuntu                           |
        | metadata org.openstack__1__os_version          | 13.10                                |
        | metadata com.rackspace__1__build_rackconnect   | 1                                    |
        | progress                                       | 100                                  |
        | minRam                                         | 0                                    |
        | OS-EXT-IMG-SIZE:size                           | 589204485                            |
        | id                                             | 7a3515d4-ddd9-4297-bd36-06d2140bf11b |
        +------------------------------------------------+--------------------------------------+

        # Boot your new image
        supernova personal-iad boot --image 7a3515d4-ddd9-4297-bd36-06d2140bf11b --flavor 3 --key-name rax ubuntu1310v1-vm1
        +------------------------+--------------------------------------+
        | Property               | Value                                |
        +------------------------+--------------------------------------+
        | status                 | BUILD                                |
        | updated                | 2014-01-03T01:33:24Z                 |
        | OS-EXT-STS:task_state  | scheduling                           |
        | key_name               | rax                                  |
        | image                  | Custom Ubuntu 13.10 v1               |
        | hostId                 |                                      |
        | OS-EXT-STS:vm_state    | building                             |
        | flavor                 | 1GB Standard Instance                |
        | id                     | 0058922a-8595-45aa-a314-86aac1c605e0 |
        | user_id                | 10079419                             |
        | name                   | ubuntu1310v1-vm1                     |
        | adminPass              | SJV6Jex67EeX                         |
        | tenant_id              | 852575                               |
        | created                | 2014-01-03T01:33:24Z                 |
        | OS-DCF:diskConfig      | MANUAL                               |
        | accessIPv4             |                                      |
        | accessIPv6             |                                      |
        | progress               | 0                                    |
        | OS-EXT-STS:power_state | 0                                    |
        | config_drive           |                                      |
        | metadata               | {}                                   |
        +------------------------+--------------------------------------+

        # Login to your new instance

        ssh root@162.209.96.39
        Warning: Permanently added '162.209.96.39' (ECDSA) to the list of known hosts.
        The programs included with the Ubuntu system are free software;
        the exact distribution terms for each program are described in the
        individual files in /usr/share/doc/*/copyright.
        Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
        applicable law.
        root@ubuntu1310v1-vm1:~#

### Related information

-   <https://github.com/rackerlabs/boot.rackspace.com/wiki/Using-Nova-Agent-for-Linux>
-   <https://github.com/rackerlabs/boot.rackspace.com/wiki/Using-Cloud-Init-for-Linux>

#### Contributors

Thanks to Greg Ball, Paul Friel, Brian Rosmaita, and Jered Heeschen for
their contributions to this article.
