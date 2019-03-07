---
permalink: linux-file-permission-concepts/
audit_date: '2019-03-07'
title: Linux file permission concepts
type: article
created_date: '2011-11-23'
created_by: Rackspace community
last_modified_date: '2019-03-07'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article explores the core concepts of Linux&reg; file permissions. It starts
with the basics and moves on to more advanced topics. It also provides some
practical examples. To get an introduction to file permissions and to learn how
to view file permissions, see
[Check Linux file permissions with ls](https://support.rackspace.com/how-to/checking-linux-file-permissions-with-ls/).

### File access

In a multiuser environment like Linux, it’s important to control which users
can modify or delete various files on the system. This control isn’t just a
necessary security precaution&mdash;it prevents catastrophic accidents. If a user
can only affect a minimum number of files, there’s less chance that a mistyped
command, or a typo in a script, destroys an essential file or publishes
confidential information to a public web site.

Before exploring *how* to manage file access, you first need to understand the
concepts of file ownership and file permissions. Note that ownership and
permissions also apply to directories because directories are basically a
special kind of file as far as the filesystem is concerned. Even though there
are some differences for directories, the basic concepts are the same, so most
file permission concepts or commands discussed in this article apply to
directories, too.

### Ownership basics

Every file and directory on a Linux file system has an owner. The owner of a
file gets to assign permissions for the file. If user `mom123` owns the file
**lawndarts**, you need permission from `mom123` to play with **lawndarts**. She
might give you access, deny you access to it altogether, or just let you look at
**lawndarts** without getting to play with it.

The user who owns a file gets to set or change its permissions, determining who
(including even the owner) can read the file, execute it, change it, or delete it. It’s
a simple privilege, but it has a far-reaching impact.

#### File group

While every file has a user who owns it and can control its permissions, every
file also belongs to a *group*. A group describes a set of users who share file
permissions that might be different from the typical user. A user can belong to
more than one group, but a file can be in only one group.

Group ownership is a handy way to let a file owner assign one set of permissions
to a file for people he doesn’t know (“You can look, but can’t touch.”) and
another set of permissions for people he trusts with the file (“You can look and
touch. But no one else can.”).

#### Changing ownership

A typical user can control a file’s permissions but can’t assign ownership to
another user. To change ownership, you need to use the superuser, commonly known
as `root`.

If you aren’t logged in as `root`, you should use the `sudo` command to use root
privileges to change a file’s owner.

The file system is more flexible about changing a file’s group. You can still use
root privileges to change the group, but if the file's owner belongs to the
target group, the file’s owner can also switch a file to the target group.

##### The chown command

The main command used to change a file’s owner or group is `chown`. The most
common syntax used with `chown` is shown in the following example:

    chown user:group file1 file2 file3

The `user` in the preceding example is the user you want to own the file, and
the `group` is the group you want the file to belong to. A colon separates the
two elements of the command. Following the user and group pair, you list one or
more files affected by the change.

**Note**: `chown` also accepts a period in place of the colon when separating
the user and group names. Use of the period is outdated but still supported, and
you might see it in old scripts or documentation. You should use the colon, if
possible.

You can omit either the user or the group but not both. If you want to change
only the owner for a file, you can use the following syntax:

    chown user file1

If you have a user name that includes a period and you don’t want to change the
group, include the colon after the user as shown in the following example:

    chown john.smith: file1

If you want to use `chown` to just change the group, make sure to include the
colon before the group name, even though you won’t be specifying a user as shown
in the following example:

    chown :group file1

##### The chgrp command

If you prefer not to use the colon when you just want to change the group for a
file, you can use `chgrp` as shown in the following example:

    chgrp group file1

This works just like `chown :group file1`, but it’s easier to type and read.

##### The -R option

If you want to change the owner a particular directory and its files and
subdirectories, use the `-R` option to make a recursive change as shown in the
following example:

    chown -R user:group directoryname

The `-R` option works with `chgrp` as well. With both commands, the change
applies first to the parent directory and then iterates through everything
inside the directory (including subdirectories).

##### Symlinks

Symbolic links (symlinks) require special handling for `chown` or `chgrp`
operations. A symlink is an alias for another file, similar to a shortcut in
Microsoft&reg; Windows&reg;. Rather than applying the change to the symlink
itself, the file system applies the change to the target of the symlink. Thus,
if the symlink **link** points to the file **thefile.txt**, consider the
following command:

    chown user:group link

When that command executes, the system changes the owner and group for the
target file **thefile.txt**. The ownership of the symlink, **link** remains
unchanged.

If you want to change the owner or group of a symlink, use the `-h` flag for
`chown` and `chgrp`, as shown in the following example:

    chown -h user:group link

### Permissions basics

There are two parts to permissions: what someone is allowed to do with a file,
and who that *someone* can be.

#### What is allowed

There are three categories of user actions for files and directories: read,
write, and execute.

##### Read

The read permission for a file controls who can open or view a file's contents.

The read permission for a directory controls whether or not you can see a list
of the files in the directory, however, read permission is not enough. You also
need execute permission for the directory to see the file list.

##### Write

The write permission for a file controls whether or not you can change the file’s
contents.

The write permission for a directory controls whether or not you can add, delete,
or rename files in that directory. To exercise your write permissions in a
directory, you also need execute permission for the directory.

**Note**: Only the write permission on the enclosing directory affects whether
or not you can rename or delete a file. Some operations, like `rm`, do a check
 and prevent you from deleting a file you don’t own. There’s nothing stopping
 another program that doesn’t have a similar check built into it from deleting
 a file you can’t write to and don’t own.

##### Execute

The execute permission for a file allows you to run that file from the command
line. To run any command (`chown`, `ls`, `rm`, and so on), you have to have
execute permission for the file representing that command. If you try to
run a command and get a `permission denied` error, you don’t have execute
permission.

The execute permission for a directory lets you perform an operation in that
directory or to change your working directory (`cd`) to that directory.

Even if you have read permission for a directory you can’t actually run the `ls`
command in that directory to see the list of files unless you also have the
execute permission. Otherwise, when you try to run `ls`, you are blocked before
the system can even check for read permission. To affect anything inside a
directory, you need have execute permission for the directory.

#### Who can do what

Now that you know what permissions are available, consider the categories used
to control who gets affected by those permissions. The categories are
user, group, and other.

##### The user category

The *user* permission category refers to permissions that apply to the owner of
the file. It’s the only category that specifically targets only one user because
only one user can own the file.

##### The group category

The *group* category refers to users that are in the same group as the file. If
the file is in the group **devs**, and the file has write permission for its
group, that would mean that users in the **devs** group have write access to the
file.

##### The other category

The *other* category is a catch-all for everyone who doesn’t fall under the user
or group categories. You use this category to determine whether other users
can read the file, edit it, or run it as a command.

#### Category priority

It’s important to note that permission categories are applied in the order
user, group, other. The first permission category the system finds for a user
is the only one it applies. If you’re the owner of the file, your permissions
are whatever is set for the user, so the system won’t bother checking the group
or other permissions for the file&mdash;it has already found what it’s going to
use.

This concept is important because if you set a permission for other, that
permission is not applied to the file’s owner or to anyone in that file’s group.
Those users get the permissions set in the user or group categories, respectively.

If you don’t set a read permission on a file for the group category but do set
it for the user and other categories, users in the file’s group do not have read
access, but everyone else does.

### Permissions plus users

Combining ownership, user categories, and permissions provides many options for
controlling access to files and directories. The following examples show some
possibilities:

- If you make a file read-only for the other category but let the user and
  group categories write to it, then you can establish a group of editors for a
  file while still allowing other users to read it. Just add the privileged users
  to the same group as the file.

- If you set read permission for the user category and remove it from the group
  and other categories, you ensure that only the owner of the file can view its
  contents.

- When you set execute permission for a file, you allow it to be run as a
  command. If you have a command you only want specific users to be able to run,
  remove the execute permission on the file for the other category.

Directories get the same treatment. Many system log directories are set to read
and execute by just  the user category (often `root`) and exclude those
permissions from other categories to ensure that only someone with superuser
access can view the logs, no matter what permissions are set on the files
themselves.

### Why root exists

The root user exists to provide access and control. The root user can change
the ownership and permissions of any file or directory on the system. That user
can also interact with files and directories as if it has the most permissive
permissions available.

Even if the user can’t read a file but the other category can, root can read it.
Similarly, if user can read the file but other can’t, root can still read the
file. But if no category has read permission (not user, not group, and not other),
then root can’t read the file either.

This behavior is most useful for files you don’t want to change accidentally.
If write permissions are removed from all categories for a file, then not even
root can change the file’s contents without changing those permissions.

### Conclusion

With a basic understanding of how file permissions work in Linux, you are
better prepared to secure files from accidental or malicious harm. You can
also keep an eye out for errors that are caused by restrictive file permissions,
such as an application being unable to write to its log (caused by having no
write permission for the user that owns the process), or a web server that is
unable to serve an html file (caused by having no read permission, or the
directory doesn’t have execute permission).
