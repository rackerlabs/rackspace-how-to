---
permalink: rackconnect-v30-compatibility/
audit_date: '2017-10-24'
title: RackConnect v3.0 compatibility
type: article
created_date: '2014-09-08'
created_by: Juan Perez
last_modified_date: '2017-11-01'
last_modified_by: Brian King
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0

This article outlines the compatibility of RackConnect v3.0 with other Rackspace products and offerings.

### RackConnect v3.0 compatibility with Rackspace public cloud offerings

The following table lists and describes the Rackspace public cloud products that are compatible with RackConnect v3.0. The **Requirements** column lists the requirements that your RackConnect v3.0 cloud servers must meet for them to work with the listed product. For example, "ServiceNet" means that your cloud servers must be provisioned with ServiceNet interfaces for them to work with the designated product.

**Note**: OnMetal v1 Servers are not compatible with RackConnect v3.0. OnMetal v2 Servers are compatible, but may require provisioning a new Cloud Network in your RackConnect environment. Cloud Load Balancers are blocked by default, but can be enabled. Contact your support team for assistance.

Product | Requirements | Details | Product information
--- | --- | --- | ---
Auto Scale | None | Auto Scale is an API-based tool that automatically scales resources in response to an increase or decrease in overall workload based on user-defined thresholds. Auto Scale enables you to automatically scale your RackConnect cloud servers resources to adjust to customer demand. <br /><br /> See the [Cloud Bursting with RackConnectV3](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#cloud-bursting) section of the *Rackspace Auto Scale Developer Guide* for details about using Auto Scale with RackConnect v3.0. | [Auto Scale Getting Started Guide](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#getting-started)<br /><br /> [Auto Scale Developer Guide](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#document-developer-guide)<br /><br /> [Cloud Bursting with RackConnectV3](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#cloud-bursting)
Cloud Backup | ServiceNet | Cloud Backup is a file-based backup application that enables you to choose which files and folders to back up from your cloud servers. You can choose to restore your whole system with all of its folders and files, or individual files or folders from a given date, to restore to an entirely different server. | [Getting Started with Rackspace Cloud Backup](/how-to/cloud-backup)
Cloud Block Storage | None | Cloud Block Storage is a block-level storage solution that enables you to expand the storage capacity of your Rackspace  Cloud Servers. | [Getting Started with Cloud Block Storage](/how-to/cloud-block-storage)
Cloud Databases | ServiceNet | Cloud Databases is a stand-alone, API-based relational database service built on the OpenStack&reg; cloud that enables you to easily provision and manage multiple MySQL database instances. Instances are provisioned in a single-tenant, container-based environment per account. <br /><br /> RackConnect v3.0 is <strong>compatible</strong> with MySQL Cloud Databases instances. <br /><br /> **Note:** Cloud Databases is compatible with cloud servers only and cannot be used directly with dedicated servers. | [Getting Started with Cloud Databases](/how-to/cloud-databases)
Cloud Files | ServiceNet | Cloud Files provides an easy-to-use online storage for files and media that can be delivered globally at fast speeds over the Akamai content delivery network (CDN). | [Getting Started with Cloud Files](/how-to/cloud-files)
Cloud Monitoring | Provisioned public IP address | Cloud Monitoring provides you with timely and accurate information about how your resources are performing. You can quickly create multiple monitors that use predefined checks such as PING, HTTPS, and SMTP to track your cloud resources and receive instant notification when a resource needs your attention. | [Getting Started with Cloud Monitoring](/how-to/cloud-monitoring)
Cloud Networks | None | RackConnect v3.0 depends on and leverages Cloud Networks to connect from your RackConnect cloud servers to your dedicated environment. You use Cloud Networks to create and manage secure, isolated networks in the cloud. These networks are fully single tenant and you have complete control over the network topology, IP addressing, and which cloud servers are attached. Cloud networks are regional in scope and can be attached to any of your cloud servers in a given region. | [Getting Started with Cloud Networks](/how-to/cloud-networks)
Cloud Orchestration | None | Rackspace Cloud Orchestration helps you set up projects and servers with just a few clicks instead of lengthy installations. You can usually be up and running in less than five minutes, depending on the template that you choose and other factors. Cloud Orchestration provides templates for a LAMP stack to get your web server up and running quickly, a Minecraft server, and a WordPress blog, just to name a few. | [Quick set up with Rackspace Cloud Orchestration](/how-to/quick-set-up-with-rackspace-cloud-orchestration)
Managed Operations support level | ServiceNet | Managed Operations provides support beyond Managed Infrastructure, including direct assistance with resizes, snapshots, host machine issues, adding and removing servers, and managing IP addresses. To ensure <em><strong>Fanatical Support&reg;</strong></em>, Rackspace provides support for specific software and server configurations on Cloud Servers with Managed Operations support. | [Linux Spheres of Support for Dedicated and Managed Operations](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops)
ObjectRocket | ServiceNet | The ObjectRocket platform is built for scalability, speed, and safety. It provides fully managed instances of MongoDB and Redis in data centers across the globe. <br /><br /> RackConnect v3.0 is <strong>compatible</strong> with <strong>ObjectRocket Redis </strong>instances that have a ServiceNet IP address in the 10.188.0.0/15 range. If an instance has a ServiceNet IP address that is not in this range, contact ObjectRocket support. <br /><br /> RackConnect v3.0 is <strong>compatible</strong> with <strong>MonogoDB</strong>. | [ObjectRocket Getting Started Guide](https://docs.objectrocket.com/getting_started.html)

### RackConnect v3.0 compatibility with Rackspace dedicated network device offerings

The following table lists the dedicated network device offerings that are compatible with RackConnect v3.0.

Network device | Details
--- | ---
Cisco ASA Firewalls | [RackConnect network device comparison](/how-to/rackconnect-network-device-comparison)
Cisco ASA X Series Firewalls | [RackConnect network device comparison](/how-to/rackconnect-network-device-comparison)
Juniper SRX Series Firewalls | [RackConnect network device comparison](/how-to/rackconnect-network-device-comparison)
BIG-IP F5 Load Balancers | [Using dedicated load balancers with RackConnect](/how-to/using-dedicated-load-balancers-with-rackconnect-v20)
Brocade Load Balancer | [Using dedicated load balancers with RackConnect](/how-to/using-dedicated-load-balancers-with-rackconnect-v20)

### RackConnect v3.0 compatibility with Rackspace dedicated offerings

The following table lists the dedicated offerings that are compatible with RackConnect v3.0. Compatibility with dedicated offerings is based on network connectivity from these offerings to and from your RackConnect v3.0 cloud networks. The correct routes to allow this traffic can be set up by your Network Security team.

Network offering | Compatible | Details |
--- | --- | ---
Managed Colocation  | Network devices in a Managed Colocation environment are supported only if the network devices are managed by the Network Security team. Customer-managed network devices are not supported. | [Managed Colocation](https://www.rackspace.com/dedicated-servers/colocation)
Managed Storage | The Managed Storage offering is compatible only with dedicated servers in a RackConnect configured dedicated environment. The Managed Storage offering cannot be used directly with cloud servers. | [Managed Storage](https://www.rackspace.com/managed-hosting/data-storage)
Managed Virtualization | Yes | [Managed Virtualization](https://www.rackspace.com/cloud/private/managed_virtualization/)
Private Cloud | Yes | [Private Cloud](https://www.rackspace.com/cloud/private/)
