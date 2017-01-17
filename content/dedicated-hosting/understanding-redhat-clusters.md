---
permalink: understanding-redhat-clusters/
audit_date: '2017-01-17'
title: Dedicated Hosting FAQ
type: product
created_date: '2017-01-17'
created_by: Alan Hicks
last_modified_date: '2017-01-17'
last_modified_by: Alan Hicks
product: Dedicated Hosting
product_url: dedicated-hosting
---

### Overview

Rackspace supports high-availability linux clustering in our dedicated
environment. High-availability clusters offer the most robust environment
for your critical services by eliminating many single points of
failure. They are also valued for their ability to keep services online
during crucial maintenances. While both useful and beneficial, clusters
present unique requirements to implement and support them. Here we hope
to lay out the requirements, features, best practices, and potential
complications along with a brief discussion of some of the reasons you
may require or desire a high-availability cluster to help you decide if
this is the right decision for your business.

Some of the services we most commonly see implemented in clusters are:

- MySQL (including MariaDB and Percona)
- NFS
- Redis
- Oracle

### Requirements

As previously mentioned, proper implementation of a high-availability
cluster has requirements that are atypical of most servers at
Rackspace. Many of these requirements eliminate single points of failure
that are indirectly related to an actual server failure.

- Operating Systems
    - Red Hat Linux version 5 is supported for legacy systems **only**. No new clusters will be deployed with RHEL 5.
    - Red Hat Linux version 6 is supported for new builds.
    - Red Hat Linux version 7 is not currently supported, but we are working diligently to add this offering.
    - Other Linux operation systems (e.g. Ubuntu, Debian) are **not** supported.
    - Customer provided operating systems (even those mentioned above as supported) are **not** supported
- Hardware
    - Cloud servers are **not** supported.
    - New and legacy deployments supported on Dell R710, Dell R720, and HP GL380 servers
    - Dell 2900 series servers are **not** supported
- Shared Storage
    - Rackspace supports shared storage through our SAN and NAS offerings
    - iSCSI and NFS storage solutions are also supported
    - Rackspace highly recommends dedicated SAN or shared SAN for their performance benefits and robust nature

### Features

High availability clusters are usually desired for their ability to
keep crucial services such as databases and file shares online and
active in the event of unexpected catastrophic server failures. When
one member experiences a failure unique to itself, resources and
services homed to that member at the time of the failure migrate
automatically to another member.

Another facet of these clusters that rarely receives the attention it
deserves is the ability to take cluster members offline for maintenance
procedures without suffering a service outage. This enables maintenance
work to be performed during business hours without an interruption to
your core business activity. This is beloved by systems administrators
who are tired of waking up at 3 a.m. to perform some simple maintenance
that requires bringing a server offline. While Rackspace offers 24x7
support, many of our customers work regular 9-5 hours. HA clusters give
them the option to perform this type of operation during those regular
business hours without negatively impacting their customers.

### High-Availability Cabinets

In addition to making the servers themselves redundant, most of our
customers chose to place their clusters into our high-availability
cabinets. Doing so eliminates many other single points of failure by
adding the following features:

- Redundant Switches
    - Bonded network interfaces on the servers are connected to
      different switches, ensuring that a single switch failure
      does not break network access to the cluster
- Redundant Firewalls
    - By placing your cluster behind our redundant firewalls, firewall
      maintenance or failure need not take your service offline.
- Redundant Power Circuits
    - All of our supported servers have redundant power supplies. By
      choosing our HA cabinet offering, these power supplies are
      connected to separate circuits, ensuring that the failure of a
      single electrical circuit need not cause an outage on your
      cluster.

### Fencing Broken Servers

Proper fencing is a requirement for a well-implemented HA cluster.
Fencing allows a working server to terminate a non-functional server,
forcing it to release its resources in the process. Fencing is
sometimes refered to as STONITH (Shoot The Other Node In The Head).

At Rackspace, fencing is handled by the servers' built-in out-of-bound
controller. On Dell devices, this is the DRAC module. HP servers use
their iLO module. As Dells are still the most prevalent servers at
Rackspace, we will refer to these devices as DRACs. Just keep in mind
that the actual controller module may be something different.

The DRAC is an out-of-bound controller that allows administrators to
power servers on, power them off, or connect to the console over the
Internet, without logging into the server's operating system. Indeed,
an administrator can connect to the DRAC to perform operations even
when the server is shutdown or in a crashed state. Since we cannot rely
upon our ability to login to a failed cluster member, the DRAC is an
ideal platform for fencing.






chosen to use iLO components as fencing device
