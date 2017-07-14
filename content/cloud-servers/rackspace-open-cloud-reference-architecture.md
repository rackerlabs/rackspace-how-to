---
permalink: rackspace-open-cloud-reference-architecture/
audit_date: '2016-06-02'
title: Rackspace Open Cloud reference architecture
type: article
created_date: '2012-08-10'
created_by: Rae D. Cabello
last_modified_date: '2017-06-06'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article presents a variety of cloud architectural configurations that
you could use for your business or personal project.

### Basic cloud architecture

The basic cloud architecture is a starting point that you can build on for
future applications. Typically, this is the first step our customers take when moving an application to the cloud, yet it uses platform services like Cloud Databases and Cloud Files to replace dedicated database servers and expensive storage arrays.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/basic-cloud-configuration.svg %}" alt="Diagram detailing basic cloud configuration" />

1. **Public network**: Each cloud server has two networks, the public network and the service network. In a basic cloud configuration, the cloud server is accessible from the Internet over the public network.

2. [Rackspace Cloud Load Balancers](https://www.rackspace.com/cloud/load-balancing): A load balancer is used to distribute workloads among multiple back-end systems or services, based on the criteria that is defined as part of its configuration.

3. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/): The cloud server uses the service network to communicate with the other cloud servers and cloud databases. Bandwidth on the service network is free.

4. **Potential growth servers**: Additional cloud servers are used when additional resources are needed.

5. **Service network**: The service network is for communication between the web instance cloud server and cloud databases, as well as other cloud servers used for potential growth.

6. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/): Cloud databases with MySQL is an optimized, redundant platform.

7. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/): Static content can be served through Cloud Files and the Akamai CDN for global content delivery.

8. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the application to ensure that everything is working efficiently and properly.

### Tiered cloud architecture

The tiered architecture is the next step in configuring an application for the Open Cloud. This configuration enables you to scale each tier (web, app, caching, and database) horizontally as you grow. This example uses replicated database servers instead of the Cloud Databases platform, which allows for more customization. This configuration also shows the power of the asynchronous processing of tasks, which makes each tier more modular.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/tiered-cloud-arch.svg %}" alt="" />

1. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/):
Cloud load balancers have multiple balancing options, and support SSL
termination for secure sites.

2. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/): Cloud servers can be modular for secure sites.

3. **MySQL**: MySQL replication is important for redundancy and failover.

4. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/databases/): Static content can be served through Cloud Files and the Akamai CDN for global content delivery.

### Web application architecture

This architecture shows a typical web application configuration in the Open Cloud. In this architecture, the web servers use Cloud Block Storage for extra disk space. Load balancers are also used in multiple levels of the application, balancing not only web workloads but also application workloads.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/web-app-config.svg %}" alt="" />

1.  [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the infrastructure to ensure that everything is working efficiently and properly.

2. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/): Load balancers have multiple balancing options and support SSL termination for secure sites.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/): Cloud servers use Cloud Block Storage to serve web content for this application.

4. **Rackspace Cloud Load Balancers**: Load balancers can also balance on service networks for back-end connections.

5. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/): Cloud databases host MySQL as an optimized, redundant platform.

### Content management system architecture

Rackspace Support technicians might use this architecture for a content management system (CMS) such as Drupal. Typically, we configure the application to heavily use caching, with Varnish for some static content and Memcached for database query caching. This configuration also enables you to scale horizontally quickly for events or high traffic.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/content-management-arch.svg %}" alt="" />

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the infrastructure to ensure that everything is working efficiently and properly.

2. [Rackspace Cloud Load Balancer](http://www.rackspace.com/cloud/public/loadbalancers/): Load balancers have multiple balancing options, and support SSL termination for secure sites.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/): Cloud servers use Cloud Block Storage to serve web content for this application.

4. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/): Cloud databases with MySQL is an optimized, redundant platform.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/): Static content can be served through Rackspace Cloud Files and the Akamai CDN for global content delivery.

### Wordpress cloud architecture

The Rackspace Managed Cloud Servers team might use the following architecture to configure the Open Cloud for WordPress.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/wordpress-cloud-arch.svg %}" alt="" />

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the infrastructure to ensure that everything is working efficiently and properly.

2. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/):
Cloud load balancers have multiple balancing options, and support SSL
termination for secure sites.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/): Cloud servers use Cloud Block Storage to serve web content for this application.

4. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/): Cloud databases with MySQL is an optimized, redundant platform.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/): Static content can be served through Rackspace Cloud Files and the Akamai CDN for global content delivery.

6. **Memcached**: Memcached is used for MySQL queries, session data, or both.

### Reverse proxy cloud architecture

This architecture uses cloud servers acting as reverse proxies for specialized workloads. This architecture could be used for caching, SSL termination, or other use cases. It also displays a use case for Cloud networks, where you can create virtual private clouds for application servers, limiting their accessibility for better security.


<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/reverse-proxy-cloud-arch.svg %}" alt="" />

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the infrastructure to ensure that everything is working efficiently and properly.

2. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/):
Cloud load balancers have multiple balancing options, and support SSL
termination for secure sites.

3. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/):	Cloud servers can act as reverse proxies for caching or routing traffic.

4. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/): Cloud servers use Cloud Block Storage to serve web content for this application.

5. [Rackspace Cloud Networks](https://www.rackspace.com/cloud/networks): Cloud networks can be used to create a virtual private cloud, limiting traffic to and from secure servers.

### Basic RackConnect architecture

This architecture is similar to the CMS and web application architectures, but it uses dedicated hardware for part of the configuration where more customization or bare metal is required. Typically customers use bare metal servers for database workloads or parts of their application that have a high number of I/O operations. RackConnect configurations are also used for customers who require higher levels of PCI compliance.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/basic-rackconnect-config.svg %}" alt="" />

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the infrastructure to ensure that everything is working efficiently and properly.

2. [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect): RackConnect allows Rackspace to connect from a customer data center to a Rackspace data center through a site-to-site IPSec VPN.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/): Cloud servers use Cloud Block Storage to serve web content for this application.

4. [Dedicated Servers](https://www.rackspace.com/dedicated-servers/): This configuration uses dedicated servers for
high-performance custom MySQL.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/): Static content can be served through Rackspace Cloud Files and the Akamai CDN for global content delivery.

### Hybrid cloud architecture

This high-level overview shows the possibilities of mixing private and public clouds. This configuration is for customers who want to take advantage of cloud technology but might still need to maintain an in-house solution. Customers also use private clouds to have dedicated host machines, which eliminates the so-called "noisy neighbor" problem present with every multitenant public cloud hosting provider. The power of OpenStack enables customers to move workloads between their in-house private cloud and the Rackspace Open Cloud without having to change their application to suit a new API. Customers can link their in-house private cloud to a Rackspace hosted private cloud for the same purpose.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/hybrid-cloud-configuration.svg %}" alt="" />

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/): Cloud Monitoring watches the infrastructure to ensure that everything is working efficiently and properly.

2. [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect): RackConnect enables Rackspace to connect from a customer data center to a Rackspace data center through a site-to-site IPSec VPN.

3. [Rackspace Cloud, Private Edition](http://www.rackspace.com/cloud/private/): The Rackspace Cloud Private Edition team can provide support in a customer or partner data center.

4. [OpenStack Private Cloud](http://www.rackspace.com/cloud/private/): Customers can also use RackConnect. This will connect a Rackspace Hosted OpenStack Private Cloud to the Rackspace Public Cloud.

### Ecommerce architecture

This architecture can be coupled with the web application or RackConnect
architectures for ecommerce. This architecture also shows the power of our Cloud
Tools Marketplace--customers can sign up for partner services like
SendGrid for end-user email deliverability. This architecture also
takes advantage of a bare metal database server for PCI compliance
standards and to takes full advantage of computing resources.

<img src="{% asset_path cloud-servers/rackspace-open-cloud-reference-architecture/ecommerce-open-cloud.svg %}" alt="" />

1. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/): When a visitor loads a web page, cloud servers are used as web and application servers. A firewall and load balancer are also used.

2. [Rackspace Cloud Networks](https://www.rackspace.com/cloud/networks): Cloud servers can be segmented from each other by using Rackspace Cloud Networks.

3. [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect): Using RackConnect, cloud resources can be connected seamlessly to dedicated hardware, in this case for use as a database server.

4. [Mailgun](http://www.mailgun.com/): Customer email can be sent through **Mailgun**, a Rackspace Partner. Customers can also use a payment gateway to meet PCI requirements.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/): Static content can be served through Rackspace Cloud Files and the Akamai CDN for global content delivery.
