---
permalink: private-cloud-is-rad-how-to-leverage-private-cloud-for-rapid-application-development/
audit_date:
title: 'Private Cloud is RAD: How to Leverage Private Cloud for Rapid Application Development'
type: article
created_date: '2011-03-27'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Rapid Application Development (RAD) refers to a type of software
development methodology that uses minimal planning in favor of rapid
prototyping. One of the many challenges of RAD is the constant demand
for rapid deployment of stable computing platforms for development and
testing. A pronounced reliance on prototyping is characteristic of RAD
methodologies. For this reason, the advanced features of [private cloud](http://www.rackspace.com/cloud/private/) computing can offer
significant advantages for developers employing RAD. This article will
discuss how private cloud computing can increase developer efficiency in creating rapidly
deployed, stable systems that include advanced features not available in
traditional dedicated systems.

In a traditional dedicated hardware model, new hardware must be
provisioned whenever new prototypes are created or new projects are
initiated. This can result in weeks of planning and research that put
additional pressure on stretched IT project budgets and potentially
threaten delivery timelines. By implementing a private cloud, computing
resources are ready for deployment before projects are started. When
projects are completed, the resources can be re-used quickly and easily.
The advanced features of private cloud computing also can
provide additional productivity gains that are well suited for RAD.

One of the core features of private cloud computing is the
capacity to create stable and predictable virtual machines (VM). A RAD
developer can configure a VM with all the necessary tools, applications,
and OS tweaks necessary for a stable platform for development or
testing. When a VM system image is created, it can be cloned many times
over with the provision of many VMs, which can significantly reduce the
time required to provision new systems for development or testing.
Pre-built images can allow development tasks that would require weeks of
labor in a traditional dedicated hardware environment to be completed
much more quickly.

Stable systems with a predictable and consistent configuration are
important to successful regression testing. As described above, VM
system images can provide technicians with a predictable starting point
for testing. Using advanced hypervisors, technicians can create
snapshots of virtual machines that can be employed to simplify system
testing and reduce related risks. Changes can be tested on the virtual
machine, and these changes can be undone as needed by initiating a
rollback. Snapshots and rollbacks enable faster regression testing and
allow virtual machines to be reset to a known state with fewer steps.

An optimal environment would include the following components:

-   Hypervisors - The physical servers that run the various virtual
    machines under hypervisor control.
-   Fiber SAN Network - The Fiber Channel Storage Array Network that is
    the shared storage component where the virtual machine image files
    are stored.
-   Firewall - Firewalls are an important security requirement, even in private cloud.

Using the configuration above, base VM images can be created in the
hypervisors and stored on the Fiber SAN. When new projects are
initiated, the base images can be quickly deployed to provide a rapid,
stable environment. The productivity gains achieved by using private cloud computing can be
expected to contribute to faster project startup, reduced development
time, and optimized use of resources. The ultimate result is likely to
be happier customers.
