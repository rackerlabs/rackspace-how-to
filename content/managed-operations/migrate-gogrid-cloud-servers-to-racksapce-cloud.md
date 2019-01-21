---
permalink: migrate-gogrid-cloud-servers-to-rackspace-cloud/
audit_date: '2018-08-15'
title: Migrate GoGrid Cloud Servers to the Rackspace Cloud
type: article
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-01-21'
last_modified_by: Cat Lookabaugh
product: Managed Operations
product_url: managed-operations
---

**Rackspace will discontinue support of GoGrid service effective May 31st, 2019.**

You might be able to migrate your GoGrid Linux&reg; servers to the Rackspace
Public Cloud by using [InstanceSync](https://github.com/cloudnull/InstanceSync/).
You do not need to stop your GoGrid server to complete the migration.

**Note:** The following process is offered as an unsupported courtesy and is not
guaranteed to work for your GoGrid Linux servers.

### Migration steps

Use the following steps to migrate your GoGrid Linux servers to the Rackspace
Cloud:

1. Sign up for a Rackspace Public Cloud account.

2. Create a new destination server in the Rackspace Public Cloud and record
   the public IPv4 address and root password of your new Rackspace server. See
   [Create a general purpose Cloud Server](/how-to/creating-a-general-purpose-cloud-server)
   for assistance. If your current servers are running an end-of-life (EOL)
   operating system (OS), such as Ubuntu&reg; 12, contact Rackspace Support to
   help you build the destination server.

3. If you are running an EOL OS, you need to change the base repositories for your
   server (both your old GoGrid server and the new Rackspace Cloud server). For
   example, the CentOS&reg; 5 repository should be `baseurl=http://vault.centos.org/5.11/os/$basearch`.
   Consult your distribution's documentation for more specifics on this step.

4. Apply all available updates for your OS on both your GoGrid server and your
   new Rackspace destination server. For example, if you're running Ubuntu 14,
   don't upgrade to 16 or 18, but do apply all updates to Ubuntu 14.

5. Download [InstanceSync](https://github.com/cloudnull/InstanceSync/) onto your
   GoGrid server and run the script. Watch the [screencast](https://asciinema.org/a/1063)
   for more info about how to run `InstanceSync`.

6. Verify the operation of your applications on your new Rackspace Cloud server.

7. Make any other needed changes to complete the migration, such as updating
   DNS records, configuring monitoring, and so on.

### Choices for server creation

When you create your new server, you need to make the choices discussed in this
section.

#### Rackspace Service Level Agreements (SLA)

The level of service provided at GoGrid aligns most closely with Rackspace's
Managed Infrastructure SLA. For more details about the two SLAs offered by
Rackspace Public Cloud, see [service levels](https://www.rackspace.com/openstack/public/service-levels).

#### Rackspace regions

The Rackspace Public Cloud is available in the following regions:

-  Dallas-Fort Worth (DFW)
-  Chicago (ORD)
-  Northern Virginia (IAD)
-  London (LON)
-  Sydney (SYD)
-  Hong Kong (HKG)

The following account types are available:

- **Global** has access to all regions *except* London.

- **UK** has access to the **LON** region, exclusively.

Choose the region and account type that fits best for your application. You can
open and link multiple accounts.

#### Cloud flavors

You can use any Rackspace Cloud server with enough disk space. The disk
allocations are slightly smaller in the Rackspace Cloud than they are in GoGrid,
but if you haven't used all the disk space on your GoGrid Cloud Server, you
should be able to migrate a server with the same size memory. If you are using
all the disk space on your GoGrid Cloud Server, choose a larger Rackspace Cloud
flavor.  For SSD-based GoGrid flavors, you should choose the Rackspace General
Purpose flavor.

For more information on Rackspace Cloud server flavors, see
[Understanding flavor classes](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/compute/cloud-servers-product-concepts/flavor-class/?_ga=2.184726953.1235559400.1548081702-2066683424.1543957190).

The following image shows a flavor-to-flavor comparison between GoGrid and
Rackspace:

<img src="{% asset_path managed-operations/migrate-gogrid-cloud-servers-to-rackspace-cloud/Gogrid-rackspace-flavor-map.png %}" />

#### Cloud storage

The Rackspace Public Cloud does not offer a file-based solution such as GoGrid's
Cloud Storage. Instead, choose
[Rackspace Cloud Block Storage](https://www.rackspace.com/cloud/block-storage)
for a block-based solution.

#### Rackspace Public Cloud server cost

The preceding flavor-to-flavor mapping table shows estimated pricing for standard
servers. Prices might vary according to region, image used, and SLA.  See
[pricing](https://www.rackspace.com/openstack/public/pricing) for other Rackspace
Cloud products, such as Cloud Load Balancers, Cloud Block Storage, and so on.

