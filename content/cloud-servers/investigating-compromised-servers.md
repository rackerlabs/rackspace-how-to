---
permalink: investigate-compromised-servers/
audit_date:
title: Investigate compromised servers
type: article
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2019-01-17'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article lists the tools that are available for performing an analysis of a compromised server. (Cleaning the 
compromised server is outside of its scope.) Using these tools helps you determine the following information:

- The point of entry
- The origin of the attack
- Which files are compromised
- The level of access that the attacker obtained
- The audit trail of the attacker's footprints

Many different types of compromises can exploit a UNIX&reg; server. Attackers might launch a brute force attack, guess a 
weak password, or attempt to use known software vulnerabilities in the hope that the server 
isn't on a regular patch schedule. It's important to understand how the machine was compromised so that you can 
determine the extent of the damage to your server and other hosts that are accessible to the compromised machine.

For most root-level compromises, the most straightforward recovery approach is to perform a clean installation of the server and restore any critical data from backups. However, until you know the entry point of the compromise, this step might not be sufficient because you need to understand the compromise so that you can properly close the security hole.

### Document the attack

When you're notified that a system under your control might be compromised, ensure that you obtain as much information as possible from the reporter, including the following items:

- How the initial problem was found
- The estimated time that the compromise occurred
- Whether the server has been modified since the compromise was detected
- Anything else that the reporter says that is important

**Important**: If you plan to involve law enforcement, it is imperative that no additional actions are taken on the server. The server must remain in its current state for evidence collection purposes.

If you choose to proceed with the investigation, document anything that you find on the server. This step can be as simple as copying and pasting a command and its results.

### Investigation tools

In some compromises, the attacker manages to delete all important log files to hide their tracks. However, this doesn't always occur. As a result, the log files leave valuable clues regarding what the attacker did to the server. The log files might also help you determine if the attack was a basic web hack or a root-level compromise. Use the commands in this section to try to find clues to help you unravel the extent of the compromise.

#### last command

The `last` command lists the sessions of users who recently logged in to the system. Its output includes the timestamps and hostnames, and indicates whether the user is still logged in. If an odd Internet Protocol (IP) address appears in the output, you can cross-reference it against a brute force Secure Shell (SSH) attack in the `/var/log/messages` or `/var/log/secure` directory. This step might indicate how the attacker gained entry, what username they used to gain access, and if they were able to escalate their privileges to `root`.

#### ls -lart command

The `ls -lart` command outputs a time-ordered list of files and directories that you can correlate against the time that the compromise occurred. This output can help you determine what the attack added or removed from the system.

#### netstat -na command

The `netstat -na` command displays the current listening sockets on the machine. Running this command might reveal any back doors that are listening or errant services that are running.

#### ps -wauxef command    

This command helps you track down any errant processes that are listening and shows other odd processes (for example, the user `www` running a bash process). You can also run the command `lsof |grep <pid>` to find more information about open files that a process is using. Concurrently, running `cat /proc/<pid>/cmdline` might also tell you where the file that controls a process exists.

#### bash_history command

The history file is often the Rosetta stone of tracking down what took place during a compromise. Using the `bash_history` command to look through the user's `.bash_history` file often shows exactly what commands they executed, what malicious programs they downloaded, and the directories on which they focused.

### top command

Malicious processes often cause central processing unit (CPU) contention issues within the environment, and therefore appear near the top of the list of processes. Use the `top` command to display this list. When you're tracking down a compromise, consider any processes that cause CPU contention issues suspicious.

#### strace command

When you run the `strace -p pid` command on a suspicious process, the `strace` command might yield important insight into what the process is doing.

### Other tools

The preceding commands might not provide many clues regarding what occurred during the attack. If this is the case, you can use more specialized tools.

**Important**: Before you use the tools in this section, you should confirm that the binaries that you are using to investigate are not trojanned versions. Trojanned versions can perform tasks on behalf of the attacker, such as 
omitting information that might reveal what the compromise was trying to accomplish.

Run the following command to verify that you have a good working set of tools:

    rpm -Va

Verifying a package compares information about the installed files in the package with the metadata for the package that the RPM Package Manager (RPM) database stores. Verification compares information about the size, MD5 sum, permissions, type, owner, and group that is associated with each file. The output displays any discrepancies.

**Important**: Flagged packages in the following directories might indicate that you are using a trojanned version of the binary, and therefore you cannot trust its output:

- `/bin`
- `/sbin`
- `/usr/bin`
- `/usr/sbin`

The following example shows a trojanned file:

    S.5….T /bin/login

#### rpm -qa command

You can use the command `rpm -qa` to show recently installed packages in chronological order. However, in the case of a root compromise, the rpm database might also be compromised.

#### lsattr command

If the attacker is able to gain root access and trojan certain binaries, they might make those binaries immutable so that you cannot reinstall clean versions of them. Check the following directories:

- `/bin`
- `/sbin`
- `/usr/bin`
- `/usr/sbin`

The following example shows a file that an attacker has made immutable:

    -------i----- /bin/ps
    Under normal circumstances in these directories, the rules should all look similar to:

    ------------- /bin/ps

#### find command

`find` is a UNIX tool that can be critical in finding recently modified files. For example, you can find files that were modified within the past five days by running the following command:

    find / -mtime 5

### Common directories for web exploits

Check the following world-writable directories to which Apache&reg; commonly writes temporary files:

- `ls -al /tmp`
- `ls -al /var/tmp`
- `ls -al /dev/shm`

Look for any files that you don't recognize or that look suspicious. Be on the lookout for hidden files and files that have execute permissions.

If you have set permissions for directories on your website to 777, check those as well. 

### Find the point of entry

If you find helpful information by using the tools in the previous sections, you might also have a timestamp for the time 
that the malicious file or files were installed on the server.

You can use that timestamp to review your website's access logs for suspicious entries that were added during that time period. If you find something suspicious, you can cross-reference it with the location of the malicious files to narrow down the point of entry.

While the large majority of compromises come from exploitable code within your website, you cannot rule out other entry points. Ensure that you review `/var/log/*` for anything that appears suspicious during the reported time frame.

### Example investigation

The example investigation in this section demonstrates the process that you should use when you investigate a suspected root-level compromise.

#### Step 1: Identify the type of attack

Verify whether it was a basic web hack, or if root privileges were really gained. In most cases, the attack is a simple web hack that you can safely clean.

Run the following commands to determine if the attacker gained root privileges:

    lsattr /usr/sbin | less

    lsattr /usr/bin | less

    lsattr /bin | less

    lsattr /sbin | less

Look for modified attributes, such as binaries that have been set to immutable.

Output:

    s---ia------- /sbin/shs

When you use the `strings` command on that file, you see that it's a backdoor shell.

### Step 2: Check if the attacker cleaned their tracks 

In many cases, attackers are inexperienced or sloppy, and have not erased their tracks. Use the following steps to check if the attacker has left clues:

* Verify that all of the user accounts in `/etc/passwd` have a valid shell by running the following command:

      cat /home/$USER/.bash_history

* Retrieve the root user's history by running the following commands:

      history

      cat /root/.bash_history

In this example, the output from the `/root/.bash_history` command reveals that the attacker performed the following actions on the server:

1. Downloaded malicious tools to serve up via Apache in `/var/www/html/*`. 
2. Installed Internet Relay Chat (IRC) tools and other tools in `/var/tmp/.ICE-unix`. 
3. Modified root's crontab to re-download the malicious tools if someone removes them from the server 
   (`* * * * * /var/tmp/.ICE-unix/update >/dev/null 2>&1`).

### Step 3: Check for basic web hacks

If steps 1 and 2 don't reveal anything, the attack is probably a simple web hack that you can easily clean without 
formatting the server.

However, in this example, we know that the attacker gained root privileges. They also might have exploited phpMyAdmin. 
After the backdoor PHP Shell loaded, the attacker was able to perform a local root exploit to escalate their privileges.

Run the following commands to find hidden files and directories in the world-readable directories to which Apache 
typically writes `tmp` files:

    ls -al /var/tmp |less

    ls -al /tmp

    ls -al /dev/shm

In this example, the commands return the following output:

    drwx------ 3 70 70 4096 Nov 19 02:00 /var/tmp/.ICE-unix

If items are found here, you must attempt to track down the entry point so that you can take down the site, upgrade site code, or otherwise fix the exploitable code. Step 5 presents a quick way to accomplish this task. However, if the output of the `ps -waux` command shows that IRC bots are running, then you can try to catch where the process is running from by using the `lsof` command or `ps -wauxxef |grep <pid>`.

### Step 4: Look for process identifiers that are listening for incoming connections

Run the following commands to look for process identifiers (PIDs) that are listening for incoming connections:

- `netstat -natp`: Looks for any suspicious connections that are running on odd ports
- `ps -wauxxef`: Looks for suspicious files, such as `bash` running under a `www` context
- `lsof <pid>`: Helps to determine where the PID is running from

The output appears similar to the following example:

    tcp 0 0 0.0.0.0:1144 0.0.0.0:* LISTEN 1008/bash

    tcp 0 1 172.16.23.13:60968 22.22.22.22:7000 SYN_SENT 6860/sshd

In this example, several other SSH-established connections are also running from high-level ports, as shown in 
the following example:

    [root@www tmp]# netstat -natp |grep sshd |awk '{print $4,$5,$6,$7}'

    0.0.0.0:22 0.0.0.0:* LISTEN 1046/sshd

    172.16.23.13:60986 22.22.22.22:6667 SYN_SENT 6860/sshd

    123.123.123.123:22 22.22.22.22:59361 ESTABLISHED 22795/sshd

    123.123.123.123:22 22.22.22.22:57434 ESTABLISHED 22796/sshd

    123.123.123.123:57139 143.143.143.143:6667 ESTABLISHED 6860/sshd

    123.123.123.123:57402 22.22.22.22:6667 ESTABLISHED 6860/sshd

    123.123.123.123:22 143.143.143.143:49238 ESTABLISHED 8860/sshd

    123.123.123.123:57134 22.22.22.22:6667 ESTABLISHED 6860/sshd

    123.123.123.123:56845 22.22.22.22:6667 ESTABLISHED 6860/sshd

    123.123.123.123:57127 143.143.143.143:6667 ESTABLISHED 6860/sshd

This output indicates that the attackers are still connected to this machine. However, you aren't able to see them 
because they probably modified the binaries to hide themselves.

### Step 5: Determine the point of entry for the original compromise

Use the following steps to determine the point of entry for the original compromise:

1. Check `/var/log/[messages|secure]` for brute force SSH attempts.

2. Check the Apache access logs and error logs. This step might help determine which site is exploitable.

   You should also cross-reference IPs against the logs if you think that there is a chance that it might have 
   originated from there. This is a quick and straightforward way to trace down the point of origin.

   You can quickly check servers that have a large number of web logs by using the following commands:

       cd /var/log/httpd

       for i in `ls * |grep access`; do echo $i && grep wget $i; done

       for i in `ls * |grep access`; do echo $i && grep curl $i; done

   **Note**: This example searches `wget` because `wget` was in root's history file under what might have been part of the 
   entry point.

### Outcome

In this example, our investigation revealed that the phpMyAdmin installation in the `/var/www/html` directory was exploited, most likely because the version of phpMyAdmin installed on the server was severely outdated. Patching phpMyAdmin on a regular schedule prevents this situation from occurring.
