---
permalink: hidden-base-images/
audit_date:
title: Hidden Base Images
type: article
created_date: '2013-11-04'
created_by: Amanda Clark
last_modified_date: '2017-02-16'
last_modified_by: Laura Santamaria
product: Cloud Servers
product_url: cloud-servers
---

To provide the best experience possible for our customers, we carefully maintain
the list of images displayed when building a new cloud server. This means that
from time to time, older versions of an operating system may be removed from the
default list, usually shortly after a newer version is released. In general, we
try to keep the most current and at least one previous release of each operating
system we support.

Images that have been publicly released are never actually deleted, so you can
still access these older images by referencing the image ID directly through the
Cloud Servers API.  If you're looking for an older version of your favorite
Linux distro or Windows Server, you can probably locate it in this list.

**Warning:** These older images are no longer maintained and may not contain the
most up-to-date patches and package updates.

### Arch images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Arch 2013.9 | ba293687-4af0-4ccb-99e5-097d83f72dfe | 3/5/14 | Replaced by Arch 2014.2.

### CentOS images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
CentOS 5.9 | 59c037c1-70ec-41e4-aa17-73a9b0cb6b16 | 3/5/14 | Replaced by CentOS 5.10.
CentOS 6.4 | f70ed7c7-b42e-4d77-83d8-40fa29825b85 | 2/20/14 | Replaced by CentOS 6.5.

### Debian images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Debian 6 (Squeeze) (PV) | 874e0441-f7b7-456e-9c13-dd3f630d187c | 4/25/15 | Replaced by Debian 8 (Jessie).
Debian 7 (PV) | 857d7d36-34f3-409f-8435-693e8797be8b | 3/5/14 | Replaced by Debian 7 PVHVM, which uses different virtualization drivers and contains `cloud-init`.

### Fedora images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Fedora 20 (Heisenbug) (PVHVM) | a3307d30-39b9-4abc-be13-1d7134002c2d | 5/26/15 | Replaced by Fedora 22.
Fedora 18 | 896caae3-82f1-4b03-beaa-75fbdde27969 | 3/5/14 | No longer supported; this is the last image published.
Fedora 19 (PV) | 8500226f-b193-4471-9eff-9cba8440bfc8 | 3/5/14 | Replaced by Fedora 19 PVHVM, which uses different virtualization drivers and contains `cloud-init`.
Fedora 20 (PV) | 5ef987c7-0dda-4ebe-ae71-7f5c4a425faa | 3/5/14 | Replaced by Fedora 20 PVHVM, which uses different virtualization drivers and contains `cloud-init`.
Fedora 17 | 7bf1ac03-48e2-48f1-a363-7a91fa51d782 | 10/11/13 | No longer supported.

### FreeBSD images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
FreeBSD 9.2 | fb624ffd-81c2-4217-8cd5-da32d32e85c4 | 3/5/14 | Replaced by FreeBSD 10.0.

### Gentoo images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Gentoo 13.3 | 73764eb8-3c1c-42a9-8fff-71f6beefc6a7 | 3/5/14 | Replaced by Gentoo 14.1.

### Ubuntu images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Ubuntu 14.10 (Utopic Unicorn) (PVHVM) | 668b0764-4936-4eec-a2f2-3b5bb2c40b26 | 4/23/15 | Replaced by 15.04 (Vivid Vervet).
Ubuntu 10.04 (Lucid Lynx) | 1ee40a10-e249-475f-a799-40428a50c7de | 3/30/15 | No longer supported by Canonical.
Ubuntu 13.10 (Saucy Salamancer) | 7b8abc3f-5fd2-4d02-9e9a-16d43fc7128e | 6/23/14 | No longer supported by Canonical.
Ubuntu 13.10 (Saucy Salamander) (PVHVM) | aca656d3-dd70-4d7e-a9e5-f12182871cde | 6/23/14 | No longer supported by Canonical.
Ubuntu 12.10 (Quantal Quetzal) | f3ae5ef7-dc43-473a-b9d6-65e3f2cb7867 | 4/17/14 | No longer supported by Canonical.
Ubuntu 12.10 (Quantal Quetzal) (PVHVM) | ab5354f6-b7a3-4802-a2ad-911f67961197 | 4/17/14 | No longer supported by Canonical.
Ubuntu 13.04 | 45975587-fb06-4d56-bc94-38d1038aef8d | 1/6/14 | No longer supported by Canonical.<br/>As of 13.04, all non-LTS Ubuntu releases have a nine-month lifecycle; the previous non-LTS lifecycle was 18 months.
Ubuntu 13.04 PVHVM | 62df001e-87ee-407c-b042-6f4e13f5d7e1 | 1/6/14 | No longer supported by Canonical.<br/>As of 13.04, all non-LTS Ubuntu releases have a nine-month lifecycle; the previous non-LTS lifecycle was 18 months.

### OpenSUSE images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
OpenSUSE 12.3 | 8955d327-9a69-468f-be5c-60f571267406 | 3/5/14 | Replaced by OpenSUSE 13.1.

### Red Hat Enterprise Linux (RHEL) images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Red Hat Enterprise Linux 5.9 | 9d661e79-e473-4e2c-8a60-06b33b0add67 | 3/5/14 | Replaced by RHEL 5.10.
Red Hat Enterprise Linux 6.4 | c6e2fed0-75bf-420d-a744-7cfc75a1889e | 2/20/14 | Replaced by RHEL 6.5.

### Scientific Linux images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Scientific Linux 6.4 (PV) | bced783b-31d2-4637-b820-fa02522c518b | 3/5/14 | Replaced by Scientific Linux 6.4 PVHVM, which uses different virtualization drivers and contains `cloud-init`.

### Windows Server images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Windows Server 2008 R2 SP1<br/>(base install without updates) | f46e9237-9971-44b1-b92f-3a5a03592d3e | 6/17/15 | No longer maintained; however, the fully patched version of Windows 2008 R2 SP1 is still available.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Standard | b41c2705-f820-4b6f-8d32-d04b5f57a4f7 | 6/17/15 | No longer maintained; however, SQL Server 2012 SP1 is still available on Windows 2012.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Web | c6301f02-1388-4a4a-ba7c-b52e1bff7813 | 6/17/15 | No longer maintained; however, SQL Server 2012 SP1 is still available on Windows 2012
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 Express | b28d7079-c4e8-41cf-94ce-9c4b57cf6f23 | 6/17/15 | No longer maintained.
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 SP1 Standard | 959aee20-e0b8-42a7-9201-10057c2b7e05 | 6/17/15 | No longer maintained.
Windows Server 2012<br/>(base install without updates) | c81a65a3-8217-4520-96de-1d9313ae3094 | 6/17/15 | No longer maintained; however, the fully patched version of Windows 2012 is still available.
Windows Server 2012 + SharePoint 2013 with SQL Server 2012 SP1 Standard | d69d55ef-cb4c-4787-9f1b-2de41ecac9a1 | 6/17/15 | No longer maintained.
Windows Server 2012 R2<br/>(base install without updates) | fe486888-6890-47ac-a02d-b740868f143b | 6/17/15 | No longer maintained; however, the fully patched version of Windows 2012 R2 is still available.
Windows Server 2008 R2 SP1 | b349843c-22e6-48c9-8932-d282bd69fc90 | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 (base install without updates) | 7462c004-59cb-403c-9a8d-823ce978a00c | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2008 R2 SP2 Standard | b640fa31-d590-4058-b90a-db98d36ec0c8 | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2008 R2 SP2 Web | b4a0aee1-a218-455f-8c7a-ecef527d43c4 | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Standard | fa12f54c-259a-4128-a682-2f8be01520d7 | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Web | 2844cc38-83a0-4e86-b737-eac73c26198b | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 Express | 0487cb15-9832-4fb7-b2d9-5fc8f55803ad | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 SP1 Standard | fa14596a-1a70-42d0-bf20-699c35439356 | 10/29/13 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
