---
permalink: migrating-between-server-flavors/
audit_date: '2020-07-30'
title: 'Migrate between server flavors'
type: article
created_date: '2020-07-23'
created_by: Brian Abshier
last_modified_date: '2020-07-23'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Within the Rackspace Cloud, you have different server flavors from which to choose. 
You can view the list [here](https://developer.rackspace.com/docs/cloud-servers/v2/general-api-info/flavors/).

If you outgrow your server and need more resources, the best option is to scale horizontally by cloning your
servers and placing them behind a load balancer. Horizontal scaling, in most cases, works better than
vertical scaling. With vertical scaling, you have to take your server offline while you resize up to a larger
one. Horizontal scaling allows your existing pool of servers to remain online, serving traffic, while
you create additional clones to offload some of the traffic. However, horizontal scaling might not apply in
your case, or you might prefer not to use it. 

Standard or General Purpose servers default to using local disks rather than block storage volumes as their
boot disk. So, it might be unclear how to move to a flavor that boots from a volume such as Compute or Memory. 

### Limitations

Cloud images created from large servers don’t allow you to take an image and create a bootable Block Storage
volume. If you took the image from a cloud server with a root disk, or if the image has a `min_disk` parameter
larger than 127 GB, you can’t create a volume from that image. If you have a 4GB Standard, an 8GB General
Purpose server, or anything larger, you fall into this category. 

The problem is that the component used to attach images to cloud servers, `qemu-img`, can’t handle files 127 GB or
larger. If you try to attach a too-large image through the API, you get an `HTTP 412 invalid image` error.

### Moving to another flavor

If your Standard or General Purpose server is small enough, you should be able to take an image of your server
and create a bootable volume that you can use to boot Compute or Memory flavor servers. To learn more, see
[Boot a server from a Cloud Block Storage volume](https://support.rackspace.com/how-to/boot-a-server-from-a-cloud-block-storage-volume/).

However, if your server falls under the category listed in the preceding **Limitations** section, you need to perform
a manual cloud-to-cloud migration of the server's data to move to the other flavor. To learn more, see
[Cloud-to-cloud migration](https://support.rackspace.com/how-to/cloud-to-cloud-migration/).
