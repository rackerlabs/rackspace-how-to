---
node_id: 1941
title: Next Generation Cloud Servers migration considerations and options
type: article
created_date: '2012-08-09'
created_by: Jered Heeschen
last_modified_date: '2016-01-06'
last_modified_by: Catherine Richardson
product: Cloud Servers
product_url: cloud-servers
---

If you're moving your application from our First Generation Cloud Servers platform to Next Generation Cloud Servers, keep the features of the new platform and your migration options in mind when you migrate.

Note that our First Generation Cloud Servers platform will be retired, and all First Generation servers are being migrated to Next Generation Cloud Servers.  We will send communications with migration information for eligible servers.  Migration effects and options are detailed in the "Migrating to Next Generation" section.

### Feature changes

Our Next Generation Cloud Servers platform includes several changes compared to the first generation.

-  **API**: The [OpenStack API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/) used by Next Generation Cloud Servers is responsive and flexible, with room to grow.  New features include management of server metadata and API control of rescue mode.

-  **IPv6**: Next Generation Cloud Servers assign IPv6 addresses, although each server can have only one assigned IPv6 address.

-  **Region choice**: In our Next Generation Cloud environment, you can choose the region where your created cloud servers will reside.

  Regional control helps you manage back-end availability between your servers and connectivity to services such as Cloud Databases and Cloud Load Balancers.  You can also ensure that you have copies of your application in multiple regions to aid with disaster recovery.

-  **Disk management**: Disk management is more flexible and with it you can repartition your cloud server's virtual disk and switch file systems if necessary.

-  **Open architecture**: The Next Generation Cloud's OpenStack base provides the potential for interoperability with OpenStack-based tools like [python-novaclient](/how-to/using-python-novaclient-with-the-rackspace-cloud), as well as compatibility with private and third-party clouds running OpenStack.

-  **General Purpose and optimized servers**: Our Next Generation platform includes multipurpose (General Purpose) server flavors and server flavors optimized for computing power, memory, and network and disk throughput.  These server flavors offer dramatic improvements over First Generation and Standard servers in disk and network speed.  For more information, see [New features in General Purpose and optimized Cloud Servers](/how-to/new-features-in-general-purpose-and-work-optimized-cloud-servers).

-  **Resizing**: While Standard server flavors can be resized, General Purpose and work-optimized servers cannot.  General Purpose and work-optimized server types must be migrated to a new server to change CPU and memory allocation.  They can add a Cloud Block Storage volume to increase available disk space.

-  **Images**: Images can be made from Standard servers, similar to First Generation servers.

  General Purpose and work-optimized server images include only the local system disk, not attached data disks.

  Compute, Memory, and General Purpose servers that use Cloud Block Storage volumes as system disks cannot be imaged because they do not have local system disks.  Servers with Cloud Block Storage volumes as system disks can have a snapshot taken of the system volume using the Block Storage Volumes interface in the Cloud Control Panel or the Cloud Block Storage API..

-  **No shared IP address groups**: Unlike First Generation Cloud Servers, our Next Generation environment does not offer the ability to create shared IP address groups via the API.

-  **No 256 MB instances**: Instances with 256 MB of memory are not available for Next Generation Cloud Servers.  Server sizes start at 512 MB RAM.

-  **Virtual CPU allocation**: Our Next Generation servers are more strict about allocating CPU time on the host to instances than our First Generation servers.  If your application relies on frequent CPU bursts, you might see a reduction in performance on a Next Generation server.  Conversely, if you rely on consistent CPU power (without being affected by bursts from other instances on the host), Next Generation servers are more reliable.

  In some cases, our cloud server packages can offer more virtual CPUs than our First Generation platform.  Further, our Compute server flavors offer the ability to emphasize CPU power in your server configuration.  For more information about cloud server vCPU allocation,see the [Cloud Servers pricing page][http://www.rackspace.com/cloud/servers].

### Migrating to Next Generation

First Generation Cloud Servers will be retired, so it is necessary to migrate data from First Generation Cloud Servers to another Cloud Servers option.  We will send migration window information as each server becomes eligible for self-service and assisted migration.

During the migration window, a self-service migration option will be available for your server in the Cloud Control Panel.  Your server will also have a designated date when it will be eligible for an assisted migration.  We will send notifications to accounts with active First Generation servers starting in January, 2015 with migration window information and instructions.  If servers are not migrated before the end of the migration window, they will be migrated automatically.

**Note:**  A server's public and private IP addresses **will be preserved** if you perform a self-service or assisted migration.  Shared IP addresses will also be preserved.

A Linux server migrated to Next Generation Cloud Servers will use the same server flavor as the original server, including RAM and virtual CPU allocation.  A Windows server will be migrated to the Next Generation flavor closest in size to the original server.

In many cases a migration can be performed while preserving application and server states.  Availability of this feature depends on the server's operating system.  Some operating systems and distributions will need to be halted for the migration.

See the [First Generation to Next Generation cloud server migration FAQ](/how-to/first-generation-to-next-generation-cloud-server-migration-faq) and the [migration thread in our community forums](https://community.rackspace.com/products/f/25/t/4787) for more answers about self-service and assisted migrations.

#### Self-service migration

To perform a self-service migration, you can perform a soft reboot of your server through the Cloud Control Panel during your migration window.  Rebooting your server from the command line or using the hard reboot option in the control panel will not initiate a migration.

#### Assisted migration

You will be notified by email and in the Cloud Control Panel of a date when your server will be eligible for assisted migration.  If you opt for an assisted migration, we'll perform the server migration for you during the specified time window.  Every effort will be made to minimize downtime and preserve application states for the transition.

### Migrating outside the migration window

If you don't want to wait for your migration window to move your data from First Generation Cloud Servers to Next Generation Cloud Servers, you can choose image-based migration or manual migration.  When planning this kind of migration consider the size of the original server, as well as the region of connected Cloud Database instances, Cloud Load Balancers, and Cloud Block Storage volumes.

**Note:**  Unlike self-service and assisted migrations, the image-based and manual migration options described in this section result in a new server with a different IP address than the original instance.  A server's IP address can only be preserved if it is migrated using a self-service or assisted migration as described in the previous section.

### Image-based migration

The Cloud Control Panel provides the ability to create a special image of a First Generation Cloud Server that is automatically converted to a Next Generation image. You can use the new image to create a Next Generation server.

**Note:** Using an image to migrate to Next Generation Cloud Servers can be a simpler and quicker process than migrating your data with rsync, but it will not work with all instances. Support for image-based migration is determined by the base image that was originally used to create the instance.

Manual migration is available as an alternative for unsupported instances and is described in the next section.

#### To create a Next Generation image from a First Generation server

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. Click the gear icon next to the server you want to duplicate, and select **Create Image**.

    If the server is compatible with the conversion process, you are given a choice between making a First Generation or Next Generation image.

    ![Image migration](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/nextgen-snapshot.png)

    **Note:** If you don't see an option to create a Next Generation image, your instance is not supported by the conversion process. In that case, use one of the manual migration approaches described later in this section.

3. To create a converted image, specify a name for the image, select **Next Generation Cloud Server Image**, and then click **Create Image**.

    When the image is ready, it will be listed as an image choice when you are creating a new cloud server. Note that image storage pricing on Cloud Files applies.

If you have trouble creating the image, [contact Support](http://www.rackspace.com/support/).

**Note:** The IP address of an instance created from an image will be different from the IP address of the server used to create that image. Depending on your application, issues might occur if both the original server and the new server are active simultaneously.

### Manually migrating Linux servers

For advice on taking the system disks and data disks on General Purpose and I/O optimized servers into account when migrating, see [Migrating to a General Purpose or I/O Server](/how-to/migrating-to-a-general-purpose-or-io-server).

### Manually migrating Windows 2012 servers

To migrate IIS and Microsoft SQL Server data on Windows 2012, you can use the Microsoft Web Deploy tool per the [instructions in the Rackspace Community](https://community.rackspace.com/products/f/25/t/641).

### Post-migration considerations

After migrating to a new cloud server, make any necessary changes to DNS information or load balancers for your application.

Older First Generation images can't be used to create Next Generation servers, so be sure to make back-up arrangements for the new server after the migration is complete.

If you have questions about your migration and post-migration options, see the [migration thread in our community forums](https://community.rackspace.com/products/f/25/t/4787) for more information.
