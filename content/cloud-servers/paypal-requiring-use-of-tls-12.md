---
permalink: PayPal-requiring-tls-12
audit_date: '2019-01-18'
title: PayPal requiring TLS 1.2
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-18'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---
As of June 2016, [PayPal&reg; requires you to use version 1.2 of the Transport
Layer Security protocol (TLS 1.2)](https://www.paypal.com/us/smarthelp/article/why-do-i-need-to-upgrade-my-system-to-tls-1.2-faq3898) when communicating with
their service. If you leverage PayPal to process payments, you might have to
take action if your operating system does not support TLS 1.2. You can check
the operating system on which your server is running in the [Cloud Control
Panel](https://login.rackspace.com).

This article provides guidance for addressing this issue for the most common
operating systems at Rackspace.

**Red Hat&reg; Enterprise Linux&reg; (RHEL) and CentOS&reg;**

* RHEL and CentOS 5
* RHEL and CentOS 6
* RHEL and CentOS 7

**Ubuntu&reg; Server**

* Ubuntu 12.04 LTS
* Ubuntu 14.04 LTS

**Debian&reg;**

* Debian 7
* Debian 8

**Windows&reg; Server&reg;**

* Windows Server 2003 and 2008
* Windows Server 2008 R2
* Windows Server 2012

### RHEL and CentOS 5

RHEL and CentOS 5 do not support TLS 1.2. As a result, your websites and applications will no longer be able to take payments by using the PayPal service because the sever is no longer able to talk to the PayPal endpoint (other payment gateway providers might not be affected).

You can resolve this issue in one of the following ways:

1. Migrate to RHEL 6 or 7, CentOS 6 or 7, or Ubuntu 14.04 LTS. We encourage
   you to engage with your support team before taking this route to ensure
   that you understand how this might affect your configuration and if your
   hardware supports the operating system.

2. Perform a custom compile of packages to provide TLS 1.2. Rackspace does not perform this work and does not recommend this option. If you use this approach, Rackspace is not able to provide support for the operating system. If this step is performed incorrectly, it could also create security vulnerabilities because these packages are not continuously patched.

### RHEL and CentOS 6

The latest point release of RHEL 6.8 enable TLS 1.2 use by default (2016-05-10).

CentOS 6.8 is not available yet, the current 6.7 release does not enable TLS 1.2 by default. Users of CentOS will need to wait for the CentOS project team to build and release 6.8. More information on how long that will take on the CentOS wiki.

In both RHEL and CentOS (once released), customers that rely on Rackspace for automatic patching will automatically update in their normal patching cycle.
RHEL/CentOS 7

Customers running RHEL/CentOS 7 should not need to take action as the OS comes with TLS 1.2 configured by default.

### Ubuntu 12.04 LTS

Customers running Ubuntu 12.04 LTS should not need to take action as the OS comes with TLS 1.2 configured by default.

### Ubuntu 14.04 LTS

Customers running Ubuntu 14.04 LTS should not need to take action as the OS comes with TLS 1.2 configured by default.

### Debian 7

Customers running Debian 7 should not need to take action as the OS comes with TLS 1.2 configured by default.

### Debian 8

Customers running Debian 8 should not need to take action as the OS comes with TLS 1.2 configured by default.

### Windows Server 2003 and 2008

Windows Server 2003 and 2008 (SCHANNEL) do not support TLS 1.2, so user’s sites/application will no longer be able to take payments since the sever will no longer be able to talk to the PayPal endpoint. The only option that you will have to ensure continuity of the service is to migrate to Windows Server 2008 R2 or 2012. We encourage Rackspace customer to engage with their support team before taking this route to ensure they understand how this will affect their configuration and if their hardware supports the operating system.
Servers running Windows Server 2008 but using the .NET framework to enable TLS will need to update to .Net 4.5. However, before doing so, we recommend that you check how this impacts your application and re-work any portions of it that are not compatible with the upgrade.

### Windows Server 2008 R2

Windows Server 2008 R2 supports TLS 1.2 but you will need to modify some settings on the server to ensure that you are leveraging that protocol. To make the changes, open PowerShell and run the following commands:

    #make TSL 1.2 protocol reg keys
    md "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2"
    md "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server"
    md "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"

# Enable TLS 1.2 for client and server SCHANNEL communications

      new-itemproperty -path     "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" -name "Enabled" -value 1 -PropertyType "DWord"
      new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server" -name "DisabledByDefault" -value 0 -PropertyType "DWord"
      new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" -name "Enabled" -value 1 -PropertyType "DWord"
      new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" -name "DisabledByDefault" -value 0 -PropertyType "DWord"

You need to reboot to ensure that the changes take effect on the server.
However, servers running Windows Server 2008 R2 but using the .NET framework to enable TLS will need to update to .Net 4.5. Before doing so, we recommend that you check how this impacts your application and re-work any portions of it that are not compatible with the upgrade.

### Windows Server 2012

If you are running Windows Server 2012, you should not need to take action because the OS comes with TLS 1.2 configured by default.
