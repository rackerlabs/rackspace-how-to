---
permalink: investigate-compromised-servers/
audit_date:
title: Investigate compromised servers
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: '2019-01-16'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article lists the tools that are available for performing an analysis of a compromised server. (Cleaning the 
compromised server is outside of its scope.) Using these tools help you determine the following information:

- The point of entry
- The origin of the attack
- Which files were compromised
- The level of access that the attacker obtained
- The audit trail of the attacker's footprints

Many different types of compromises can exploit a UNIX&reg; server. Attackers might launch a brute force attack, guess a 
weak password, or attempt to use known software vulnerabilities in the hope that the server 
isn't on a regular patch schedule. It's important to understand how the machine was compromised so that you can 
determine the extent of the damage to your server and other hosts that are accessible to the compromised machine.

For most root-level compromises, the most straightforward recovery approach is to perform a clean installation of the server and restore any critical data from backups. However, until you know the entry point of the compromise, this step might not be sufficient because you need to understand the compromise so that you can properly close the security hole.

### Document the attack

When you're notified that a system under your control might be compromised, ensure that you obtain as much information as possible from the reporter, including:

- How the initial problem was found
- The estimated time that the compromise occurred
- Whether the server has been modified since the compromise was detected
- Anything else that the reporter says that is important

**Important**: If you plan to involve law enforcement, it is imperative that no additional actions are taken on the server. The server must remain in its current state for evidence collection purposes.

If you choose to proceed with the investigation, document anything that you find on the server. This step can be as simple as copying and pasting a command and its results.

### Investigation tools

In some compromises, the attacker manages to delete all important log files to hide their tracks. However, this doesn't always occur. As a result, the log files leave valuable clues regarding what the attacker did to the server. The log files might also help you determine if the attack was a basic web hack or a root-level compromise. Use the commands in this section to try to find clues that will help you unravel the extent of the compromise.

#### Last

The `last` command lists the sessions of users who recently logged in to the system. It includes the timestamps and hostnames, and indicates whether the user is still logged in. If an odd Internet Protocol (IP) address appears in the output, you can cross-reference it against a brute-force Secure Shell (SSH) attack in the `/var/log/messages` or `/var/log/secure` directory. This step might indicate how the attacker gained entry, what username they used to gain access, and if they were able to escalate their privileges to `root`.

#### ls -lart

The `ls -lart` command outputs a time-ordered list of files and directories that you can correlate against the time that the compromise occurred. This output can help you determine what the attack added or removed from the system.

#### netstat -na

The `netstat -na` command displays the current listening sockets on the machine. Running this command might reveal any back doors that are listening or errant services that are running.

#### ps -wauxef    

This command helps you track down any errant processes that are listening and shows other odd processes (for example, the user `www` running a bash process). You can also run the command `lsof |grep <pid>` to find more information about open files that this process is using. Concurrently, running `cat /proc/<pid>/cmdline` might also tell you where the file that controls this process exists.

#### bash_history

The history file is often the "Rosetta stone" of tracking down what took place during a compromise. Using the `bash_history` command to look through the user's `.bash_history` file often shows exactly what commands they executed, what malicious programs they downloaded, and the directories on which they focused.

### top

Malicious processes often cause central processing unit (CPU) contention issues within the environment, and therefore appear near the top of the list of processes. Use the `top` command to display this list. When you're tracking down a compromise, consider any processes that cause CPU contention issues suspicious.

#### strace

When you run the `strace -p pid` command on a suspicious process, the `strace` command might yield important insight into what the process is doing.

### Other tools

These commands might not provide many clues regarding what occurred during the attack. If this is the case, you can use more specialized tools.

**Important**: Before you use the tools in this section, you should confirm that the binaries that you are using to investigate are not trojanned versions. These trojanned versions can perform tasks on behalf of the attacker, such as 
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

rpm -qa

This can be used to show what rpm's have been recently installed in chronological order. However, in the case of a root compromise, the rpm database could be altered and therefore not trusted.

lsattr

In cases where the attacker was able to get root access and trojan certain binaries, sometimes they will set that binary to be immutable so you cannot reinstall a clean version of that binary. Common directories to look in are:

- `/bin`
- `/sbin`
- `/usr/bin`
- `/usr/sbin`

An example of a file that had its attributes set to immutable:

-------i----- /bin/ps
Under normal circumstances in these directories, the rules should all look similar to:

------------- /bin/ps
find
Find is a UNIX tool that can be critical in finding files that have been recently modified. For instance, to find files that have been modified in the last file days, run:
find / -mtime 5
### Common Directories Where Web Exploits Are Found
Check world writable directories that Apache would commonly write its temp files to. Locations such as:
ls -al /tmp

ls -al /var/tmp

ls -al /dev/shm
If you have directories on your website that are chmod'ed 777, those are suspect as well.
When checking these directories, you are looking for any files that you don't recognize, or look suspicious. Be on the lookout for hidden files or files that have execute permissions.
### Finding Point Of Entry
If you found anything using the information above, that means that you most likely have a timestamp of when the malicious file(s) were installed on the server.
You can now use that timestamp to start combing through your website's access logs, looking for any suspicious entries in the log during that time period. If you find something, you can cross reference it to where you found the malicious files, then you likely just narrowed down the point of entry.
While the large majority of compromises do come from exploitable code within your website, you cannot rule out other entry points. So be sure to dig through /var/log/* to see if there is anything suspicious during the reported time frame.
### Example Of Investigation
Below is a real example of one of my investigations, documenting my thought process.
When I am investigating a suspected root level compromise, the first thing that needs to be verified was whether or not this was just a basic web hack, or if root privileges were really gained. 80% of the time, its just a simple web hack that can be safely cleaned.
Step 1: Quick and dirty check to see it root privileges were gained:
lsattr /usr/sbin | less

lsattr /usr/bin | less

lsattr /bin | less

lsattr /sbin | less
What to look for:
* Your checking for modified attributes such as binaries being set immutable, etc.
Results:
s---ia------- /sbin/shs
^ When you strings that file, you see its a backdoor shell.

Step 2: See if the attacker cleaned his tracks. 
Many times, these are script kiddies or dummies who just forgot to clean up after themselves.
What to look for:
* All user accounts in /etc/passwd that a valid shell:
cat /home/$USER/.bash_history
* Root's history:
history

cat /root/.bash_history
Results: 
The /root/.bash_history revealed what the attacker did on the server, which includes:
1. They downloaded some malicious tools to serve up via apache in /var/www/html/*. 
2. They also installed some IRC stuff in /var/tmp/.ICE-unix (as well as other tools). 
3. Modified root's crontab to re-download the malicious tools if someone removes them from the server:
* * * * * /var/tmp/.ICE-unix/update >/dev/null 2>&1

Step 3: Check for basic web hacks
Normally if steps 1 and 2 do not show anything, most likely its just a simple web hack that CAN be cleaned easily without formatting the server or otherwise causing panic.
In this specific investigation, that logic is null and void since we know that root privileges were gained. However, just for reference, and since its relevant to this anyways cause I believe that the attacker exploited phpmyadmin. Once they had their backdoor phpshell loaded, they were able to perform a local root exploit to escalate their privileges.
What to look for:
* Hidden files and directories, in world readable directories, that apache would normally write tmp files to:
ls -al /var/tmp |less

ls -al /tmp

ls -al /dev/shm
Results:
drwx------ 3 70 70 4096 Nov 19 02:00 /var/tmp/.ICE-unix
If items are found in here, you must attempt to track down the entry point so you can have the client take down the site, upgrade their site code, or otherwise fix the exploitable code. One quick and dirty way is by looking at step 5. However, if you see irc bots and stuff running in the output of ps -waux, then you can try to catch where the process is running from by using lsof, or ps -wauxxef |grep <pid>.
Step 4: Look for PID's listening for incoming connections
What to look for:
* netstat -natp : Looks for any suspicious connections running on odd ports
* ps -wauxxef : look for suspicious files like bash running under www context
* lsof <pid> : helps to determine where the pid above is running from
Results:
tcp 0 0 0.0.0.0:1144 0.0.0.0:* LISTEN 1008/bash

tcp 0 1 172.16.23.13:60968 22.22.22.22:7000 SYN_SENT 6860/sshd
There are also a fair amount of other ssh ESTABLISHED connections running from high level ports. This means the attackers are still connected to this machine. I can't see them cause they probably modified the binaries to hide themselves.
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
Step 5: Determine point of entry for original compromise
### What to look for
* /var/log/[messages|secure] : check for brute forced ssh attempts.
* apache access logs and error logs : May help determine which site is exploitable. Most attacks are linked against this.
When checking this, also cross reference IP's against the logs if you think there is a chance it may have originated from there. Its a quick and easy way to trace down the origin point.
Simple ways of checking servers with a ton of web logs like the one used in this example:
cd /var/log/httpd

for i in `ls * |grep access`; do echo $i && grep wget $i; done

for i in `ls * |grep access`; do echo $i && grep curl $i; done
NOTE: wget was searched cause that was in root's history file under what I believe may have been part of the entry point
Results:

Evidence found that the phpmyadmin installation in /var/www/html was exploited. The version of phpmyadmin was severely outdated. Keeping phpmyadmin patched on a regular schedule would have prevented this from happening.
