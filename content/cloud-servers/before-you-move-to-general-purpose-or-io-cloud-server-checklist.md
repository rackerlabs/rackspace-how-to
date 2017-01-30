---
permalink: before-you-move-to-general-purpose-or-io-cloud-server-checklist/
audit_date:
title: Before you move to General Purpose or I/O Cloud Server (checklist)
type: article
created_date: '2013-11-04'
created_by: David Hendler
last_modified_date: '2016-09-09'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

General Purpose and I/O-optimized Cloud Servers offer an increase in
drive and networking speed,but there are some factors to consider before
moving your current environment. This checklist provides information
that you need to consider to ensure that you are ready to move.

### Premigration considerations

General Purpose Cloud Servers cannot be resized, so ensuring that your
architecture is correct from the start is important. Best practices
include splitting your web and application servers from your database
server and putting them behind a load balancer. This split will enable
you to easily scale horizontally in the future without the need for
downtime or requiring DNS changes.

### Premigration actions

-   If you have a Cloud Server, you might be able to
    create an image to migrate to General Purpose Cloud Servers.
    - For a 512 MB server, create a 1 GB or larger General Purpose Cloud Server via image.
    - For a 1 GB server, create a 2 GB or larger General Purpose Cloud Server via image.
    - For a 2 GB or larger server, you cannot use an image to build a General Purpose Cloud Server.
-   Ensure that any automation you have set up allows for a 40 GB system drive.
-   Audit your current and future storage needs to determine how to best
    organize the data with the General Purpose Cloud
    Server configuration. You will have multiple disks instead of a
    single monolithic disk. Consider the following options:
    -   Use the system disk only.
    -   Use both the system and data disk.
    -   Create a single RAID 0 volume out of the multiple data disks on
        larger servers.
    -   Leverage Cloud Block Storage for portability.
-   If you use Cloud Backup, ensure that all of your data is backed up
    when you create your new General Purpose Cloud Server.
-   If you have disk monitoring set up, you must set up monitoring for
    your system disk and data disk or disks separately.
