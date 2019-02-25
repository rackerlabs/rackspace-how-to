---
permalink: overview-of-the-managed-windows-patching-service/
audit_date: '2019-01-22'
title:  Overview of the Managed Windows Patching service
type: article
created_date: '2019-02-15'
created_by: Rackspace Community
last_modified_date: '2019-02-15'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Microsoft&reg; releases patches every second Tuesday of the month (known as
_Patch Tuesday_). After we receive these patches, we begin the process of
determining which updates we will approve.

### Updates that we approve

We approve the following Microsoft updates:

- Updates that apply to the Windows&reg; operating system (OS) itself.
  This category includes the following updates:
  - Updates that are installed by default.
  - Available add-on roles or services (such as Internet Explorer&reg; or
    Internet Information Services (IIS) security updates).
- Security updates for the .NET Framework.
- Non-security updates if Rackspace Support determines that they address a
  specific need that applies to our customer base as a whole, such as
  cumulative time zone updates.
- The latest definition updates for Windows Defender during monthly patching.

### Updates that we do not approve

We do not approve the following Microsoft updates:

- Windows service packs.
- New versions of Internet Explorer.
- Non-security related .NET Framework updates. Rackspace Support only installs
  .NET Framework releases and service packs on customer request.
- Microsoft Office updates. Customers use Microsoft Office as a client
  application on servers, and also use its libraries in some web applications.
  As a result, we cannot update this software without the potential for
  breaking a custom application.
- Add-on Microsoft products other than the core OS.
- Third-party software.

### About installing unapproved patches

Even if you opt in to our Managed Windows Patching service, you can still
install any software and updates that you want by visiting the Windows Update
website, or by downloading the software directly from Microsoft. In addition,
you can ask Rackspace Support to assist you with some of the patches that we
did not approve.

**Important**: If you request a patch that Rackspace did not approve, you are
responsible for any issues that might arise due to the installation.

### Release schedule

You can choose to receive approved patches at one of the following intervals:

- **Early release week**: The first week after Microsoft's Patch Tuesday.

- **Default release week**: The second week after Microsoft's Patch Tuesday.

- **Delayed release week**: The third week after Microsoft's Patch Tuesday.

You can also choose the day of the week and the time that the update occurs.

If an update requires a server restart, the restart also occurs at this time.
