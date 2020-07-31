---
permalink: use-fail2ban-on-ubuntu/
audit_date:
title: Use fail2ban on Ubuntu
type: article
created_date: '2020-07-30'
created_by: John Garcia
last_modified_date:
last_modified_by:
product: Cloud Servers
product_url: cloud-servers
---

This article will explain how to install the Fail2Ban service on Ubuntu 20.04

# What is Fail2Ban?

Fail2Ban is intrusion prevention software that can be used to protect servers from malicious threats such as Brute-Force attacks.

## Prerequisites

Prior to beginning the installation of Fail2Ban, it is good practice to always ensure your server is up to date.  You can do so by executing the following commands:

- The following command will return a listing of packages for your repoositories to ensure you are up to date.
```
root@server-01:~# sudo apt-get upgrade
```
- The following command will install the current versions of packages installed on your server.
```
root@server-01:~# sudo apt-get upgrade
```
**Note:**  After executing this command, you will be provided a summary of packages that will be upgraded and will be prompted with the amount of additional space this install will need.  Type "**y**" to continue with this upgrade.

# Installing Fail2Ban

Begin the installation of Fail2Ban with the following command:

```
root@server-01:~# sudo apt-get install fail2ban
```
**Note:** After executing this command, you will be prompted with the amount of additional space this install will need.  Type "**y**" to continue with this upgrade.

You should verify that Fail2Ban is installed and running with the following command:
```
root@server-01:~# sudo systemctl status fail2ban
● fail2ban.service - Fail2Ban Service
     Loaded: loaded (/lib/systemd/system/fail2ban.service; enabled; vendor preset>
     Active: active (running) since Fri 2020-07-31 00:23:21 UTC; 42min ago
```
If Fail2ban is not running at any time, you can start it with the following command:
```
root@server-01:~# sudo systemctl start fail2ban
```

Set Fail2Ban to start upon boot with the following command:
```
root@server-01:~# sudo systemctl enable fail2ban
Synchronizing state of fail2ban.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable fail2ban
```

## Configuring Fail2Ban

Now that we have successfully installed Fail2Ban, we can move on to configuring its settings.  Fail2Ban's default configurations are in the **fail2ban.conf** and **jail.conf** configuration files and should not be updated.  Instead you can create new files **fail2ban.local** and **jail.local**, or copy the **.conf** files to create the **.local** files.

You can copy the existing **.conf** file to create the **.local** file with the following command:
```
root@server-01:~# sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```
Going forward any configuration changes to Fail2Ban should be done in only the **.local** files using your favorite text editor.  The following are examples of items that can be configured:


- ignoreip - Specified addresses that will not be banned by criteria.
- bantime -  Specified length of time that ban will last.
- maxretry - Specified number of log in failures, prior to being banned.

There are numerous other fields that are configurable and those descriptions can be foudn within the **.local** file.

The following is an example of a basic ban setting from within the **jail.local** file.

Scrolling through the **jail.local** file, I have come to the following section and entered the listed values.
```
# "bantime" is the number of seconds that a host is banned.
bantime  = 10m

# A host is banned if it has generated "maxretry" during the last "findtime"
# seconds.
findtime  = 10m

# "maxretry" is the number of failures before a host get banned.
maxretry = 3
```
**Note:** In the previous example, we have set the bantime for 10 minutes and maxretry to 3.

Lastly, I have entered the wrong credentials and as you can see after 3 unsuccessful log in attempts our IP address is now banned as proof of concept.
```
[user@test ~]$ ssh root@23.253.159.172
root@23.253.159.172's password:
Permission denied, please try again.
root@23.253.159.172's password:
Permission denied, please try again.
root@23.253.159.172's password:
Permission denied (publickey,password).
[user@test ~]$ ssh root@23.253.159.172
ssh: connect to host 23.253.159.172 port 22: Connection refused
