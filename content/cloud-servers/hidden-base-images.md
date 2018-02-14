---
permalink: hidden-base-images/
audit_date: '2017-12-19'
title: Hidden base images
type: article
created_date: '2013-11-04'
created_by: Amanda Clark
last_modified_date: '2017-05-18'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

To provide the best experience possible for our customers, we carefully maintain the list of images that can be used to build a new cloud server. Older versions of an operating system are occasionally removed from the default list, usually shortly after a newer version is released. In general, the list displays the most current version and at least one previous version of each operating system that we support.

Images that have been publicly released are never actually deleted, just hidden. You can access these older images by referencing the image ID directly through the Cloud Servers API.  If you're looking for an older version of a Linux distro or Windows Server, use this article to find the image ID for that version..

**Warning:** These older images are no longer maintained and might not contain the most up-to-date patches and package updates.

### Arch images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Arch 2014.2 | b21af3ef-1a1e-46b5-98ef-bb0c81b25292 | 2017-09-06 | Retired

### Fedora images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Fedora 19 (Schrodinger's Cat) (PVHVM) | fda42efc-d20c-4fe7-929d-2aa7d0ef5307 | 2015-01-30 | No longer supported by the Fedora Project. This image was the last image of this version published.
Fedora 20 (Heisenbug) (PVHVM) | a3307d30-39b9-4abc-be13-1d7134002c2d | 2015-05-26 | No longer supported by the Fedora Project. This image was the last image of this version published.
Fedora 21 (PVHVM) | 79f41a1d-ed68-40bc-84d5-e7a36dabcb44 | 2016-03-24 | No longer supported by the Fedora Project. This image was the last image of this version published.
Fedora 22 (PVHVM) | 779851de-9b1e-4500-839a-dc1d6e25cb25 | 2016-06-21 | No longer supported by the Fedora Project. This image was the last image of this version published.
Fedora 23 (PVHVM) | f597d109-f91f-417e-9818-9ae21dca2262 | 2016-12-27 | No longer supported by the Fedora Project. This image was the last image of this version published.
Fedora 24 (PVHVM) | 4e284168-69fd-44aa-8d4a-0844058118d9 | 2017-08-08 | No longer supported by the Fedora Project. This image was the last image of this version published.
Fedora 25 (PVHVM) | 8c9f3212-8515-484e-9109-00e585be8cf4 | 2017-12-12 | No longer supported by the Fedora Project. This image was the last image of this version published.

### FreeBSD images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
FreeBSD 10  | 1125dfad-61cf-40e4-890c-afdef535dad4 | 2017-09-06 | Retired
FreeBSD 11  | c656f3c8-12ff-4b2e-9333-9a857c553292 | 2017-09-06 | Retired

### Gentoo images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Gentoo 15.3 | c6693b8d-1e99-4112-b2a0-ceefd18a55ca | 2017-09-06 | Retired

### OpenSUSE images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
OpenSUSE 13.1 (PVHVM) | 59addab2-1551-4949-b635-bc88f1b6dc7c | 2015-01-15 | No longer supported; this is the last image published.
OpenSUSE 13.2 (PVHVM) | 79436148-753f-41b7-aee9-5acbde16582c | 2016-05-03 | No longer supported; this is the last image published.
OpenSUSE Leap 42 | abe0d447-42ea-41ed-aadf-03828639570d | 2017-09-06 | Retired

### Scientific Linux images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Scientific Linux 6 (PVHVM) | 51706a83-20cb-42dd-92a8-d704f5a7a1bf | 2017-09-06 | Retired
Scientific Linux 7 (PVHVM) | 6c0551dd-798d-4b56-b847-de58165dbffa | 2017-09-06 | Retired

### Ubuntu images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Ubuntu 12.04 (PVHVM) | f2d30a56-bc2b-4906-8027-92f8a45bbb10 | 2017-04-28 | No longer supported by Canonical.
Ubuntu 12.10 (Quantal Quetzal) (PVHVM) | ab5354f6-b7a3-4802-a2ad-911f67961197 | 2014-04-17 | No longer supported by Canonical.
Ubuntu 13.04 (PVHVM) | 62df001e-87ee-407c-b042-6f4e13f5d7e1 | 2014-01-06 | No longer supported by Canonical.
Ubuntu 13.10 (Saucy Salamander) (PVHVM) | aca656d3-dd70-4d7e-a9e5-f12182871cde | 2014-06-23 | No longer supported by Canonical.
Ubuntu 14.10 (Utopic Unicorn) (PVHVM) | 668b0764-4936-4eec-a2f2-3b5bb2c40b26 | 2015-04-23 | Replaced by 15.04 (Vivid Vervet).
Ubuntu 15.04 (Vivid Vervet) (PVHVM) | 658a7d3b-4c58-4e29-b339-2509cca0de10 | 2015-10-23 | No longer supported by Canonical.
Ubuntu 15.10 (Willy Werewolf) (PVHVM) | 59a3fadd-93e7-4674-886a-64883e17115f | 2016-12-07 | No longer supported by Canonical.
Ubuntu 16.10 (Yakety Yak) (PVHVM) | 321116e4-5c76-42ce-8ddf-5cb4dcbf7cfe | 2017-07-27 | No longer supported by Canonical.

### Windows Server images

Image | ID | Date hidden | Notes
--- | --- | --- | ---
Windows Server 2008 R2 SP1<br/>(base install without updates) | f46e9237-9971-44b1-b92f-3a5a03592d3e | 2015-06-17 | No longer maintained; however, the fully patched version of Windows 2008 R2 SP1 is still available.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Standard | b41c2705-f820-4b6f-8d32-d04b5f57a4f7 | 2015-06-17 | No longer maintained; however, SQL Server 2012 SP1 is still available on Windows 2012.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Web | c6301f02-1388-4a4a-ba7c-b52e1bff7813 | 2015-06-17 | No longer maintained; however, SQL Server 2012 SP1 is still available on Windows 2012
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 Express | b28d7079-c4e8-41cf-94ce-9c4b57cf6f23 | 2015-06-17 | No longer maintained.
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 SP1 Standard | 959aee20-e0b8-42a7-9201-10057c2b7e05 | 2015-06-17 | No longer maintained.
Windows Server 2012<br/>(base install without updates) | c81a65a3-8217-4520-96de-1d9313ae3094 | 2015-06-17 | No longer maintained.
Windows Server 2012 (with updates) | cfe2dcff-38ca-4bc2-b033-58ee2be041cf | 2018-01-08 | No longer maintained.
Windows Server 2012 + SQL Server 2012 SP1 Standard | 6532ebf1-80b0-44d4-b1bb-965e8198be2a | 2018-01-08 | No longer maintained.
Windows Server 2012 + SQL Server 2012 SP1 Web | d6a32649-f166-4767-88bd-b377c2fab719 | 2018-01-08 | No longer maintained.
Windows Server 2012 + SharePoint 2013 with SQL Server 2012 SP1 Standard | d69d55ef-cb4c-4787-9f1b-2de41ecac9a1 | 2015-06-17 | No longer maintained.
Windows Server 2012 R2<br/>(base install without updates) | fe486888-6890-47ac-a02d-b740868f143b | 2015-06-17 | No longer maintained; however, the fully patched version of Windows 2012 R2 is still available.
Windows Server 2008 R2 SP1 | b349843c-22e6-48c9-8932-d282bd69fc90 | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 (base install without updates) | 7462c004-59cb-403c-9a8d-823ce978a00c | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2008 R2 SP2 Standard | b640fa31-d590-4058-b90a-db98d36ec0c8 | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2008 R2 SP2 Web | b4a0aee1-a218-455f-8c7a-ecef527d43c4 | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Standard | fa12f54c-259a-4128-a682-2f8be01520d7 | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Web | 2844cc38-83a0-4e86-b737-eac73c26198b | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 Express | 0487cb15-9832-4fb7-b2d9-5fc8f55803ad | 2013-10-293 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 SP1 Standard | fa14596a-1a70-42d0-bf20-699c35439356 | 2013-10-29 | Base images for Windows Server 2008 now use Datacenter Edition. This is one of the last Windows 2008 Enterprise images released before the switch.
