---
permalink: apache-hadoop-on-rackspace-private-cloud/
audit_date: '2018-07-27'
title: Using Apache Hadoop on Rackspace Private Cloud
type: article
created_date: '2013-01-24'
created_by: Alyssa Hurtgen
last_modified_date: '2018-07-27'
last_modified_by: Cat Lookabaugh
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

### Overview

Rackspace Private Cloud Software allows businesses to quickly and
seamlessly implement a stable and reliable Apache Hadoop cluster quickly
and simply in an open cloud solution.

### Apache Hadoop and the Cloud

Two major trends in the technology zeitgeist include Cloud Computing and
Big Data, but installing and working with this combination is not without challenges. 
Big Data technologies such as Hadoop are taxing on servers, storage, and network
requirements, while the cloud promises elasticity and agility. How can
Hadoop take advantage of this framework, and how can the cloud meet the
needs of a demanding Hadoop cluster?

This article investigates the synergies and challenges presented by Apache
Hadoop and its role in Rackspace Private Cloud powered by OpenStack.


### OpenStack

OpenStack is an open cloud standard and implementation that can be used
to build both public and private clouds. A private cloud is an on-demand
and scalable server environment reserved for your data alone and can be
hosted in a private, a Rackspace or a third party data center.
Private clouds are intended for companies who want to host the servers
themselves for many reasons, including security and compliance requirements.

The attraction of using a free and open-source cloud operating system,
without the worry of vendor lock-in, has already led several companies to
power their public and private clouds with OpenStack.

### Rackspace Private Cloud Software Powered by OpenStack

[Rackspace Private Cloud
Software](http://www.rackspace.com/cloud/private/) (RPCS) is a free and
open-source software that can be used to launch a cloud powered by
OpenStack. RPCS provides the same
cloud platform that powers Rackspace's public cloud, the largest open
cloud deployment in the world.

### Apache Hadoop

Born out of the large Internet properties such as Yahoo, Hadoop is an
open-source project that provides a platform to store and process
massive amounts of data, including both structured, complex data and unstructured
data. A set of Apache projects such as Hive, Pig, HBase,
HCatalog, and Ambari have grown up around Hadoop to provide tools to
manipulate data and to manage and monitor this complex, clustered
environment. As it has grown and added key enterprise features, its
popularity has exploded because of its open source nature and the
fact that it can cost-effectively scale across clusters of commodity
hardware, while delivering high availability and reliability.


### Challenges of using Hadoop in a virtual machine environment

Hadoop's architecture makes certain assumptions about the underlying
infrastructure. Hadoop is resilient and is architected to accommodate
and rebalance stored data and processing as nodes (servers) are added or
removed to and from the environment. This might sound like a perfect fit for
the elasticity of the cloud. However, the current scheduling and
recovery mechanism found in Hadoop is built on a more static and
predictable infrastructure. It makes it difficult for Hadoop to take
advantage of the rapid dynamic nature of the cloud where machines can
join or leave from the cluster depending on a particular workload. There
are three main challenges with Hadoop in a virtualized environment:

-   Virtual disks add IO overhead.
-   Virtual machines can be allocated on the same server, breaking
    Hadoop's redundancy expectations.
-   Hadoop assumes a static infrastructure - machines can reboot or go
    away but generally recover. The correct approach to deal with a bad
    virtual machine in cloud is to provision a new one.

### Benefits of using Apache Hadoop with Rackspace Private Cloud

Although Hadoop was originally architected for the world of big-iron,
the choice of virtual Hadoop is a very appealing one for several
reasons. With the increasing adoption of cloud, it's very likely that
your data is already stored in the cloud, or will be soon. In that case,
doing the analysis on the data close to where it sits is extremely
cost-effective. With Hadoop as part of the Rackspace Private Cloud, 
you can spin up a cluster in minutes to extend your
current environment without having to move data from internal
resources to the cloud. 

The following figure shows an example of the OpenStack cloud architecture 
deployed by the Rackspace Cloud Private Cloud software. Add the 
Hadoop instances on the Compute node as described in the Hadoop installation 
and set up instructions. 

<img src="{% asset_path rpc-openstack/apache-hadoop-on-rackspace-private-cloud/masscompute-web.jpg %}" width="600" height="398" />


While performance of a Hadoop cluster might be superior with dedicated
hardware, the agility of running it in the cloud on demand can trump
some of the limitations for some workloads.

In addition to improving agility, running Hadoop in an OpenStack environment provides the following 
additional benefits: 

-   One-click setup
    and rapid deployment. You can go from bare-metal to an open cloud
    with Hadoop running on it within a matter of a couple of hours.
-   Ability to reuse physical infrastructure.
-   Multi-purpose cloud infrastructure that you can use for
    Hadoop and for other services like hosting your web application or
    databases within the same environment.
-   Shrink and expand clusters on demand, by adding or removing nodes from a
    cluster or by resizing Virtual Machines (VM).
-   Ability to clone a VM and boot new VMs off of snapshots.
-   OpenStack provides persistent local disks for Hadoop to use as
    its permanent storage.
-   When the Hadoop cluster is idle, some machines can be decommissioned
    and reused for other purposes.

As Hadoop and the cloud grow together, the benefits of the combined
offer grow stronger. For instance, there is ongoing work in
the Apache Hadoop community to make Hadoop virtualization-aware which
ensures optimal data placement and provides support for failures in a
cloud environment. The future looks even brighter because this enables a
truly elastic and reliable Hadoop Cluster. This work is all being
completed in the open-source community.

### Hortonworks Data Platform for Hadoop

Hortonworks Data Platform (HDP) is the only 100% open-source data
management platform for Apache Hadoop. Built and packaged by the core
architects, builders, and operators of Hadoop, HDP includes all of the
necessary components to manage a cluster at scale and uncover business
insights from existing and new big data sources.  Not only is it the
most stable and reliable Hadoop distribution, but it is also the most
close to the open-source trunk available and is distributed as 100% 
open-source with no holdbacks or proprietary components. It is perfect for
OpenStack.

### Hadoop software installation and set up

Rackspace Private Cloud makes it easy to create a production-ready cloud powered by
OpenStack within a few hours. After you have your Rackspace Private
Cloud ready, you can provision Hadoop in the cluster.

There several ways to install Hadoop, but most of them are geared
to installing in a dedicated environment. You can try using 
of the existing options like Ambari or manually install
the RPMs. We chose to write our own Saltstack deployment
for OpenStack to make Hadoop installation easier for public or private
clouds powered by OpenStack and even bare metal. To use the cookbooks and plugins, 
see the following installation and user documentation. 

-   [hdp-heat-template](https://github.com/rcbops/RPC-Heat-HDP)
-   [HDP setup](https://github.com/rcbops/hadoop-formula)


### Using Heat to manage nodes and clusters

OpenStack Heat is an orchestration engine that launches instances, connects
them to networks, and kicks off Saltstack for software installation and 
configuration. You can launch a configuration with the following command:

```heat stack-create hadoop-stack -f hadoop-stack.yaml \
  -e env.yaml -P flavor=m1.large;floating-network-id=<NET_ID>; \
  datanodes-count=<COUNT>;keyname=<KEYNAME>;image=<IMAGE_ID>
  ```

#### Run a map-reduce job

Log in to your master node and launch a job by using the following instructions:

    $ cd /usr/lib/hadoop
    $ hadoop jar hadoop-*-examples.jar pi 10 1000000

Track job progress by using the JobTracker's web UI at http://master\_node:50030/.

### Conclusion

Using Hadoop with OpenStack is a compelling choice that
brings benefits like agility, automation, ease of deployment, and
multi-tenancy and security through isolation of resources. Combining the
Rackspace Private Cloud and OpenStack with Hadoop and Hortonworks
creates an enterprise-ready Hadoop solution that can be deployed in
minutes into the open cloud.
