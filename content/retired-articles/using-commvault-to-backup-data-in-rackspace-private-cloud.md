---
permalink: using-commvault-to-backup-data-in-rackspace-private-cloud/
audit_date:
title: Using CommVault to Backup Data in Rackspace Private Cloud
type: article
created_date: '2013-02-19'
created_by: Alyssa Hurtgen
last_modified_date: '2013-06-26'
last_modified_by: Kyle Laffoon
---

### Overview

Rackspace Private Cloud powered by OpenStack lets you create virtual
instances that you can use to run any kind of applications. However,
these virtual machines do not come with a backup and recovery solution
by default. CommVault Simpana&reg; software has been tested and validated to
work with Rackspace Private Cloud to do file-level backup and recovery
of data inside individual instances. <span
style="line-height: 1.538em;">This document gives a brief overview of
architecture and the components involved and the process to configure
your instances for backup.</span>

### Prerequisites

This document assumes the following:

-   A Rackspace Private Cloud Software cluster (at least one controller, and one compute node, or
    an all-in-one and additional compute node)

-   CommVault Simpana&reg; Software version 9 or later


### Backup Infrastructure

CommVault Simpana&reg; software is built from the ground up on a single
platform for integrated data protection and management. IT organizations
can reduce costs and simplify data management across its lifecycle with
integrated modules for backup & recovery, archive, replication, search,
and reporting.

An introduction to CommVault terminology for backup and recovery:

**CommCell&reg;:** Collectively all Simpana components deployed for data
protection and recovery including the CommCell Console, CommServe, Media
Agents, and iDataAgents.

**CommCell Console:** The graphical user interface that allows you to
control and manage all CommVault Simpana components.

**CommServe&reg;:** The coordinator and administrator of the CommCell
components. The CommServe server communicates with all agents in the
CommCell to initiate data protection, management, and recovery
operations.  The CommServe does some resource intensive processing and
is preferably installed on a box with enough compute resources.

**MediaAgent:** Transfers data between the client computer(s) and the
storage media during backup and recovery operations. The layout and the
number of media agents you want in a typical deployment depends upon
your storage needs.

**File System iDataAgent:** Installed on the virtual machines in the
Rackspace Private Cloud and performs the backup and restore operations.
Any instance that needs to be backed up should have this agent installed
and registered to the backup infrastructure.

### Architecture Recommendations

The following diagram illustrates the different components of CommVault
software and how they work with Rackspace Private Cloud. Typically, you
run the CommServe and Media Agents outside the private cloud, so your
back infrastructure can stay up independent of the cloud.

Using the CommCell GUI, source-side de-duplicated backups can be configured and automated to identify what
data needs to be protected, how long to retain the protected data, and where to store a copy of the data.

The specifics of your layout will depend on several factors, like your
storage requirements, policies, and existing infrastructure, if any. For
specific architectural recommendations and all configuration
considerations, you can to talk to a CommVault Systems Engineer.

<img src="{% asset_path rpc-openstack/using-commvault-to-backup-data-in-rackspace-private-cloud/commvault_rackspace_openstack_layout.png %}" class="image-half_width" width="375" height="271" />

### Agent Installation

Multiple options are available for installing the Simpana iDataAgent in
an OpenStack VM. The configuration of the iDataAgent can be automated by
booting new VMs off of VM images with the iDataAgent preinstalled and
preconfigured for your environment.

### Conclusion

CommVault Simpana software has been tested and validated to work with
Rackspace Private Cloud to perform file-level backup and recovery of
data inside individual instances. OpenStack virtual machines can easily
be protected in an existing CommVault infrastructure or a new
deployment.
