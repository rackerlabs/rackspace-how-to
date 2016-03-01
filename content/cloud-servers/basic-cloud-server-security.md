---
node_id: 268
title: Basic Cloud Server Security
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Note**: These are the basics of connecting to a Linux Cloud Server and
setting up security.

### Previous section

[Create a Cloud Server](/how-to/create-a-cloud-server)

Although Rackspace Cloud has taken steps to make your default Cloud
Server image as secure as possible, the first line of defense lies in
the hands of you, our customer.  Follow these steps immediately after
creating your Cloud Server to help protect the integrity of your data.

**Note:** The commands in this article are meant for Ubuntu.  Small
modifications may be required for other distributions.

### Log in

As soon as you have your IP address and password for your Cloud Server,
login via SSH:

    ssh root@123.45.67.890

If you rebuilt your Cloud Server, you may get a message informing you
that the "remote host identification has changed".

When logging into a Cloud Server via SSH, we learned about the security
features of [matching the remote host with known keys](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console). When you rebuild a Cloud Server, the remote host key changes. As such, your computer thinks there is something dodgy going on.

All you need to do is remove the older entry for the Cloud Server IP:

On your *local* computer, edit the **.ssh/known_hosts** file and remove any
entries that point to your Cloud Server IP address.

    nano ~/.ssh/known_hosts

If you are not using Linux or a Mac on your local computer, the location
of the **.ssh/known_hosts** file will differ.  Please refer to your own OS for
details of where this file is kept.

### User administration

Once logged in to the Cloud Server, immediately change your root
password to one of your choosing.

    passwd

Add an admin user (we've used the name demo here but any name will do).

    adduser demo

Best security practices for system administration state that you should
not operate on your system as the root user (this initial setup is the
only time you would need to log in as root).  As such, the main
administration user (demo) needs to have `sudo` (Super User) privileges
so they can, with a password, complete administrative tasks.

To configure this, use the `visudo` command, which invokes the 'nano'
editor by default in Ubuntu:

    visudo

At the end of the file add:

    demo   ALL=(ALL) ALL

When you are finished, press the key combination `Ctrl-X` to exit, press
`y` to confirm your saving the changes, and press the **Enter** key to
save as the indicated file, '`/etc/sudoers.tmp`' .

**Note**: You may find that while working in the nano editor, the
backspace/delete key works backwards, deleting characters in front of
the cursor rather than behind it.  This can be resolved by editing the
'/etc/nanorc' file (with nano, for example) and either uncommenting or
adding the line:

    set rebinddelete

The corrected behavior will take effect after the file has been saved
and nano has been opened again.

### SSH keygen

One effective way of securing SSH access to your cloud server is to use
a **public/private** key.  This means that a *public* key is placed on
the server and the *private* key is on your local workstation. This
makes it impossible for someone to log in using just a password - they
must have the private key. This consists of 3 basic steps: create the
key on your local workstation, copy the public key to the Cloud Server,
and set the correct permissions for the key.

The first step is to create a folder to hold your keys. On your LOCAL
workstation:

    mkdir ~/.ssh

That's assuming you use Linux or a Mac and the folder does not exist. Follow the link to read a detailed article for [key generation using Putty for
Windows](/how-to/generating-rsa-keys-with-ssh-puttygen).

To create the ssh keys, on your *local* workstation enter:

    ssh-keygen -t rsa

If you do not want a passphrase then just press enter when prompted.

That created two files in the .ssh directory: **id_rsa** and **id_rsa.pub**.
The pub file holds the public key. This is the file that is placed on
the Cloud Server.

The other file is your private key. Never show, give away or keep this
file on a public computer.

### SSH copy

Now we need to get the public key file onto the Cloud Server.

We'll use the `scp` (secure copy) command for this as it is an easy
and secure means of transferring files.

Still on your *local* workstation enter this command:

    scp ~/.ssh/id_rsa.pub demo@123.45.67.890:/home/demo/

When prompted, enter the demo user password.

Change the IP address to your cloud server and the location to your
admin user's home directory (remember the admin user in this example is
called demo).

### SSH Permissions

OK, so now we've created the public/private keys and we've copied the
public key onto the Cloud Server.

Now we need to sort out a few permissions for the ssh key.

On your Cloud Server, create a directory called **.ssh** in the 'demo'
user's home folder and move the pub key into it.

    mkdir /home/demo/.ssh
    mv /home/demo/id_rsa.pub /home/demo/.ssh/authorized_keys

Now we can set the correct permissions on the key:

    chown -R demo:demo /home/demo/.ssh
    chmod 700 /home/demo/.ssh
    chmod 600 /home/demo/.ssh/authorized_keys

Again, change the 'demo' user and group to your admin user and group.

It may seem a long set of steps but once you have done it once you can
see the order of things: create the key on your local workstation, copy
the public key to the Cloud Server, and set the correct permissions for
the key.

### SSH config

**Note**: If you have Cloud Servers with a Managed Operations, do not
change the default SSH configuration by disabling port 22 because our
automation uses this port for access to your server.  If your server
does not have Managed Operations, you can choose to implement the
following optional security safeguard.

Because keeping the SSH service on the default port of 22 makes it an
easier target, we'll change the default SSH configuration to make it
more secure:

    nano /etc/ssh/sshd_config

The main things to change, check, and add are:

    Port 22                           <--- optionally change to a port of your choosing
    Protocol 2
    PermitRootLogin no
    PasswordAuthentication no
    UseDNS no
    AllowUsers demo

Note that you should not change the ssh port number if your server has a
Managed Operations or if you're using RackConnect.  Turning off root
logins for ssh is recommended for most servers, but for RackConnect
don't disable root logins right after server creation (as it will be
used by RackConnect for the initial server setup).

PasswordAuthentication has been turned off as we setup the
public/private key earlier.  If you intend to access your Cloud Server
from different computers, you may want leave PasswordAuthentication set
to yes. Only use the private key if the local computer is secure (i.e.
don't put the private key on a work computer).

Note that we haven't enabled the new settings yet - we need to create a
simple firewall using `iptables` before it's safe to restart ssh using
the new port.

That's worth emphasizing:  **Do not restart ssh yet.**

### iptables in Ubuntu

The utility called iptables is the default firewall for Linux systems.
 It works by refusing to allow connections to ports or services that you
specify.

The next thing is to set up iptables so that you have a more secure
installation while allowing the server to run the services that it needs
to run.

To start with, we're going to have three ports open: **ssh**, **http**,
and **https**.

We're going to create two files, `/etc/iptables.test.rules` and
`/etc/iptables.up.rules`. The first is a temporary (test) set of rules
and the second the 'permanent' set of rules (this is the one iptables
will use when starting up after a reboot for example).

Note that we are logged in as the root user.  This is the only time we
will log in as the root user.  If you are completing this step at a
later date using the admin user, you will need to use 'sudo' in front of
the commands.

Now let's see what's running at the moment:

    iptables -L

You will see something similar to this:

    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination

    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination

    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination

What this tells us is that we are accepting anything from anyone on any
port and allowing anything to happen.

Some think that this is not dangerous if there are no services running
on the server, and it doesn't matter that all ports are open.  We
disagree.  If connections to unused (and popular) ports are blocked or
dropped, then the vast majority of malicious intruders will move on to
another machine where ports are accepting connections.  It only takes a
few minutes to set up a firewall - is it really worth not doing?

To build the firewall, create the file `/etc/iptables.test.rules` and
add some rules.  If you, or another admin user for this Cloud Server,
have worked through these steps previously, this file may not be empty:

    nano /etc/iptables.test.rules

You can change and add ports as you see fit.

Defined your rules?  Good.  Then lets apply those rules to our server:

    iptables-restore < /etc/iptables.test.rules

Let's see if there is any difference:

    iptables -L

Notice the change? (If there is no change in the output, you did
something wrong and should try again from the start).

Have a look at the rules and see exactly what is being accepted,
rejected and dropped. Once you are happy with the rules, it's time to
save your rules permanently:

    iptables-save > /etc/iptables.up.rules

### Add a networking script

Now we need to ensure that the iptables rules are applied when we reboot
the server.  If the server was rebooted before this step the changes
would be lost and the server would revert to allowing everything from
everywhere.

We'll add a small script that the system will run when your network
interfaces are started. Create the file by running:

    nano /etc/network/if-pre-up.d/iptables

Add the following lines to the new file:

        #!/bin/sh
        /sbin/iptables-restore < /etc/iptables.up.rules

Save your changes, and then make the new script executable:

    chmod +x /etc/network/if-pre-up.d/iptables

That should ensure that whenever your network interfaces are brought up
(usually just at boot time), the firewall will be too.

### iptables in Red Hat

If you are using a Red Hat distribution, iptables works a little
differently.  Using the commands below, you can change your iptables
ruleset directly from the command line.

#### HTTP - Port 80

Use the following command to open port 80 for HTTP (web) traffic in your
iptables firewall:

        # sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport http -j ACCEPT

#### HTTPS/SSL - Port 443

Use the following command to open port 443 for Secure HTTP traffic:

        # sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport https -j ACCEPT

#### SSH - Port 22

Though port 22 is open by default to allow you to SSH to your server
after it is built, this command shows you how you would open port 22:

        # sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport ssh -j ACCEPT

#### FTP - Port 21

FTP is a common service for file transfer, but it is largely obsolete
due to the fact that it is not a secure protocol and we strongly
recommend using a secure file transfer protocol like vsftpd.  If you
absolutely have to use FTP, use these commands to open the default port
of 21.

        # sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport ftp -j ACCEPT
        # sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport ftp-data -j ACCEPT

#### MySQL - Port 3306

If you need to make a remote connection to your MySQL database from
another server, you will need to open port 3306 in iptables.

        # sudo /sbin/iptables -I RH-Firewall-1-INPUT 1 -p tcp --dport mysql -j ACCEPT

#### Saving Your Rules

Use the following command to save all the rules you&rsquo;ve created.  If not
saved before your server is rebooted, the iptables ruleset will revert
to the default ruleset blocking all traffic except on port 22!

        # sudo /sbin/service iptables save

#### Restarting iptables

Your changes to iptables will not take effect until you save your rules,
and then restart the iptables service.  Remember, if you restart
iptables before saving your rules, iptables will revert to the default
ruleset!

        # sudo /sbin/service iptables restart

### Restarting ssh

Now we'll restart the ssh service.

**Note**: Make sure you stay logged in while
you restart ssh and test it with a new connection. That way if
something goes wrong you can troubleshoot it more easily.

On most distributions the service is "sshd", and you restart it with the
command:

        # sudo service sshd restart

On Ubuntu and some other distributions it's called "ssh", and is
restarted with a similar command:

        # sudo service ssh restart

If you have trouble making a new connection after restarting ssh, check
the symptoms to see what may be wrong. If the connection times out,
there may be a problem with the iptables config. If you get a warning
about a private key, your key may not be installed on the server
properly (check for extra linebreaks or characters that were missed in a
copy and paste operation). If you've been rebuilding the server then
you may need to [remove the host key from your known hosts file](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console)
before you can make a connection.

### Troubleshooting

The incorrect configuration of SSH, sudo and/or iptables could cause you
to be locked out of your system. If this occurs, please log into the
the Rackspace Cloud Control Panel and use the Web Console or Rescue Mode
to repair the configurations.
