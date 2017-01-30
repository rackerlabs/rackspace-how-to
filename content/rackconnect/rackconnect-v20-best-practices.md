---
permalink: rackconnect-v20-best-practices/
audit_date:
title: RackConnect v2.0 best practices
type: article
created_date: '2012-08-23'
created_by: Juan Perez
last_modified_date: '2015-09-04'
last_modified_by: Constanze Kratel
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

This document outlines recommendations and cautions based on customer feedback with RackConnect.

### Recommendations

We recommend the following best practices for using RackConnect.

#### Use RackConnect network policies to make changes to network access for your cloud servers

When you need to open ports to or from your cloud server, or you need to
make changes to the software firewall, you *must* use the RackConnect
network policies section of the
[MyRackspace portal](https://my.rackspace.com/) to make the changes. If
you use the Firewall Control Panel, the RackConnect Automation that
services your installation could fail, a conflict in your network
policies might arise, and your rules will be removed when there are
updates to the system.

**Note:** The term *software firewall* refers to iptables in Linux and to
Windows Firewall in Windows.

#### Monitor your cloud server status during a rebuild

If you rebuild a server, you can monitor its automation status in the RackConnect Management Interface in the
[MyRackspace portal](https://my.rackspace.com/) or you can use the [API to monitor the automation status](/how-to/how-to-programmatically-determine-the-rackconnect-v20-automation-status-of-your-cloud).

#### Understand how your servers use RackConnect

To understand how RackConnect transfers data to your cloud
server, read the following description of the process:

-   The traffic flow is between the eth0/public interfaces
    (private IP) on your dedicated servers to the eth1/private
    interfaces (private IP) on your cloud servers.
-   The gateway for the cloud servers is configured on your dedicated
    firewall or load balancer.
-   Traffic speed is generally limited by the slowest network in
    your environment. A dedicated firewall or load balancer with a
    slower (less than 1 GB) network interface limits speeds, and
    dedicated servers (currently on a 1 GB network) can't take
    direct advantage of the higher network speed for our General
    Purpose and work-optimized cloud servers (currently on a
    10 GB network).
-   The eth0/public interface is disabled on your cloud servers
    and *all* traffic must flow from the eth1/private interface through
    your dedicated firewall or load balancer.

**Traffic flow between dedicated and cloud servers: RackConnect Firewall**

<img src="{% asset_path rackconnect/rackconnect-v20-best-practices/RC.Traffic.Flow_.png %}" class="image-full_width" />

**Traffic flow between dedicated and cloud servers: RackConnect Load Balancer**

<img src="{% asset_path rackconnect/rackconnect-v20-best-practices/RC.Traffic.Flow_.LB_.png %}" class="image-full_width" />

### Cautions

We recommend the following cautions when using RackConnect.

#### Do not change your root/administrator password before your cloud server is deployed

For several minutes after your cloud server is built, automation scripts
use the root/administrator password to establish a service account. The
service account is used to configure the server for RackConnect and implement updates to the server in the future. If the password is
changed before the service account can be created, the automation
fails. You may change the root/administrator password after your cloud
server is deployed. You know it is deployed when the server's status
shows a green circle in
the [MyRackspace portal](https://my.rackspace.com/) under **Network
&gt; RackConnect &gt; *yourCloudAccount* &gt; *yourCloudServer*** (*not* under the **Cloud Server** tab).

#### Do not delete or modify the "rackconnect" user

When RackConnect is implemented on your cloud servers, a user account
named "rackconnect" is created with administrator rights. Automation
scripts depend on this user and without it, the scripts fail. If this
user is deleted, it must be re-created.

**Linux users:** If you modify the `/etc/sudoers` file, keep all
references to the "rackconnect" user unchanged. If you change the login
authentication method from password authentication to key-based
authentication, still allow password authentication for the
"rackconnect" user.

**Windows users:** The user needs to be in the Administrators group. If
you update your server to be a domain controller, create a
ticket and inform the RackConnect team about this change. You must
manually create a "rackconnect" user account on the domain and add the
account to the Domain Admins global group. The RackConnect team will
add the **DOMAIN\rackconnect** account to the RackConnect system instead of
"rackconnect" to get RackConnect to work with your server.

#### Do not prevent the root user from logging in using Password Authentication via SSH before the completion of the initial RackConnect process

RackConnect does not support key-based authentication, so password
authentication must be allowed for the root user during the RackConnect
Automation process.

The PermitRootLogin entry must be set to YES in the ``sshd`` configuration file
during the initial process of connecting your Linux cloud servers
through RackConnect. After the "rackconnect" user has been added to the
server, and your server is properly deployed with RackConnect, SSH
access by the root user can be disabled because RackConnect uses the
"rackconnect" user from that point forward.

#### Do not modify the standard port used by SSH (Port 22)

If you modify the port number, RackConnect Automation breaks. Rackspace
does not have the ability to support non-standard SSH ports at this
time.

#### Do not mount an NFS on a dedicated hosted system before completion of the initial RackConnect process

The RackConnect initial process gives the cloud server access to the
dedicated network, so mounting a network file share before the process
is complete causes the process to fail.

#### Do not use overly complicated network configurations with RackConnect cloud servers

Complex networking configurations, such as bridged interfaces, will
likely break RackConnect Automation.

#### Do not enable SELinux on RackConnect cloud servers

Rackspace does not currently support Security-Enhanced Linux (SELinux).
If it is enabled, disable it or set it to Permissive mode.

#### Do not remove any basic system utilities like sed, awk, or ip from Linux cloud servers

Removing basic system utilities such as sed, awk, or ip, can break the
RackConnect Automation process.
