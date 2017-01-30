---
permalink: rackconnect-v20-compatibility/
audit_date:
title: RackConnect v2.0 compatibility
type: article
created_date: '2013-07-24'
created_by: Juan Perez
last_modified_date: '2016-01-13'
last_modified_by: Rose Contreras
product: RackConnect
product_url: rackconnect
---

**Applies to:** RackConnect v2.0

**Important:** These compatibility listings are general guidelines.
View the links provided or contact your Support Team for
further details and caveats.

### RackConnect compatibility with other Rackspace Cloud offerings

Product | Compatible | Details | Product information
--- | --- | --- | ---
Auto Scale | Yes | Automatically scale cloud servers with RackConnect to adjust to customer demand, including the ability to leverage F5 Load Balancer Pools. | <a href="https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#getting-started">Auto Scale Getting Started Guide</a> <br /> <br/> <a href="https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#developer-guide">Auto Scale Developer Guide</a>
Cloud Backup | Yes | Rackspace Cloud Backup is a file-based backup application that lets you choose which files and folders to backup from your cloud server. You can choose to restore your whole system with all of its folders and files, or individual files or folders from a given date, or restore to an entirely different server. | <a href="/how-to/cloud-backup">Cloud Backup support</a>
Cloud Block Storage | Yes | Rackspace Cloud Block Storage is a block-level storage solution that allows you to expand the storage capacity of your cloud servers. | <a href="/how-to/cloud-block-storage">Cloud Block Storage support</a>
Cloud Databases | Yes, with caveats | The Cloud Databases product is a stand-alone, API-based, relational database service built on OpenStack&reg; cloud that allows Rackspace customers to easily provision and manage multiple MySQL database instances. | <a href="/how-to/cloud-databases">Cloud Databases support</a>
Cloud Files | Yes | Cloud Files is an affordable, redundant, scalable, and dynamic storage service offering. The core storage system is designed to provide a safe, secure, automatically resizing and network accessible way to store data. | <a href="/how-to/cloud-files">Cloud Files support</a>
Cloud Load Balancers | Yes, with caveats; see linked article | Mission-critical web-based applications and workloads require high availability. Load balancing distributes workloads across two or more servers, network links, and other resources to maximize throughput, minimize response time and avoid overload. Cloud Load Balancers allows you to quickly load balance multiple servers for optimal resource utilization.<br /> <br /> <a href="/how-to/using-cloud-load-balancers-with-rackconnect">Using Cloud Load Balancers with RackConnect</a> | <a href="/how-to/cloud-load-balancers">Cloud Load Balancers support</a>
Cloud Monitoring | Yes | Using Rackspace Cloud Monitoring you can quickly create multiple monitors using predefined checks, such as PING, HTTPS, SMTP (and many more), to keep track of your cloud resources and receive instant notification when a resource needs your attention. | <a href="/how-to/creating-a-monitoring-check-using-the-cloud-control-panel">Creating a Monitoring Check Using the Cloud Control Panel</a>
Cloud Networks | Yes, with caveats; see linked article | Cloud Networks lets you create a virtual Layer 2 network, which gives you greater control and security when you deploy web applications. <br /> <br /> <a href="/how-to/rackconnect-v20-with-cloud-networks-faq">RackConnect with Cloud Networks FAQ</a> | <a href="/how-to/cloud-networks">Getting Started with Cloud Networks</a>
Managed Operations  | Yes | Rackspace Cloud Servers with Managed Operations extends our world-class managed services from our Managed Hosting offering to the Rackspace Cloud. This offering provides an additional level of support on cloud servers, which includes monitoring, operating system, and application infrastructure layer support. | <a href="/how-to/cloud-servers">Cloud Servers support</a>
OnMetal Cloud Servers | Yes | OnMetal Cloud Servers combine the consistent performance and economy of colocation with the elasticity of the cloud. | <a href="/how-to/using-onmetal-cloud-servers-with-rackconnect-v20">Using OnMetal Cloud Servers with RackConnect

### RackConnect compatibility with dedicated network devices

Network device | Compatible | Details
--- | --- | ---
Cisco ASA Firewalls | Yes | <a href="/how-to/rackconnect-network-device-comparison">RackConnect network device comparison</a>
Cisco ASA X Series Firewalls | Yes | No applicable
BIG-IP F5 Load Balancers | Yes | <a href="/how-to/using-dedicated-load-balancers-with-rackconnect-v20">Using Dedicated Load Balancers with RackConnect v2.0</a>
Brocade Load Balancers | Yes, with caveats; see linked article | <a href="/how-to/using-dedicated-load-balancers-with-rackconnect-v20">Using Dedicated Load Balancers with RackConnect v2.0</a>

### RackConnect compatibility with dedicated offerings

Network device | Compatible | Details
--- | --- | ---
Managed Colocation | Yes | <a href="https://www.rackspace.com/managed_hosting/managed_colocation/">Managed Colocation</a>
Managed Storage | Yes<sup>1</sup> | <a href="https://www.rackspace.com/managed_hosting/services/storage/">Managed Storage</a>
Managed Virtualization | Yes | <a href="https://www.rackspace.com/cloud/private/managed_virtualization/">Managed Virtualization</a>
Private Cloud | Yes | <a href="https://www.rackspace.com/cloud/private/">Private Cloud</a>

<sup>1</sup> The Managed Storage offering is compatible with dedicated
servers only in a RackConnect configured dedicated environment. The Managed
Storage offering cannot be used directly with cloud servers.
