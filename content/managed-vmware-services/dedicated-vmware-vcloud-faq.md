---
permalink: dedicated-vmware-vcloud-faq/
audit_date:
title: Rackspace Private Cloud Powered by VMware vCloud FAQ
type: article
created_date: '2015-01-29'
created_by: Karin Levenstein
last_modified_date: '2016-01-21'
last_modified_by: Rose Coste
product: Managed VMware Services
product_url: managed-vmware-services
---

Rackspace Private Cloud Powered by VMware vCloud&reg; (hereafter refered to as Dedicated vCloud) is a private cloud offering based on VMware services hosted on a dedicated management cluster. This list of frequently asked questions provides details about Dedicated vCloud features and management options for vApps and virtual machines (VMs).

For more information, see the [Dedicated vCloud product page](https://www.rackspace.com/managed-hosting/vmware/vmware-vcloud).

### General

#### How do I access Dedicated vCloud? {#general-access}

You can access Dedicated vCloud only through a VPN connection to Rackspace.

#### What Rackspace data centers provide Dedicated vCloud? {#general-datacenters}

Dedicated vCloud is available in the IAD and LON data centers.

#### Are backup and antivirus solutions included with Dedicated vCloud? {#general-backup}

Dedicated vCloud environments are protected by the CommVault SQL Server agent in conjunction with Rackspace VM Recovery, which is an image-based backup solution. Antivirus software is installed and configured by using the latest platform supported by Rackspace. Only VMs in vApps created from Rackspace catalog templates with the Managed designation include backup and antivirus services.

#### How can I migrate virtual machines to Dedicated vCloud? {#general-migrate}

Dedicated vCloud provides a method for uploading a VM, vApp, or virtual appliance in either the OVF or OVA format.

You can also migrate data to Rackspace by using VMware vCloud Connector, which is a free tool for moving from your local VMware environment to the Rackspace-hosted Dedicated vCloud environment. For more information about migrating to Dedicated vCloud, contact Rackspace Support.

#### What versions of VMware services are currently supported in Dedicated vCloud? {#general-versions}

Dedicated vCloud supports vCloud Director version 5.5, vSphere version 5.5, and vCenter Operations version 5.8.

#### Where can I find a list of known issues for Dedicated vCloud? {#general-issues}

Known issues are listed in the release notes for each version of vCloud. You can find your version number by clicking **Help** \> **About** in vCloud. For more information, see the [VMware vCloud Director Documentation](https://www.vmware.com/support/pubs/vcd_pubs.html).

----

### Access control

#### How are permissions for users controlled in Dedicated vCloud? {#access-perms}

Rackspace retains administrator access to vCloud. Customers are given a limited access account. Elevated access levels are granted only as needed to maintain security. New users are created on request, except for Active Directory installations managed by the customer.

#### How many active concurrent users can access vCloud? {#access-concurrent}

A vCloud environment is limited on a per-cell basis to 5,000 logged-in users and 1,500 active concurrent users. The limit applies to the total number of users accessing both the user interface and the API.

#### Is the same infrastructure used for login information if I have multiple vCloud environments in a single data center? {#access-infra}

Each vCloud environment is self-contained, with its own set of user accounts. Rackspace can provide a single authentication source for all environments; for example, for all environments in the Intensive domain. Rackspace can create the same local users across all environments.

#### What single sign-on (SSO) capabilities are provided? {#access-sso}

By default, vCloud authenticates to the Rackspace Intensive domain. Rackspace can add your domain to the SSO service for VMware vCenter and the vCloud Organization as an additional authentication source.

#### What restrictions are there on vCloud features? {#access-restrictions}

Customer role limitations are described in the features and permissions tables in our [Dedicated vCloud Handbook](https://developer.rackspace.com/docs/managed-vmware-services/vcloud/v1.5/).

----

### Architecture

#### Are Dedicated vCloud environments deployed in a high availability (HA) configuration? {#arch-ha}

Yes, Dedicated vCloud environments are deployed in an HA configuration.

#### Is there a limit to the number of VMs per environment? {#arch-limit}

Rackspace does not impose a limit on VMs per environment. We can provide recommendations for best practices to maintain optimal performance.

#### Can I access the vCloud API? {#arch-api}

Yes. You can access the vCloud and vSphere APIs, subject to permissions restrictions on a user account.

#### Can I implement a stretched layer 2 to allow vMotion sharing between my existing sites? {#arch-vmotion}

No, stretching the data link layer across environments is not supported in Dedicated vCloud.

#### Can I add ESXi hypervisors in my data center to a Dedicated vCloud environment? {#arch-addhyper}

No. Only hypervisors provided by Rackspace can be added.

#### Can I manage Rackspace-hosted VMware ESXi hypervisors if I have Dedicated vCloud? {#arch-managehyper}

We do not provide direct access to the hypervisor. You can make hypervisor change requests by creating a Rackspace support ticket.

#### With Dedicated vCloud, do I have full control over ESXi hypervisors to import or export my own VMs? {#arch-importhyper}

Import and export privileges are not provided on individual hypervisors. You can upload images to your Dedicated vCloud environment by using the OVF Import function of vCloud Connector.

#### Can I manage vCenter plug-ins and add my own third party plug-ins? {#arch-plugins}

No, write access to vCenter is not provided.

#### Are Storage RDMs supported? {#arch-rdms}

Yes, you can get support for raw device mappings (RDMs) by opening a support ticket with our storage and virtualization team.

----

### Integration

#### What other VMware products are supported? {#int-other}

Dedicated vCloud allows customers to use other VMware products like vRealize Automation, but these products are not fully supported by Rackspace.

#### Is Rackspace RackConnect supported with Dedicated vCloud? {#int-rackconnect}

Yes.

#### Does the MyRackspace portal work with vCloud? {#int-myrack}

You can view VM devices in the MyRackspace portal, but VM management is available only through the vCloud portal or API.

#### Is VMware vCloud Connector supported? {#int-connector}

You can deploy vCloud Connector, but Rackspace does not provide support for it.

#### Can I deploy the Alert Logic IDS with Dedicated vCloud? {#int-alertlogic}

Yes. The Alert Logic intrusion detection system (IDS) can be used with Dedicated vCloud.

----

### Monitoring

#### How are Dedicated vCloud components monitored? {#monitoring-how}

The management infrastructure is monitored by using the following combination of tools:

-   **HP SiteScope for vCenter services** alert Rackspace virtualization engineers when any web services associated with Dedicated vCloud and vCloud Director are unavailable.
-   **Rackwatch for hypervisor connectivity** alerts Rackspace virtualization engineers when devices don't respond to ping requests.
-   **CA&reg; Nimsoft Monitor for vCenter alarms** alert Rackspace virtualization engineers to alarms raised in vCenter.

Any supported vApps deployed from the Rackspace-provided catalog are monitored by these systems.

#### Is monitoring provided for my unmanaged VMs? {#monitoring-unmanaged}

No.  Rackspace does not provide monitoring for VMs designated as unmanaged.  For more information, see [Dedicated vCloud support coverage](/how-to/dedicated-vmware-vcloud-support-coverage).

#### How do I know if Dedicated vCloud resources are low? {#monitoring-resources}

Dedicated vCloud includes the VMware vCenter Operations (vCOps) suite of performance monitoring and planning tools. vCOps provides advanced reporting and forecasting capabilities, and the ability to set alerts to notify you when resources are low. These tools can be useful for optimizing resources and identifying performance bottlenecks.

Rackspace can help you with the use of other monitoring software as needed.
