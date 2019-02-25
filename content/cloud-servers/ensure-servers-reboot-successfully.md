---
permalink: ensure-servers-reboot-successfully/
audit_date:
title: Ensure servers reboot successfully
type: article
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-01-21'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shares tips that help you ensure that server reboots are fast
and minimally disruptive.

### Ensure that server backups are configured and running

We recommend that you use backups to keep your data up to date. Rackspace
[Cloud Backups](https://www.rackspace.com/en-us/cloud/backup) run a
differential backup on a set frequency. You can set a cloud backup to run
on any number of directories.

**Important**: On performance cloud servers that have a data disc, the data
partition is not included in any image snapshots that you take. Ensure that
these data partitions are included in your backup scheme.

#### Back up Linux

If you are running a Linux&reg; server, you might need to back up the
following directories:

- **/home**
- **/root**
- **/etc** (This directory contains most of your configuration files.)
- **/var/www** (This directory often contains your websites and files.)
- **/var/lib/mysqlbackup** (Servers built by using Rackspace Managed
  Operations have an automated process that automatically runs a `mysql dump`
  to this folder.)

#### Back up Windows

If you are running a Windows&reg; server, we recommend that you back up
locations where your data might be stored, such as the following locations:

- **C:\inetpub**
- **C:\Users**
- Any additional drives such **D:** and **E:**

### Back up live databases

Cloud Backup does not back up live databases. You must back these databases up
by using Microsoft SQL Server Management Studio.

We recommend that you carefully consider your specific applications and their
backup needs.

### Ensure that services are configured to start after boot

When you install a service, it is not automatically configured to restart
after the server is rebooted. You must configure services to restart after the
server reboots. To learn how to perform this task, select the following
resource that corresponds to your server's operating system (OS):

- Windows: [Prepare to migrate a Windows server](https://support.rackspace.com/how-to/prepare-to-migrate-a-windows-server/#ensureAutoStart)
- Ubuntu&reg;: [UPDATE-RC.D(8)](https://manpages.debian.org/wheezy/sysv-rc/update-rc.d.8.en.html)
- RHEL&reg; and CentOS&reg;: [Using the chkconfig utility](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s2-services-chkconfig)

### Ensure that iptables or Windows Firewall rules are saved and configured to restart on reboot

It is important to ensure that the firewall rules that you configure stay
active upon reboot. This section shows you how perform this task.

#### SSL passphrase

We do not recommend using a passphrase when you generate a Secure Sockets
Layer (SSL) certificate. However, if you already have a passphrase in place
for your SSL certificate, you need to input that into the server when it
reboots. The services on the server cannot start until you enter that
passphrase.

#### Ensure that Cloud Block Storage volumes attach on reboot

If you have data on a Cloud Block Storage volume attached to a next generation
cloud server, you must ensure that any volumes are properly connected after a
reboot.

To do this, you need to add your volume to the static file system information
in the `fstab` file. You cannot attach Cloud Block Storage volumes to a first
generation cloud server.

**Note**: If you are using Windows, mounted block storage should remain
mounted after the server reboots.

### FSCK (File system consistency check)

A file system consistency check (`fsck` operation) generally runs
automatically at boot time.  Two common triggers automatically
execute an `fsck`. Either the OS detects that a file system is in an
inconsistent state (due to a non-graceful shutdown such as a crash or loss of
power), or after the number of times that the system is mounted passes a
threshold.

After you reboot your server, this check might happen automatically.  If it
does, it might increase the delay for your server coming back online. While
delays are usually negative experiences, in this case the delay might save
your server. We recommend that you allow the file system check to complete
even though it might cause delays. If you attempt to reboot the server again,
it resumes the file system check and extends the delay.

### Test

So that you know how your servers and other cloud products react during and after a reboot, we strongly recommend that you take a few minutes to test the entire process
of getting your environment back up and running.

We recommend that you perform testing during the development phase or on
separate servers to limit any customer impact.

### Mitigate the impact of a reboots

Use the tips in this section to reduce the impact of server reboots.

***Horizontal scaling***

One of the best ways to prevent the prolonged impacts of a reboot is to distribute
your application over multiple redundant, tiered servers. This approach, which
is called _Horizontal scaling_, is a great way to minimize the risk of
downtime due to a single server going down.

***Custom error pages***

Using a cloud load balancer gives you the ability to set a custom error page
in the event that a server connected to the load balancer is offline or
unresponsive. When you proactively configure that error page, a visitor to
your site receives an error message that is specific to your unique
application.
