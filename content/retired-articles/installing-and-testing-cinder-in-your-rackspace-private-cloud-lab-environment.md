---
permalink: installing-and-testing-cinder-in-your-rackspace-private-cloud-lab-environment/
audit_date:
title: Install and test Cinder in your Rackspace Private Cloud lab environment
type: article
created_date: '2014-04-24'
created_by: Jason Grimm
last_modified_date: '2016-07-14'
last_modified_by: Kyle Laffoon
---

This article provides instructions for setting up the OpenStack Cinder
Service in your Rackspace Private Cloud (RPC) lab environment using the
LVM driver.

It also provides some basic commands to verify that your newly installed
Cinder service and components are configured and running correctly.

This is specifically for sandbox and testing / development environments
- configurations described here, such as: compute and cinder running on
the controller, using a loopback device for cinder-volumes and so on are
not supported and should not be used in production.

### Environment Overview

While this post does not cover RPC installation in detail there are some
high level configuration notes provided here to describe the test
environment (a link to the full RPC installation documentation is listed
in the references section).

You will see that I have a single dedicated chef server and a single
controller / compute host in my environment. The hardware is
two Rackspace General Purpose Cloud Servers, a 1 GB and an 8 GB flavor
respectively. The operating system is Ubuntu 12.04.4 LTS 64-bit server
edition and the RPC version is 4.2.2rc.  This same process works on 4.x,
4.1x and has a reasonable expectation of continuing to work on later
releases with minor adjustments. I'm using a single NIC / network
configuration for all services.

You may also notice that instead of using the "all-in-one" role I
specify roles individually. The reason I do this is because the
"all-in-one" role defaults to nova-network, does not contain heat, and
only installs the cinder-scheduler and cinder-api components (not
cinder-volume). In my case I want to also run cinder-volume on this node
and I am specifying neutron, heat and other components as well just for
demonstration purposes.

<img src="{% asset_path rpc-openstack/installing-and-testing-cinder-in-your-rackspace-private-cloud-lab-environment/blog%20visios.png %}" width="564" height="241" />

Running this command in your environment should look similar to this:

    knife bootstrap controller-1.<your domain> -E <your environment> -r 'role[single-controller],role[single-compute],role[heat-all],role[ceilometer-all],role[cinder-all],role[neutron-network-manager]'

It's not quite time to run this command yet however; let's continue on
to complete all of the necessary tasks to prepare for the node
deployment.

### Environment Preparation - Operating System

The following configuration tasks in this section are to be completed on
both chef-1 and controller-1 unless otherwise indicated.

#### Install the OS

Install the operating system (manually or with an image, snapshot,
template, etc.)

Accept all of the installation defaults and once complete run update /
upgrade and reboot on both hosts.  The git package (required for the
initial cookbook and package downloads) should be the only additional
package that needs to be installed by hand; the remaining dependencies
are installed automatically by the deployment process.

    apt-get update
    apt-get upgrade
    apt-get -y install git
    reboot

#### SSH keys

Chef is capable of handling the ssh key distribution for us; however, as
a personal preference, I typically perform this step manually and ensure
it's all working before I install chef.  The only requirement is for
chef-1 to have ssh pass-thru authentication to controller-1 but there is
no harm in having bi-directional pass-thru authentication if that's
preferable.

1.  The commands (<span>from the chef server</span>) to accomplish this
    are:


    ssh-keygen
    ssh-copy-id -i ~/.ssh/id_rsa.pub root@controller-1

**Note:** Accept the defaults unless you want to specify different key types
or key strength, e.g. ssh-keygen -t rsa or dsa, -b 1024 or 4096, etc.).

Some distributions or packaging of openssh do not include the
ssh-copy-id command. In this case it's likely faster and easier to copy
the keys by hand vs. installing a modified or recompiled version of
openssh.  To accomplish this manually you can use these example steps:

    ssh-keygen
    cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
    chmod 400 ~/.ssh/authorized_keys
    ssh root@controller-1 "mkdir /root/.ssh; chmod -R 400 /root/.ssh"
    scp ~/.ssh/authorized_keys root@controller-1:/root/.ssh/

If everything worked correctly you should now be able to ssh, as root,
from chef-1 to controller-1 without any authentication prompts.

#### Other settings

Also be sure to setup all of your other basic services and settings.
Some of your considerations may include:

1.  Configuring (or disabling) iptables
    -If leaving iptables enabled you'll need to open several ports for
    RPC to function properly.  You can find most of these ports listed
    in the "api settings" tab for the "security and access" menu on the
    project tab.  They are also listed in the /root/openrc file
    automatically created during the installation process.
    **Note:** I recommend installing with iptables off to ensure you have a
    good working deployment and then going back afterwards to lock the
    ports down.
2.  Ensure name resolution works correctly for both long (FQDN) and
    short name (hostname -s) references
    -/etc/hosts file tends to be the fastest / easiest
    -Place the long host names first then any aliases, for example
    10.0.20.51 chef-1.yourdomain.local chef-1
3.  Ensure time zones are set correctly and NTP is synchronized on both
    hosts (particularly important when deploying on top of virtual
    machines due to hardware clock drift)
4.  Ensure Internet connectivity and necessary repository access is
    present

### Environment Preparation - cinder-volumes

The following configuration tasks are to be completed on controller-1.

1.  We'll be using the native Linux Volume Manager to provide block
    storage backing for our environment.

2.  Likewise the cinder LVM driver will be used to connect to this
    storage.

3.  By design, and due to the custom storage configuration nature - the
    "cinder-volumes" volume group is not setup by the chef cinder-volume
    role and must be completed beforehand.

4.  Here are a couple of convenient tips I've found for setting up this
    volume group.

-   You may have noticed that the default behavior of the Ubuntu server
    installation (as well as most templates) is to use LVM; however, it
    typically creates only a single physical volume, a single volume
    group and also consumes all space on the device.
-   You can still create the cinder-volumes volume group but you'll need
    to either:

-   Add another disk (which may not be readily available) to be used by
    cinder-volumes, or:
-   Reconfigure LVM (which can be tedious):

1.  Resize the logical volumes (typically root and swap) in the existing
    volume group
2.  Resize the volume group itself
3.  Resize the underlying physical volume
4.  Create a new partition in the newly available space on the disk
5.  Run pvcreate to create a new physical volume for LVM to manage
6.  Run vgcreate cinder-volumes on this newly available physical volume

Optionally I have found that a third method for creating the
cinder-volumes group using a loopback device is much faster and easier.
This is not optimal for performance but is perfectly suitable for basic,
functional testing. You can accomplish this quickly and easily with the
following commands which creates a 5 GB cinder-volumes volume group
(adjust block size, count, etc. to suit your needs).

**Note:** Ensure you have sufficient free space on your /root mount before
running this command; accidentally filling up the /root mount will
certainly cause issues.

    # Create image
    dd if=/dev/zero of=/root/pv1.img bs=2M count=2500

    # Setup the loopback device
    losetup /dev/loop0 pv1.img

    # Partition the loopback device
    sfdisk /dev/loop0 << EOF
    ,,8e,,
    EOF

    # Scan devices and volume groups to detect the device changes
    pvscan
    vgscan

    # Create physical volume and volume group
    pvcreate /dev/loop0
    vgcreate cinder-volumes /dev/loop0

    # Display results
    vgs

**Note:** If creating larger volumes you may want to use the seek option
with dd or the fallocate command vs. waiting for each block of data to
write out.  The cinder service zeros out all blocks regardless when it
initializes so there should be no security or stale data concerns.

If everything executed correctly your final output should look similar
to this:

    root@controller-1:~# vgs
      VG             #PV #LV #SN Attr   VSize  VFree
      cinder-volumes   1   0   0 wz--n-  4.88g  4.88g
      rackspace1       1   2   0 wz--n- 19.76g 20.00m

This concludes the operating system and storage configuration tasks,
move on to the chef and environment installation processes.

### Environment Creation - Installing Chef, Cookbooks, and Creating the Environment File

In this section we will cover installing chef and configuring your
environment file.

As mentioned, a complete installation procedure is not detailed here but
the high level steps are outlined below.

#### Install Chef

The basic commands to install chef-server on chef-1 are as follows:

    # Download the installation script
    curl -s -O https://raw.github.com/rcbops/support-tools/master/chef-install/install-chef-server.sh


    # Run the installer
    # bash install-chef-server.sh


    # Source the modified .bash_profile to declare the necessary knife environment variables
    . /root/.bash_profile


    # Test the knife command
    knife client list

#### Install Cookbooks

In this section we'll download and install the RPC cookbooks.  To
download the installation script run the following command:

    curl -s -O https://raw.github.com/rcbops/support-tools/master/chef-install/install-cookbooks.sh

Before running the shell script to install the cookbooks, use an editor
to check and or edit the install-cookbooks.sh script and set the branch
parameter according to your needs.

In this exercise we'll be using 4.2.2rc; the current default stable
branch is 4.2.1.

    # Check the current RPC version declared in the script
    grep -m1 BRANCH /root/install-cookbooks.sh
    COOKBOOK_BRANCH=${COOKBOOK_BRANCH:-v4.2.1}


    # Modify the script to set your desired branch
    vi install-cookbooks.sh

Or:

    # Use an in-line sed
    sed -i -e 's/v4.2.1/v4.2.2rc/g' install-cookbooks.sh


    # Verify that your edits were added properly
    grep -m1 BRANCH /root/install-cookbooks.sh
    COOKBOOK_BRANCH=${COOKBOOK_BRANCH:-v4.2.2rc}


    # Execute the install script
    bash /root/install-cookbooks.sh

Now that our ssh keys are in place, chef server is installed and our
cookbooks are downloaded and installed it is time to create an
environment file.

#### Creating the environment file

Your specific environment file will vary but there are a few sections of
interest to our installation.  The entire environment file is shown in
pieces below for your reference; the relevant sections are highlighted.

1.  Create / edit the environment file.


    # Open / create the environment file in a text editor, for example
    vi rpc422rc.json

2.  Change the header to match what you want the name of the environment
    to be, for convenience I match the environment name and the file
    name to the version number.  Basic glance settings are also
    shown here.


    {
      "name": "rpcv422rc",
      "description": "Rackspace Private Cloud v4.2.2rc",
      "cookbook_versions": {},
      "json_class": "Chef::Environment",
      "chef_type": "environment",
      "default_attributes": {
      },
      "override_attributes": {
         "glance": {
                "images": [
                    "cirros-0.3.1-x86_64",
                    "ubuntu-server-12.04.3-x86_64"
                ],
                "image": {
                    "cirros-0.3.1-x86_64": "http://download.cirros-cloud.net/0.3.1/cirros-0.3.1-x86_64-disk.img",
                    "ubuntu-server-12.04.3-x86_64": "http://cloud-images.ubuntu.com/releases/12.04.3/release/ubuntu-12.04-server-cloudimg-amd64-disk1.img"
                },
                "image_upload": true
            },


Since I'm installing OpenStack on top of a hypervisor that doesn't
support VT acceleration I have to set my virtualization type to qemu;
also not suitable for production but sufficient for functional testing.
If you have a hypervisor that supports VT acceleration you can leave
this stanza out altogether as the cookbook defaults to kvm or you can
manually specify it if you like.

        "nova": {
            "libvirt": {
            "vncserver_listen": "0.0.0.0",
            "virt_type": "qemu"
            },

Additionally, you may opt to specify your cinder configuration options.
The parameters listed here are actually the default settings in the
cookbook which works well for this environment; however, I generally
specify them regardless in case the defaults change.  It is also handy
as a placeholder if I reuse the environment file or need to make
modifications to the settings later on.

           "cinder" : {
                  "storage" : {
                         "provider" : "lvm",
                         "enable_multipath" : false,
                         "lvm" : {
                               "volume_group" : "cinder-volumes",
                               "volume_clear" : "zero",
                               "config" : "/etc/lvm/lvm.conf"
                         }
                  },
                  "services" : {
                         "volume" : {
                               "network" : "cinder"
                         }
                  }
           },

Lastly, if you're not accustom to running a single NIC / single subnet
environment then you may want to review the network settings as well.
Also shown here are basic neutron configuration directives.

          "network": {
            "provider": "neutron"
          }
        },
        "neutron": {
          "ovs": {
            "provider_networks": [
              {
                "label": "ph-eth0",
                "bridge": "br-eth0",
                "vlans": "1:1"
              }
            ],
            "network_type": "gre"
          }
        },
        "mysql": {
            "allow_remote_root": true,
            "root_network_acl": "%"
        },
        "osops_networks": {
          "nova": "10.0.20.0/24",
          "public": "10.0.20.0/24",
          "management": "10.0.20.0/24",
          "cinder" : "10.0.20.0/24"
        }
    }

Once complete you are ready to create your environment.

    knife environment from file rpcv422rc.json

**Note:** JSON is very sensitive to white space in formatting so I would
recommend pasting this into a text editor first and removing any special
characters or, better yet, just type it in manually to avoid parsing
errors due to formatting.*

Create this file with a text editor and when complete
use the "knife environment from file" creation process vs. the "knife
environment edit" command (as some documentation refers to). The "knife
environment edit" approach will not retain your environment edits if
there are issues with syntax or definitions.  Instead your edits are
lost each time it fails and there is no debug information displayed
either.*

### Environment Deployment

All the tedious work is over, now we push our roles to our controller /
compute node with the following command.

    knife bootstrap controller-1.<your domain> -E <your environment> -r 'role[single-controller],role[single-compute],role[heat-all],role[ceilometer-all],role[cinder-all],role[neutron-network-manager]'

### Environment Testing

If everything went according to plan you should be able to login to your
newly deployed node and check to make sure everything is running okay.

#### Check Cinder services

1.  SSH into the controller / compute node
2.  Check the cinder services from the operating system


    root@controller-1:~# service cinder-volume status
    cinder-volume start/running, process 27061


    root@controller-1:~# service cinder-api status
    cinder-api start/running, process 26974


    root@controller-1:~# service cinder-scheduler status
    cinder-scheduler start/running, process 27019

3.  Source the credentials file


    cd /root
    . openrc

4.  Check the cinder services from the cinder CLI


    root@controller-1:~# cinder service-list
    +------------------+----------------------+------+---------+-------+--------------------+
    |      Binary      |         Host         | Zone |  Status | State |      Updated_at    |
    +------------------+----------------------+------+---------+-------+--------------------+
    | cinder-scheduler | controller-1.lab.net | nova | enabled |   up  | 2014-02-17T13:29:48|
    | cinder-volume    | controller-1.lab.net | nova | enabled |   up  | 2014-02-17T13:29:45|
    +------------------+----------------------+------+---------+-------+--------------------+

#### Post installation setup

Before we get to work on verifying cinder, let's setup a few other
components for our instances.

1.  Create a keypair.

-   If you haven't already created ssh keys on this controller
    node, do so now


    cd /root
    ssh-keygen
    cd .ssh


    nova keypair-add --pub_key id_rsa.pub mykey
    nova keypair-list
    +-------+-------------------------------------------------+
    | Name  | Fingerprint                                     |
    +-------+-------------------------------------------------+
    | mykey | xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx |
    +-------+-------------------------------------------------+

2.  Create a security group to allow ping and ssh , verify results.


    nova secgroup-create mysecuritygroup "My Security Group"
    +--------------------------------------+-----------------+-------------------+
    | Id                                   | Name            | Description       |
    +--------------------------------------+-----------------+-------------------+
    | e1ca5db8-b47b-4849-94ea-9bd0eadee3c9 | mysecuritygroup | My Security Group |
    +--------------------------------------+-----------------+-------------------+


    nova secgroup-add-rule mysecuritygroup tcp 22 22 0.0.0.0/0
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | tcp         | 22        | 22      | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+


    secgroup-add-rule mysecuritygroup icmp -1 -1 0.0.0.0/0
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | icmp        | -1        | -1      | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+


    nova secgroup-list
    +--------------------------------------+-----------------+-------------------+
    | Id                                   | Name            | Description       |
    +--------------------------------------+-----------------+-------------------+
    | df4ebc27-5d40-4005-a57a-0d2aab642694 | default         | default           |
    | e1ca5db8-b47b-4849-94ea-9bd0eadee3c9 | mysecuritygroup | My Security Group |
    +--------------------------------------+-----------------+-------------------+


    nova secgroup-list-rules mysecuritygroup
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | icmp        | -1        | -1      | 0.0.0.0/0 |              |
    | tcp         | 22        | 22      | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+

3.  Create a new router and verify.

**Note:** Neutron uses net namespaces, if this is not preferred you can
remove neutron and put in nova-network.  Everything in this article
works the same except for the sections on setting up networking and
SSH'ing to your instances .*

    neutron router-create router-1
    Created a new router:
    +-----------------------+--------------------------------------+
    | Field                 | Value                                |
    +-----------------------+--------------------------------------+
    | admin_state_up        | True                                 |
    | external_gateway_info |                                      |
    | id                    | 3488e9b9-d03f-4e07-85ee-268d688d6a92 |
    | name                  | router-1                             |
    | status                | ACTIVE                               |
    | tenant_id             | fb89fe32204f4f438810d4d12b400a52     |
    +-----------------------+--------------------------------------+


    root@controller-1:~/.ssh# neutron router-list
    +--------------------------------------+----------+-----------------------+
    | id                                   | name     | external_gateway_info |
    +--------------------------------------+----------+-----------------------+
    | 3488e9b9-d03f-4e07-85ee-268d688d6a92 | router-1 | null                  |
    +--------------------------------------+----------+-----------------------+

4.  Create the public network and verify.


    neutron net-create publicnet-1 --provider:network_type flat --provider:physical_network ph-eth0 --router:external=True
    Created a new network:
    +---------------------------+--------------------------------------+
    | Field                     | Value                                |
    +---------------------------+--------------------------------------+
    | admin_state_up            | True                                 |
    | id                        | 82a7ac1e-ac91-4b70-9d74-3c1e2a71a5f8 |
    | name                      | publicnet-1                          |
    | provider:network_type     | flat                                 |
    | provider:physical_network | ph-eth0                              |
    | provider:segmentation_id  |                                      |
    | router:external           | True                                 |
    | shared                    | False                                |
    | status                    | ACTIVE                               |
    | subnets                   |                                      |
    | tenant_id                 | fb89fe32204f4f438810d4d12b400a52     |
    +---------------------------+--------------------------------------+


    root@controller-1:~/.ssh# neutron net-list
    +--------------------------------------+-------------+---------+
    | id                                   | name        | subnets |
    +--------------------------------------+-------------+---------+
    | 82a7ac1e-ac91-4b70-9d74-3c1e2a71a5f8 | publicnet-1 |         |
    +--------------------------------------+-------------+---------+

5.  Create a subnet and verify.


    neutron subnet-create --name publicnet-1_subnet-1 --gateway 10.0.20.1 publicnet-1 10.0.20.0/24 --disable-dhcp
    Created a new subnet:
    +------------------+----------------------------------------------+
    | Field            | Value                                        |
    +------------------+----------------------------------------------+
    | allocation_pools | {"start": "10.0.20.2", "end": "10.0.20.254"} |
    | cidr             | 10.0.20.0/24                                 |
    | dns_nameservers  |                                              |
    | enable_dhcp      | False                                        |
    | gateway_ip       | 10.0.20.1                                    |
    | host_routes      |                                              |
    | id               | bc172bcf-5b53-4b54-963c-4e36695e6aa1         |
    | ip_version       | 4                                            |
    | name             | publicnet-1_subnet-1                         |
    | network_id       | 82a7ac1e-ac91-4b70-9d74-3c1e2a71a5f8         |
    | tenant_id        | fb89fe32204f4f438810d4d12b400a52             |
    +------------------+----------------------------------------------+


    root@controller-1:~/.ssh# neutron subnet-list
    +----------------------------+----------------------+--------------+-------------------+
    | id                         | name                 | cidr         | allocation_pools  |
    +----------------------------+----------------------+--------------+-------------------+
    | bc172bcf-5b53-4b54e6aa1... | publicnet-1_subnet-1 | 10.0.20.0/24 | {"start": "10.... |
    +----------------------------+----------------------+--------------+-------------------+


6.  Set the router gateway.


    neutron router-gateway-set router-1 publicnet-1
    Set gateway for router router-1


    neutron router-port-list router-1
    +--------------------------------------+------+-------------------+--------------------+
    | id                                   | name | mac_address       | fixed_ips          |
    +--------------------------------------+------+-------------------+--------------------+
    | 17d817db-cd56-4e9f-9b39-7a83f72e950e |      | fa:16:3e:00:23:d0 | {"subnet_id":....  |
    +--------------------------------------+------+-------------------+--------------------+

7.  Create a private VM network, subnet and router interface.


    neutron net-create privatenet-1
    Created a new network:
    +---------------------------+--------------------------------------+
    | Field                     | Value                                |
    +---------------------------+--------------------------------------+
    | admin_state_up            | True                                 |
    | id                        | 4ed006c3-fade-429b-ab3f-f156f17c2a9c |
    | name                      | privatenet-1                         |
    | provider:network_type     | gre                                  |
    | provider:physical_network |                                      |
    | provider:segmentation_id  | 1                                    |
    | shared                    | False                                |
    | status                    | ACTIVE                               |
    | subnets                   |                                      |
    | tenant_id                 | fb89fe32204f4f438810d4d12b400a52     |
    +---------------------------+--------------------------------------+


    root@controller-1:~/.ssh# neutron subnet-create --name privatenet-1_subnet-1 privatenet-1 192.168.20.0/24
    Created a new subnet:
    +------------------+----------------------------------------------------+
    | Field            | Value                                              |
    +------------------+----------------------------------------------------+
    | allocation_pools | {"start": "192.168.20.2", "end": "192.168.20.254"} |
    | cidr             | 192.168.20.0/24                                    |
    | dns_nameservers  |                                                    |
    | enable_dhcp      | True                                               |
    | gateway_ip       | 192.168.20.1                                       |
    | host_routes      |                                                    |
    | id               | 9c21571e-43c7-4ffa-8e67-4135be702ce7               |
    | ip_version       | 4                                                  |
    | name             | privatenet-1_subnet-1                              |
    | network_id       | 4ed006c3-fade-429b-ab3f-f156f17c2a9c               |
    | tenant_id        | fb89fe32204f4f438810d4d12b400a52                   |
    +------------------+----------------------------------------------------+


    root@controller-1:~/.ssh# neutron router-interface-add router-1 privatenet-1_subnet-1
    Added interface 63391343-81f0-4338-8466-e178f837c1bb to router router-1.


Assuming all of this looks good we can move on to testing cinder.

#### Testing cinder

Finally we're ready to test our cinder service and configuration.

1.  First let's test the creation of a basic volume and verify.


    cinder create --display-name 1gb-basicvol-1 1
    +---------------------+--------------------------------------+
    |       Property      |                Value                 |
    +---------------------+--------------------------------------+
    |     attachments     |                  []                  |
    |  availability_zone  |                 nova                 |
    |       bootable      |                false                 |
    |      created_at     |      2014-02-17T13:32:50.524045      |
    | display_description |                 None                 |
    |     display_name    |            1gb-basicvol-1            |
    |          id         | c164f8ea-e228-4c2b-9f71-d8c0832d38e2 |
    |       metadata      |                  {}                  |
    |         size        |                  1                   |
    |     snapshot_id     |                 None                 |
    |     source_volid    |                 None                 |
    |        status       |               creating               |
    |     volume_type     |                 None                 |
    +---------------------+--------------------------------------+


    cinder list
    +----------------------------+-----------+----------------+------+-------------+--------+
    |             ID             |   Status  |  Display Name  | Size | Volume Type | Boot.. |
    +----------------------------+-----------+----------------+------+-------------+--------+
    | c164f8ea-e228-4c2b-9f71... | available | 1gb-basicvol-1 |  1   |     None    | false  |
    +----------------------------+-----------+----------------+------+-------------+--------+

2.  Optionally you can view the volume from the operating system
    as well.


    lvs
      LV                                          VG             Attr   LSize  Origin Snap%  Move Log Copy%  Convert
      volume-c164f8ea-e228-4c2b-9f71-d8c0832d38e2 cinder-volumes -wi-ao  1.00g
      root                                        rackspace1     -wi-ao 15.74g
      swap_1                                      rackspace1     -wi-ao  4.00g


    lvdisplay
      --- Logical volume ---
      LV Name                /dev/cinder-volumes/volume-c164f8ea-e228-4c2b-9f71-d8c0832d38e2
      VG Name                cinder-volumes
      LV UUID                S19Jzu-HruZ-TOK8-OCqf-TJuz-Gpqc-IewVM3
      LV Write Access        read/write
      LV Status              available
      # open                 1
      LV Size                1.00 GiB
      Current LE             256
      Segments               1
      Allocation             inherit
      Read ahead sectors     auto
      - currently set to     256
      Block device           252:2

3.  Next let's test creating a volume from a bootable image.

-   First, let's make sure we have an image present


    glance image-list
    +-----------------------------------+------------------------------------+-------------+
    | ID                                | Name                               | Disk Format |
    +-----------------------------------+------------------------------------+-------------+
    | 9f8aa2db-6984-4dec-8a36-95a718... | cirros-0.3.1-x86_64-image          | qcow2       |
    | 9cfdd395-b18d-4de0-b87d-b268a5... | ubuntu-server-12.04.3-x86_64-image | qcow2       |
    +-----------------------------------+------------------------------------+-------------+


    glance image-show cirros-0.3.1-x86_64-image
    +------------------+--------------------------------------+
    | Property         | Value                                |
    +------------------+--------------------------------------+
    | container_format | bare                                 |
    | created_at       | 2014-02-16T05:12:45                  |
    | deleted          | False                                |
    | disk_format      | qcow2                                |
    | id               | 9f8aa2db-6984-4dec-8a36-95a7188a5308 |
    | is_public        | True                                 |
    | min_disk         | 0                                    |
    | min_ram          | 0                                    |
    | name             | cirros-0.3.1-x86_64-image            |
    | owner            | fb89fe32204f4f438810d4d12b400a52     |
    | protected        | False                                |
    | size             | 13147648                             |
    | status           | active                               |
    | updated_at       | 2014-02-16T05:12:45                  |
    +------------------+--------------------------------------+

-   Now let's create a bootable volume using this image and verify
    that it is set to bootable.


**Note:** It will show bootable "false" at first, but after creation it will
show as "true".*



    cinder create --image-id 9f8aa2db-6984-4dec-8a36-95a7188a5308 --display-name 1gb-bootvol-1 1
    +---------------------+--------------------------------------+
    |       Property      |                Value                 |
    +---------------------+--------------------------------------+
    |     attachments     |                  []                  |
    |  availability_zone  |                 nova                 |
    |       bootable      |                false                 |
    |      created_at     |      2014-02-17T18:25:36.882570      |
    | display_description |                 None                 |
    |     display_name    |            1gb-bootvol-1             |
    |          id         | 59ccacc7-c195-44a1-9354-5e48c8406683 |
    |       image_id      | 9f8aa2db-6984-4dec-8a36-95a7188a5308 |
    |       metadata      |                  {}                  |
    |         size        |                  1                   |
    |     snapshot_id     |                 None                 |
    |     source_volid    |                 None                 |
    |        status       |               creating               |
    |     volume_type     |                 None                 |
    +---------------------+--------------------------------------+


    cinder list
    +----------------------------+-----------+----------------+------+-------------+--------+
    |             ID             |   Status  |  Display Name  | Size | Volume Type | Boot.. |
    +----------------------------+-----------+----------------+------+-------------+--------+
    | 59ccacc7-c195-44a1-9354... | available | 1gb-bootvol-1  |  1   |     None    |   true |
    | c164f8ea-e228-4c2b-9f71... | available | 1gb-basicvol-1 |  1   |     None    |  false |
    +----------------------------+-----------+----------------+------+-------------+--------+

-   Once created let's boot an instance using this newly created
    bootable volume.




    # List flavors
    nova flavor-list
    +----+-----------+-----------+------+-----------+------+-------+-------------+----------+
    | ID | Name      | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public|
    +----+-----------+-----------+------+-----------+------+-------+-------------+----------+
    | 1  | m1.tiny   | 512       | 1    | 0         |      | 1     | 1.0         | True     |
    | 2  | m1.small  | 2048      | 20   | 0         |      | 1     | 1.0         | True     |
    | 3  | m1.medium | 4096      | 40   | 0         |      | 2     | 1.0         | True     |
    | 4  | m1.large  | 8192      | 80   | 0         |      | 4     | 1.0         | True     |
    | 5  | m1.xlarge | 16384     | 160  | 0         |      | 8     | 1.0         | True     |
    +----+-----------+-----------+------+-----------+------+-------+-------------+----------+


    # Boot from volume
    nova boot --flavor m1.tiny --boot-volume 59ccacc7-c195-44a1-9354-5e48c8406683 --key-name mykey --security-groups mysecuritygroup --nic net-id=4ed006c3-fade-429b-ab3f-f156f17c2a9c vm-1


    +---------------------------------+----------------------------------------------------+
    | Property                        | Value                                              |
    +---------------------------------+----------------------------------------------------+
    | OS-EXT-STS:task_state           | scheduling                                         |
    | image                           | Attempt to boot from volume - no image supplied    |
    | OS-EXT-STS:vm_state             | building                                           |
    | OS-EXT-SRV-ATTR:instance_name   | instance-00000003                                  |
    | OS-SRV-USG:launched_at          | None                                               |
    | flavor                          | m1.tiny                                            |
    | id                              | 6d96a99f-dd44-41f5-96d7-35a7e830c174               |
    | security_groups                 | [{u'name': u'mysecuritygroup'}]                    |
    | user_id                         | bb2948138ae04677927933a9ae352ecc                   |
    | OS-DCF:diskConfig               | MANUAL                                             |
    | accessIPv4                      |                                                    |
    | accessIPv6                      |                                                    |
    | progress                        | 0                                                  |
    | OS-EXT-STS:power_state          | 0                                                  |
    | OS-EXT-AZ:availability_zone     | nova                                               |
    | config_drive                    |                                                    |
    | status                          | BUILD                                              |
    | updated                         | 2014-02-17T23:19:52Z                               |
    | hostId                          |                                                    |
    | OS-EXT-SRV-ATTR:host            | None                                               |
    | OS-SRV-USG:terminated_at        | None                                               |
    | key_name                        | mykey                                              |
    | OS-EXT-SRV-ATTR:hypervisor_h... | None                                               |
    | name                            | vm-1                                               |
    | adminPass                       | 3wjBvH3npKpj                                       |
    | tenant_id                       | fb89fe32204f4f438810d4d12b400a52                   |
    | created                         | 2014-02-17T23:19:51Z                               |
    | os-extended-volumes:volumes_... | [{u'id': u'59ccacc7-c195-44a1-9354-5e48c8406683'}] |
    | metadata                        | {}                                                 |
    +---------------------------------+----------------------------------------------------+


    nova list
    +----------------+------+--------+------------+-------------+---------------------------+
    | ID             | Name | Status | Task State | Power State | Networks                  |
    +----------------+------+--------+------------+-------------+---------------------------+
    | 6d96a99f-dd... | vm-1 | ACTIVE | None       | Running     | privatenet-1=192.168.20.2 |
    +----------------+------+--------+------------+-------------+---------------------------+

-   Check again to verify that the build is complete


    nova show 6d96a99f-dd44-41f5-96d7-35a7e830c174
    +----------------------------+----------------------------------------------------------+
    | Property                   | Value                                                    |
    +----------------------------+----------------------------------------------------------+
    | status                     | ACTIVE                                                   |
    | updated                    | 2014-02-17T23:20:01Z                                     |
    | OS-EXT-STS:task_state      | None                                                     |
    | OS-EXT-SRV-ATTR:host       | controller-1.lab.net                                     |
    | key_name                   | mykey                                                    |
    | image                      | Attempt to boot from volume - no image supplied          |
    | hostId                     | 8f19bbc5e451b2a9ab8483d2f751b24366621f5ed8f7b6a95486e5a6 |
    | OS-EXT-STS:vm_state        | active                                                   |
    | OS-EXT-SRV-ATTR:instanc... | instance-00000003                                        |
    | OS-SRV-USG:launched_at     | 2014-02-17T23:20:01.000000                               |
    | OS-EXT-SRV-ATTR:hypervi... | controller-1.lab.net                                     |
    | flavor                     | m1.tiny (1)                                              |
    | id                         | 6d96a99f-dd44-41f5-96d7-35a7e830c174                     |
    | security_groups            | [{u'name': u'mysecuritygroup'}]                          |
    | OS-SRV-USG:terminated_at   | None                                                     |
    | user_id                    | bb2948138ae04677927933a9ae352ecc                         |
    | name                       | vm-1                                                     |
    | created                    | 2014-02-17T23:19:51Z                                     |
    | tenant_id                  | fb89fe32204f4f438810d4d12b400a52                         |
    | OS-DCF:diskConfig          | MANUAL                                                   |
    | metadata                   | {}                                                       |
    | os-extended-volumes:vol... | [{u'id': u'59ccacc7-c195-44a1-9354-5e48c8406683'}]       |
    | accessIPv4                 |                                                          |
    | accessIPv6                 |                                                          |
    | progress                   | 0                                                        |
    | OS-EXT-STS:power_state     | 1                                                        |
    | OS-EXT-AZ:availability_... | nova                                                     |
    | privatenet-1 network       | 192.168.20.2                                             |
    | config_drive               |                                                          |
    +----------------------------+----------------------------------------------------------+

-   SSH to the instance to verify that it is up
    and running.


    ip netns list
    qdhcp-4ed006c3-fade-429b-ab3f-f156f17c2a9c
    qrouter-3488e9b9-d03f-4e07-85ee-268d688d6a92


    ip netns exec qrouter-3488e9b9-d03f-4e07-85ee-268d688d6a92 ssh
    // ');
     document.write(addy66481);
     document.write('<\/a>');
     //-->\n
    // ]]>
    // ');
    // ]]>
    This email address is being protected from spambots. You need JavaScript enabled to view it.
    // ');
    // ]]>
    .2 The authenticity of host '192.168.20.2 (192.168.20.2)' can't be established. RSA key fingerprint is 1a:5b:23:f3:43:44:bd:e0:1d:fa:93:b8:36:18:71:fe. Are you sure you want to continue connecting (yes/no)? yes Warning: Permanently added '192.168.20.2' (RSA) to the list of known hosts.
    // ');
     document.write(addy73709);
     document.write('<\/a>');
     //-->\n
    // ]]>
    // ');
    // ]]>
    This email address is being protected from spambots. You need JavaScript enabled to view it.
    // ');
    // ]]>
    .2's password: < The cirros image's default password is cubswin:) > $ ip addr show eth0 eth0 Link encap:Ethernet HWaddr FA:16:3E:85:16:59 inet addr:192.168.20.2 Bcast:192.168.20.255 Mask:255.255.255.0 inet6 addr: fe80::f816:3eff:fe85:1659/64 Scope:Link UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1 RX packets:293 errors:0 dropped:0 overruns:0 frame:0 TX packets:403 errors:0 dropped:0 overruns:0 carrier:0 collisions:0 txqueuelen:1000 RX bytes:40193 (39.2 KiB) TX bytes:40421 (39.4 KiB) Interrupt:11 Base address:0xc000


#### Create an image-based volume at boot time

You can reduce this process to a single command by combining volume
creation with the instance boot as follows.

1.  Boot instance with volume and image paramaters.


    nova boot --flavor m1.tiny --key-name mykey --security-groups mysecuritygroup --nic net-id=4ed006c3-fade-429b-ab3f-f156f17c2a9c --block-device source=image,id=9f8aa2db-6984-4dec-8a36-95a7188a5308,dest=volume,device=vda,size=1,shutdown=preserve,bootindex=0 vm-2
    +-------------------------------------+-------------------------------------------------+
    | Property                            | Value                                           |
    +-------------------------------------+-------------------------------------------------+
    | OS-EXT-STS:task_state               | scheduling                                      |
    | image                               | Attempt to boot from volume - no image supplied |
    | OS-EXT-STS:vm_state                 | building                                        |
    | OS-EXT-SRV-ATTR:instance_name       | instance-00000005                               |
    | OS-SRV-USG:launched_at              | None                                            |
    | flavor                              | m1.tiny                                         |
    | id                                  | 7d10a2db-9a9b-426e-a54a-9fc0224cdf14            |
    | security_groups                     | [{u'name': u'mysecuritygroup'}]                 |
    | user_id                             | bb2948138ae04677927933a9ae352ecc                |
    | OS-DCF:diskConfig                   | MANUAL                                          |
    | accessIPv4                          |                                                 |
    | accessIPv6                          |                                                 |
    | progress                            | 0                                               |
    | OS-EXT-STS:power_state              | 0                                               |
    | OS-EXT-AZ:availability_zone         | nova                                            |
    | config_drive                        |                                                 |
    | status                              | BUILD                                           |
    | updated                             | 2014-02-17T23:40:19Z                            |
    | hostId                              |                                                 |
    | OS-EXT-SRV-ATTR:host                | None                                            |
    | OS-SRV-USG:terminated_at            | None                                            |
    | key_name                            | mykey                                           |
    | OS-EXT-SRV-ATTR:hypervisor_host...  | None                                            |
    | name                                | vm-2                                            |
    | adminPass                           | MhRoHYQ88R8L                                    |
    | tenant_id                           | fb89fe32204f4f438810d4d12b400a52                |
    | created                             | 2014-02-17T23:40:19Z                            |
    | os-extended-volumes:volumes_atta... | []                                              |
    | metadata                            | {}                                              |
    +-------------------------------------+-------------------------------------------------+

2.  Check again to verify that the build is complete


    nova list
    +---------------+------+---------+------------+-------------+---------------------------+
    | ID            | Name | Status  | Task State | Power State | Networks                  |
    +---------------+------+---------+------------+-------------+---------------------------+
    | 6d96a99f-d... | vm-1 | SHUTOFF | None       | Shutdown    | privatenet-1=192.168.20.2 |
    | 7d10a2db-9... | vm-2 | ACTIVE  | None       | Running     | privatenet-1=192.168.20.4 |
    +---------------+------+---------+------------+-------------+---------------------------+


    nova show 7d10a2db-9a9b-426e-a54a-9fc0224cdf14
    +----------------------------+----------------------------------------------------------+
    | Property                   | Value                                                    |
    +----------------------------+----------------------------------------------------------+
    | status                     | ACTIVE                                                   |
    | updated                    | 2014-02-17T23:40:37Z                                     |
    | OS-EXT-STS:task_state      | None                                                     |
    | OS-EXT-SRV-ATTR:host       | controller-1.lab.net                                     |
    | key_name                   | mykey                                                    |
    | image                      | Attempt to boot from volume - no image supplied          |
    | hostId                     | 8f19bbc5e451b2a9ab8483d2f751b24366621f5ed8f7b6a95486e5a6 |
    | OS-EXT-STS:vm_state        | active                                                   |
    | OS-EXT-SRV-ATTR:instanc... | instance-00000005                                        |
    | OS-SRV-USG:launched_at     | 2014-02-17T23:40:36.000000                               |
    | OS-EXT-SRV-ATTR:hypervi... | controller-1.lab.net                                     |
    | flavor                     | m1.tiny (1)                                              |
    | id                         | 7d10a2db-9a9b-426e-a54a-9fc0224cdf14                     |
    | security_groups            | [{u'name': u'mysecuritygroup'}]                          |
    | OS-SRV-USG:terminated_at   | None                                                     |
    | user_id                    | bb2948138ae04677927933a9ae352ecc                         |
    | name                       | vm-2                                                     |
    | created                    | 2014-02-17T23:40:19Z                                     |
    | tenant_id                  | fb89fe32204f4f438810d4d12b400a52                         |
    | OS-DCF:diskConfig          | MANUAL                                                   |
    | metadata                   | {}                                                       |
    | os-extended-volumes:vol... | [{u'id': u'8dd33269-1ef4-4cd0-8c75-1f0749219981'}]       |
    | accessIPv4                 |                                                          |
    | accessIPv6                 |                                                          |
    | progress                   | 0                                                        |
    | OS-EXT-STS:power_state     | 1                                                        |
    | OS-EXT-AZ:availability_... | nova                                                     |
    | privatenet-1 network       | 192.168.20.4                                             |
    | config_drive               |                                                          |
    +----------------------------+----------------------------------------------------------+

    # Rename the newly created volume (not able to be set from boot command)
    cinder rename 8dd33269-1ef4-4cd0-8c75-1f0749219981 1gb-bootvol-2

3.  SSH to the instance to verify that it is up and running


    ip netns exec qrouter-3488e9b9-d03f-4e07-85ee-268d688d6a92 ssh
    // ');
     document.write(addy23149);
     document.write('<\/a>');
     //-->\n
    // ]]>
    // ');
    // ]]>
    This email address is being protected from spambots. You need JavaScript enabled to view it.
    // ');
    // ]]>
    .4 The authenticity of host '192.168.20.4 (192.168.20.4)' can't be established. RSA key fingerprint is 52:15:84:66:39:d3:5e:71:b2:08:d6:c9:7a:8c:81:95. Are you sure you want to continue connecting (yes/no)? yes Warning: Permanently added '192.168.20.4' (RSA) to the list of known hosts.
    // ');
     document.write(addy31872);
     document.write('<\/a>');
     //-->\n
    // ]]>
    // ');
    // ]]>
    This email address is being protected from spambots. You need JavaScript enabled to view it.
    // ');
    // ]]>
    .4's password: $ ip addr show eth0 Link encap:Ethernet HWaddr FA:16:3E:94:A0:CF inet addr:192.168.20.4 Bcast:192.168.20.255 Mask:255.255.255.0 inet6 addr: fe80::f816:3eff:fe94:a0cf/64 Scope:Link UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1 RX packets:302 errors:0 dropped:0 overruns:0 frame:0 TX packets:411 errors:0 dropped:0 overruns:0 carrier:0 collisions:0 txqueuelen:1000 RX bytes:40757 (39.8 KiB) TX bytes:41015 (40.0 KiB) Interrupt:11 Base address:0xc000

4.  Lastly check cinder and nova list to make sure both volumes are
    created and match the attachment shown in nova list for your
    new instances.


    cinder list
    +---------------+-----------+----------------+------+-------------+----------+----------+
    |       ID      |   Status  |  Display Name  | Size | Volume Type | Bootable | Attach...|
    +---------------+-----------+----------------+------+-------------+----------+----------+
    | 59ccacc7-c... |   in-use  | 1gb-bootvol-1  |  1   |     None    |   true   | 6d9...174|
    | 8dd33269-1... |   in-use  | 1gb-bootvol-2  |  1   |     None    |   true   | 7d1...f14|
    | c164f8ea-e... | available | 1gb-basicvol-1 |  1   |     None    |  false   |          |
    +---------------+-----------+----------------+------+-------------+----------+----------+


    root@controller-1:~# nova list
    +---------------+------+---------+------------+-------------+---------------------------+
    | ID            | Name | Status  | Task State | Power State | Networks                  |
    +---------------+------+---------+------------+-------------+---------------------------+
    | 6d96a99f-d... | vm-1 | SHUTOFF | None       | Shutdown    | privatenet-1=192.168.20.2 |
    | 7d10a2db-9... | vm-2 | SHUTOFF | None       | Shutdown    | privatenet-1=192.168.20.4 |
    +---------------+------+---------+------------+-------------+---------------------------+


### Conclusion

In this article we covered the basics of a cinder-enabled environment
creation and deployment from prerequisites all the way through
validation testing.

Hopefully it has provided a good primer for quickly setting up or adding
cinder to your lab environment.

Look for later cinder related posts with more advanced topics such as
using NetApp, EMC or SolidFire cinder drivers, providing Cinder HA to
your instances and using multiple cinder devices to provide workload
separation and performance tiering for your instances.

### Reference Material

You may also find the following references helpful as you explore cinder
functionality further.

RPC block storage configuration - </how-to/configuring-openstack-block-storage>
