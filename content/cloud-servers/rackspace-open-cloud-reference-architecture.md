---
node_id: 1945
title: Rackspace Open Cloud Reference Architecture
type: article
created_date: '2012-08-10'
created_by: Rae D. Cabello
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The following article presents a variety of architectural setups that
could potentially serve your business or personal project(s).

### Basic Cloud Architecture

This is a basic cloud architecture - a starting point to build on for
future applications. Every journey starts with a single step. Typically,
this is the first step our customers take when moving an application to
the cloud, yet already uses platform services like Cloud Databases and
Cloud Files to replace dedicated hardware like beefy dedicated database
servers and expensive storage arrays.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/basic%20cloud%20configuration.png)

1. **Public Network** - Each **Rackspace Cloud Server** has two networks
. Here, the Cloud Server is accessible from the Internet over the Public
network.

2. **Service Network** - The Rackspace Cloud Server uses the Service
Network to communicate with other Cloud Servers and Rackspace Cloud
Databases. Bandwidth on the Service Network is free.

3. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/) - The
Rackspace Cloud Server used the Service Network to communicate to the
other Cloud Servers and Rackspace Cloud Databases. Bandwidth on the
Service Network is free.

4. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace Cloud Monitoring watches the application to ensure
everything is working efficiently and properly.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/) - Static
content can be served through Rackspace Cloud Files and the Akamai
CDN for global content delivery.</span>

6. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/) - Rackspace Cloud Databases will host MySQL is a optimized, redundant platform.

### Tiered Cloud Configuration

The tiered architecture is the next step in configuring an application
for the Open Cloud. This configuration allows you to scale each tier
(Web, App, Caching, Database) horizontally as you grow. In this example,
we are using replicated database servers instead of the Cloud Database
platform which allows for more customization. This configuration also
shows the power of the asynchronous processing of tasks - basically
making each tier that much more modular.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/six.png)

1. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/) - Rackspace
Cloud Load Balancers have multiple balancing options, and support SSL
termination for secure sites.

2. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/) - Rackspace
Cloud Servers can be a modular for secure sites.

3. **MySQL** - **MySQL** replication is important for redundancy and
failover.

4. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/databases/) - Static
content can be served through Rackspace Cloud Files and the Akamai
CDN for global content delivery.

### Web Application Configuration

This is a typical web application configuration in the Open Cloud. In
this architecture you can see the web servers utilizing Cloud Block
Storage for extra disk space. Cloud Load Balancers is also used in
multiple levels of the application, balancing not only web workloads but
application workloads as well.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/10_0.png)

1.  [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace
Cloud Monitoring watches the infrastructure to make sure everything is
working efficiently and properly.

2. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/) - Rackspace
Cloud Load Balancers have multiple balancing options, and support SSL
termination for secure sites.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/) - Rackspace
Cloud Servers utilizing Cloud Block Storage serve web content for this
application.

4. **Rackspace Cloud Load Balancers**- Rackspace Cloud Balancers can
also balance on Service Networks for back end connections.

5. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/) -
 Rackspace Cloud Databases will host MySQL is a optimized, redundant
platform.

### Content Management System Architecture

This architecture is how Rackspace Fanatical Support technicians would
architect a content management system such as Drupal. Typically, we try
to configure the application to heavily utilize caching, both with
Varnish for some static content and Memcached for database query
caching. This configuration also allows you to scale horizontally
quickly for events or high traffic.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/two_0.png)

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace
Cloud Monitoring watches the infrastructure to make sure everything is
working efficiently and properly.

2. [Rackspace Cloud Load Balancer](http://www.rackspace.com/cloud/public/loadbalancers/) - Rackspace
Cloud Load Balancers have multiple balancing options, and support SSL
termination for secure sites.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/) - Rackspace
Cloud Servers utilizing Cloud Block Storage serve web content for this
application.

4. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/) -
 Rackspace Cloud Databases will host MySQL is a optimized, redundant
platform.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/) - Static content
can be served through Rackspace Cloud Files and the Akamai CDN for
global content delivery.

### Wordpress Cloud Architecture

Following is an example of the way our Managed Cloud Servers team could
potentially configure the Open Cloud for WordPress.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/7.png)

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace
Cloud Monitoring watches the infrastructure to make sure everything is
working efficiently and properly.

2. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/) - Rackspace
Cloud Load Balancers have multiple balancing options, and support SSL
termination for secure sites.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/) - Rackspace
Cloud Servers utilizing Cloud Block Storage serve web content for this
application.

4. [Rackspace Cloud Databases](http://www.rackspace.com/cloud/public/databases/) -
 Rackspace Cloud Databases will host MySQL is a optimized, redundant
platform.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/) - Static content
can be served through Rackspace Cloud Files and the Akamai CDN for
global content delivery.

6. **Memcached** - Memcached is used for MySQL query and/or session
data.

### Reverse Proxy Cloud Architecture

This architecture uses Cloud Servers acting as reverse proxies for
specialized workloads. This could be used for caching, SSL termination,
or other use cases. This architecture also displays a use case for Cloud
Networks, where you can create virtual private clouds for application
servers limiting their accessibility for better security.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/eight.png)

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace
Cloud Monitoring watches the infrastructure to make sure everything is
working efficiently and properly.

2. [Rackspace Cloud Load Balancers](http://www.rackspace.com/cloud/public/loadbalancers/) - Rackspace
Cloud Load Balancers have multiple balancing options, and support SSL
termination for secure sites.

3. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/) - Rackspace
Cloud Servers can act as Reverse Proxies for caching or routing
traffic.

4. [Cloud Block Storage](https://www.rackspace.com/cloud/block-storage) - Rackspace Cloud Servers utilizing Cloud
Block Storage serve web content for this application.

5. [Rackspace Cloud Networks](https://www.rackspace.com/cloud/networks) - Rackspace Cloud Networks can be used
to create a virtual private cloud - limiting traffic to and from secure
servers.

### Basic RackConnect Configuration

This architecture goes hand in hand with the CMS and Web Application
architectures, but uses dedicated hardware for part of the configuration
where more customization or bare metal is required. Typically our
customers use bare metal servers for database workloads or parts of
their application that have a high number of I/O operations. RackConnect
configurations are also utilized for customers that  require higher
levels of PCI compliance.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/five.png)

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace
Cloud Monitoring watches the infrastructure to make sure everything is
working efficiently and properly.

2. [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect) - RackConnect allows Rackspace to connect from a
customer datacenter to a Rackspace datacenter through a Site-to-Site
IPSec VPN.

3. [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/) - Rackspace
Cloud Servers utilizing Cloud Block Storage serve web content for this
application.

4. **Dedicated Servers** - This configuration uses Dedicated Servers for
high performance custom MySQL.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/) - Static content
can be served through Rackspace Cloud Files and the Akamai CDN for
global content delivery.

### Hybrid Cloud Configuration

This is a high level overview of the possibilities of mixing private
clouds and public cloud. This configuration is for customers that want
to take advantage of cloud technology but may still need to maintain an
in-house solution. Customers also use private clouds so they have
dedicated host machines - eliminating the so-called "noisy neighbor"
problem present with every multi-tenant public cloud hosting provider.
The power of OpenStack allows customers to move workloads between their
in-house private cloud and the Rackspace Open Cloud without having to
change their application to suit a new API. This also shows that
customers can link their in-house private cloud to a Rackspace hosted
private cloud for the same purpose.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/four.png)

1. [Rackspace Cloud Monitoring](http://www.rackspace.com/cloud/public/monitoring/) - Rackspace
Cloud Monitoring watches the infrastructure to make sure everything is
working efficiently and properly.

2. [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect) - RackConnect allows Rackspace to connect from a
customer datacenter to a Rackspace datacenter through a Site-to-Site
IPSec VPN.

3. [Rackspace Cloud: Private Edition](http://www.rackspace.com/cloud/private/) - The Rackspace
Cloud Private Edition team can provide Fanatical Support in a customer
or partner datacenter.

4. [OpenStack Private Cloud](http://www.rackspace.com/cloud/private/) - Customers can also
use RackConnect. This will connect a Rackspace Hosted Open Stack Private
Cloud to the Rackspace Public Cloud.

### E-Commerce Use Case

This use case can be coupled with the Web Application or RackConnect
Architectures for E-Commerce. This also shows the power of our Cloud
Tools Marketplace - customers can sign up for partner services like
SendGrid for end user email deliverability. This configuration also
takes advantage of a bare metal database server for PCI compliance
standards and to take full advantage of computing resources.

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/mailgun.png)

1. [Rackspace Cloud Servers](http://www.rackspace.com/cloud/public/servers/) - When a
visitor loads a webpage, Rackspace Cloud Server**s** are used as web and
application servers. A Firewall and Load Balancer are utilized are
here.

2. [Rackspace Cloud Networks](https://www.rackspace.com/cloud/networks) - The Rackspace Cloud Servers can
segmented from each other using Rackspace Cloud Networks.

3. [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect) - Using RackConnect, cloud resources can be connected
seamlessly to dedicated hardware, in this case for use as a database
server.

4. **Mailgun** - Customer email can be sent through **Mailgun**,
Rackspace subsidiary. Customers can also use a payment gateway to meet
PCI requirments.

5. [Rackspace Cloud Files](http://www.rackspace.com/cloud/public/files/) - Static content
can be served through Rackspace Cloud Files and the Akamai CDN for
global content delivery.
