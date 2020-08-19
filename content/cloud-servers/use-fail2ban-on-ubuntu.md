---
permalink: use-fail2ban-on-ubuntu/
audit_date: '2020-08-19'
title: Use fail2ban on Ubuntu
type: article
created_date: '2020-07-30'
created_by: John Garcia
last_modified_date: '2020-08-19'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to install the Fail2Ban service on Ubuntu 20.04.

### What is Fail2Ban?

Fail2Ban is intrusion prevention software that you can use to protect servers from malicious threats
such as brute-force attacks.

### Prerequisites

Before you install Fail2Ban, it is good practice always to ensure your server is up to date.  Execute the following
command to update the current versions of packages installed on your server:

      root@server-01:~# sudo apt-get upgrade

**Note:**  The preceding command provides a summary of packages to be upgraded and prompts you with the required
additional space for the installation.  Type "**y**" to continue with the upgrade.

### Install Fail2Ban

Execute the following command to begin the installation:

    root@server-01:~# sudo apt-get install fail2ban

**Note:** At the additional space prompt, type "**y**" to continue with the upgrade.

Verify that Fail2Ban is installed and running with the following command:

    root@server-01:~# sudo systemctl status fail2ban
    fail2ban.service - Fail2Ban Service
     Loaded: loaded (/lib/systemd/system/fail2ban.service; enabled; vendor preset>
     Active: active (running) since Fri 2020-07-31 00:23:21 UTC; 42min ago

If Fail2ban is not running at any time, you can start it with the following command:

    root@server-01:~# sudo systemctl start fail2ban

Set Fail2Ban to start at boot with the following command:

    root@server-01:~# sudo systemctl enable fail2ban
    Synchronizing state of fail2ban.service with SysV service script with /lib/systemd/systemd-sysv-install.
    Executing: /lib/systemd/systemd-sysv-install enable fail2ban

### Configure Fail2Ban

You should not update the Fail2Ban default configuration files, **fail2ban.conf** and **jail.conf**. Instead, create new empty
files **fail2ban.local** and **jail.local**, or copy the **.conf** files to create the **.local** files.

You can copy the existing **.conf** file to create the **.local** file with the following command:

    root@server-01:~# sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

Make any Fail2Ban configuration changes to only the **.local** files using your favorite text editor.  The following examples
are commonly configured items:

- **ignoreip**: Specified addresses that are not be banned by criteria.
- **bantime**:  Specified length of time that ban lasts.
- **maxretry**: Specified number of login failures, before being banned.

Numerous other fields are configurable, and you can find those descriptions within the **.local** file.

The following example shows a basic ban setting from within the **jail.local** file and sets the
`bantime` to 10 minutes and `maxretry` to three attempts.

    # "bantime" is the number of seconds that a host is banned.
    bantime  = 10m

    # A host is banned if it has generated "maxretry" during the last "findtime"
    # seconds.
    findtime  = 10m

    # "maxretry" is the number of failures before a host get banned.

    maxretry = 3
     
The following example shows three unsuccessful login attempts and the resulting IP address ban.

    [user@test ~]$ ssh root@23.253.159.172
    root@23.253.159.172's password:
    Permission denied, please try again.
    root@23.253.159.172's password:
    Permission denied, please try again.
    root@23.253.159.172's password:
    Permission denied (publickey,password).
    [user@test ~]$ ssh root@23.253.159.172
    ssh: connect to host 23.253.159.172 port 22: Connection refused
