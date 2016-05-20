---
permalink: managed-vmware-services-faq/
audit_date:
title: Managed VMware Services FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2016-01-20'
last_modified_by: Stephanie Fillmon
product: Managed VMware Services
product_url: managed-vmware-services
---

### Architecture

#### What type of replication solutions do you offer?

Rackspace offers two different solutions for replication. At a high
level, the differences are automated vs. manual failover and the
selection should depend on your RPO/RTO.

-   SRM: Automated failover. Provides RTO/RPO dependent on your
    configuration and based on testing.
-   VM Replication (vRanger): Manual failover. Provides no RTO/RPO.

#### What are the benefits of virtualization?

Server portability, consolidation, cloning and snapshots.

#### With Managed VMware, can I log in to the hypervisor?

No. However, if you have Dedicated vCenter, you do have the ability to
log in to your hypervisor(s).

#### With Managed VMware, do I get API access to the virtual centers or hypervisors?

No. Rackspace does not provide API access.

------------------------------------------------------------------------

### Features

#### How do I reimage a VM?

You can request this through an action in the customer portal.

#### Are imaged-based backups part of the managed virtualization offering?

Yes, for an additional service fee. This is accomplished via VM
Recovery.

#### Can I use fault tolerance with my Rackspace VMs?

This is not a currently-supported feature.

#### How does vMotion work?

vMotion is the process by which one hypervisor hands off a VM's memory
and processes to another hypervisor in the cluster. This process is down
while the VM is online and with no interuption of the VMs services. It
is important to not that vMotion does not preserve VM uptime in the
event of a fatal hypervisor failure. The source and destination
hypervisors must be operational and healthy in order for the vMotion to
be successful.

#### Does Rackspace offer utility billing for VMs?

Yes. If you power down a VM through the customer portal, you will not be
paying for it as long as it is powered down?

#### How are my VMs backed up?

Rackspace can be back up VMs through our VM Recovery service or
CommVault.

#### What is a snapshot and how does it work?

Snapshot is a point-in-time delta file to track all changes to a virtual
machine. Snapshots give you the ability to roll-back (i.e. Windows
patching at the disk level). Snapshots ARE NOT a permanent backup, and
should generally not be kept for more than 72 hours as they take up the
required 15% overhead.

#### What can I use the portal for?

Order new VMs, change resources of a VM, resize VMs, power on/off and
reset VMs, Snapshots, suspend VMs, performance metrics (CPU/RAM
utilization, network, disk utilization)

------------------------------------------------------------------------

### Implementation

#### How do I appropriately size my VMs?

Less is better. It is more important to size VMs closer to what they
need as opposed to loading in extra capacity that may not be used.
Assigning too many CPUs slows performance down. Begin with 2 CPUs, go to
4 if necessary. Very rarely start with 4 or more. Regardless of vendor
recommendation for a physical environment, virtual CPUs do not map 1:1
to physical CPUs. It's a completely different architecture.

#### Why does Rackspace require 15% overhead storage?

This overhead is necessary to perform functions like
cloning/snapshotting/vMotion. 15% is non-negotiable.

------------------------------------------------------------------------

### Maintenance

#### How do I add RAM or CPU to a VM?

In the
[my.rackspace.com](https://my.rackspace.com/portal/auth/login?targetUri=%2Fhome)
portal, go to **Products &gt; Managed Virtualization** and click on the
gear icon next to the name of the VM. Select **Resize VM**. The current
RAM and CPU are selected. Change the values as necessary and then click
**Resize Virtual Machine**.

**Warning:** Selecting **Resize VM** will cause your VM to power off
immediately. This process will take approximately 5 minutes plus the
required boot time.

#### Where is data stored if I create a snapshot, clone, or template?

-   Snapshots are stored with the VM and consume your allocated
    storage infrastructure. Snapshots must be carefully managed to
    ensure they don't consume all the disk space.
-   Clones are stored on the Rackspace infrastructure, so they don't use
    allocated disk resources. You can create one clone per VM.
-   Templates are stored on the Rackspace infrastructure. You can create
    one template per VM.

#### What are the differences between snapshot, clones, and templates?

-   **Snapshot** : A snapshot is a point-in-time "instance" of a VM that
    can be reverted or remerged (deleted). When a snapshot is taken, the
    hypervisor software begins recording changes in what is known as a
    *delta disk*. If the snapshot is reverted, the delta disk is removed
    and the parent disk is restored, which has the effect of taking the
    VM back to the instant the snapshot was created. Any subsequent
    changes after the snapshot no longer exist. If the snapshot is
    remerged (deleted), the delta disk is merged into the parent disk
    and the ability to jump back to the snapshot is no longer present.
    Snapshots are best used in situations such as patching, where a
    snapshot is reverted or remerged (deleted) depending on
    patch success. Snapshots are stored with the VM and therefore use
    your storage allocation. We therefore recommend that you keep
    snapshots only for 2-3 days to prevent overuse of the disk.
-   **Clone** : A clone is a one-to-one image copy of an existing VM. It
    acts independently from a parent VM, but it is an exact copy of the
    parent VM when it is initially created. You can create new VMs from
    the clones. You can create one clone per VM on the
    Rackspace infrastructure. The clone is also stored on the Rackspace
    infrastructure, so it doesn't use up your storage allocation. While
    clones can act and operate independently of the parent;
    snapshots cannot.
-   **Template**: A template is a clone that is designed for deployment
    of future VMs. It is also stored on the Rackspace
    storage infrastructure. You can create one template per VM.

#### How can I expand or shrink my virtual disk?

You can expand but you can't shrink. To expand, submit a ticket and
specify which virtual disk you would like expanded.

#### How do I view the performance of a VM or host?

Performance monitors are built into the portal under the
VM/host/cluster.

#### Can I have a clone or template created at a scheduled time interval?

This can be done in an automated fashion with the VM Recovery service,
or manually at your preferred times within the customer portal.

#### How do I monitor my available sever virtualization resources?

Use the [portal](https://my.rackspace.com/) to see which resources
(storage - local or otherwise) are reserved or available to provision
VMs in your environment**.**

**Note**: This only applies for the Server Virtualization product, not
Dedicated vCenter or Dedicated vCloud.

#### How do I create and delete clones or templates?

Use the portal to access the VM, and click **Create Clone/Template** in
the **Clone**/**Templates** section. Use a similar process for deleting,
by clicking **Delete Clone/Template**. You can also clone a VM by
clicking the **Copy VM** action in the portal.

#### How do I create and delete snapshots?

Use the portal to access the VM, and click **Create Snapshot** in the
**Snapshots** section. Use a similar process to delete a VM, by clicking
**Delete Snapshot** .

#### Can I have a copy of my Rackspace VM?

Due to our licensing agreements with vendors, we cannot provide a
licensed VM image until approved by our Legal team.

Do powered-down VMs count toward my available resources?

Yes. The **Available RAM (or CPU)** field in the portal takes into
account all VMs, whether powered down or not. However, powered-down VMs
prevent the VM from consuming resources on the hypervisor.

#### How many clones/templates/snapshots can I have active?

1 clone, 1 template, unlimited snapshots (snapshots can be "unlimited"
in that they take up to the original size of the original disk). The
snapshots take up customer's storage and does count to the required 15%
overhead.

#### How long will it take to provision a VM?

It depends, but probably greater than a week. Deployment times can vary
based on the request (rely on other teams); availability of resources/IP
addresses/avail. storage/compute resources (CPU and RAM)/hypervisor.
