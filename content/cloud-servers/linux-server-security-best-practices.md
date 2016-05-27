---
permalink: linux-server-security-best-practices/
audit_date:
title: Linux server security best practices
type: article
created_date: '2014-07-16'
created_by: Christoph Champ
last_modified_date: '2014-07-22'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

The first step after creating a Linux cloud server should be to set the security on it. This crucial step must be performed on every server to prevent hackers from obtaining unwanted access. The result is a more secure environment that helps prevent you and your business from being hacked. Performing these basic steps and hardening the security on your server *should* make hackers give up and move on to a new target.

### Linux user management

This section outlines best practices for managing privileged users on a Linux system.

By default, every Linux system has the root user created as the first user. The root user should be used only for the initial configuration of the system and should then be disabled via Secure Shell (SSH) (see the "Linux SSH configuration" section for more information). Disabling this root user via SSH makes it harder for a hacker to gain access to the system. Because the root user is created by default on every Linux server, hackers already have half the information they need to log in to your server if the root user is enabled via SSH. All they need to do is run any number of brute-force SSH attacks until the password hash is broken.

To avoid this situation, you must create a secondary user to use when you need to log in and administer the system. Each end user on the system should have their own login credentials for logging purposes. Depending on the actions that the end user will be performing, they might need to have sudo permission to perform administrative actions. This section provides examples on how to add a user with sudo permission on both Debian and Red Hat Enterprise Linux based systems.

#### Password strength guidelines

Before we create any users, let's talk about passwords. Ensure that you use strong passwords that require a minimum length (and maybe even include expiration dates). Following are common guidelines advocated by proponents of software system security:

- Use a minimum password length of 12 to 14 characters, if permitted.
- Include lowercase and uppercase alphabetic characters, numbers, and symbols, if permitted.
- Generate passwords randomly where feasible.
- Avoid using the same password twice (for example, across multiple user accounts or software systems).
- Avoid character repetition, keyboard patterns, dictionary words, letter or number sequences, user names, relative or pet names, romantic links (current or past), and biographical information (for example, ID numbers, ancestors' names, or dates).
- Avoid using information that is or might become publicly associated with the user or the account.
- Avoid using information that the user's colleagues or acquaintances might know to be associated with the user.
- Do not use passwords that consist wholly of any simple combination of the aforementioned weak components.

#### Add a user (Debian and Ubuntu)

1.  Create a new user and set the user’s password. For our examples we'll use the username **bob**.

        adduser bob

2.  Give the new user permission to use `sudo` to perform privileged operations on the system.  This new user will be your main user when logging in remotely and making changes to the server.

    a.  Run the following command as root to edit the list of user permissions:

        visudo

    b.  Add the following line directly after the line containing `root ALL=(ALL:ALL) ALL`, replacing **bob** with your username:

        bob     ALL=(ALL:ALL) ALL

    c.  Save and quit.

3.  Switch to the new user and test its permissions by using `sudo` to run a command that normally requires root access:

        su bob
        sudo iptables -L

    You will be asked to enter the new user's password for verification before the command will be executed.

If you got a bunch of lines about INPUT and OUTPUT, the new user now has sudo permissions and you can proceed to the next section. You should log in to this user instead of root whenever possible. Using `sudo` will help you avoid making inadvertent system changes, and your changes will be logged for future reference.

#### Add a user (Red Hat and CentOS)

1.  Create a new user with `adduser` and set the user’s password with `passwd`. For our examples we'll use the username **bob**.

        adduser bob
        passwd bob

2.  Give the new user permission to use `sudo` to perform privileged operations on the system.  This new user will be your main user when logging in remotely and making changes to the server.

    a.  Run the following command:

        visudo

    Note: On some distributions the text editor the system will use for `visudo` is `vi`. It's not a user-friendly editor, so you may need to consult a [vi tutorial](http://bignosebird.com/docs/vi.shtml) for help.  Some basic commands to get you started:

    - Arrow keys: Move the cursor.
    - `i`: Insert at the cursor (this will let you start typing)
    - `escape`: The escape key will bring you out of edit mode and back to the command mode.
    - `x`: Delete the character under the cursor.
    - `:q`: (colon q) Quit and save the changes.
    - `:q!`: (colon q exclamation point) Quit but don't save the changes.

    b.  Add the following line directly after the line containing `root ALL=(ALL:ALL) ALL`, replacing **bob** with your username:

        bob     ALL=(ALL)       ALL

    c.  Save and quit.

3.  Switch to the new user and test its permissions by using `sudo` to run a command that normally requires root access:

        su bob
        sudo iptables -L

    You will be asked to enter the new user's password for verification before the command will be executed.

If you got a bunch of lines about INPUT and OUTPUT, the new user now has sudo permissions and you can proceed to the next section. You should log in to this user instead of root whenever possible. Using `sudo` will help you avoid making inadvertent system changes, and your changes will be logged for future reference.

### Generate an SSH key pair

To give us a login option more secure than password-based logins, we'll start by creating an SSH key pair to be used with the user you created earlier.  These instructions work with any Linux distribution.

**Note:** These instructions are for Linux and Mac OS X desktops. If you are going to connect from a Windows desktop, follow the instructions in [Logging in with a SSH Private Key on Windows](/knowledge_center/article/generating-rsa-keys-with-ssh-puttygen) to generate and add the SSH key pair.

1.  Run the following command to generate a key pair on your *local* Linux or Mac computer.

        ssh-keygen -b 4096 -t rsa

    You'll be asked where to save the key and whether you want to add a passphrase to the key.  The default location will be fine.  Whether you want to add a password is up to you - it's more secure, but can be inconvenient.

    Two files will be created. The default names are `id_rsa` for your private key and `id_rsa.pub` for your public key.

2.  After you have created the key pair on your local computer, upload the public key to your remote server for the user that you created previously.

    **Note:** Be sure to upload the *public* key, and *not* your private key. Also, replace `bob@x.x.x.x` with your username and remote server's public IP address.

        ssh-copy-id -i ~/.ssh/id_rsa.pub bob@x.x.x.x

3.  Now connect to the remote server, with `ssh bob@x.x.x.x`, and check in the following file to verify that no extra keys were added that you were not expecting:

    .ssh/authorized_keys

### Linux SSH daemon configuration

Now that your additional user is created with sudo permissions and an SSH key pair, you can move on to the next part of securing your Linux system. You will work with the SSH daemon (server) configuration to improve security.

**Note for Managed Operations and RackConnect customers:** To ensure that our automated systems have access to your server when needed, we request that you do not change the SSH configuration and move on to the next section. When connecting to your server, Rackspace support will log in as the user **rack** using password authentication on port 22. In addition, rebuilding existing servers or building a new server from a snapshot will require that root logins are enabled via the **PermitRootLogin** option set to **yes**. If you do need to change these values, please speak with an administrator at Rackspace to do so in a way that does not impact our ability to provide you with Fanatical Support.

The example commands assume you're no longer logged in as root and are logged in as your new user, using sudo to perform privileged operations.

#### SSH configuration options

This section covers common options in the SSH configuration file to help improve security. You will use this information to configure your firewall later.

This section only outlines a few options to change and what they do. For details on other configuration options see the [OpenSSH documentation](http://www.openssh.com/cgi-bin/man.cgi/OpenBSD-current/man5/sshd_config.5).

The options we'll focus on are:

- `Port XX` — This is the port on which the SSH daemon listens (port 22 by default).
- `PermitRootLogin` — This flag enables (yes) or disables (no) root login via SSH.
- `PubkeyAuthentication` — This flag enables (yes) or disables (no) SSH keys for authentication.
- `PasswordAuthentication` — This flag enables (yes) or disables (no) password authentication.

SSH uses port 22 by default for communication. Hackers try port 22 with the user name of **root** by default on every server that they attack. This is why disabling the root user via SSH and changing SSH to listen on a non-standard port will help prevent a breach. If you do this, you are taking away two pieces of information the hacker already had and must obtain to start his attack.

Changing the port won't stop a determined intruder, but it will cause most superficial scans for SSH connection opportunities to overlook your server.  Similarly, removing SSH access for the root user will interfere with casual brute force attacks via SSH.

Another part of this configuration is the authentication method to use when logging in. By default, all Linux systems use password authentication. There are multiple ways to perform authentication on the server, but the main two are using a password and SSH keys.

SSH keys are generated in pairs, one *public* and the other *private*, and they can be used only in combination with each other. The private key is meant to be stored in a safe location on the computer you'll connect from, and should never be given out. The public key can be given out and is what you place on the server that you will log in to. The private key on your local computer is run through an algorithm when you make a connection, granting access if the key pair hash matches up with the public key.

#### Modify sshd_config

By this point you have added a new user with sudo permissions, created an SSH keypair, and uploaded your public SSH key. Now you will change your SSH configuration file to improve your security. To do this, you can change SSH to listen on a custom port, restrict root login via SSH, enable public key authentication (already enabled for Ubuntu 14.04), and disable password authentication.

1.  Open the SSH daemon configuration file for editing:

        sudo vi /etc/ssh/sshd_config

2.  Change the following lines (original value > new value):

        Port 22 > Port 9001
        PermitRootLogin yes > PermitRootLogin no
        #PasswordAuthentication yes > PasswordAuthentication no

    If you are changing the port number, replace **9001** with the port you would like to use.  Make sure the new port isn't already in use by another program using a tool like [netstat](/knowledge_center/article/checking-listening-ports-with-netstat).

    **Note:** As mentioned above, you should not make this change to the `sshd_config` file if your server has a Managed Operations service level. These changes could prevent Rackspace access to your server.

3.  Test the altered SSH configuration for typos by running:

        sshd -t

SSH is now configured to run on a custom port and accept only non-root users that pass a valid SSH Key. To have these settings apply and persist, the SSH service will have to be restarted. *Do not* do this yet; you will do this in the next section. Restarting SSH now might lock you out of the server, requiring you to use [rescue mode](/knowledge_center/article/rackspace-cloud-essentials-rescue-mode-on-linux-cloud-servers) or the [web console](/knowledge_center/article/managing-your-server-console-session) to restore the configuration.

You still must configure the firewall before restarting the server.  The firewall is discussed in the next section.

#### Amend iptables and restart SSH

**Note for RackConnect users:** You should use the RackConnect management interface to manage firewall rules instead of iptables on the server. You shouldn't be changing the ssh port either if you use RackConnect, but for more information about firewalls and RackConnect, see [Managing RackConnect Network Policies](/knowledge_center/article/managing-rackconnect-network-policies).

1.  Verify that the firewall is open. By default, Ubuntu does not have any restrictions, while CentOS and Red Hat do. The following output shows what it looks like when are no ports blocked and the policy is ACCEPT:

        $ sudo iptables -L
        Chain INPUT (policy ACCEPT)
        target     prot opt source               destination

        Chain FORWARD (policy ACCEPT)
        target     prot opt source               destination

        Chain OUTPUT (policy ACCEPT)
        target     prot opt source               destination

2.  If there are any REJECT or DROP rules present, some ports are blocked. We can open the new SSH port by running:

        sudo iptables -I INPUT -p tcp --dport 9001 -m state --state NEW,ESTABLISHED -j ACCEPT

    Replace **9001** with the port you used for the SSH daemon.

    If you are running Red Hat Enterprise Linux 5 or CentOS 5, change the INPUT in the command to match the name of the input rules in your current iptables rules.  For example:

        sudo iptables -I RH-Firewall-1-INPUT -p tcp --dport 9001 -m state --state NEW,ESTABLISHED -j ACCEPT

3.  Run the following command to restart the SSH daemon so that it applies the new configuration you set up:

        sudo service ssh restart

    If you get an error the SSH daemon may be named `sshd`, so instead run:

        sudo service sshd restart

4.  Log in to the server, **in a new window**, as the user that you created earlier.  Keep your original connection active in case you need to troubleshoot the configuration.

    To connect to SSH with the new configuration you may need to specify the port number and key to use.  For example:

        ssh -p 9001 -i ~/.ssh/id_rsa bob@x.x.x.x

    The `-p` option specifies the port and the `-i` option specifies the private key to use for the connection.

    If you're connecting from a Windows desktop, when you create the connection in [PuTTY](/knowledge_center/article/rackspace-cloud-essentials-going-from-windows-to-linux-using-putty) you can specify the port number and a private key.

#### Save the iptables rule

If you were able to connect with the new configuration, save your iptables rules before continuing to make sure the SSH port will stay open.

On Ubuntu and Debian, run:

    sudo -c "iptables-save > /etc/iptables.rules"

On CentOS, Red Hat, and Fedora, run:

    sudo service iptables save

### Firewalls 

`iptables` is a firewall and networking tool that is available to all Linux distributions and operates by analyzing packets at the kernel level as they are received.

For an introduction to iptables and how to use it, read the Knowledge Center article, [Introduction to iptables](/knowledge_center/article/introduction-to-iptables).

**Note for RackConnect users:** You should use the RackConnect management interface to manage firewall rules instead of iptables on the server. For more information, see [Managing RackConnect Network Policies](/knowledge_center/article/managing-rackconnect-network-policies).

#### Sample iptables ruleset

**Disclaimer:** Following is only a template to help you build an iptables ruleset that will best fit your solution. It is not intended to be a security standard nor will it fit every environment. Use this sample only to help you with syntax and ideas on how to use iptables.

The default locations of where iptables rulesets are saved on a given Linux distribution are as follows (and some distributions allow you to save elsewhere by using the `iptables-save` command):

- Fedora, Red Hat Enterprise Linux, and CentOS: `/etc/sysconfig/iptables`
- Ubuntu and Debian: `/etc/iptables.rules`

You can save the following template/example iptables ruleset in the appropriate location for your distribution.  Change the rule for port **9001** to use the port you set up for SSH, or remove that line if you didn't change the SSH port.

**Note for RHEL 5 and CentOS 5 servers:** RHEL 5 and CentOS 5 and earlier use "RH-Firewall-1-INPUT" instead of "INPUT" in their firewall rules (the entries that begin with "-A" in the sample file - the second line should still use INPUT).

    *filter

    # Dropping incoming connections that don't have explicit rules below
    :INPUT DROP [68:4456]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [1628:151823]

    # Allow established connections for both public and private connections
    -A INPUT -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -i eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT

    # Opening ports wide open
    -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 9001 -j ACCEPT

    # Opening a port to a specific IP
    -A INPUT -p tcp -m tcp --dport 10000 -s 192.168.1.1 -j ACCEPT

    # Opening a port to a range of IPs
    -A INPUT -p tcp -m tcp --dport 20000 -s 192.168.0.0/24 -j ACCEPT

    # Commmiting the rules to the firewall
    COMMIT

You should then restart the iptables service to activate your firewall rules:

    sudo service iptables restart

If your system tells you there isn't an iptables service, we'll use `iptables-restore` to load the new rules. Run the following command, using the location of your iptables rules file as the second argument.

    sudo -c "/sbin/iptables-restore < /etc/iptables.rules"

### Account-level security 

While securing your servers is an essential part of operations on the Internet, securing your account is also necessary. Your account name, password, and API keys are all essential parts of how you interact with the Rackspace Cloud offerings. Just like any other password or access credentials, you want to keep them secure, but you also need to allow your team to take action and perform necessary tasks.

Through the use of [Role Based Access Control (RBAC)](/knowledge_center/article/overview-role-based-access-control-rbac), you can create users and grant permissions to individuals or applications that will be responsible for using various Rackspace services. By leveraging RBAC, you can give your team and contractors access just to the utilities that they need and revoke them when and if necessary. Just like any other system, your Rackspace account should use privilege separation and grant access only to services that the individual needs to perform their duties.

Following are some usage scenarios:

- Give contractors access to set up the environment that you have hired them to create while limiting their ability to view or change any credit card information or delete your account.
- Allow your accountant to see the bill but not to delete your servers.
- Hire a DBA and only give the DBA access to your DBaaS instances.
- Allow a client to upload files directly to your Cloud Files account.
- Configure your servers to register and use specific users for your monitoring and backup agents that are separate from your Admin account.

See the following Knowledge Center articles for more information about RBAC:

- [Overview: Role Based Access Control (RBAC)](/knowledge_center/article/overview-role-based-access-control-rbac)
- [FAQ: Role-Based Access Control (RBAC)](http://www.rackspace.com/knowledge_center/article/faq-role-based-access-control-rbac)

### Simple intrusion prevention

Most would-be intruders run multiple attacks against the same port to try and find something they can exploit in the software running on that port. Fortunately you can set up an intrusion prevention tool like [Fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page) on your server to block repeated attacks on a port.

**Note:** Managed Operations servers will have Fail2Ban installed and configured by default to watch over SSH login attempts. Please feel free to contact your support team if you have any questions or concerns.

Fail2ban monitors logs and automatically blocks connections if it sees too many from the same host in a short period of time.  To set up and configure Fail2ban on your server, reference [our instructions for installing Fail2ban](/knowledge_center/article/fail2ban).

### Intrusion detection

An intrusion detection system (IDS) can help an admin monitor systems for suspicious activity and possible exploits.  An IDS is more robust than a prevention tool like Fail2ban but can be more complicated to set up and maintain.

A popular open source IDS is [OSSEC](http://www.ossec.net/).  OSSEC maintains agents on multiple systems that report back to a main server, allowing investigation of logs and alerts from a potentially compromised server even if that server is shut down.

If you suspect a system has already been compromised, you can investigate with procedures described in our articles on [checking for backdoors and intruders](/knowledge_center/article/checking-for-a-security-compromise-backdoors-and-intruders) and [rescue mode investigation](/knowledge_center/article/checking-for-a-security-compromise-rescue-mode-investigation).

### Keep your OS up-to-date (patching) 

It is very important to keep your kernel, packages, and dependencies up-to-date. This is especially true for security-related modules and packages. Some updates (for example, kernel updates) require your server to be rebooted. Plan for a time that will cause the least amount of disruption during the (normally very short) downtime while your server is rebooting.

Questions your server administrator should be asking:

- Is your Cloud Server fully patched?
- Do you have a patching schedule (one that causes the least amount of disruptions and downtime)?

To check for and install updates on Ubuntu and Debian systems, run:

    sudo apt-get update
    sudo apt-get upgrade

To check for and install updates on CentOS, Red Hat, and Fedora systems, run:

    sudo yum update

### OS end-of-life

You should find out when the Linux distribution release that you are running on your servers will reach its end-of-life (EOL). When a release reaches its EOL, the distribution's maintainers will no longer support it or supply package updates via their official repositories. You will want to plan your migration to a newer release well before your current release reaches its EOL.

For an example, Ubuntu's Raring Ringtail (13.04) release reached its EOL on January 27, 2014.

Use the following links to find out when your Linux distribution release will reach its EOL:

- Ubuntu: [https://wiki.ubuntu.com/Releases](https://wiki.ubuntu.com/Releases)
- Red Hat: [https://access.redhat.com/support/policy/updates/errata/](https://access.redhat.com/support/policy/updates/errata/)
- CentOS: See Red Hat
- Fedora: [https://fedoraproject.org/wiki/End_of_life](https://fedoraproject.org/wiki/End_of_life)
- Debian: [https://wiki.debian.org/DebianReleases](https://wiki.debian.org/DebianReleases)

### Further reading

- [Rackspace Cloud Essentials Guide - Security & Remote Access](http://www.rackspace.com/knowledge_center/article/rackspace-cloud-essentials-guide-security-remote-access)

--Co-Authored by Reese McJunkin
