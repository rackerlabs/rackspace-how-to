---
permalink: /rackconnect-release-notes/
audit_date:
title: RackConnect release notes
type: article
created_date: '2012-09-14'
created_by: Jonathan Hogue
last_modified_date: '2017-01-18'
last_modified_by: Laura Santamaria
---

Following is a summary of features, updates, and changes for
RackConnect. Keep this page bookmarked for updates made periodically to
RackConnect.

### July 15, 2014

-   Added support for OnMetal servers.
-   RackConnect user passwords are now periodically changed.

### March 25, 2014

-   Added support for metadata value updates to move servers between
    load balancer pools.

### October 7, 2013

-   Added support for HKG region.

### August 20, 2013

-   Added support for F5 version 11.

### July 30, 2013

-   Added support for IAD region.

### April 9, 2013

-   Added support for ASA software versions later than 8.3.
-   Added support for ASA X series firewalls.

### January 15, 2013

-   Added support for Cloud Networks.
-   Automated quality control for each new RackConnect
    customer configuration. RackConnect will automatically create two
    cloud servers (via a test account which the customer will *not* be
    billed for) and perform several quality assurance checks before
    removing the servers and marking the configuration complete.
-   The [AutoNAT](/how-to/rackconnect-auto-nat-feature)
    feature is now available.

### November 19, 2012

-   Added support for Windows Server 2012.

### November 13, 2012

-   Changed the order of operations for cloud server builds for
    customers at the Managed Operations service level so that the server builds,
    RackConnect automation runs, and then managed cloud automation runs.
    Managed cloud customers who run their own post-build automation
    should trigger their automation to start based on the completion of
    the managed cloud automation rather than RackConnect.

### October 9, 2012

-   Network device configuration save and sync performance improvements.

### October 3, 2012

-   You will be notified when a cloud server is unprocessable because it was built in a region that does not match the region in which
    your dedicated environment is deployed.
-   You can now use the Cloud Servers API to query the RackConnect
    Automation Status of your Cloud Servers.

### August 13, 2012

-   Made performance improvements for F5 packet filter changes.

### August 1, 2012

-   Added support for Cloud Servers.

### July 02, 2012

-   Added customer API call to retrieve automation status.
-   Added customer API call to retrieve automation status details.
-   Added customer API call to retrieve gateway IP.

### May 08, 2012

-   Added network policies, which allow communication between Cloud
    accounts belonging to the same RackConnect configuration.
-   Improved overall automation performance.

### Known Issue: Pre-9/6 Windows Managed Operations Cloud Server Snapshots Failing RackConnect

**Description**: Windows Managed Operations Cloud Server Snapshots fail
RackConnect automation.

**Cause:** The agent is not able to correctly set the private IP when IPv6
is disabled, leading to an instance that does not have proper
connectivity and thus fails RackConnect automation.

**Affects:** Snapshots created from Managed Operations Windows Servers where the Cloud Server from which the image is based was spun up before 9/6/12.

**Workaround:** Re-enable IPv6 on the base image before creating snapshots.
See [http://support.microsoft.com/kb/929852](http://support.microsoft.com/kb/929852) for instructions.
