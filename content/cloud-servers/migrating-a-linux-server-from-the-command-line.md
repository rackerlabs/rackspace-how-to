---
permalink: migrating-a-linux-server-from-the-command-line-1/
audit_date: '2016-08-03'
title: Migrating a Linux server from the command line
type: article
created_date: '2011-03-16'
created_by: Jered Heeschen
last_modified_date: '2016-08-09'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Migrating your data from one Linux server to another is simple only if you've been running a simple server. If you have many interdependent services or a highly customized setup, then re-creating the environment from scratch is an involved process. The process is less complex if you can copy over just the files that you need without worrying
about overwriting system files specific to the new server.

This article describes how to prepare for a migration and the tools that will make the job go easier.

### Full migration versus package migration

The first choice you need to make is whether you need to migrate the
whole server, configuration and all, or if you can just copy over the data for a couple services.

This article describes the process for a full migration. If you know
you need to copy more than just a few data files this is the most
straightforward approach.

If you prefer a per-package approach, see [Migrate a Linux server per-package from the command line](/how-to/migrating-a-linux-server-from-the-command-line-2).

### Preparing the new server

Confirm that the destination server is accessible via SSH from the origin server. Also, enable root logins via SSH
on the destination server (in the **/etc/ssh/sshd_config** file) so that rsync can replace system and application files.

Verify that rsync is installed on both the original server and the
destination server (the package name is usually rsync). Run the command `which rsync` to verify that it's installed where you can run it.

A full migration is more likely to succeed if the destination server is as similar to the original server
as possible. They should use the same distribution, system architecture, kernel version, and software versions.

#### Distribution

Run the same distribution on each server, and try to match the version of the distribution. The location of system files isn't always consistent across different distributions, and sometimes new versions of a distribution move some files around. If you perform a straight copy without matching the distribution, you might have an unstable server.

If you want to combine your server migration with a distribution upgrade, complete the migration before performing the upgrade.

#### Architecture

Both servers should use the same architecture. You can check the architecture on Linux servers by using the `uname -a` command:

    $ uname -a
    Linux demo 2.6.35.4-rscloud #8 SMP Mon Sep 20 15:54:33 UTC 2010 x86_64 Quad-Core AMD Opteron(tm) Processor 2374 HE AuthenticAMD GNU/Linux

After the date (which ends in `UTC 2010` in the example) is a code that represent your system's architecture. In this case, `x86_64` indicates an x86 system running a 64-bit architecture. If you instead see
`i686` for the architecture, your system is 32-bit.

If the architectures don't match, the copied programs won't run. For example, software compiled for 32-bit generally does not work well on a 64-bit system. If the architectures don't match, you need to migrate on a per-package basis instead.

#### Kernel version

Try to use the same kernel version on both servers. Sometimes a new kernel adds or changes features, so a different kernel can complicate the migration.

You can check the kernel version by running the `uname -a` command, as in the preceding section. The kernel version is listed after the host name, so in the preceding example, the kernel version is `2.6.35.4-rscloud`.

It's generally not a good idea to copy kernels between servers. If you
compile or install your own kernel (as opposed to using one provided by
your hosting service), it's safer to perform that process manually on the
destination server.

#### Software versions

Try to match the versions of any software that is already installed on the destination to the versions that you're running on the original server. The easiest way to ensure that both systems are running the same
versions of any common packages is to run an update through your package
manager before the migration.

### Optimizing before copying

The more files that you have on the origin server, the longer it will take to migrate to the destination server. Remove any temporary or cache files that you don't need, or add their directories to the exclude file. Check the sizes of your log files and, if you can, archive or delete older logs.

Much of what happens when you resize a virtual server
is similar to what happens when you use rsync to migrate from one server to
the other. As a result, most of the tips in the [article about speeding up rsync](/how-to/speed-up-rsync-when-migrating-a-linux-server-from-the-command-line) also apply here.

### Next step

You've compared the origin and destination servers to each other and
prepared your file systems for the copy.

For information on running rsync manually, go to the [article on migrating with rsync](/how-to/migrating-a-linux-server-from-the-command-line-2) to start the process.
