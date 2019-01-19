---
permalink: paypal-requiring-use-of-tls-12
audit_date:
title: PayPal Requiring Use of TLS 1.2
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
On 17 June 2016, PayPal started forcing the use of a more modern security protocol (TLS 1.2) when communicating with their service. This means users leveraging PayPal to process payments may have to take action if their operating system does not support TLS 1.2. You can check which operating system your server is on in your control panel. 
We have provided guidance below on how to address this issue with the most common operating systems at Rackspace.
RHEL/CentOS

* RHEL/CentOS 5
* RHEL/CentOS 6
* RHEL/CentOS 7
Ubuntu Server

* Ubuntu 12.04 LTS
* Ubuntu 14.04 LTS
Debian

* Debian 7
* Debian 8
Windows Server Config

* 2003 and 2008
* 2008 R2
* 2012
RHEL/CentOS 5

RHEL/CentOS 5 does not support TLS 1.2, so user’s sites/applications will no longer be able to take payments via the Paypal service, since the sever will no longer be able to talk to the Paypal endpoint (Other payment gateway providers might not be affected). There are two options to resolve this issue:
1. Migrate to RHEL/CentOS 6, 7, or Ubuntu 14.04 LTS. We encourage Rackspace customers to engage with their support team before taking this route to ensure they understand how this will affect their configuration and if their hardware supports the operating system.

2. Do a custom compile of packages to provide TLS 1.2. Rackspace will not perform this work and does not recommend this option. Doing this would result in the operating system falling out of our ability to provide support and could result in security vulnerabilities if done incorrectly, and future vulnerabilities since these packages are not subjected to continued patching.
RHEL/CentOS 6

The latest point release of RHEL 6.8 enable TLS 1.2 use by default (2016-05-10).
CentOS 6.8 is not available yet, the current 6.7 release does not enable TLS 1.2 by default. Users of CentOS will need to wait for the CentOS project team to build and release 6.8. More information on how long that will take on the CentOS wiki.
In both RHEL and CentOS (once released), customers that rely on Rackspace for automatic patching will automatically update in their normal patching cycle.
RHEL/CentOS 7

Customers running RHEL/CentOS 7 should not need to take action as the OS comes with TLS 1.2 configured by default.
Ubuntu 12.04 LTS

Customers running Ubuntu 12.04 LTS should not need to take action as the OS comes with TLS 1.2 configured by default.
Ubuntu 14.04 LTS

Customers running Ubuntu 14.04 LTS should not need to take action as the OS comes with TLS 1.2 configured by default.
Debian 7

Customers running Debian 7 should not need to take action as the OS comes with TLS 1.2 configured by default.
Debian 8

Customers running Debian 8 should not need to take action as the OS comes with TLS 1.2 configured by default.
Windows Server 2003 and 2008

Windows Server 2003 and 2008 (SCHANNEL) do not support TLS 1.2, so user’s sites/application will no longer be able to take payments since the sever will no longer be able to talk to the Paypal endpoint. The only option that you will have to ensure continuity of the service is to migrate to Windows Server 2008 R2 or 2012. We encourage Rackspace customer to engage with their support team before taking this route to ensure they understand how this will affect their configuration and if their hardware supports the operating system.
Servers running Windows Server 2008 but using the .NET framework to enable TLS will need to update to .Net 4.5. However, before doing so, we recommend that you check how this impacts your application and re-work any portions of it that are not compatible with the upgrade.
Windows Server 2008 R2

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
You will need to reboot to ensure that the changes take effect on the server.
However, servers running Windows Server 2008 R2 but using the .NET framework to enable TLS will need to update to .Net 4.5. Before doing so, we recommend that you check how this impacts your application and re-work any portions of it that are not compatible with the upgrade.
Windows Server 2012

Customers running Windows Server 2012 should not need to take action as the OS comes with TLS 1.2 configured by default.
