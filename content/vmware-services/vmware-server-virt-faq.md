---
permalink: managed-vmware-services-faq/
audit_date: '2018-01-29'
title: Server Virtualization FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2018-01-29'
last_modified_by: Alexandra Settle
product: Managed VMware Services
product_url: managed-vmware-services
---

### Architecture

#### What type of disaster recovery (DR) solutions does Rackspace offer?

Rackspace offers three different solutions for DR:

- [Replication Manager](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/getting-started/replication-manager/):

  Replication Manager (SRM) is an add-on service for VMware&reg; Server Virtualization
  that utilizes VMware vCenter&trade; Site Recover Manager&trade; (SRM) to automate portions
  of the customer’s disaster recovery (DR) plan.

- [VM Replication](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/getting-started/vm-replication/):
  
  VM Replication provides geographical redundancy and helps protect
  business-critical VMs in the event of a data center outage or unplanned
  downtime. Geographical redundancy is a key component to any sound
  DR strategy. VM Replication helps protect and recover
  VMware Server Virtualization VMs by easily and cost-effectively
  replicating VMs between our data centers.

- [Virtual Machine Recovery](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/getting-started/vm-recovery/):
  
  Managed Backup Virtual Machine Recovery (VMR) is the Rackspace-productized
  version of VMware’s API for Data Protection (VADP) based backups to
  protect VMware Server Virtualization VMs. Managed Backup (MBU) VMR is a
  fully managed multi-tenant Backup and Recovery service for VMware
  Server Virtualization environments hosted in the Rackspace data centers.

#### What are the benefits of Rackspace VMware Server Virtualization?

VMware Server Virtualization is a fully managed virtualization platform.

#### With VMware Server Virtualization, can I log in to the hypervisor?

No. However, you are able to view the performance and other statistics
through the MyRackspace&reg; portal. Contact your Rackspace VMware support team
for more details.

#### With VMware Server Virtualization, do I get API access to the virtual centers or hypervisors?

No. Rackspace does not provide API access. If you are interested in gaining
access to the software, speak to your Rackspace account team about
[Rackspace Private Cloud powered by VMware](https://www.rackspace.com/en-gb/vmware/private-cloud).

------------------------------------------------------------------------

### Features

#### How do I re-image a VM?

You can request this through an action in the MyRackspace portal.

#### Are imaged-based backups part of the VMware Server Virtualization offering?

Yes, they are available for an additional service fee. This is accomplished via VM
Recovery.

#### Can I use fault tolerance with my Rackspace VMs?

VMware Server Virtualization does not currently allow VMware vSphere&reg; Storage vMotion&reg;
and therefore fault tolerance is not enabled.

#### Does Rackspace offer utility billing for VMs?

You have the ability to suspend the utility billing of virtual machines when
they are not in use by powering down VMs through the MyRackspace portal.
By powering off a VM from within the OS you will not only generate an
alert ticket for support to investigate, but the VM will continue billing
at the daily utility rate. To
power down VMs through the portal, see [Powering a virtual machine on and off](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/user-manual/managing-vms/#svh-power-vm).

#### How are my VMs backed up?

Rackspace can back up VMs through our VM Recovery service or
Rackspace Managed Backup.

#### What is a snapshot and how does it work?

Snapshot is a point-in-time delta file to track all changes to a virtual
machine. Snapshots give you the ability to roll back (Windows
patching at the disk level). Snapshots are not a permanent backup and
generally should not be kept for more than 72 hours.

#### What can I use the MyRackspace portal for?

-  Ordering new or multiple VMs
-  Change the resources of a VM
-  Resize VMs
-  Request re-imaging of a VM
-  Cloning and copying VMs
-  Power on or off and reset VMs
-  Performance metrics for VMs, hypervisors, and clusters (CPU/RAM utilization, network, disk utilization)
-  Requesting deletion of VMs

------------------------------------------------------------------------

### Implementation

#### How do I appropriately size my VMs?

Less is better. It is more important to size VMs closer to what they
need as opposed to loading in extra capacity that might not be used.
Assigning too many CPUs slows performance down. Begin with two CPUs, and go to
four if necessary. Very rarely start with four or more. Regardless of vendor
recommendation for a physical environment, virtual CPUs do not map 1 to 1
to physical CPUs. It's a completely different architecture.

#### Why does Rackspace require overhead storage?

This overhead is necessary to perform functions like
cloning, snapshotting, or vMotion.

------------------------------------------------------------------------

### Maintenance

#### How do I add RAM or CPU to a VM?

To add RAM or CPU to your VM, request a ticket with your Rackspace VMware
support team through the MyRackspace portal.

#### What are the differences between snapshot, clones, and templates?

-   **Snapshot** : A snapshot is a point-in-time instance of a VM that
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
    your storage allocation. We recommend that you keep
    snapshots only for two to three days to prevent overuse of the disk.
-   **Clone**: A clone is a one-to-one image copy of an existing VM. It
    acts independently from a parent VM, but it is an exact copy of the
    parent VM when it is initially created. You can create new VMs from
    the clones. You can create one clone per VM on the
    Rackspace infrastructure. The clone is also stored on the Rackspace
    infrastructure, so it doesn't use up your storage allocation. While
    clones can act and operate independently of the parent,
    snapshots cannot.
-   **Template**: A template is a clone that is designed for deployment
    of future VMs. A template is also stored on the Rackspace
    storage infrastructure. You can create one template per VM.

#### Where is data stored if I create a snapshot, clone, or template?

-   Snapshots are stored with the parent disk of VM and consume your
    allocated storage infrastructure. Snapshots must be carefully managed to
    ensure that they don't consume all the disk space.
-   Clones are stored on the Rackspace infrastructure, so they don't use
    allocated disk resources. You can create one clone per VM.
-   Templates are stored on the Rackspace infrastructure. You can create
    one template per VM.

#### How can I expand or shrink my virtual disk?

You can expand your virtual disk but you can't shrink it. To expand, submit a ticket and
specify the virtual disk that you want expanded.

#### How do I view the performance or monitor my available resources of a VM or host?

Use the MyRackspace portal to see which resources
(storage - local or otherwise) are reserved or available to provision
VMs in your environment.

For information on how to view performance, see the
[Viewing hypervisor and virtual machine performance section](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/user-manual/managing-hyps-clusters/) of
the Server Virtualization Customer Handbook.

#### Can I have a clone or template created at a scheduled time interval?

You can do this in an automated fashion with the VM Recovery service
or manually at your preferred times within the customer portal.

#### How do I create and delete clones or templates?

For information on how to create and delete clones or templates, see the [Copy and cloning virtual machines
section](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/user-manual/copy-clone-vms/)
of the Server Virtualization Customer Handbook.

#### How do I create and delete snapshots?

For information on how to create and delete snapshots, see the [Snapshotting a virtual machine section](https://developer.rackspace.com/docs/docs-vmware-server-virt/server-virt-handbook/user-manual/managing-vms/#snapshotting-a-virtual-machine) of
the Server Virtualization Customer Handbook.

#### Can I have a copy of my Rackspace VM?

Due to our licensing agreements with vendors, we cannot provide a
licensed VM image until that is approved by our Legal team.

#### Do powered-down VMs count toward my available resources?

Yes. The **Available RAM (or CPU)** field in the portal takes into
account all VMs, whether powered down or not. However, powered-down VMs
prevent the VM from consuming resources on the hypervisor.

#### How many clones, templates, and snapshots can I have active?

You can have one clone, one template, and unlimited snapshots. Snapshots can be "unlimited"
in that they take up to the original size of the original disk. The
snapshots take up customer storage and do count toward the required 15%
overhead.

#### How long will it take to provision a VM?

It depends, but probably greater than a week. Deployment times can vary
based on the request (rely on other teams), availability of resources or IP
addresses, and storage or compute resources (CPU and RAM) and hypervisors.
