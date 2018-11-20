---
permalink: cloud-block-storage-attaching-vs-mounting/
audit_date:
title: Attaching versus mounting in Cloud Block Storage
type: article
created_date: '2012-10-22'
created_by: David Hendler
last_modified_date: '2016-10-24'
last_modified_by: Kate Dougherty
product: Cloud Block Storage
product_url: cloud-block-storage
---

In Cloud Block Storage you both attach and mount a volume to a server. The
following information explains these concepts:

**Attach**: When you attach a Cloud Block Storage Volume to a server, a
logical connection is created from a Cloud Block Storage node to the
hypervisor hosting your cloud server. This is done over a network link
via the iSCSI protocol. The new Volume gets exposed as a virtual device
to the host. To your Cloud Server, the Volume appears as a new raw
storage device. You can attach a Cloud Block Storage Volume through
either the API or the [Cloud Control Panel](https://login.rackspace.com/).

**Mount**: Mounting is generally done once a volume has been attached
and formatted for use by a computer's operating system. Mounting is the
process in which a user instructs the operating system how to logically
map the directory structure to a physical storage device. You can only
mount a volume through the computer's operating system.

For more information about how to mount your volume, see [Prepare your
volume](/how-to/prepare-your-cloud-block-storage-volume).
