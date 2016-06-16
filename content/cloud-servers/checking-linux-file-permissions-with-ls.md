---
permalink: checking-linux-file-permissions-with-ls/
audit_date:
title: Check Linux file permissions with ls
type: article
created_date: '2011-11-23'
created_by: Jered Heeschen
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article focuses on the basics of how to use the `ls` command to
check Linux file permissions and what it can tell you about a file's
type and permissions.

### ls command

You use the `ls` command (the first letter is a lowercase L) to see what
files are in a directory. When run by itself, `ls` returns a list of the
current working directory (essentially, the directory you are in). You
can also specify a directory to list. For example, a list of the first
few files in the /etc directory on a Gentoo system might look as
follows:

    $ ls /etc
    DIR_COLORS            gentoo-release      man.conf            runlevels
    adjtime               gpm                 mime.types          sandbox.conf
    apache2               group               mke2fs.conf         sandbox.d
    bash                  group-              modprobe.d          scsi_id.config
    ca-certificates       host.conf           modules.autoload.d  securetty
    ca-certificates.conf  hosts               modprobe.d          scsi_id.config
    ...

#### ls -h

The `-h` option changes the way file sizes are displayed. Instead of
displaying file sizes in raw bytes, `-h` displays them in the
human-readable format of kilobytes, megabytes, and so on. Other linux
tools such as df also support this flag with `df -h` to show current disk 
usage in a easier to read format.

#### ls -l

To get more information about the files in a directory, use the `-l`
option with ls. The following example shows a result of using the `-l`
option:

    $ ls -l /etc
    total 492
    -rw-r--r-- 1 root root  4468 Nov 19  2009 DIR_COLORS
    -rw-r--r-- 1 root root    10 Jun 30 03:29 adjtime
    drwxr-xr-x 4 root root  4096 Jun 30 03:44 apache2
    drwxr-xr-x 2 root root  4096 Nov 19  2009 bash
    drwxr-xr-x 3 root root  4096 Nov 19  2009 ca-certificates
    -rw-r--r-- 1 root root  5955 Nov 19  2009 ca-certificates.conf
    drwxr-xr-x 2 root root  4096 Jul  5 20:37 conf.d
    drwxr-xr-x 2 root root  4096 Dec  3  2009 cron.d
    drwxr-x--- 2 root root  4096 Dec  3  2009 cron.daily
    -rw-r--r-- 1 root root   220 Dec  3  2009 cron.deny
    drwxr-x--- 2 root root  4096 Dec  3  2009 cron.hourly
    drwxr-x--- 2 root root  4096 Dec  3  2009 cron.monthly
    drwxr-x--- 2 root root  4096 Dec  3  2009 cron.weekly
    -rw-r--r-- 1 root root   611 Dec  3  2009 crontab
    ...

The files names are on the far right side of each line, and the file
details precede the names. The details you need to know in order to
check permission are the series of letters and dashes on the far left of
each line and the columns that have root in them. The rest of this
article explains how to interpret and use these details.

However, before going into those details, you should know about one
other option that can be used with `ls` to return a comprehensive list
of files, `-a`.

#### ls -a

When you use the `ls` command, if you want to see any files whose names
start with a period, you must use the `-a` option. For example, if you
use only `ls` to look at a directory listing for root's home directory
on a clean Linux installation, no files are returned:

    $ ls /root

However, if you add the `-a` option, the ls command returns a list of
files:

    $ ls -a /root
    .  ..  .bash_history  .bashrc  .profile  .viminfo

Files that start with a period are usually system files and application
settings files, and you usually don't want them included in directory
lists. But it's important to know that they're there and how to see
them. The .bashrc file is especially useful to know about because it
contains user environment settings that you can change.

If you combine the `-l` and `-a` options into `-la`, you get all the
details of those hidden files:

    $ ls -la /root
    total 24
    drwxr-xr-x  2 root root 4096 2009-12-16 01:10 .
    drwxr-xr-x 23 root root 4096 2010-02-18 10:14 ..
    -rw-------  1 root root  123 2010-01-21 15:49 .bash_history
    -rw-r--r--  1 root root 2227 2007-10-20 11:51 .bashrc
    -rw-r--r--  1 root root  141 2007-10-20 11:51 .profile
    -rw-------  1 root root  868 2009-12-16 00:47 .viminfo

Consider the single period and double period in both directory lists:

-   The single period (.) refers to the directory itself. If you type
    `cd .` the directory changes back into the directory you started
    with (in the example, `/root`). Knowing this is convenient when
    you're running a command and you want it to refer to your current
    directory (for example, when you want to copy a file there).
-   The double period (..) refers to the parent directory. If you type
    `cd ..` the directory changes to the one above the one you're in, in
    the file system hierarchy. In the preceding example, typing `cd ..`
    would take you above `/root` to `/`, the very top of the hierarchy.

### Permission details

This section examines the series of letters and dashes that define the
file permissions.

#### The first character: file type

In the preceding examples, the first character in each list was either a
dash (-) or the letter `d`.

-   A dash (-) indicates that the file is a regular file. That's the
    sort of file that you'll usually work with when you're saving some
    text or running a command.
-   The letter `d` indicates that the file is a directory, which are
    basically a special kind of file. Knowing that makes it easier to
    think of that first slot in the full directory listing as the *file
    type*.

#### Another file type: symlink

A special file type that you will see frequently is a symlink, sometimes
called a soft link. It begins with a lowercase `L`, as shown in the
following example:

    lrwxrwxrwx 1 root root      4 Jun 30 03:29 sh -> bash

A symlink is a pointer to another location in the file system. In the
example, `sh -> bash` indicates that the link is named `sh` and it
points to a file named bash. This means that if you call `/bin/sh` (in a
script, for example), you will actually run `/bin/bash`.

A symlink doesn't have to point to something in the same directory, as
shown in the following example:

    lrwxrwxrwx 1 root root     20 Jun 30 03:29 pgawk -> /usr/bin/pgawk-3.1.6
    lrwxrwxrwx 1 root root     16 Jun 30 03:29 pidof -> ../sbin/killall5

In this example, the first symlink uses an absolute path to reference
its target, and the second one uses a relative path.

#### The next three characters: user permissions

The next three letters in a file list cover the `user` category of
permissions. Consider the following example:

    drwxrwxr-x 2 root mail 4096 Dec  3  2009 mail

After the letter `d`, which tells us that the file is a directory, are
the letters `rwx`. These letters are abbreviations of the types of
permissions that can be set:

-   `r` refers to the read permission.
-   `w` refers to the write permission.
-   `x` refers to the execute permission.

#### The second trio of characters: group permissions

The next trio of characters (also `rwx`) shows the permissions for the
`group` category, and the letters mean the same thing as they did for
the user. For this directory, the group has as many permissions as the
owner (`rwx`).

#### The third trio of characters: other permissions

The last trio of characters (`r-x`) shows the permissions for the final
category, `other`. In this example, `other` does not have write
permission for the directory, which is indicated by the dash (-).

Notice the specific order to the permissions in a triplet: read, write,
execute. A dash in place of a letter for a permission means that
category doesn't have that permission.

To summarize:

-   The first character in the directory list refers to the file type.
-   The next three characters refer to user permissions.
-   The next three characters refer to group permissions.
-   The final three characters in that block refer to other permissions.

#### The first number

After the permissions, there's a number. It has nothing to do with file
permissions, so you can ignore it.

#### Owner and group

After the number, two names are listed. In the preceding example, the
names are root and mail.

The first name is the name of the owner of the file. The `user`
permissions apply to that user when it attempts to access the directory.
In this case, the user root.

The second name is the file's group. The `group` permissions apply to
any user (that is not the file owner) in the same group as the file. In
this case, those permissions apply to anyone in the mail group.

### Summary

Being able to check the permissions on a file is useful. It is where
troubleshooting can start - ensuring that a user can read a particular
file, for example, or examining a directory structure to ensure that
users can follow the hierarchy to the files that they need.
