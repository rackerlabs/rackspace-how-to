---
permalink: rackconnect-power-users-guide/
audit_date:
title: RackConnect Power Users Guide
type: article
created_date: '2012-11-09'
created_by: Jonathan Hogue
last_modified_date: '2016-01-06'
last_modified_by: Rose Contreras
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

This document is meant to be used by RackConnect "power users." Power
users typically use the API to build new servers and need to be able to
spin up large numbers of servers quickly. For power users, the time it
takes to spin up many servers is very important, thus build times and
build success rates are key success measurements.

### How to increase build success rates

1. "Burst" the server builds - A RackConnect configuration represents a
deployment of the RackConnect solution. The configuration is comprised
of your Edge and Connected physical network devices, along with one or
more Cloud Accounts that you associate with the configuration. A single
RackConnect can support up to 200 cloud servers per configuration based
on network device.

  We recommend that you create no more than 20 Windows servers or 30 Linux
servers at a time. It is best to create all 20 or 30 simultaneously,
rather than issuing the API call to create one, waiting for a while, and
then issuing the command for the next. If you need to build more than 20
or 30 servers, wait until the first batch is complete before kicking off
the next batch. RackConnect has an API you can use to determine when the
last server is fully deployed. More information about how to determine the RackConnect automation status for cloud servers is available at [Programmatically determine the RackConnect automation status of your cloud
servers](/how-to/how-to-programmatically-determine-the-rackconnect-v20-automation-status-of-your-cloud).

1. Vet the image - After the basic cloud server build has completed,
RackConnect logs on to the newly created server and performs some
configuration changes. For RackConnect v2.0 customers, the automation
creates a RackConnect "user", disables the public interface,
reconfigures the private interface so that it can connect to your
dedicated environment, and configures the software firewall according to
your network policies. If you are not using a standard Rackspace image
that has been verified to work with RackConnect, there are a number of
configuration changes that could be made that may prevent RackConnect
automation from running successfully. For example, images that have SSH
disabled, have SSH configured for a non-standard port, or prevent root
login via SSH will all fail to build correctly. For more information about image
configuration, see [RackConnect best
practices](/how-to/rackconnect-v20-best-practices).

1. Allow Rackspace automation to complete - If you are running your own
automation scripts after the cloud server build is complete, be sure to
allow all Rackspace automation to complete before running your scripts.
If your automation and Rackspace automation runs at the same time it
could cause one or both to fail. For customers with a Managed Operations
service level, there are two automation passes that Rackspace
runs: one for RackConnect and one for the Managed Operations servers. If
you are not a Managed Operations service level customer, you only need
to wait for the RackConnect automation to complete before running your
own. To programmatically determine when Rackspace automation is complete, see [Programmatically determine the
RackConnect automation status of your cloud
servers](/how-to/how-to-programmatically-determine-the-rackconnect-v20-automation-status-of-your-cloud)

1. Build cloud servers in the correct region - Ensure that you create
your cloud servers in the same region as your RackConnect configuration.
In other words, if your dedicated environment is in the Rackspace DFW
region, be sure to build any cloud servers you want to be connect to RackConnect
in the same region. Servers build in a different region will not be
accessible from your dedicated environment.

### How to decrease build times

Use manual disk mode. The Rackspace Next Generation Cloud Servers API
has an extension called `diskConfig` that allows you to control how the
cloud server disk is partitioned when servers are created, rebuilt, or
resized. There are two modes: manual and auto.

-   Auto: The server is built with a single partition the size of the
    target disk. The file system is automatically adjusted to fit the
    entire partition. This keeps things simple and automated. AUTO is
    valid only for images and servers with a single partition that use
    the EXT3 file system. This is the default setting for applicable
    Rackspace base images.
-   Manual: The server is built using whatever partition scheme and file
    system is in the source image. If the target disk is larger, the
    remaining disk space is left unpartitioned. This enables images to
    have non-EXT3 file systems, multiple partitions, and so on, and
    enables you to manage the disk configuration.

Manual disk mode creates a 20 GB partition for the OS, so unless you need
more than 20 GB of space you should use manual mode as this will decrease
the server build time significantly. You can also extend the partition
manually post-build.
