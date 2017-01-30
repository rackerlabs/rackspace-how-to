---
permalink: windows-server-2012-r2-with-managed-operations-support/
audit_date:
title: Windows Server 2012 R2 with Managed Operations support
type: article
created_date: '2012-10-09'
created_by: Rae D. Cabello
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: Managed Operations
product_url: managed-operations
---

Managed Operations for Windows 2012 R2 Servers includes upsizes,
snapshots, host machine issues, adding and removing servers, and
managing IP addresses. To ensure Fanatical Support, Rackspace provides
support for specific software and server configurations on Cloud Servers
with Managed Operations. The purpose of this of article is to detail the
differences in functionality among versions of Windows Server 2012 R2,
and to identify which features are currently supported. Bookmark this
page for future updates.

### Top 10 Features of Windows Server 2012 compared to 2008 and 2003

#### Managed: Windows Server 2012 R2


| Feature | Windows Support | Rackspace Support
|-------- | --------------- |------------------
| Scale & Performace                                            | Supported           | Available             |
| Shared-Nothing Live Migration                                 | Supported           | Unsupported           |
| Hyper-V Network Virtualization                                | Supported           | Unsupported           |
| Hyper-V Replica                                               | Supported           | Unsupported           |
| Low Cost Highly Available Files Based Storage                 | Supported           | Unsupported           |
| Windows Powershell 4.0                                        | Supported           | Supported             |
| Hybrid Applications                                           | Supported           | Supported             |
| Multi-tenant, High Density Websites                           | Supported           | Supported             |
| Simplified, Feature-Rich Virtual Desktop Infrastructure (VDI) | Supported           | Unsupported           |
| Dynamic Acces Control                                         | Supported           | Unsupported[ ]()      |

#### Managed: Windows Server 2008 R2

| Feature | Windows Support | Rackspace Support
|-------- | --------------- |------------------
| Scale & Performace                                            | Partially Supported | Supported             |
| Shared-Nothing Live Migration                                 | Unsupported         | Unsupported           |
| Hyper-V Network Virtualization                                | Unsupported         | Unsupported           |
| Hyper-V Replica                                               | Unsupported         | Unsupported           |
| Low Cost Highly Available Files Based Storage                 | Unsupported         | Unsupported           |
| Windows Powershell 3.0                                        | Partially Supported | Supported             |
| Hybrid Applications                                           | Partially Supported | Unsupported           |
| Multi-tenant, High Density Websites                           | Partially Supported | Supported             |
| Simplified, Feature-Rich Virtual Desktop Infrastructure (VDI) | Partially Supported | Unsupported           |
| Dynamic Acces Control                                         | Unsupported         | Unsupported[ ]()      |

#### Managed: Windows Server 2003 R2

| Feature | Windows Support | Rackspace Support
|-------- | --------------- |------------------
| Scale & Performace                                            | Partially Supported | Unsupported           |
| Shared-Nothing Live Migration                                 | Unsupported         | Unsupported           |
| Hyper-V Network Virtualization                                | Unsupported         | Unsupported           |
| Hyper-V Replica                                               | Unsupported         | Unsupported           |
| Low Cost Highly Available Files Based Storage                 | Unsupported         | Unsupported           |
| Windows Powershell 3.0                                        | Unsupported         | Unsupported           |
| Hybrid Applications                                           | Unsupported         | Unsupported           |
| Multi-tenant, High Density Websites                           | Unsupported         | Unsupported           |
| Simplified, Feature-Rich Virtual Desktop Infrastructure (VDI) | Unsupported         | Unsupported           |
| Dynamic Acces Control                                         | Unsupported         | Unsupported[ ]()      |

#### Dedicated: Windows Server 2012 R2

| Feature | Windows Support | Rackspace Support
|-------- | --------------- |------------------
| Scale & Performace                                            | Supported           | Supported             |
| Shared-Nothing Live Migration                                 | Supported           | Unsupported           |
| Hyper-V Network Virtualization                                | Supported           | Unsupported           |
| Hyper-V Replica                                               | Supported           | Unsupported           |
| Low Cost Highly Available Files Based Storage                 | Supported           | Pending               |
| Windows Powershell 4.0                                        | Supported           | Pending               |
| Hybrid Applications                                           | Supported           | Pending               |
| Multi-tenant, High Density Websites                           | Supported           | Pending               |
| Simplified, Feature-Rich Virtual Desktop Infrastructure (VDI) | Supported           | Unsupported           |
| Dynamic Acces Control                                         | Supported           | Pending               |

#### Dedicated: Windows Server 2008 R2

| Feature | Windows Support | Rackspace Support
|-------- | --------------- |------------------
| Scale & Performace                                            | Partially Supported | Supported             |
| Shared-Nothing Live Migration                                 | Unsupported         | Unsupported           |
| Hyper-V Network Virtualization                                | Unsupported         | Unsupported           |
| Hyper-V Replica                                               | Unsupported         | Unsupported           |
| Low Cost Highly Available Files Based Storage                 | Unsupported         | Unsupported           |
| Windows Powershell 3.0                                        | Partially Supported | Supported             |
| Hybrid Applications                                           | Partially Supported | Unsupported           |
| Multi-tenant, High Density Websites                           | Partially Supported | Supported             |
| Simplified, Feature-Rich Virtual Desktop Infrastructure (VDI) | Partially Supported | Unsupported           |
| Dynamic Acces Control                                         | Unsupported         | Unsupported           |

#### Dedicated: Windows Server 2003 R2

| Feature | Windows Support | Rackspace Support
|-------- | --------------- |------------------
| Scale & Performace                                            | Partially Supported | Supported             |
| Shared-Nothing Live Migration                                 | Unsupported         | Unsupported           |
| Hyper-V Network Virtualization                                | Unsupported         | Unsupported           |
| Hyper-V Replica                                               | Unsupported         | Unsupported           |
| Low Cost Highly Available Files Based Storage                 | Unsupported         | Unsupported           |
| Windows Powershell 3.0                                        | Unsupported         | Unsupported           |
| Hybrid Applications                                           | Unsupported         | Unsupported           |
| Multi-tenant, High Density Websites                           | Unsupported         | Unsupported           |
| Simplified, Feature-Rich Virtual Desktop Infrastructure (VDI) | Unsupported         | Unsupported           |
| Dynamic Acces Control                                         | Unsupported         | Unsupported           |

### Microsoft Windows Server 2012 R2 licensing

Windows Server 2012 R2 has a simplified licensing model and single
codebase. All options are available regardless of which license model
you select, although the Datacenter edition is required for the
unlimited virtualization use rights. Customers who would have had to
chose among Web, Standard and Enterprise editions can now simply select
Standard edition.

**Notes**:

- Cloud customers will have access to Windows Server 2012 R2 images through the Cloud Servers API
  and Control Panel.

- MyRack is used by customers with dedicated servers and is the interface for RackConnect.
