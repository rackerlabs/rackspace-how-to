---
permalink: apache-hadoop-on-rackspace-private-cloud/
audit_date:
title: Using Apache Hadoop on Rackspace Private Cloud
type: article
created_date: '2013-01-24'
created_by: Alyssa Hurtgen
last_modified_date: '2013-04-12'
last_modified_by: Jered Heeschen
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

### Overview

Rackspace Private Cloud Software allows businesses to quickly and
seamlessly implement a stable and reliable Apache Hadoop cluster quickly
and simply in an open cloud solution.

### Apache Hadoop and the Cloud

Two major trends in the technology zeitgeist include Cloud Computing and
Big Data. It now makes sense to look at using them together.
However, installing and working with this combination is not without challenges. 
Big Data technologies such as Hadoop are taxing on servers, storage and network
requirements, while the cloud promises elasticity and agility. How can
Hadoop take advantage of this framework and how can the cloud meet the
needs of a demanding Hadoop cluster?

This paper investigates the synergies and challenges presented by Apache
Hadoop and its role in Rackspace Private Cloud powered by OpenStack.


### OpenStack

OpenStack is an open cloud standard and implementation that can be used
to build both public and private clouds. A private cloud is an on-demand
and scalable server environment reserved for your data alone, whether
you host it in your datacenter, Rackspace's or any third party's.
Private cloud is intended for companies who want to host the servers
themselves for security and compliancy requirements and any other
reasons they may have.

The attraction of using a free and open source cloud operating system
without the worry of vendor lock-in has already led several companies to
power their public and private clouds with OpenStack.


### Rackspace Private Cloud Software Powered by OpenStack

[Rackspace Private Cloud
Software](http://www.rackspace.com/cloud/private/) (RPCS) is a free and
open source software that can be utilized to launch a cloud powered by
OpenStack. RPCS provides the same
cloud platform that powers Rackspace's public cloud, the largest open
cloud deployment in the world.

### Apache Hadoop

Born out of the large Internet properties such as Yahoo, Hadoop is an
open source project that provides a platform to store and process
massive amounts of data, including structured and complex, unstructured
data. There are also a set of Apache projects such as Hive, Pig, HBase,
HCatalog and Ambari that have grown up around Hadoop to provide tools to
manipulate data and to manage and monitor this complex clustered
environment. As it has grown and added key enterprise features, its
popularity has exploded. This is due to its open source nature and the
fact that it can cost-effectively scale across clusters of commodity
hardware, while delivering high availability and reliability.


### Challenges of using Hadoop in a virtual machine environment

Hadoop's architecture makes certain assumptions about the underlying
infrastructure. Hadoop is resilient and is architected to accommodate
and rebalance stored data and processing as nodes (servers) are added or
removed to and from the environment. This might sound a perfect fit for
the elasticity of the cloud; however, the current scheduling and
recovery mechanism found in Hadoop is built on a more static and
predictable infrastructure. It makes it difficult for Hadoop to take
advantage of the rapid dynamic nature of the cloud where machines can
join or leave from the cluster depending on a particular workload. There
are three main challenges with Hadoop in a virtualized environment:

-   Virtual disks will add IO overhead.
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
deployed by the Rackspace Cloud Private Cloud software. You add the 
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
-   Multi-purpose cloud infrastructure, that you can use not just for
    Hadoop but for other services like hosting your web application, or
    databases within the same environment.
-   Shrink and expand cluster on demand, by adding/removing nodes from a
    cluster or resizing VMs.
-   Ability to clone a VM and boot new VMs off of snapshots.
-   OpenStack can provide persistent local disks for Hadoop to use as
    its permanent storage.
-   When the Hadoop cluster is idle, some machines can be decommissioned
    and reused for other purposes.

As Hadoop and the cloud grow together, the benefits of the combined
offer will only grow stronger. For instance, there is ongoing work in
the Apache Hadoop community to make Hadoop virtualization-aware which
will ensure optimal data placement and provide support for failures in a
cloud environment. The future looks even brighter as this will enable a
truly elastic and reliable Hadoop Cluster. This work is all being
completed in the open source community.

### Hortonworks Data Platform for Hadoop

Rackspace has partnered with Hortonworks to bring an enterprise-ready,
100% open source Hadoop platform to Rackspace Private Cloud powered by
OpenStack.

OpenStack was created as a collaborative software project designed to
create freely available code, badly needed standards, and common ground
for the benefit of both cloud providers and cloud customers. In this
environment, Hortonworks Data Platform (HDP) just makes sense.It is 100%
open source and is freely available; standards based and better yet open
to integrate with the ecosystem and other stack components. More
importantly, core Hadoop is compute and storage and HDP provides the
most stable and reliable distribution for this.

Hortonworks Data Platform (HDP) is the only 100% open source data
management platform for Apache Hadoop. Built and packaged by the core
architects, builders and operators of Hadoop, HDP includes all of the
necessary components to manage a cluster at scale and uncover business
insights from existing and new big data sources.  Not only is it the
most stable and reliable Hadoop distribution, but it is also the most
close to the open source trunk available and is distributed as 100% open
source with no holdbacks or proprietary components. It is perfect for
OpenStack.

### Hadoop software installation and set up

Rackspace Private Cloud makes it easy to create a production-ready cloud powered by
OpenStack within a few of hours. Once you have your Rackspace Private
Cloud ready, you can provision Hadoop in the cluster.

There several ways to install Hadoop, but most of them are geared
to installing in a dedicated environment. You can try using 
of the existing options like Apache Whirr and Ambari or manually install
the RPMs. We chose to write our own Chef Cookbooks and a Knife plugin
for OpenStack to make Hadoop installation easier for public or private
clouds powered by OpenStack and even bare metal. To use the cookbooks and plugin, 
see the following installation and user documentation. 

-   [hdp-cookbooks](https://github.com/rackerlabs/hdp-cookbooks)
-   [knife-alamo](https://github.com/rackerlabs/knife-alamo)


### Using the knife plugin to manage nodes and clusters

After you install the Chef cookbooks on a chef-server, users can run the 
knife-alamo plugin from a workstation to interact with the
private cloud and to create both master and data Hadoop nodes. 

#### Create master and data Hadoop nodes

From the work station, complete the following set up procedure:


1\. To create a Hadoop NameNode, run the following command:

       $ knife alamo server create --name hadoopmaster --image fc63cb81-aca2-47dd-896b-a7a2bf4a041a --flavor 1 --chefenv hdp

2\. To create a Hadoop DataNode, run the following command:

       $ knife alamo server create --name hadoopworker8 --image 51f0b7ff-0326-4092-8568-30699e34da87 --flavor 2 --chefenv hdp --runlist 'recipe[chef-client],role[hadoop-worker]'

The create datanode command, performs the following operations:

- Spins up an instance of flavor size 2 
- Installs the chef-client.
- Adds the role of Hadoop-worker to the chef-client.


#### Run the chef-client

To run the chef-client on demand for the instance, run the following command:

       $ knife alamo server chefclient 51f0b7ff-0326-4092-8568-30699e34da87

#### Run a map-reduce job

Login to your master node and launch a job:

    $ cd /usr/lib/hadoop
    $ hadoop jar hadoop-*-examples.jar pi 10 1000000

Job progress can be tracked by using the JobTracker's web UI at
http://master\_node:50030/

#### Delete a node

After you finish using a cluster, run the delete command to remove each 
of the instance on the cluster. 

    $ knife alamo server delete 51f0b7ff-0326-4092-8568-30699e34da87

After resources are released, they can be instantly provisioned for other
purposes.

### Conclusion

Using Hadoop with OpenStack is a compelling choice that
brings benefits like agility, automation, ease of deployment, and
multi-tenancy and security through isolation of resources. Combining the
Rackspace Private Cloud and OpenStack with Hadoop and Hortonworks
creates an enterprise-ready Hadoop solution that can be deployed in
minutes into the open cloud.

