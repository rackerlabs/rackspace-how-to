---
permalink: paypal-requires-tls-12/
audit_date: '2019-01-18'
title: PayPal requires TLS 1.2
type: article
created_date: '2019-02-21'
created_by: Rackspace Community
last_modified_date: '2019-02-21'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---
As of June 2016, [PayPal&reg; requires you to use version 1.2 of the Transport
Layer Security protocol (TLS 1.2)](https://www.paypal.com/us/smarthelp/article/why-do-i-need-to-upgrade-my-system-to-tls-1.2-faq3898) when communicating with their service. If you leverage PayPal 
to process payments, you might have to take action if your operating system (OS) 
does not support TLS 1.2. 

This article provides guidance for addressing this issue for some 
common Rackspace operating systems.

### Table of contents

* [Find the OS that your server is running](#findos)

**Red Hat&reg; Enterprise Linux&reg; (RHEL) and CentOS&reg;**

* [RHEL and CentOS 7](#rhel_and_centos7)
* [RHEL and CentOS 6](#rhel_and_centos6)
* [RHEL and CentOS 5](#rhel_and_centos5)

**Ubuntu&reg;**

* [Ubuntu 14.04 LTS](#ubuntu_1404)
* [Ubuntu 12.04 LTS](#ubuntu_1204)

**Debian&reg;**

* [Debian 8](#debian8)
* [Debian 7](#debian7)

**Windows&reg; Server&reg;**

* [Windows Server 2012](#windows2012)
* [Windows Server 2008 R2](#windows2008_r2)
* [Windows Server 2003 and 2008](#windows2003_2008)

### <a id="findos">Find the OS that your server is running</a>

If you do not know which OS your server is running, 
use the following steps to find out:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Select **Servers > Cloud Servers**.
4. Click the name of the server that you want to check.

   The **Server Details** page appears.

5. The OS appears in the **System Image** field.

### <a id="rhel_and_centos7">RHEL and CentOS 7</a>

If you are running RHEL and CentOS 7, you do not need to take action because
the OS comes with TLS 1.2 configured by default.

### <a id="rhel_and_centos6">RHEL and CentOS 6</a>

RHEL 6.8 enables TLS 1.2 use by default. In both RHEL and CentOS, customers
who rely on Rackspace for automatic patching automatically update in their
normal patching cycle.

### <a id="rhel_and_centos5">RHEL and CentOS 5</a>

RHEL and CentOS 5 do not support TLS 1.2. As a result, your websites and
applications can no longer take payments by using the PayPal
service because the server can no longer talk to the PayPal endpoint.
(Other payment gateway providers might not be affected.)

You can resolve this issue in one of the following ways:

- Migrate to RHEL 6 or 7, CentOS 6 or 7, or Ubuntu 14.04 Long Term Support
  (LTS). We encourage you to engage with your account manager or Rackspace
  Support before you take this step to ensure that you understand how it
  might affect your configuration and if your hardware supports the OS.

- Perform a custom compile of packages to provide TLS 1.2. Rackspace does not
  perform this work and does not recommend this option. If you use this
  approach, Rackspace is not able to provide support for the OS. If this step
  is performed incorrectly, it might also create security vulnerabilities
  because these packages are not continuously patched.

### <a id="ubuntu_1404">Ubuntu 14.04 LTS</a>

If you are running Ubuntu 14.04 LTS, you do not need to take action because
the OS comes with TLS 1.2 configured by default.

### <a id="ubuntu_1204">Ubuntu 12.04 LTS</a>

If you are running Ubuntu 12.04 LTS, you do not need to take action because the
OS comes with TLS 1.2 configured by default.

### <a id="debian8">Debian 8</a>

If you are running Debian 8, you do not need to take action because the OS
comes with TLS 1.2 configured by default.

### <a id="debian7">Debian 7</a>

If you are running Debian 7, you do not need to take action because the OS comes with
TLS 1.2 configured by default.

### <a id="windows2012">Windows Server 2012</a>

If you are running Windows Server 2012, you do not need to take action because
the OS comes with TLS 1.2 configured by default.

### <a id="windows2008_r2">Windows Server 2008 R2</a>

Windows Server 2008 R2 supports TLS 1.2, but you need to modify some settings
on the server to ensure that you are leveraging that protocol. To make the
changes, open PowerShell&reg; and run the following commands:

    #make TSL 1.2 protocol reg keys
    md "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2"
    md "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server"
    md "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"

    # Enable TLS 1.2 for client and server SCHANNEL communications

    new-itemproperty -path     "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" -name "Enabled" -value 1 -PropertyType "DWord"
    new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" -name "DisabledByDefault" -value 0 -PropertyType "DWord"
    new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" -name "Enabled" -value 1 -PropertyType "DWord"
    new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" -name "DisabledByDefault" -value 0 -PropertyType "DWord"

Next, you need to restart the server to ensure that the changes take effect.

**Note**: Servers that are running Windows Server 2008 R2 but are using the
.NET framework to enable TLS must update to .NET 4.5. Before you perform
this step, we recommend that you determine how it might impact your
application and rework any portions of it that are not compatible with the
upgrade.

### <a id="windows2003_2008">Windows Server 2003 and 2008</a>

Windows Server 2003 and 2008 do not support TLS 1.2. As a result,
websites and applications that run on these systems are no longer able to take
payments because the server is no longer able to talk to the PayPal endpoint.

The only way to ensure continuity of the service is to migrate to Windows
Server 2008 R2 or 2012. We encourage you to engage with Rackspace Support
before you take this step to ensure you understand how it might affect your
configuration and if your hardware supports the OS.

**Note**: Servers that are running Windows Server 2008 but are using the .NET
framework to enable TLS must update to .NET 4.5. However, before you perform
this step, we recommend that you determine how it might impact your
application and rework any portions of it that are not compatible with the
upgrade.
