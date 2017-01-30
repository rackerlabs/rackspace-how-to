---
permalink: configuring-basic-security/
audit_date:
title: Configure basic security
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-06-20'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Some people think that this is not dangerous if there are no services
running on the server, and it doesn't matter that all ports are open. We
disagree. If connections to unused (and popular) ports are blocked or
dropped, then the vast majority of malicious intruders will move on to
another machine where ports are accepting connections. It only takes a
few minutes to set up a firewall - so we highly recommend that you do so
to protect your server.

After you create a new cloud server, we recommend that you perform the
following tasks to enhance security of the server.

**Note:** Small modifications to the following commands might be
necessary if you're using a different distribution. If necessary, refer
to your operating system documentation.

### Log in to the server

As soon as you have your server's IP address
and password, log in using the following SSH command:

    ssh root@123.45.67.890

**Note**: If you're logging in to a rebuilt server, you might see a
message stating that the remote host identification has changed. When
you rebuild a cloud server, the remote host key changes, which indicates
unusual or suspicious activity on your computer. To avoid this issue,
remove the older entry for the server IP address. On
your *local* computer, edit the SSH `known_hosts` file by using the
following command and remove any entries that point to your cloud server
IP address:

    nano ~/.ssh/known_hosts

If your local computer is running an operating system other than Linux
or Mac OS X, the location of the `known_hosts` file will differ. Refer
to your OS documention to learn the location of this file.

### Change the root password

After logging in to your server, change the root password by issuing the
following command:

    passwd

### Add an Admin User

**Note**: If you are setting up additional SSH users for an OnMetal
server, see [Create OnMetal Cloud Servers](/how-to/create-onmetal-cloud-servers)
for applicable OnMetal steps.

1.  To add an admin user, issue the following command and replace
    **demo** with the user name of your choice:

        adduser demo

    **Note**: After this initial step, you should not log in as the root
    user to perform daily operations on your server. However, you'll
    need Super User (sudo) privileges to complete these
    administrative tasks.

2.  To assign the sudo privileges to the admin user, issue the following
    command, which invokes the nano editor by default on Ubuntu:

        visudo

3.  At the end of the file, add your admin user name (in place of demo
    in the following example) and the following text string:

        demo   ALL=(ALL) ALL

4.  When you are finished adding this line, exit, confirm, and save the
    file as follows:
    a.  Press **Ctrl-X** to exit.
    b.  Press **y** to confirm the changes.
    c.  Press **Enter** to save the file as `/etc/sudoers.tmp`.

        **Note**: While working in the nano editor, the backspace/delete
        key works unexpectedly, deleting characters in front of the
        cursor rather than behind it. You can resolve this issue by
        editing the `/etc/nanorc` file (with nano, for example) and
        either uncommenting the following line or adding it:

            set rebinddelete

The new behavior takes effect after you save the file and open nano
again.

### Set up public and private keys (SSH keygen)

One effective way of securing SSH access to your cloud server is to use
a **public/private** key, which means that a public key is placed on the
server and the private key is on your local computer. This makes it
impossible for someone to log in using just a password; they must have
the private key. This setup consists of the following basic
steps: create the key on your local computer, copy the public key to the
server, and set the correct permissions for the key.

The following instructions assume that you use Linux or Mac OS X. For
Windows instructions, see [Key generation using Putty forWindows](/how-to/generating-rsa-keys-with-ssh-puttygen).

#### Step 1. Create the public and private keys

1.  On your local computer, create a folder to hold your keys:

        mkdir ~/.ssh

2.  To create the SSH keys, on your *local* computer,  enter the
    following command:

        ssh-keygen -t rsa

    -   The id_rsa and id_rsa.pub are created in the .ssh directory.
        The rsa.pub file holds the public key. You'll place this file on
        your server.

    -   The id_rsa file is your private key. Never show, give away, or
        keep this file on a public computer.

#### Step 2. Copy the public key

You can use the `scp` command to place the public key on your server.

1.  While still on your *local* computer, enter the following command,
    substituting your admin user for demo, IP address and admin user's
    home directory:

        scp ~/.ssh/id_rsa.pub demo@123.45.67.890:/home/demo/

2.  When prompted, enter the admin user password.
3.  Create a directory on the admin user's home folder on your server
    called .ssh and move the pub key into it, as shown in the following
    examples:

        mkdir /home/demo/.ssh

        mv /home/demo/id_rsa.pub /home/demo/.ssh/authorized_keys

#### Step 3. Modify SSH permissions

Set the correct permissions on the key using the following commands,
changing the "demo" user and group to your admin user and group:

    chown -R demo:demo /home/demo/.ssh
    chmod 700 /home/demo/.ssh
    chmod 600 /home/demo/.ssh/authorized_keys

You have now successfully created the key on your local computer, copied
the public key to your server, and set the correct permissions for the
key.

### Modify the SSH configuration

Keeping the SSH service on the default port of 22 makes it an easy
target. We recommend changing the default SSH configuration to make it
more secure.

1.  Issue the following command:

        nano /etc/ssh/sshd_config

2.  Change the default port of 22 to one of your choosing, turn off root
    logins, and define which users can log in:

        Port 22                           <--- change to a port of your choosing
        Protocol 2
        PermitRootLogin no
        PasswordAuthentication no
        UseDNS no
        AllowUsers demo

    **Note**: The port number can be any integer from 1025
    through 65536. Be sure to note the new port number and remember to
    avoid port conflicts if you later configure additional
    listening processes.

Because you have set up a public/private key, you can set the
PasswordAuthentication parameter to no. However, if you intend to access
your server from different computers, you may want to leave
PasswordAuthentication set to yes. Only use the private key if the local
computer is secure (i.e. don't put the private key on a work computer).

These settings are not enabled yet. Before restarting SSH by
using the new port, you need to create a simple firewall by using
iptables.

**Note**: Do not restart SSH yet.

### Set up a private firewall by using iptables

The utility called iptables is the default firewall for Linux systems.
It works by refusing connections to ports or services that you specify.

**Note:** The procedure in this section does not apply to servers that
use `systemd`. Servers that use `systemd` now use another firewall front
end to iptables called FirewallD. The syntax and implementation for
FirewallD vary greatly. For proper firewall configuration on FirewallD
and `systemd` servers, see "Introduction to firewalld" at the Red Hat
customer portal.

As part of this procedure, you'll open three ports: **ssh**, **http**,
and **https.**

You'll then create two files:

-   /`etc/iptables.test.rules`

-   `/etc/iptables.up.rules`

The first is a set of temporary test rules and the second is the
permanent set of rules iptables will use.

**Note**: You need to root user permissions to complete procedure. If
you're not currently logged in as root, use the sudo command in front of
the following commands.

1.  Issue the following command to see what processes are currently
    running:

        iptables -L

    You'll see something similar to this:

        Chain INPUT (policy ACCEPT)
        target     prot opt source               destination

        Chain FORWARD (policy ACCEPT)
        target     prot opt source               destination

        Chain OUTPUT (policy ACCEPT)
        target     prot opt source               destination

    This means the server is are accepting anything from anyone on
    any port.

2.  To build the firewall, create the
    file `/etc/iptables.test.rules` and add some rules. If you have
    worked through these steps previously, this file may not be empty:

        nano /etc/iptables.test.rules

3.  Change and add ports as necessary.
4.  Issue the following command to apply the rules to your server:

        iptables-restore < /etc/iptables.test.rules

5.  Issue the following command to note any differences:

        iptables -L

6.  If there is no change in the output, repeat the preceding steps and
    try again.
7.  Check the rules and see exactly what is being accepted, rejected
    and dropped. When you're satisfied with the rules, save them
    permanently by issuing the following command:

        iptables-save > /etc/iptables.up.rules

    **Note**: If the server is rebooted before you save the rules
    permanently, the changes are lost and the server reverts to the
    previous settings.

8.  Add a script that the system runs when your network interfaces
    are started. Create the file by running:

        nano /etc/network/if-pre-up.d/iptables

9.  Add the following lines to the new file:

        #!/bin/sh
        /sbin/iptables-restore < /etc/iptables.up.rules

10. Save your changes, and then make the new script executable:

        chmod +x /etc/network/if-pre-up.d/iptables

### Set up iptables in Red Hat

If you are using a Red Hat distribution, iptables works a little
differently than it does in an Ubuntu distribution. Using the following
commands, you can change your iptables ruleset directly from the command
line.

#### HTTP - port 80

For RHEL 7 and CentOS 7, use the following command to open port 80 for
HTTP (web) traffic in your iptables firewall:

    sudo firewall-cmd --add-service=http --permanent

For older OS versions, use the following command:

    sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport http -j ACCEPT

#### HTTPS/SSL - port 443

For RHEL 7 and CentOS 7, use the following command to open port 443 for
secure HTTP traffic:

    sudo firewall-cmd --add-service=https --permanent

For older OS versions, use the following command:

    sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport https -j ACCEPT

#### SSH - port 22

Although port 22 is open by default to allow you to SSH to your server
after it is built, the following command shows you how you would open
port 22 in RHEL 7 and CentOS 7:

    sudo firewall-cmd --add-service=ssh -permanent

If you set up a custom port for SSH, use the following command for RHEL
7 and CentOS 7:

    sudo firewall-cmd --add-port=<customport>/tcp --permanent

For older OS versions, use the following command to open port 22:

    sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport ssh -j ACCEPT

#### FTP - port 21

FTP is a common service for file transfer, but it is largely obsolete
because it is not a secure protocol. We strongly recommend using a
secure file transfer protocol like SFTP instead.  If you absolutely have
to use FTP, use the following command to open the default port of 21 in
RHEL 7 and CentOS 7:

    sudo firewall-cmd --add-service=ftp --permanent

For older OS versions, use the following commands:

    sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport ftp -j ACCEPT
    sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport ftp-data -j ACCEPT

#### MySQL - port 3306

If you need to make a remote connection to your MySQL database from
another server, you must open port 3306 in iptables. For RHEL 7 and
CentOS 7, use the following command:

    sudo firewall-cmd --add-service=mysql --permanent

For older OS versions, use the following command:

    sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport mysql -j ACCEPT

#### Save your rules

Use the following command to save all the rules that you've created.  If
not saved before your server is rebooted, the iptables ruleset will
revert to the default ruleset, blocking all traffic except on port 22.
If you are using RHEL 7 or CentOS 7, this step is not necessary.

    sudo /sbin/service iptables save

#### Restart iptables

Your changes to iptables take effect only after you have saved the rules
and restarted the iptables service.  Remember, if you restart iptables
before saving your rules, iptables reverts to the default ruleset.

For RHEL 7 and CentOS 7, use the following command:

    firewall-cmd --reload

For older OS versions, use the following command:

    sudo /sbin/service iptables restart

#### Check rules

To check rules after reloading the firewall in RHEL 7 and CentOS 7, use
the following commands:

    firewall-cmd --get-active-zones

This returns which zone is active (the one you just saved all of your
rules to).

    firewall-cmd --zone=<zone> --list-all

This lists the enabled services in a specified zone.

### Restart ssh

Now you can restart the SSH service. **Stay logged in while you restart
ssh and test it with a new connection.** That way if an error occurs,
you can troubleshoot it more easily.

On most distributions, the service is sshd, and you restart it with the
command:

    sudo service sshd restart

On Ubuntu and some other distributions, the service is called ssh and
you restart it with a similar command:

    sudo service ssh restart

If you have trouble making a new connection after restarting SSH, check
the symptoms to determine what might be wrong.

-   If the connection times out, there might be a problem with the
    iptables configuration.
-   If you get a warning about a private key, your key might not be
    installed on the server properly (check for extra line breaks or
    characters that were missed in a copy-and-paste operation).
-   If you've been rebuilding the server, you might need to [remove the host key from your known_hosts file](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console) before
    you can make a connection.

### If you're locked out

The incorrect configuration of SSH, sudo, or iptables could cause you to
be locked out of your system.  If this occurs, log in to the The
Rackspace Cloud Control Panel and use the Web Console or Rescue Mode to
repair the configurations.

These are the basics of connecting to a Linux Cloud Server and setting
up security.  See [Windows Cloud Server](/how-to/log-in-to-your-server-via-rdp-windows) to
be perform these steps on a Windows server.
