---
permalink: rpc-vmware-faq/
audit_date:
title: Rackspace Private Cloud Powered by VMware FAQ
type: article
created_date: '2015-01-29'
created_by: Karin Levenstein
last_modified_date: '2016-01-21'
last_modified_by: Rose Coste
product: Rackspace Private Cloud Powered by VMware
product_url: rpc-vmware
---

Rackspace Private Cloud Powered by VMware vCloud&reg; (hereafter refered to as RPC-V) is a private cloud offering based on VMware software defined datacenter (SDDC) services hosted on a dedicated management cluster. This list of frequently asked questions provides details about RPC-V features and management options.

For more information, see the [RPC-V product page](https://www.rackspace.com/vmware/private-cloud).

### General

#### How do I access RPC-V? {#general-access}

You can access RPC-V only through a VPN connection to Rackspace.

#### What Rackspace data centers provide Dedicated vCloud? {#general-datacenters}

RPC-V is available in the IAD, DFW, LON, ORD, SDY and HKG data centers.

#### Are backups included with RPC-V? {#general-backup}

RPC-V management environments are automatically protected by an image based CommVault solution. 

#### Is an Anti-Virus solution included with RPC-V? {#general-backup}

Optional antivirus software can be licensed and installed to protect Guest Operating Systems. 

#### How can I migrate virtual machines to RPC-V? {#general-migrate}

You can migrate data to Rackspace by using VMware vSphere replication or a number of other supported replication solutions. For more information about migrating to RPC-V, contact Rackspace Support.

#### Where can I find a list of known issues for RPC-V? {#general-issues}

Known issues are listed in the release notes for each version of vSphere. You can find your version number by clicking **Help** \> **About** in vCenter. For more information, see the [VMware vSphere Documentation]( https://docs.vmware.com/en/VMware-vSphere/index.html).

----

### Architecture

#### Are RPC-V environments deployed in a high availability (HA) configuration? {#arch-ha}

Yes, RPC-V environments are deployed in an HA configuration.

#### Is there a limit to the number of VMs per environment? {#arch-limit}

Rackspace does not impose a limit on VMs per environment. We can provide recommendations for best practices to maintain optimal performance.

#### Can I access the vCenter API? {#arch-api}

Yes. You can access the vCenter and vSphere APIs, subject to permissions restrictions on a user account.

#### Can I add ESXi hypervisors in my data center to a RPC-V environment? {#arch-addhyper}

By default only hypervisors provided by Rackspace can be added, please contact Rackspace support for additional details.

#### Can I manage vCenter plug-ins and add my own third party plug-ins? {#arch-plugins}

Yes, write access to vCenter is provided.

#### Are Storage RDMs supported? {#arch-rdms}

Yes, you can get support for raw device mappings (RDMs) by opening a support ticket with our storage and virtualization team.

----

### Integration

#### What other VMware products are supported? {#int-other}

RPC-V allows customers to use other VMware products like vRealize Automation, which are optional add-ons.

#### Is Rackspace RackConnect supported with RPC-V? {#int-rackconnect}

Yes.

----

### Monitoring

#### How are Dedicated vCloud components monitored? {#monitoring-how}

The management infrastructure is monitored by using the following combination of tools:

-   **HP SiteScope for vCenter services** alert Rackspace virtualization engineers when any web services associated with RPC-V are unavailable.
-   **Rackwatch for hypervisor connectivity** alerts Rackspace virtualization engineers when devices don't respond to ping requests.
-   **CA&reg; Nimsoft Monitor for vCenter alarms** alert Rackspace virtualization engineers to alarms raised in vCenter.

#### Is monitoring provided for my unmanaged VMs? {#monitoring-unmanaged}

No.  Rackspace does not provide monitoring for VMs designated as unmanaged.  For more information.

#### How do I know if RPC-V resources are low? {#monitoring-resources}

RPC-V includes the VMware vRealize Operations (vROps) suite of performance monitoring and planning tools. vROps provides advanced reporting and forecasting capabilities, and the ability to set alerts to notify you when resources are low. These tools can be useful for optimizing resources and identifying performance bottlenecks.

Rackspace can help you with the use of other monitoring software as needed.
