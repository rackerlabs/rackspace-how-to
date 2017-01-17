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
to lay out the requirements, benefits, best practices, and potential
complications along with a brief discussion of some of the reasons you
may require or desire a high-availability cluster to help you decide if
this is the right decision for your business.

#### Requirements

As previously mentioned, proper implementation of a high-availability
cluster has requirements that are atypical of most servers at
Rackspace. 

* Operating Systems
..* Red Hat Linux version 5 is supported for legacy systems *only*. No new clusters will be deployed with RHEL 5.
..* Red Hat Linux version 6 is supported for new builds.
..* Red Hat Linux version 7 is not currently supported, but we are working diligently to add this offering.
..* Other Linux operation systems (e.g. Ubuntu, Debian) are *not* supported.
* Hardware
..* 




