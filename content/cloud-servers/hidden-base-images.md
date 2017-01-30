---
permalink: hidden-base-images/
audit_date:
title: Hidden Base Images
type: article
created_date: '2013-11-04'
created_by: Amanda Clark
last_modified_date: '2015-06-08'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

In order to provide the best experience possible for our customers we
carefully maintain the list of images displayed when building a new
cloud server. This means that from time to time older versions of an
operating system may be removed from the default list, usually shortly
after a newer version is released. In general, we try to keep the most
current and at least one previous release of each operating system we
support.

Images that have been publicly released are never actually deleted, so
you can still access these older images by referencing the image ID
directly through the Cloud Servers API.  If you're looking for an older
version of your favorite Linux distro you can probably locate it in the
list below. Please be aware that these older images are no longer
maintained and may not contain the most up-to-date patches and package
updates.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Image Name</th>
<th align="left">Image ID</th>
<th align="left">Date Hidden</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Windows Server 2008 R2 SP1 (base install without updates)</p></td>
<td align="left">f46e9237-9971-44b1-b92f-3a5a03592d3e</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained, however the fully patched version of Windows 2008 R2 SP1 is still available</td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Standard</p></td>
<td align="left">b41c2705-f820-4b6f-8d32-d04b5f57a4f7</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained, however SQL Server 2012 SP1 is still available on Windows 2012</td>
</tr>
<tr class="odd">
<td align="left"><p>Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Web</p></td>
<td align="left">c6301f02-1388-4a4a-ba7c-b52e1bff7813</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained, however SQL Server 2012 SP1 is still available on Windows 2012</td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 Express</p></td>
<td align="left">b28d7079-c4e8-41cf-94ce-9c4b57cf6f23</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained</td>
</tr>
<tr class="odd">
<td align="left"><p>Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 SP1 Standard</p></td>
<td align="left">959aee20-e0b8-42a7-9201-10057c2b7e05</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained</td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2012 (base install without updates)</p></td>
<td align="left">c81a65a3-8217-4520-96de-1d9313ae3094</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained, however the fully patched version of Windows 2012 is still available</td>
</tr>
<tr class="odd">
<td align="left"><p>Windows Server 2012 + SharePoint 2013 with SQL Server 2012 SP1 Standard</p></td>
<td align="left">d69d55ef-cb4c-4787-9f1b-2de41ecac9a1</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained</td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2012 R2 (base install without updates)</p></td>
<td align="left">fe486888-6890-47ac-a02d-b740868f143b</td>
<td align="left">6/17/15</td>
<td align="left">This image is no longer maintained, however the fully patched version of Windows 2012 R2 is still available</td>
</tr>
<tr class="odd">
<td align="left"><p>Fedora 20 (Heisenbug) (PVHVM)</p></td>
<td align="left">a3307d30-39b9-4abc-be13-1d7134002c2d</td>
<td align="left">5/26/15</td>
<td align="left">This version has been replaced by Fedora 22</td>
</tr>
<tr class="even">
<td align="left"><p>Debian 6 (Squeeze) (PV)</p></td>
<td align="left">874e0441-f7b7-456e-9c13-dd3f630d187c</td>
<td align="left">4/25/15</td>
<td align="left">This version has been replaced by Debian 8 (Jessie)</td>
</tr>
<tr class="odd">
<td align="left"><p>Ubuntu 14.10 (Utopic Unicorn) (PVHVM)</p></td>
<td align="left">668b0764-4936-4eec-a2f2-3b5bb2c40b26</td>
<td align="left">4/23/15</td>
<td align="left">This version has been replaced by 15.04 (Vivid Vervet)</td>
</tr>
<tr class="even">
<td align="left"><p>Ubuntu 10.04 (Lucid Lynx)</p></td>
<td align="left">1ee40a10-e249-475f-a799-40428a50c7de</td>
<td align="left">3/30/15</td>
<td align="left">This version is no longer supported by Canonical</td>
</tr>
<tr class="odd">
<td align="left"><p>Ubuntu 13.10 (Saucy Salamancer)</p></td>
<td align="left">7b8abc3f-5fd2-4d02-9e9a-16d43fc7128e</td>
<td align="left">6/23/14</td>
<td align="left">This version is no longer supported by Canonical</td>
</tr>
<tr class="even">
<td align="left"><p>Ubuntu 13.10 (Saucy Salamander) (PVHVM)</p></td>
<td align="left">aca656d3-dd70-4d7e-a9e5-f12182871cde</td>
<td align="left">6/23/14</td>
<td align="left">This version is no longer supported by Canonical</td>
</tr>
<tr class="odd">
<td align="left"><p>Ubuntu 12.10 (Quantal Quetzal)</p></td>
<td align="left">f3ae5ef7-dc43-473a-b9d6-65e3f2cb7867</td>
<td align="left">4/17/14</td>
<td align="left">This version is no longer supported by Canonical</td>
</tr>
<tr class="even">
<td align="left"><p>Ubuntu 12.10 (Quantal Quetzal) (PVHVM)</p></td>
<td align="left">ab5354f6-b7a3-4802-a2ad-911f67961197</td>
<td align="left">4/17/14</td>
<td align="left">This version is no longer supported by Canonical</td>
</tr>
<tr class="odd">
<td align="left"><p>Arch 2013.9</p></td>
<td align="left">ba293687-4af0-4ccb-99e5-097d83f72dfe</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by Arch 2014.2</td>
</tr>
<tr class="even">
<td align="left"><p>CentOS 5.9</p></td>
<td align="left">59c037c1-70ec-41e4-aa17-73a9b0cb6b16</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by CentOS 5.10</td>
</tr>
<tr class="odd">
<td align="left"><p>Debian 7 (PV)</p></td>
<td align="left">857d7d36-34f3-409f-8435-693e8797be8b</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by Debian 7 PVHVM which uses different virtualization drivers and contains cloud-init</td>
</tr>
<tr class="even">
<td align="left"><p>Fedora 18</p></td>
<td align="left">896caae3-82f1-4b03-beaa-75fbdde27969</td>
<td align="left">3/5/14</td>
<td align="left">Fedora 18 is no longer supported, this is the last image published</td>
</tr>
<tr class="odd">
<td align="left"><p>Fedora 19 (PV)</p></td>
<td align="left">8500226f-b193-4471-9eff-9cba8440bfc8</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by Fedora 19 PVHVM which uses different virtualization drivers and contains cloud-init</td>
</tr>
<tr class="even">
<td align="left"><p>Fedora 20 (PV)</p></td>
<td align="left">5ef987c7-0dda-4ebe-ae71-7f5c4a425faa</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by Fedora 20 PVHVM which uses different virtualization drivers and contains cloud-init</td>
</tr>
<tr class="odd">
<td align="left"><p>FreeBSD 9.2</p></td>
<td align="left">fb624ffd-81c2-4217-8cd5-da32d32e85c4</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by FreeBSD 10.0</td>
</tr>
<tr class="even">
<td align="left"><p>Gentoo 13.3</p></td>
<td align="left">73764eb8-3c1c-42a9-8fff-71f6beefc6a7</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by Gentoo 14.1</td>
</tr>
<tr class="odd">
<td align="left"><p>OpenSUSE 12.3</p></td>
<td align="left">8955d327-9a69-468f-be5c-60f571267406</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by OpenSUSE 13.1</td>
</tr>
<tr class="even">
<td align="left"><p>RHEL 5.9</p></td>
<td align="left">9d661e79-e473-4e2c-8a60-06b33b0add67</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by RHEL 5.10</td>
</tr>
<tr class="odd">
<td align="left"><p>Scientific Linux 6.4 (PV)</p></td>
<td align="left">bced783b-31d2-4637-b820-fa02522c518b</td>
<td align="left">3/5/14</td>
<td align="left">This image has been replaced by Scientific Linux 6.4 PVHVM which uses different virtualization drivers and contains cloud-init</td>
</tr>
<tr class="even">
<td align="left"><p>CentOS 6.4</p></td>
<td align="left">f70ed7c7-b42e-4d77-83d8-40fa29825b85</td>
<td align="left">2/20/14</td>
<td align="left">This image has been replaced by CentOS 6.5</td>
</tr>
<tr class="odd">
<td align="left"><p>Red Hat Enterprise Linux 6.4</p></td>
<td align="left">c6e2fed0-75bf-420d-a744-7cfc75a1889e</td>
<td align="left">2/20/14</td>
<td align="left">This image has been replaced by RHEL 6.5</td>
</tr>
<tr class="even">
<td align="left"><p>Ubuntu 13.04</p></td>
<td align="left">45975587-fb06-4d56-bc94-38d1038aef8d</td>
<td align="left">1/6/14</td>
<td align="left">This image is no longer supported by Canonical. As of 13.04, all non-LTS Ubuntu releases have a nine month lifecycle (previous non-LTS lifecycle was 18 months).</td>
</tr>
<tr class="odd">
<td align="left"><p>Ubuntu 13.04 PVHVM</p></td>
<td align="left">62df001e-87ee-407c-b042-6f4e13f5d7e1</td>
<td align="left">1/6/14</td>
<td align="left">This image is no longer supported by Canonical. As of 13.04, all non-LTS Ubuntu releases have a nine month lifecycle (previous non-LTS lifecycle was 18 months).</td>
</tr>
<tr class="even">
<td align="left"><p>Windows Server 2008 R2 SP1</p></td>
<td align="left">b349843c-22e6-48c9-8932-d282bd69fc90</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition. These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="odd">
<td align="left">Windows Server 2008 R2 SP1 (base install without updates)</td>
<td align="left">7462c004-59cb-403c-9a8d-823ce978a00c</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition. These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="even">
<td align="left">Windows Server 2008 R2 SP1 + SQL Server 2008 R2 SP2 Standard</td>
<td align="left">b640fa31-d590-4058-b90a-db98d36ec0c8</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition. These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="odd">
<td align="left">Windows Server 2008 R2 SP1 + SQL Server 2008 R2 SP2 Web</td>
<td align="left">b4a0aee1-a218-455f-8c7a-ecef527d43c4</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition. These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="even">
<td align="left">Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Standard</td>
<td align="left">fa12f54c-259a-4128-a682-2f8be01520d7</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition.  These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="odd">
<td align="left">Windows Server 2008 R2 SP1 + SQL Server 2012 SP1 Web</td>
<td align="left">2844cc38-83a0-4e86-b737-eac73c26198b</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition.  These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="even">
<td align="left">Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 Express</td>
<td align="left">0487cb15-9832-4fb7-b2d9-5fc8f55803ad</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition. These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="odd">
<td align="left">Windows Server 2008 R2 SP1 + SharePoint 2010 Foundation with SQL Server 2008 R2 SP1 Standard</td>
<td align="left">fa14596a-1a70-42d0-bf20-699c35439356</td>
<td align="left">10/29/13</td>
<td align="left">Base images for Windows Server 2008 now use Datacenter Edition. These are the last Windows 2008 Enterprise images that were released before the switch</td>
</tr>
<tr class="even">
<td align="left">Fedora 17</td>
<td align="left">7bf1ac03-48e2-48f1-a363-7a91fa51d782</td>
<td align="left">10/11/13</td>
<td align="left">No longer supported</td>
</tr>
</tbody>
</table>
