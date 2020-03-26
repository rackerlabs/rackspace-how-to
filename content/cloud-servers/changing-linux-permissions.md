---
permalink: changing-linux-permissions/
audit_date: '2020-03-26'
title: Changing Linux permissions
type: article
created_date: '2020-03-19'
created_by: John Abercrombie
last_modified_date: '2020-03-26'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to change permissions on a Linux&reg; cloud server by using the `chmod` command.

### What is the chmod command?

Put simply, `chmod` stands for *change mode* and is used to set file or directory permissions in Linux. `chmod` is used by the root user to determine what users, groups, and others can access files or directories.

Typically, the chmod command will be used in the following formats:

    $ chmod (options) (permissions) (file name)
    $ chmod (permissions) (file name)

As illustrated above, the use of options with the `chmod` command is optional. The second example is used most frequently. Without an option present, `chmod` modifies the permissions of the file or directory designated in the command.

### Permissions

In a Linux system, permissions are used to refer to the owner of the file or directory (user), the group that owns the file or directory (group), and anyone else who would access the file or directory (others).

There are two ways to state these permissions:

  - alphanumeric characters (r, w, x)
  - octal numbers (0-7)

For example, you have a file called **example.txt** and you want to set the following permissions:

  - The user can read, write, and execute the file
  - The group members can read and execute, but not write the file
  - Any others can only read the file

The following command option will set your desired permissions to **example.txt**:

    $ chmod u=rwx,g=rx,o=r example.txt

This option uses alphanumeric characters to denote users who can access the file as well as the permissions you want to set for these designated users.

  - The letter 'u' = user
  - The letter 'g' = group
  - The letter 'o' = other
  - The letter 'r' = read
  - The letter 'w' = write
  - The letter 'x' = execute

The following example shows how Linux portrays the permissions granted in the previous example:

    -rwxr-xr--

The first three letters (rwx) are the user’s permissions. The second three (r-x) represent the group’s permissions, and the last three (r--) represent the others’ permissions.

Next, we have the octal option for our **example.txt** exercise:

    $ chmod 754 example.txt

In this example, the numbers 7, 5, and 4 each present the user, group, and others permissions. The first number position determines the user's permission, the second number determines the group's permissions, and the third number assigns the permissions for others.

These numbers are not randomly selected. They are determined from adding together the numbers 4, 2, 1, and 0.

  - 4 stands for 'read'
  - 2 stands for 'write'
  - 1 stands for 'execute'
  - 0 stands for 'none'

Therefore, in our previous example, the 7 is determined from the combination of read (4), write (2), and execute (1). 4 + 2 + 1 = 7. The 5 is taken from adding read (4), none (0), and execute (1). 4 + 0 + 1 = 5. Lastly, the 4 is a combination of read (4), none (0), and none (0). 4 + 0 + 0 = 4.

### Options

You typically don't need to use options in the `chmod` command, but in case you do, the following
options can be used with `chmod`:

- `-c`, `--changes` = gives a verbose output when a change is made
- `-f`, `--silent`, `--quiet` = silences most error messages
- `-v`, `--verbose` = outputs a detailed message for every action processed
- `--no-preserve-root` = ignores the deference normally given by default to the / (root) directory
- `--preserve-root` = does not operate recursively on the / (root) directory
- `--reference=RFILE` = sets permissions to match those of RFILE, ignoring any specific MODE
- `-R`, `--recursive` = changes made to files or directories are applied recursively
- `--help` = displays the help message, then exits
- `--version` = displays version information, then exits


### Extras

In addition to the permissions already discussed, there are three other "special" permissions that the `chmod` command is used to set in Linux.

  - SUID (Set User ID)
  - SGID (Set Group ID)
  - Sticky Bit

#### SUID

This permission is represented as an `s` in the user’s `rwx` permission set, replacing the `x`, as shown in the following example:

    $ chmod 4755 /usr/bin/passwd
    $ ls -lh /usr/bin/passwd
    -rwsr-xr-x.  1  root  root  28K  Mar  10  2020  /usr/bin/passwd

As explained earlier in the article, the first three letters in `rwsr-xr-x` represent the user’s permissions. Notice that instead of an `x` there is an `s` in the user’s three permission slots. Instead of showing `x` for execute, there is an `s` in the execute spot. Why is that?

**Note:** This permission would be represented as the 4 in front of the usual octal permission set. So instead of `755`, the permission would be written as `4755`.

A word of warning is needed before explaining what this special permission does. This permission should be granted with extreme caution.

The reason for such caution is this particular permission allows a user to execute a binary program as though they were the owner of that program even though they are not. The most well-known example of this is the `passwd` command.

In the case of `passwd`, the user is able to execute the program even though the binary program is owned by root. However, because `passwd` is set as a SUID by default, it always executes as the root user.

If a regular user was given SUID permissions on other binary programs, they could execute commands as root without having ‘root’ permissions. It allows for an abnormal escalation of privileges that usually require sudo privileges to access.

A precaution is already built into the Linux OS in the form of only binaries can be effected by SUID permissions. It has no effect on scripts.

#### SGID

This permission is represented as an `s` in the group’s `rwx` permission set, replacing the `x` in t `r-x` segment, shown in the following example:

    $ chmod 2755 /usr/bin/screen
    $ ls -lh /usr/bin/screen
    -rwxr-sr-x.  1  root  screen  465K  Feb  10  2020  /usr/bin/screen

This `s` is found in the second group of three permissions, which we discovered is the group’s permissions earlier when written in alphanumeric style. In the octal rendering, this permission would be denoted as a `2` in front of the other three octal permission numbers. Instead of `755`, this would be written as `2755`.

Like SUID, SGID permissions only work on binaries. They do not work on scripts. As to what SGID does, it allows unprivileged group members to execute a binary as if they were the root user.

This permission is typically used on directories where members of the group need to have access within the directory shared by the group. Any files created in this directory have the same group owner no matter which group member created the file.

#### Sticky Bit

This permission is represented by a `t` in the others’ `rwx` permission set, replacing the `x`, shown in the following example:

    $ chmod 1777 /tmp
    $ ls -lhd /tmp
    drwxrwxrwt.  8  root  root  4.0K  Nov  6  14:42  /tmp

Notice the `t` in the last set of three letters. The octal equivalent of the `t` would be a `1` in front of the three permission octals. Instead of `777`, it would be written as `1777`.

What does this sticky bit do? Typically, this permission is used on a **tmp** directory, and its function is to prevent users from deleting files owned by other users. Usually, if a group has write access to a directory, any user within that group can delete any file within that directory. The sticky bit permission halts that. Only the creator of the file can delete it.

It is considered best practices to set the sticky bit permission on any directory whose ‘others’ permission is octal 7 (read, write, execute). In our `754` example, you would want to use the sticky bit permission if the octals were `757` where 7 is the third octal (representing the others’ permissions).

### File / Directory Permissions Cheat Sheet

Following is a quick cheat sheet explaining each part of the example output:

    -rwxrw-r--  rack  space  123G  Feb  03  15:36  example.txt

- `-`: The ‘-’ at the beginning tells you that this is a file. A ‘d’ at the beginning would indicate a directory.
- `rwx`: The first three letters represent the file owner’s permissions, and mean the owner can read, write, and execute the file example.txt
- `rw-`: The second three letters represent the group’s permissions, and mean the group members can read and write to the file, but they cannot execute it.
- `r--`: The third three letters represent the others’ permissions, and mean that anyone who isn’t the owner or in the group that owns the file can only read the file. They cannot write to the file or execute the file.
- `rack`: The file’s owner
- `space`: The group owner
- `123G`: The size of the file in gigabytes. An ‘M’ would denote megabytes, and a ‘K’ would denote kilobytes.
- `Feb 03 15:36`: This denotes the date and time that the file was last modified.
- `example.txt`: The name of the file. If this were listed as ‘/example’, it would be the name of the directory.
