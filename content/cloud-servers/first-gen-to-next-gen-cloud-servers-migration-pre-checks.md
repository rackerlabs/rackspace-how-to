---
permalink: first-gen-to-next-gen-cloud-servers-migration-pre-checks/
audit_date:
title: First Gen to Next Gen Cloud Servers migration pre-checks
type: article
created_date: '2015-05-15'
created_by: David Hendler
last_modified_date: '2016-06-23'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Before the migration window is opened for each of your cloud servers,
a series of checks are performed to rule out common issues that you
might encounter with migrations. If your cloud server fails any of these
checks, a ticket will be created in your account so that you can fix the
issue before your self-migration window opens. This article will help
you understand and fix the results of these checks.

**Note:** The checks will not prevent your server from migrating, but may indicate issues that could contribute to the success or failure of a migration. If your server has not migrated correctly by the end of your window,
data loss will occur when your source server is decommissioned.

### SELinux check

The SELinux check indicates whether SELinux is currently enabled on your
server. SELinux interferes with several OS-level changes that are made
by the Next Gen migration process. If the check fails (that is, if
SELinux is detected), you don't need to take any action. However, note
that SELinux will not be automatically re-enabled after the migration.
You must enable it manually.

### Disk used check

The disk used check compares the amount of space used by your server
with the total disk size available to determine percentage usage. The
check thresholds are as follows:

-   Warning > 80% usage
-   Critical > 89% usage

Failing this check does not necessarily indicate that your migration
will fail. However, large amounts of data will cause your migration to
take significantly longer to complete. We recommend that before you
initiate your self-migration, you move any unnecessary data off the
server. You can use Rackspace Cloud Backup to perform this task.

You can verify the results of this check by running `df -h` on a
Linux cloud server, or by checking the properties of your disk from the
**My Computer** screen in Windows.

### Kernel overhead check

In a subset of the First Gen Linux infrastructure, the kernel and
initial RAM disk are handled by the hypervisor instead of within your
cloud server. Because the Next Gen environment uses only self-managed
kernels, the migration process must inject your shared kernel and
`initramfs` into your file system. This check ensures that there is
sufficient free space on your disk for the kernel to be injected.

The results for this check are pass/fail.

If this test fails, your migration will fail. To rectify this issue,
ensure that you have at least 5 to 10 GB free on your root partition.

### Inode count check

This check counts the actual number of files on your root file system.
The check thresholds are as follows:

-   Warning > 2 million
-   Critical > 3 million

Like the disk usage check, failing this check does not necessarily
indicate that your cloud server migration will fail, but an extremely
high inode count will substantially increase migration time on early
Linux cloud servers.

To verify this check, run `df -i` from your Linux cloud server.
Because there are no Windows cloud servers in our earliest environment,
this check is not necessary for Windows cloud servers.

To reduce this issue, back up any unnecessary data (Rackspace Cloud
Backup is good for this purpose), and remove it from the server.

### PV drivers check

The majority of the First Gen infrastructure and the entire Next Gen
infrastructure use XenServer to power the host machines for your cloud
servers. XenServer allows for a technology called *paravirtualization*,
which increases the performance of virtualized networks and block
devices in your cloud servers. For these paravirtualized devices to
function, your cloud server must have the correct kernel modules (Linux)
or device drivers (Windows) installed.

This check determines whether these drivers are present. The check runs
only against cloud servers that already have these drivers installed;
the rest of the Rackspace infrastructure will automatically install
these drivers during your migration.

The results for this check are pass/fail.

If this check fails, the drivers must be reinstalled before your
migration window. For Linux distributions, run the following script to
install or update these drivers.  This action needs to be completed by
a user with sudo access or as the user root:

    sudo curl http://437117ba0e2524fdae22-6a87f3acbfcde81a104bb18fbb8cb85f.r47.cf2.rackcdn.com/xen_tools_installer.sh | bash

For Gentoo, Arch, and FreeBSD, or if this installer fails, you must
install these drivers manually.  

### Nova agent check

In the XenServer infrastructure, the OpenStack&reg; guest agent is the same
as that used in the Next Gen Cloud Servers infrastructure. This nova
agent allows us to perform actions such as password resets and
networking configuration changes without having to log back in to your
cloud server. As with the PV drivers check, this check is run only
against cloud servers that should already have the agent installed.

The results for this check are pass/fail.

If your Linux server fails this check, run the following script as root
to reinstall the agent through SSH or your Java console:

    curl http://e584a326fabd876c3b87-5cc4f7b75bc093abc6d4ecc36a7bc696.r2.cf1.rackcdn.com/linux-nova-agent-installer.sh | bash

If your Windows server fails this check, follow these instructions:

1.  Download the following package to your computer:

        http://e584a326fabd876c3b87-5cc4f7b75bc093abc6d4ecc36a7bc696.r2.cf1.rackcdn.com/AgentService.zip

2.  Unzip the archive.

3.  In the folder that is created, run the `installagentservice.bat`
    script from an administrator command prompt.
