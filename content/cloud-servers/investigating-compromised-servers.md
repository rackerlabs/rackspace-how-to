---
permalink: investigating-compromised-servers
audit_date:
title: Investigating Compromised Servers
created_date: '2019-01-15'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This guide is not a step by step tutorial on how to clean a compromised server, rather it is a reference to illustrate what tools are available for performing an analysis of the compromise. The goal of this guide is to show you what information is available to help you determine:
* Point of entry
* The origin of the attack
* What files were compromised
* What level access did the attacker obtain
* Audit trail of the attackers footprints
There are many different types of compromises available to exploit a UNIX server. Under many circumstances, a server is exploited using common techniques such as using a brute force attack, to guess a weak password, or attempting to use known vulnerabilities in software in hopes the server is not on a regular patch schedule. Whatever the method, it is important to understand how the machine got compromised so you can determine the extent of damage to your server and other hosts accessible to this machine.
During many root level compromises, the most straight forward approach to recovery is to perform a clean install of the server and restore any critical data from known good backups. However until the entry point of the compromise is known, this may not be enough as the compromise needs to be understood so that security hole can be properly closed.
Documentation
When you are notified that a system under your control may be compromised. You want to obtain as much information as possible from the complainant. This includes:
* How was the initial problem found?
* Can the time of the compromise be estimated?
* Has the server been modified since the compromise was detected?
* Anything else the complainant says that is important.
IMPORTANT NOTE: If you are planning on getting law enforcement involved, it is imperative that no additional actions are taken on the server. The server must remain in its current state for forensic and evidence collection purposes.
If you choose to proceed with the investigation, document anything you find on the server. It can be as simple as a copy/paste of the command and its results.
### Tools Used For Investigation
In the attacker's ideal scenario, all important log files would have been wiped so their tracks are clean.  Oftentimes however, this doesn't happen. This leaves some valuable clues in finding what was done. It may also help determine if this was a basic web hack, or a root level compromise. Below are some of the basic commands that I'll look through when trying to find that one thread so I can unravel the rest of the compromise.
last
This will list the sessions of users that recently logged into the system and include the timestamps, hostnames and whether or not the user is still logged in. An odd IP address may be cross referenced against a brute force ssh attack in /var/log/messages or /var/log/secure which may indicate how the attacker gained entry, what user they got in as, and if they were able to escalate their privilege to root.
ls -lart /
This will provide a time ordered list of files and directories that can be correlated against the time of the compromise. This listing will help determine what has been added or removed from the system.
netstat -na
This will list the current listening sockets on the machine. Running this may reveal any back doors that are listening, or any errant services that are running.
ps -wauxef
This will be helpful in tracking down any errant processes that are listening, as well as help show other odd processes such as the user www running a bash process for example. lsof |grep <pid> can also be used to further find what open files this process is using. Concurrently, cat /proc/<pid>/cmdline may also let you know where the file that controls this process exists.
bash_history
The history file often becomes the Rosetta stone of tracking down what took place during a compromise. Looking through the users .bash_history file will often show exactly what commands were executed, what malicious programs were downloaded, and possibly what directories they were focusing on.
top
Oftentimes, a malicious process will be causing CPU contention issues within the environment, and will usually show up near the top of the list. Any processes that are causing the CPU contention issues should be considered suspicious when tracking down a compromise.
strace
When running strace -p pid on a suspicious process, this may yield important insight into what the process is performing.

In some cases, the commands above may not provide many clues to what happened during the attack. This is where more fine grained tools must be used.
Before moving forward, it should be confirmed that the binaries you are using to investigate are not trojanned versions. These trojanned versions can perform whatever tasks the attacker wishes, which include not showing information that could trace what the compromise was trying to accomplish.
So to verify we have a good working set of tools:
rpm -Va
Verifying a package compares information about the installed files in the package with information about the files taken from the package meta data stored in the rpm database. Among other things, verifying compares the size, MD5 sum, permissions, type, owner and group of each file. Any discrepancies are displayed.
When running this command, it is important to note any packages that are flagged in the following directories may mean you are using a trojanned version of the binary, and therefore you cannot trust its output:
/bin

/sbin

/usr/bin

/usr/sbin
An example of what a trojanned file:
S.5….T /bin/login
rpm -qa
This can be used to show what rpm's have been recently installed in chronological order. However, in the case of a root compromise, the rpm database could be altered and therefore not trusted.
lsattr
In cases where the attacker was able to get root access and trojan certain binaries, sometimes they will set that binary to be immutable so you cannot reinstall a clean version of that binary. Common directories to look in are:
/bin

/sbin

/usr/bin

/usr/sbin
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
