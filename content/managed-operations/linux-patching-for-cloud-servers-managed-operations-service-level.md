---
permalink: linux-patching-for-cloud-servers-managed-operations-service-level/
audit_date: '2017-01-13'
title: Linux patching for Cloud Servers with the Managed Operations service level
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2017-01-13'
last_modified_by: Laura Santamaria
product: Managed Operations
product_url: managed-operations
---

Linux patching comes directly from vendors or distribution communities. The
exception is Red Hat Enterprise Linux, which feeds updates through a data
center&ndash;specific proxy server. The proxy server's authoritative data is the
Managed Red Hat Network server. Patching delays in a Managed Red Hat Network
server also cause update delays in the proxy servers for the Managed Operations
service level. For example, the upgrade to Red Hat Enterprise Linux 5.5, the
fifth update release to Red Hat Enterprise Linux 5, was delayed for several
months after it was released by Red Hat.

This table states the patching mechanisms and Rackspace-specific servers used in
Managed Operations for different distributions. In the patching server URL,
substitute the data center code, such as `dfw1` or `ord1`, for `{dc}`.

Distribution | Patching mechanism  | Patching servers | Frequency | Configuration
--- | --- | --- | --- | ---
Ubuntu | `unattended-upgrades` | `snet1-{dc}.mirror.rackspace.com`<br/>`snet2-{dc}.mirror.rackspace.com`<br/>`Howbackup:archive.ubuntu.com` <br/>`security.ubuntu.com` | Nightly between 0000 and 0400 server time | `/etc/apt/apt.conf.d/02periodic`<br/>`/etc/apt/apt.conf.d/50unattended-upgrades`
Red Hat Enterprise Linux | `yum-cron` | `snet1-{dc}.mirror.rackspace.com`<br/>`snet2-{dc}.mirror.rackspace.com`<br/><br/>For EPEL and IUS:<br/>`proxy1.{dc}.slicehost.com` or `proxy2.{dc}.slicehost.com` | Nightly between 0000 and 0400 server time | `/etc/yum-cron`<br/>`/etc/sysconfig/rhn/up2date`
CentOS | `yum-cron` | `snet1-{dc}.mirror.rackspace.com`<br/>`snet2-{dc}.mirror.rackspace.com` | Nightly between 0000 and 0400 server time | `/etc/yum-cron`
