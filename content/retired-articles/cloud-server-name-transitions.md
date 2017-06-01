---
permalink: cloud-server-name-transitions/
audit_date:
title: Cloud server name transitions
type: article
created_date: '2014-10-28'
created_by: Thomas Duesing
last_modified_date: '2016-06-20'
last_modified_by: Stephanie Fillmon
---

Rackspace has recently changed the names of the flavors that you can
choose when creating cloud servers. The goal of this change is to
simplify flavor selection by aligning the flavor names with the intended
workloads. The old flavor names are officially deprecated but will still
be recognized in API commands for a time. The new names are the only
flavor names visible in the Cloud Control Panel.

The current flavor names relate to deprecated flavor names as follows:

-   **Standard** flavor class for *virtual* cloud servers was previously
    known as Standard (no change).
-   **General Purpose** flavor class for *virtual* cloud servers was
    previously known as Performance 1.
-   **I/O Optimized** flavor class for *virtual* cloud servers was
    previously known as Performance 2.
-   **OnMetal I/O** flavor class for *OnMetal* cloud servers was
    previously known as Performance 2.
-   **Compute Optimized** flavor class for *virtual* cloud servers had
    no previous name.
-   **OnMetal Compute** flavor class for *OnMetal* cloud servers had no
    previous name.
-   **Memory Optimized** flavor class for *virtual* cloud servers had no
    previous name.
-   **OnMetal Memory** flavor class for *virtual* cloud servers had no
    previous name.

The new flavor names reflect new functional differences. We now offer
servers that are optimized for memory, compute, and I/O. Additionally,
the General Purpose servers (which were previously Performance 1) can
have a larger system disk instead of using split system and data disks.

The different types of servers are part of the expected growth life
cycle of using cloud servers. That life cycle goes from general purpose
virtual servers to workload-optimized virtual servers to
workload-optimized OnMetal servers. For more information about this
cloud server life cycle, see the graphic on the [Cloud Servers](http://www.rackspace.com/cloud/servers/) product page.
